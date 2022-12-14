# ๐ Day30_221004

Author: ๊ณ ๋ฒ์ข
Created Time: 2022๋ 10์ 4์ผ ์ค์  9:02
Status: ๐จ Published
Updated Time: 2022๋ 10์ 4์ผ ์คํ 8:16

# 1. SEQUENCE

---

(์๋์ผ๋ก ๋ฒํธ๋ฅผ ์์ฑํ๋ ๊ฐ์ฒด)
์ฑ๋ฒํ๊ธฐ, ๋ฒํธ ์ถ์ถ๊ธฐ

CREATE SEQUENCE sequence_name
[INCREMENT BY n]
[START WITH n]
[{MAXVALUE n | NOMAXVALUE}]
[{MINVALUE n | NOMINVALUE}]
[{CYCLE | NOCYCLE}]
[{CACHE | NOCACHE}]

### [์๋ชป๋ ์์]

```sql
create table board(
boardid number constraint pk_board_boardid primary key,
title nvarchar2(50)
);

select * from board;
--boardid (pk: not null, unique, ๋ด๋ถ์ ์ผ๋ก index ์๋์์ฑ
--where boardid=10; ๊ฒ์์๋ ํฅ์ ...

--๊ฒ์ํ ๊ธ์ฐ๊ธฐ ์์
insert into board(boardid, title) values(1,'์ฒ์๊ธ');
insert into board(boardid, title) values(2,'๊ธ');
-- ์ฒ์ ๊ธ์ 1๋ฒ์ด๊ณ  ๊ทธ ๋ค์๊ธ๋ถํฐ๋ ์์ฐจ์ ์ธ ๊ฐ์ insert ...

insert into board(boardid, title)
values((select count(boardid) + 1 from board), '2');
insert into board(boardid, title)
values((select count(boardid) + 1 from board), '3');
```

insert into board(boardid, title)
values((select count(boardid) + 1 from board), '2');
insert into board(boardid, title)
values((select count(boardid) + 1 from board), '3');

์๋ธ์ฟผ๋ฆฌ๋ฅผ ์ด์ฉํด ์๋์ผ๋ก PK๋ฅผ ์ค์ ํด์ฃผ์๋ค.

ํ์ง๋ง ๋ง์ฝ PK 1๋ฒ์ delete ํ  ๊ฒฝ์ฐ 

```sql
insert into board(boardid, title)
values((select count(boardid) + 1 from board), '4');
--ORA-00001: unique constraint (HR.PK_BOARD_BOARDID) violated
--DML ๋ฌธ์ ๋ฐ์
```

์ด๋ฐ์์ผ๋ก ์ค๋ฅ๊ฐ ๋๋ค.
๊ทธ๋ ๊ธฐ์ ๋ค๋ฅธ๋ฐฉ๋ฒ์ ์ฐพ์๋ณด์๋ค.

### [์ง๊ณํจ์]

```sql
select nvl(max(boardid),0) + 1 from board;

insert into board(boardid, title)
values((select nvl(max(boardid),0) + 1 from board), '1');

insert into board(boardid, title)
values((select nvl(max(boardid),0) + 1 from board), '2');

delete from board where boardid = 1;
commit;

insert into board(boardid, title)
values((select nvl(max(boardid),0) + 1 from board), '3');

select * from board;
commit;
```

maxํจ์๋ฅผ ์ด์ฉํด ์ค๊ฐ์ ๊ฐ์ deleteํด์ฃผ์ด๋ ์ ๋์ด๋๋ค.

ํ์ง๋งโฆ ์ด๋ฐ์์ผ๋ก ์๋ฒ์ ์ ์ผ๋ฉด ์ข ๋ง์ด ๊ท์ฐฎ์๊ฒ์ด๋ค.

๊ทธ๋ ๊ธฐ์ ๋์จ๊ฒ์ด ***sequence***

## sequence

- sequence ๊ฐ์ฒด ์ ๊ณต: ์ค๋ณต๊ฐ์ด ์๊ณ  ์์ฐจ์ ์ธ ๊ฐ์ ์ ๊ณตํ๋ ๊ฐ์ฒด

```sql
create sequence board_num;

select board_num.nextval from dual; -- ์ฑ๋ฒ

select board_num.currval from dual; -- ํ์ฌ๊น์ง ์ฑ๋ฒํ ๋ฒํธ ํ์ธ
```

### NEXTVAL ๊ณผ CURRVAL ์์ฌ์ด

ํน์ง)

1. NEXTVAL ๋ ๋ค์ ์ฌ์ฉ ๊ฐ๋ฅํ SEQUENCE ๊ฐ์ ๋ฐํ ํ๋ค.
2. SEQUENCE ๊ฐ ์ฐธ์กฐ๋  ๋ ๋ง๋ค, ๋ค๋ฅธ ์ฌ์ฉ์์๊ฒ ์กฐ์ฐจ๋ ์ ์ผํ ๊ฐ์ ๋ฐํํ๋ค.
3. CURRVAL ์ ํ์ฌ SEQUENCE ๊ฐ์ ์ป๋๋ค.
4. CURRVAL ์ด ์ฐธ์กฐ๋๊ธฐ ์ ์ NEXTVAL ์ด ์ฌ์ฉ๋์ด์ผ ํ๋ค.

### [๊ฒ์ํ ์์]

```sql
--๊ฒ์ํ
--๊ฒ์ํ์ ์ฌ์ฉ๋๋ ์ฑ๋ฒ๊ธฐ
create table kboard(
    num number constraint pk_kboard_num primary key,
    title nvarchar2(20)
);

create sequence kboard_num;

insert into kboard(num, title)
values(kboard_num.nextval, '์ฒ์');

insert into kboard(num, title)
values(kboard_num.nextval, '๋์ด๋น');

insert into kboard(num, title)
values(kboard_num.nextval, '์์ด๋น');

select * from kboard;

delete from kboard where num=1;
delete from kboard where num=2;

insert into kboard(num, title)
values(kboard_num.nextval, '๋ท์ด๋น');

select * from kboard;
commit;
```

[์ถ๋ ฅ]

![https://user-images.githubusercontent.com/92353613/193711010-689c20bd-1943-4d89-a09b-7dd127291110.png](https://user-images.githubusercontent.com/92353613/193711010-689c20bd-1943-4d89-a09b-7dd127291110.png)

> โ ๊ฒ์ํ โ
๊ณต์ง์ฌํญ, ์์ ๊ฒ์ํ, ๊ด๋ฆฌ์ ๊ฒ์ํ ๋ฑ๋ฑ
๊ณต์ง์ฌํญ 1..2..3...
์์ ๊ฒ์ํ 4...
๊ด๋ฆฌ์ ๊ฒ์ํ 5... .6....
๊ณต์ง์ฌํญ 7....
> 
> 1. sequence ๊ฐ์ฒด๋ ๊ณต์ ๊ฐ์ฒด (ํ์ด๋ธ์ ์ข์๋์ง ์์์)
> ํ๋์ ์ํ์ค๋ ์ฌ๋ฌ๊ณณ์์ ์์ ๋กญ๊ฒ ์ฌ์ฉ๊ฐ๋ฅํ๋ค
> sequence ํ๋ ์์ฑํด์ >> ๊ณต์ง์ฌํญ, ์์ ๊ฒ์ํ, ๊ด๋ฆฌ์ ๊ฒ์ํ ์ฌ์ฉ๊ฐ๋ฅ
> 2. ์น ์ฌ์ดํธ (๊ฒ์ํ 10๊ฐ)
> ์ํ๊ฒ์ํ, ๊ด๋ฆฌ์๊ฒ์ํ, ํ์๊ฒ์ํ ๋ฑ๋ฑ...
> ๊ฐ๊ฐ์ ๊ฒ์ํ์ ์๋ฒ์ ๋ฐ๋ก ๊ด๋ฆฌํ๊ธฐ๋ฅผ ์ํด์
> 10๊ฐ์ ์ํ์ค๋ฅผ ๋ง๋ค์ด์ ๊ฐ๊ฐ ์ฌ์ฉํ๋ฉด ๋ผ์.

### TIP)

MS-SQL: create table board(boardnum int identity(1,1).... title
insert into(title) values('๋ฐฉ๊ฐ); ์๋ (1,2,3,...)

MS-SQL: 2012๋ฒ์  (sequence๊ฐ์ฒด)

Mysql: create table board(boardnum int auto_increment, ... title)
insert into(title) values('๋ฐฉ๊ฐ); ์๋ (1,2,3,...)

mysql ๋ง๋  ์ฌ๋๋ค์ด open source >> mariadb(๊ฐ์ ์์ง)
mariadb ์ํ์ค ๊ฐ์ฒด ์กด์ฌ

### [์์]

```sql
create sequence seq_num
start with 10
increment by 2; --2์ฉ์ฆ๊ฐ

select seq_num.nextval from dual; -- ์์
select seq_num.currval from dual; -- ํ์ฌ ๋ฒํธ์ถ๋ ฅ
```

# 2. rownum(์๋ฒ)

### [์์]

```sql
select rownum as ์๋ฒ, empno, ename from emp;
--select ํ ๊ฒฐ๊ณผ์ ์๋ฒ์ ๋ถ์ฌ...
```

[์ถ๋ ฅ]

![https://user-images.githubusercontent.com/92353613/193716291-5a795d94-39ba-4c98-8c57-001b752491f4.png](https://user-images.githubusercontent.com/92353613/193716291-5a795d94-39ba-4c98-8c57-001b752491f4.png)

- ์๋ฒ์ด ์ถ๋ ฅ์ด ๋๋ค.

## Top-n ์ฟผ๋ฆฌ (์ ๋ ฌ๋ ๊ธฐ์ค์ผ๋ก ์์์ ๋ช๊ฐ ์ถ์ถ)

ํ์ด๋ธ์์ ์กฐ๊ฑด์ ๋ง๋ ์์(Top) ์์ ๋ ์ฝ๋(row) n๊ฐ๋ฅผ ์ถ์ถ

> Tip)
MS-SQP: select top 10, * from emp order by sal desc;
> 
> 
> Oracle top n (x))
> rownum: ์๋ฒ์ ๋ถ์ฌ ํน์  ์กฐ๊ฑด์ ๋ง๊ฒ top ์ฟผ๋ฆฌ ์คํ๊ฐ๋ฅ
> 
> 1. **์ ๋ ฌ**์ ๊ธฐ์ค์ ์ ์ (์ ํ)
> 2. ์ ๋ ฌ๋ ๋ฐ์ดํฐ๋ฅผ ๊ธฐ์ค์ผ๋ก rownum์ค์ ํ๊ณ  ์กฐ๊ฑด์ ๊ฑธ๊ณ  ๋ฐ์ดํฐ ์ถ์ถ

### [์์]

1๋จ๊ณ (sal ๋์์์ผ๋ก ์ ๋ ฌ)

```sql
select *
from (  select *
        from emp
        order by sal desc
     )e;
```

2๋จ๊ณ (์๋ฒ์ด ๋ถ์)

```sql
select rownum as num, e.*
from (  select *
        from emp
        order by sal desc
     )e;
```

3๋จ๊ณ (๊ธ์ฌ๋ฅผ ๋ง์ด ๋ฐ๋ ์ฌ์ 5๋ช)

```sql
select *
from    (
        select rownum as num, e.*
        from (  select *
            from emp
            order by sal desc
         )e
     ) n where num <= 5;
```

[3๋จ๊ณ ์ถ๋ ฅ]

![https://user-images.githubusercontent.com/92353613/193717402-d8341692-380f-4b79-89d2-2045a02cc6d6.png](https://user-images.githubusercontent.com/92353613/193717402-d8341692-380f-4b79-89d2-2045a02cc6d6.png)

> ๊ฒ์ํ
/*
100๊ฑด
์น ์ฌ์ดํธ์ 100๊ฑด ๋ฐ์ดํฐ๊ฐ ํ ํ๋ฉด ์ถ๋ ฅ ๊ธฐ๋ฅ
10๊ฑด์ฉ ๋๋์ด์ ํ๋ฉด์ ์ถ๋ ฅ
> 
> 
> pagesize = 10 (ํ ํ๋ฉด์ (ํ์ด์ง)์ ๋ณด์ฌ์ค ์ ์๋ ๋ฐ์ดํฐ row์)
> page ๊ฐ์ = 10๊ฐ
> 
> [1][2][3][4][5][6][7][8][9][10] >> java ๊ตฌํ >> <a href='page.jsp?'>10</a>
> 1page >> 1~10   >> DB select 1~10๊ธ
> 2page >> 11~20  >> DB select 11~20๊ธ
> 3page >> 21~30 ....
> 

> >>rownum
>>between A and B
> 

### [์์]

1๋จ๊ณ (๊ธฐ์ค ๋ฐ์ดํฐ ๋ง๋ค๊ธฐ (์ ๋ ฌ))

```sql
--์ฌ๋ฒ์ด ๋ฎ์ ์์ผ๋ก ์ ๋ ฌ
select * from employees order by employee_id asc;
```

2๋จ๊ณ (๊ธฐ์ค ๋ฐ์ดํฐ์ ์๋ฒ ๋ถ์ฌํ๊ธฐ)

```sql
select rownum as num, e.*
from (
     select * from employees order by employee_id asc
     )e
where rownum <=50; --์ ๋ ฌ๋ ๋ฐ์ดํฐ์ ๋ด๋ถ์ ์ผ๋ก ์์ฑ๋ rownum
```

3๋จ๊ณ

```sql
select *
from(
        select rownum as num, e.*
        from (
             select * from employees order by employee_id asc
             )e
        where rownum <=10
    ) n where num >= 1;
```

3๋จ๊ณ ๊ฐ๋จ.ver

```sql
select *
 FROM (
         SELECT ROWNUM AS NUM, E.* 
         FROM EMPLOYEES E ORDER BY EMPLOYEE_ID ASC
 ) WHERE NUM <=10;
```

[3๋จ๊ณ ์ถ๋ ฅ]

![https://user-images.githubusercontent.com/92353613/193719831-752ac445-ee62-4f6a-9156-98817b45478e.png](https://user-images.githubusercontent.com/92353613/193719831-752ac445-ee62-4f6a-9156-98817b45478e.png)

์ถ๋ ฅ๊ณผ ๊ฐ์ด ์ ๋ ฌํ ๋ค num์ ํตํด ์ํ๋๋๋ก ์๋ผ์ ๋ณด์ฌ์ค ์๊ฐ ์๋ค.

์ด๋ฅผํตํด ๊ฒ์ํ์ 1page 2page์ 10๊ฐ์ฉ ๋ณด์ฌ์ฃผ๊ธฐ ๊ธฐ๋ฅ์ ๊ตฌํํ  ์ ์๋ค.

> 107๊ฑด
pagesize = 10
[1][2][3][4][5][6][7][8][9][10][11]
[1] >> 1~10
[2] >> 11~20
...
[10] >> 91~100
[11] >> 101~107
> 

# 3. JDBC ๊ธฐ๋ณธ๊ตฌ์กฐ

![https://user-images.githubusercontent.com/92353613/193723288-3f5460fe-41af-4c51-b9cd-72c35cba7969.png](https://user-images.githubusercontent.com/92353613/193723288-3f5460fe-41af-4c51-b9cd-72c35cba7969.png)

- JDBC: ์๋ฐ์์ ๋ฐ์ดํฐ๋ฒ ์ด์ค์ ์ ์ํ  ์ ์๋๋ก ํ๋ ์๋ฐ API์ด๋ค.

> JDBC
> 
> 1. Java ์ธ์ธ(APP)์ ํตํด์ Oracle(์ํํธ์จ์ด) ์ฐ๊ฒฐํด์ CRUD์์
> 2. Java App: Oracle, My-sql, Ms-sql ๋ฑ๋ฑ ์ฐ๊ฒฐํ๊ณ  ์์(CRUD)
> 2.1 ๊ฐ๊ฐ์ ์ ํ์ ๋ง๋ ๋๋ผ์ด๋ฒ๋ฅผ ๊ฐ์ง๊ณ  ์์ด์ผ ํ๋ค.
> CASE 1: ์ผ์ฑ ๋ธํธ๋ถ >> HP ํ๋ฆฐํฐ ์ฐ๊ฒฐ >> HPํ๋ฆฐํฐ ์ฌ์ดํธ์์ ๋๋ผ์ด๋ฒ ๋ค์ด >> ์ผ์ฑ ์ค์น
> CASE 2: HPํ๋ฆฐํฐ ์ ์กฐ ํ์ฌ๋ ...
> 3. ๋๋ผ์ด๋ฒ๋ฅผ ์ฐธ์กฐ (ํ์ฌ ํ๋ก์ ํธ์์ ์ฌ์ฉ) >> Java Project -> ์์ฑ -> build path -> jar ํ์ผ ์ถ๊ฐ
> 3.1 ๋๋ผ์ด๋ฒ ์ฌ์ฉ ์ค๋น ์๋ฃ >> ๋ฉ๋ชจ๋ฆฌ์ load ์ฌ์ฉ ...
> 3.2 Class.forName("oracle.jdbc.OracleDriver").... new ๊ฐ์ฒด ์์ฑ ...
> 4. JAVACODE (CRUD) >> JDBC API ์ ๊ณต ๋ฐ๋๋ค.
> 4.1 import java.sql.* >> interface, class ์ ๊ณต
> 4.2 ๊ฐ๋ฐ์๋ interface๋ฅผ ํตํด์ ํ์คํ๋ DB์์ ์ํ๊ฐ๋ฅ
> POINT) why interfaceํํ๋ก ์ ๊ณตํ ๊น? >> JDBC API >> Oracle, Mysql, ...)
> 5. ์์์์
> 5.1 DB์ฐ๊ฒฐ -> ๋ช๋ น์์ฑ -> ๋ช๋ น์คํ -> ์ฒ๋ฆฌ -> ์์ํด์ 
> ๋ช๋ น: DDL (create, alter, drop)
> CRUD (insert, select, update, delete)
> ์คํ: ์ฟผ๋ฆฌ๋ฌธ์ DB์๋ฒ์๊ฒ ์ ๋ฌ
> ์ฒ๋ฆฌ: ๊ฒฐ๊ณผ๋ฅผ ๋ฐ์์ ํ๋ฉด ์ถ๋ ฅ, ๋๋ ๋ค๋ฅธ ํ๋ก๊ทธ๋จ์ ์ ๋ฌ ๋ฑ๋ฑ
> ์์ํด์ : ์ฐ๊ฒฐํด์ 

### [์ดํด๋ฆฝ์ค DB์ฐ๊ฒฐ ํ ์ ๋ณด ๊ฐ์ ธ์ค๊ธฐ]

```java
public class Ex01_Oracle_Connection {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		//DB์ฐ๊ฒฐ -> ๋ช๋ น์์ฑ -> ์คํ -> ์ฒ๋ฆฌ
		Class.forName("oracle.jdbc.OracleDriver");
		System.out.println("์ค๋ผํด ๋๋ผ์ด๋ฒ ๋ก๋ฉ....");
		
		//loading ๋ ๋๋ผ์ด๋ฒ๋ฅผ ํตํด์ oracle์ฐ๊ฒฐ
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","KOSA","1004");
		System.out.println(conn.isClosed() + "์ ์ false");

		Statement stmt = conn.createStatement(); //๋ช๋ น๊ฐ์ฒด ์ป์ด์ค๊ธฐ
		
		//CRUD
		String sql="select empno, ename, sal from emp";
		
		ResultSet rs = stmt.executeQuery(sql);// ๋ช๋ น ์คํ
		
		//rs๋ฅผ ํตํด์  DB์๋ฒ memory์ ์์ฑ๋ ์ ๋ณด๋ฅผ ์กฐํ
		//์ฒ๋ฆฌ(ํ๋ฉด์กฐํ)
		while(rs.next()) {
			System.out.println(rs.getInt("empno") + "/" + rs.getString("ename") + rs.getInt("sal"));
		}
		
		stmt.close();
		rs.close();
		conn.close();
		System.out.println("DB ์ฐ๊ฒฐ: " + conn.isClosed());
		
	}
}
```

[์ถ๋ ฅ]

```java
์ค๋ผํด ๋๋ผ์ด๋ฒ ๋ก๋ฉ....
false์ ์ false
7369/SMITH800
7499/ALLEN1600
7521/WARD1250
7566/JONES2975
7654/MARTIN1250
7698/BLAKE2850
7782/CLARK2450
7788/SCOTT3000
7839/KING5000
7844/TURNER1500
7876/ADAMS1100
7900/JAMES950
7902/FORD3000
7934/MILLER1300
DB ์ฐ๊ฒฐ: true
```

## ResultSet Flow

![https://user-images.githubusercontent.com/92353613/193739783-c7d46faa-c027-425d-8291-ca6b01180c52.png](https://user-images.githubusercontent.com/92353613/193739783-c7d46faa-c027-425d-8291-ca6b01180c52.png)

## DML (insert, update, delete)

JDBC APIํตํด์ ์์

---

1. ๊ฒฐ๊ณผ ์งํฉ์ด ์๋ค (resultSet ํ์ ์๋ค)
2. ๋ฐ์๊ฒฐ๊ณผ (return ํ์ ์) >> update 5๊ฑด >> return 5

java์ฝ๋

---

update emp set sal=0 > ์คํ > update 14๊ฑด >> return 14
update emp set sal=100 where empno=4444> update 0๊ฑด >> return 0

๊ฒฐ๊ณผ๋ฅผ ๊ฐ์ง๊ณ  java์ฝ๋๋ก ๋ก์ง์ฒ๋ฆฌ

### KEY POINT

---

1. Oracle DML(developer, Cmd(sqlplus), tool) ํ๋ฉด commit or rollback๊ฐ์ 
2. JDBC API ์ฌ์ฉํด์ java ์ฝ๋๋ฅผ ํตํด์ DML >> default >> autocommit; >> ์ค๋ฐ์
3. JDBC API ํตํด์ delete from emp >> ์คํ >> ์๋ commit> ์ค๋ฐ์
4. ํ์์ ๋ฐ๋ผ commit(), rollback ์ฒ๋ฆฌ ์ฝ๋...

### [UPDATE ์์ ]

```java
public class Ex02_Oracle_DML_update {
   public static void main(String[] args) {
      Connection conn = null;
      Statement stmt = null;
      
      try {
         //๋๋ผ์ด๋ฒ ๋ก๋ฉ
         //ClassforName("oracle.jdbc.OracleDriver"); ์๋ต๊ฐ๋ฅ
         
         //Connection ์ธํฐํ์ด์ค๋ฅผ ๊ตฌํํ๊ณ  ์๋ ๊ฐ์ฒด์ ์ฃผ์๊ฐ ๋ฆฌํด ...
         //๋คํ์ฑ์ ํตํด์ COnnection ํ์์ conn ๋ณ์๊ฐ ์ฃผ์๊ฐ์ ๋ฐ๋๋ค
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","KOSA","1004");
         stmt = conn.createStatement(); //Statement ๊ตฌํํ๊ณ  ์๋ ๊ฐ์ฒด์ ์ฃผ์ ๋ฆฌ
         
         //INSERT
           Scanner scan = new Scanner(System.in);
           int deptno = 0;
            
           System.out.print("๋ถ์์๋ ฅ : ");
           deptno = Integer.parseInt(scan.nextLine());
            
           //update dmlemp set sal=0 where deptno=๋ถ์๋ฒํธ
           String sql="update dmlemp set sal=0 where deptno="+deptno;
           System.out.println(sql);
         
         
         //ํ์ฌ
         //values(?,?,?)      >> ? parameter ๋ณ๋ ์ค์ 
         //executeUpdate()   >> insert, update, delete ๋ชจ๋ ์ํ
         int resultrow = stmt.executeUpdate(sql);
         
         if(resultrow > 0) {
            System.out.println("๋ฐ์๋ ํ์ ์: " + resultrow);
         }else {
            System.out.println("์์ธ๊ฐ ๋ฐ์๋ ๊ฒ์ด ์๋๊ณ  : ๋ฐ์๋ ํ์ด ์๋ค ");
         }
         
      } catch (Exception e) {
         //์ค๋ณต๋ฐ์ดํฐ insert ํด์ ๋ฌธ์ ๊ฐ ์๊ธฐ๋ฉด executeUpdate() ์์ธ ๋ฐ์
         //์ฝ๋ ์ฒ๋ฆฌ
         System.out.println("SQL ์์ธ๋ฐ์: " + e.getMessage());
      } finally {
         //๊ฐ์  ์ํ ๋ธ๋ญ
         //์์ํด์ 
         try {
            stmt.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
         try {
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
   }
}
```

### [INSERT ์์ ]

```java
public class Ex02_Oracle_DML_insert {
	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		
		try {
			//๋๋ผ์ด๋ฒ ๋ก๋ฉ
			//ClassforName("oracle.jdbc.OracleDriver"); ์๋ต๊ฐ๋ฅ
			
			//Connection ์ธํฐํ์ด์ค๋ฅผ ๊ตฌํํ๊ณ  ์๋ ๊ฐ์ฒด์ ์ฃผ์๊ฐ ๋ฆฌํด ...
			//๋คํ์ฑ์ ํตํด์ COnnection ํ์์ conn ๋ณ์๊ฐ ์ฃผ์๊ฐ์ ๋ฐ๋๋ค
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","KOSA","1004");
			stmt = conn.createStatement(); //Statement ๊ตฌํํ๊ณ  ์๋ ๊ฐ์ฒด์ ์ฃผ์ ๋ฆฌ
			
			//INSERT
	         int empno = 0;
	         String ename = "";
	         int deptno = 0;
	         
	         Scanner scan = new Scanner(System.in);
	         System.out.print("์ฌ๋ฒ์๋ ฅ : ");
	         empno = Integer.parseInt(scan.nextLine());
	         
	         System.out.print("์ด๋ฆ์๋ ฅ : ");
	         ename = scan.nextLine();
	         
	         System.out.print("๋ถ์์๋ ฅ : ");
	         deptno = Integer.parseInt(scan.nextLine());
	         
	         //insert into dmlemp(empno, ename, deptno) values () ๊ณ ์ ์ ์ธ ๋ฐฉ๋ฒ
	         String sql = "insert into dmlemp(empno, ename, deptno) ";
	         sql += "values (" + empno + ", '" + ename + "'," + deptno + ")";

			
			//ํ์ฌ
			//values(?,?,?)		>> ? parameter ๋ณ๋ ์ค์ 
			//executeUpdate()	>> insert, update, delete ๋ชจ๋ ์ํ
			int resultrow = stmt.executeUpdate(sql);
			
			if(resultrow > 0) {
				System.out.println("๋ฐ์๋ ํ์ ์: " + resultrow);
			}else {
				System.out.println("์์ธ๊ฐ ๋ฐ์๋ ๊ฒ์ด ์๋๊ณ  : ๋ฐ์๋ ํ์ด ์๋ค ");
			}
			
		} catch (Exception e) {
			//์ค๋ณต๋ฐ์ดํฐ insert ํด์ ๋ฌธ์ ๊ฐ ์๊ธฐ๋ฉด executeUpdate() ์์ธ ๋ฐ์
			//์ฝ๋ ์ฒ๋ฆฌ
			System.out.println("SQL ์์ธ๋ฐ์: " + e.getMessage());
		} finally {
			//๊ฐ์  ์ํ ๋ธ๋ญ
			//์์ํด์ 
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
```

### [DELETE ์์ ]

```java
public class Ex02_Oracle_DML_delete {
   public static void main(String[] args) {
      Connection conn = null;
      Statement stmt = null;
      
      try {
         //๋๋ผ์ด๋ฒ ๋ก๋ฉ
         //ClassforName("oracle.jdbc.OracleDriver"); ์๋ต๊ฐ๋ฅ
         
         //Connection ์ธํฐํ์ด์ค๋ฅผ ๊ตฌํํ๊ณ  ์๋ ๊ฐ์ฒด์ ์ฃผ์๊ฐ ๋ฆฌํด ...
         //๋คํ์ฑ์ ํตํด์ COnnection ํ์์ conn ๋ณ์๊ฐ ์ฃผ์๊ฐ์ ๋ฐ๋๋ค
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","KOSA","1004");
         stmt = conn.createStatement(); //Statement ๊ตฌํํ๊ณ  ์๋ ๊ฐ์ฒด์ ์ฃผ์ ๋ฆฌ
         
         //INSERT
           Scanner scan = new Scanner(System.in);
           int deptno = 0;
            
           System.out.print("๋ถ์์๋ ฅ : ");
           deptno = Integer.parseInt(scan.nextLine());
            
           //delete dmlemp where deptno=๋ถ์๋ฒํธ
           String sql="delete dmlemp where deptno="+deptno;
           System.out.println(sql);
         
         
         //ํ์ฌ
         //values(?,?,?)      >> ? parameter ๋ณ๋ ์ค์ 
         //executeUpdate()   >> insert, update, delete ๋ชจ๋ ์ํ
         int resultrow = stmt.executeUpdate(sql);
         
         if(resultrow > 0) {
            System.out.println("๋ฐ์๋ ํ์ ์: " + resultrow);
         }else {
            System.out.println("์์ธ๊ฐ ๋ฐ์๋ ๊ฒ์ด ์๋๊ณ  : ๋ฐ์๋ ํ์ด ์๋ค ");
         }
         
      } catch (Exception e) {
         //์ค๋ณต๋ฐ์ดํฐ insert ํด์ ๋ฌธ์ ๊ฐ ์๊ธฐ๋ฉด executeUpdate() ์์ธ ๋ฐ์
         //์ฝ๋ ์ฒ๋ฆฌ
         System.out.println("SQL ์์ธ๋ฐ์: " + e.getMessage());
      } finally {
         //๊ฐ์  ์ํ ๋ธ๋ญ
         //์์ํด์ 
         try {
            stmt.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
         try {
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
   }
}
```

## PrepareStatement

---

1. ์ค๋ช
๋ฏธ๋ฆฌ SQL๋ฌธ์ด ์ํ๋ Statement ๊ฐ DB๊ฐ ์ ์ก๋์ด์ ธ์ ์ปดํ์ผ๋์ด์ง๊ณ , SQL๋ฌธ์ ?๋ง ๋์ค์ ์ถ๊ฐ ์ํํด์ ์คํ
์ด ๋์ด์ง๋ ์ค๋น๋ Statement
    - ex) select * from emp where empno=7788 -> ๊ตฌ๋ฌธ๋ถ์ -> ์คํ๊ณํ -> ๋ฉ๋ชจ๋ฆฌ ...
    select * from emp where EMPNO=7788 -> ๊ตฌ๋ฌธ๋ถ์ -> ์คํ๊ณํ -> ๋ฉ๋ชจ๋ฆฌ ....
2.  ์ฅ์ 
- Statement ์ ๋นํด์ ๋ฐ๋ณต์ ์ธ SQL๋ฌธ์ ์ฌ์ฉํ  ๊ฒฝ์ฐ์ ๋ ๋น ๋ฅด๋ค. ( ํนํ, ๊ฒ์๋ฌธ )
- DB์ปฌ๋ผํ์๊ณผ ์๊ด์์ด ?ํ๋๋ก ํ์ํ๋ฉด ๋๋ฏ๋ก ๊ฐ๋ฐ์๊ฐ ํท๊น๋ฆฌ์ง ์๊ณ  ์ฝ๋ค. ( ํนํ, INSERT๋ฌธ )
(์ด์ : ?๋ฅผ ์ ์ธํ SQL๋ฌธ์ด DB์์ ๋ฏธ๋ฆฌ ์ปดํ์ผ๋์ด์ ธ์ ๋๊ธฐ)
1.  ๋จ์ 
SQL๋ฌธ๋ง๋ค PreparedStatement ๊ฐ์ฒด๋ฅผ ๊ฐ๊ฐ ์์ฑํด์ผ ํ๋ฏ๋ก ์ฌ์ฌ์ฉ๋ถ๊ฐ
(but, Statement ๊ฐ์ฒด๋ SQL๋ฌธ์ด ๋ฌ๋ผ์ง๋๋ผ๋ ํ ๊ฐ๋ง ์์ฑํด์ ์ฌ์ฌ์ฉ์ด ๊ฐ๋ฅํ๋ค. )
2.  ํน์ง
- Statement stmt = con.createStatement(); //์์ฑ stmt.execute(sql);//์คํ
- PreparedStatement pstmt = con.prepareStatement(sql); //์์ฑ pstmt.execute(); //์คํ
1.  ์ฃผ์
DB ๊ฐ์ฒด๋ค(table, ..)์ ๋ผ๋( ํ์ด๋ธ๋ช or ์ปฌ๋ผ๋ช or ์ํ์ค๋ช ๋ฑ์ ๊ฐ์ฒด๋ ์์ฑ๋ช)์
?๋ก ํ์ํ  ์ ์๋ค.
    - ์ฆ, data ์๋ฆฌ์๋ง ?๋ก ํ์ํ  ์ ์๋ค.
    cf) ๊ทธ๋์, DDL๋ฌธ์์๋ PreparedStatement๋ฅผ ์ฌ์ฉํ์ง ์๋๋ค.

<aside>
๐ก ๋จ์ )
์ฟผ๋ฆฌ๋ฌธ์ด ๋ฐ๋๋ฉด ๋ค์ ์ปดํ์ผ...

</aside>

### [PrepareStatement ์์]

```java
public class Ex05_Oracle_PrepareStatement {
	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			conn = SingletonHelper.getConnection("oracle");
			String sql="select empno, ename, from emp where deptno=?"; //ํ๋ผ๋ฏธํฐ๊ฐ์ '?'์ผ๋ก ํํ
			//where id=? and name=? and job=?
			// ? parameter
			pstmt = conn.prepareStatement(sql); // ๋ฏธ๋ฆฌ ์ปดํ์ผ ์์ผ๋์
			
			//์ดํ์๋ parameter ์ค์ ํด์ DB ... ๋ณด๋ด๋ฉด ๋ผ์
			pstmt.setInt(1, 30); // where deptno=30
			
			rs = pstmt.executeQuery();
			//๊ณต์๊ฐ์ ๋ก์ง
			//๋ฐ์ดํฐ 1๊ฑดใด or 1๊ฑด ์ด์ or ์๋ ๊ฒฝ์ฐ
			if(rs.next()) { //์ต์ 1๊ฑด
				do {
					System.out.println(rs.getInt(0));
				} while(rs.next());
				
			}else {
				//๋ฐ์ดํฐ ์๋ค
				System.out.println("์กฐํ๋ ๋ฐ์ดํฐ๊ฐ ์์ต๋๋ค.");
			}
			
		} catch (Exception e) {
			
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
			//์ฑ๊ธํค์ close() ํ์ง ์์์ app .... ์กด์ํ๋ ํ...
		}
			
	}
}
```

# [**JDBC ์ด๊ธ์ ๊ณผ์ ]**

[๋ฌธ์ ]

```java
create table sdept

as

   select * from dept;

sdept ํ์ด๋ธ์ ๋ํด์
์ ์ฒด์กฐํ
์กฐ๊ฑด์กฐํ
์ฝ์
์ญ์ 
์์ 
์ ์์ ํ์๋ฉด ๋ฉ๋๋ค
PreparedStatement
```

[๋ฉ์ธ๋ฌธ]

```java
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

import kr.or.kosa.SingletonHelper;

public class dept_table {
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		sql_show();
		sql_find();
		
	}
	
	public static void sql_show(){
		
		Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      
	       try {
	           conn = SingletonHelper.getConnection("oracle");
	           String sql="select * from sdept";
	           pstmt = conn.prepareStatement(sql);
	           rs = pstmt.executeQuery();
	            
	           if (rs.next()) { //์ต์ 1๊ฑด
	            do {
	               System.out.println(rs.getInt(1) + " / " + rs.getString(2) + " / " + rs.getString(3));
	            } while (rs.next());
	         }else { System.out.println("์กฐํ๋ ๋ฐ์ดํฐ๊ฐ ์์ต๋๋ค."); }

	         } catch (Exception e) {
	            
	         }finally {
	            SingletonHelper.close(rs);
	            SingletonHelper.close(pstmt);
	         }
	      }

	
	public static void sql_delete(){
		
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			System.out.println("์๋ ฅํ์ธ์");
			System.out.print("deptno= ");
			int a = Integer.parseInt(sc.nextLine());
		
			conn = SingletonHelper.getConnection("oracle");
			String sql="delete from sdept where deptno=?";
			pstmt = conn.prepareStatement(sql); // ๋ฏธ๋ฆฌ ์ปดํ์ผ ์์ผ๋์
			
			pstmt.setInt(1,a);
	        rs = pstmt.executeQuery();
			
		} catch (Exception e) {
			
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}
	}
	
	
	public static void sql_insert() {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			System.out.println("์๋ ฅํ์ธ์");
			System.out.print("deptno= ");
			int a = Integer.parseInt(sc.nextLine());
			System.out.print("dname= ");
			String b = sc.nextLine();
			System.out.print("loc= ");
			String c = sc.nextLine();
			
			conn = SingletonHelper.getConnection("oracle");
			String sql="insert into sdept values(?,?,?)";
			pstmt = conn.prepareStatement(sql); // ๋ฏธ๋ฆฌ ์ปดํ์ผ ์์ผ๋์
			
			pstmt.setInt(1, a);
	        pstmt.setString(2, b);
	        pstmt.setString(3, c);
	        
	        rs = pstmt.executeQuery();
	        
		} catch (Exception e) {
			
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}
	}
	
	public static void sql_find() {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			System.out.println("์๋ ฅํ์ธ์");
			System.out.print("deptno= ");
			int a = Integer.parseInt(sc.nextLine());
		
			conn = SingletonHelper.getConnection("oracle");
			String sql="select * from sdept where deptno=?";
			pstmt = conn.prepareStatement(sql); // ๋ฏธ๋ฆฌ ์ปดํ์ผ ์์ผ๋์
			
			pstmt.setInt(1,a);
	        rs = pstmt.executeQuery();
	        
	        if (rs.next()) { //์ต์ 1๊ฑด
	            do {
	               System.out.println(rs.getInt(1) + " / " + rs.getString(2) + " / " + rs.getString(3));
	            } while (rs.next());
	         }else { System.out.println("์กฐํ๋ ๋ฐ์ดํฐ๊ฐ ์์ต๋๋ค."); }

			
		} catch (Exception e) {
			
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}
	}
	
	public static void sql_update() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			System.out.println("๋ฐ๊ฟ deptno= ");
			int d = Integer.parseInt(sc.nextLine());
			System.out.println("์๋ ฅํ์ธ์");
			System.out.print("deptno= ");
			int a = Integer.parseInt(sc.nextLine());
			System.out.print("dname= ");
			String b = sc.nextLine();
			System.out.print("loc= ");
			String c = sc.nextLine();
			
			
			 conn = SingletonHelper.getConnection("oracle");
			 String sql="update sdept set deptno=?,dname=?,loc=? where deptno=?";
			 pstmt = conn.prepareStatement(sql); //๋ฏธ๋ฆฌ ์ปดํ์ผ ...
		
			 
			 
			 pstmt.setInt(1, a);
	         pstmt.setString(2, b);
	         pstmt.setString(3, c);
		        
			 
			 pstmt.setInt(4, d);
				
		        
	         rs = pstmt.executeQuery();
		        
		} catch (Exception e) {
			
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}
	}
}

```

[์ฑ๊ธํคํจํด]

```java
package kr.or.kosa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

//์กฐ๋ณ ๋ฌธ์ 
//ConnectionHelper ์ฝ๋๋ singleton์ผ๋ก ๋ฐ๊พธ์ธ์ ^^
public class SingletonHelper {
	private static Connection conn = null; //public > private
	private SingletonHelper() {}

	public static Connection getConnection(String dsn) {
		if(conn != null) {
			System.out.println("conn is not null");
			return conn;
		}
		try {
			  if(dsn.equals("oracle")) {
				  Class.forName("oracle.jdbc.OracleDriver");
				  conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","KOSA","1004");
			  }else if(dsn.equals("mysql")) {
				  Class.forName("com.mysql.cj.jdbc.Driver");
				  conn = DriverManager.getConnection("jdbc:mysql://192.168.0.3:3306/sampledb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=true","kosta","1004");
			  }

		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("conn return");
		return conn; 
	}

	

	public static void dbClose() {
		if(conn != null) {
			try {
				 conn.close();//์ฐ๊ฒฐํด์  (DB ์ฐ๊ฒฐ ๋๊ธฐ)
				 conn = null; //์ฐธ์กฐ๋ฅผ  null ๋ง๋๋ค  
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

     public static void close(Connection conn) {

		if(conn != null) {
			try {
				conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

	
	public static void close(Statement stmt) {
		if(stmt != null) {
			try {
				stmt.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

	public static void close(ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

	public static void close(PreparedStatement pstmt) {
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
```
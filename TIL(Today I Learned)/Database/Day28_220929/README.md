# ๐ Day28_220929

Author: ๊ณ ๋ฒ์ข
Created Time: 2022๋ 9์ 29์ผ ์ค์  9:21
Status: ๐จ Published
Updated Time: 2022๋ 9์ 29์ผ ์คํ 6:55

# 1. ์๋ธ์ฟผ๋ฆฌ

---

- ๋ฉ์ธ์ฟผ๋ฆฌ ์์์๋ ์ฟผ๋ฆฌ๋ฅผ ์ฌ์ฉํ๋๊ฑธ ์๋ธ์ฟผ๋ฆฌ๋ผ๊ณ  ํ๋ค.
- 2๊ฐ์ ์ฟผ๋ฆฌ๋ฅผ ํ๋๋ก ํตํฉ

## single row subquery

- ์คํ๊ฒฐ๊ณผ๊ฐ ๋จ์ผ row ๋จ์ผ column์ธ ๊ฒฝ์ฐ๋ฅผ (๋จ ํ๊ฐ์ ๋ฐํ)
- ex) select avg(sal) from emp
์ฐ์ฐ์: ( =  !=  <  > )

## multi row subquery

- ์คํ๊ฒฐ๊ณผ๊ฐ ๋จ์ผ column row ์ฌ๋ฌ๊ฐ์ธ ๊ฒฝ์ฐ
- ex) select sal from emp
์ฐ์ฐ์: IN, NOT IN, ANY, ALL
ALL : sal > 1000 and sal > 4000 and ...
ANY : sal > 1000 or  sal > 4000 or

### ๋ฌธ๋ฒ)

1. ๊ดํธ์์ ์์ด์ผ ํ๋ค >> (select max(sal) from emp)
2. ๋จ์ผ ์ปฌ๋ผ์ผ๋ก ๊ตฌ์ฑ >> selecet max(sal), sum(sal) from emp (์ด๋ฐ์ x)
3. ๋จ๋์ผ๋ก ์คํ ๊ฐ๋ฅ

### [์์]

- ์ฌ์ํ์ด๋ธ์์ ์ฌ์๋ค์ ํ๊ท  ์๊ธ๋ณด๋ค ๋ ๋ง์ ์๊ธ์ ๋ฐ๋ ์ฌ์์ ์ฌ๋ฒ, ์ด๋ฆ, ๊ธ์ฌ๋ฅผ ์ถ๋ ฅํ์ธ์

```sql
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp);
```

[์ถ๋ ฅ]

![https://user-images.githubusercontent.com/92353613/192912594-73669602-57af-4964-836e-b259aff88c86.png](https://user-images.githubusercontent.com/92353613/192912594-73669602-57af-4964-836e-b259aff88c86.png)

where์ [select from where] ์ ๋ถ๋ฅผ ์ ์ด์ฃผ์ด ์ฌ์ฉํ๋ค

### ์คํ์์

1. subquery ๋จผ์  ์คํ
2. ๊ฒฐ๊ณผ๋ฅผ ๊ฐ์ง๊ณ  ๋ฉ์ธ query ์คํ

### TIP)

select ...(subquery) >> ํ๊ฐ์ ํ๋ง ๋ฐํํ  ๊ฒฝ์ฐ (Scala subquery)
from (subquery) >> inline view(๊ฐ์ํ์ด๋ธ) ... ^^
where (subquery) >> ์กฐ๊ฑด

๋ฉํฐ๋ 'in' ์ฑ๊ธ์ '์ฐ์ฐ์โ

### [๋ฌธ์ ]

- ์ฌ์ํ์ด๋ธ์์ jones ์ ๊ธ์ฌ๋ณด๋ค ๋ ๋ง์ ๊ธ์ฌ๋ฅผ ๋ฐ๋ ์ฌ์ ์ฌ๋ฒ, ์ด๋ฆ, ๊ธ์ฌ๋ฅผ ์ถ๋ ฅํ์ธ์

```sql
select sal
from emp
where ename = 'JONES';  -- >> 2975

select empno, ename, sal
from emp
where sal > (select sal from emp where ename = 'JONES'); -- ๋จ์ผ

select *
from emp
where sal IN (select sal from emp where deptno = 30); -- ๋ฉํฐ
-- sal=1600 or sal=1250 or sal=1250 or sal=2580 or sal=1500 and sal=950

select *
from emp
where sal NOT IN (select sal from emp where deptno = 30);
-- sal!=1600 or sal!=1250 or sal!=1250 or sal!=2580 or sal!=1500 and sal!=950
```

### [๋ฌธ์ ]

- ๋ถํ์ง์์ด ์๋ ์ฌ์์ ์ฌ๋ฒ๊ณผ ์ด๋ฆ์ ์ถ๋ ฅํ์ธ์

```sql
-- ๋ด ์ฌ๋ฒ์ด mgr ์ปฌ๋ผ์ ์์ผ๋ฉด
select mgr from emp;
select *
from emp
where empno in (select mgr from emp);
-- where empno=7902 or empno=7788 or empno=null (or ์์  null ์ํฅx)

-- ๋ถํ์ง์์ด ์๋ ์ฌ์์ ์ฌ๋ฒ๊ณผ ์ด๋ฆ์ ์ถ๋ ฅํ์ธ์
select mgr from emp;
select *
from emp
where empno not in (select mgr from emp);
-- where empno!=7902 and empno!=7788 and empno!=null (and ์์  null ์ํฅo)

-- ๋ถํ์ง์์ด ์๋ ์ฌ์์ ์ฌ๋ฒ๊ณผ ์ด๋ฆ์ ์ถ๋ ฅํ์ธ์
select mgr from emp;
select *
from emp
where empno not in (select nvl(mgr,0) from emp);
```

์์๊ฐ์ด ๋ฐ์ดํฐ๊ฐ null๊ฐ์ด ์์ด ์ถ๋ ฅ์ด ๋์ง์์๋ ์ด์ ๊ฐ ์ ํ์๋ค

or์ผ๋ null์ ๋ฌด์ํ์ง๋ง and์ผ๋ null์ ์ํฅ์ด ์์ผ๋ฏ๋ก ๋์ค์ง ์๋๋ค.

- ๋ฌธ์ ๋ชจ์์ง
    - [๋ฌธ์  1]
        - 'SMITH'๋ณด๋ค ์๊ธ์ ๋ง์ด ๋ฐ๋ ์ฌ์๋ค์ ์ด๋ฆ๊ณผ ์๊ธ์ ์ถ๋ ฅํ๋ผ.
        
        ```sql
        SELECT ENAME, SAL
        FROM EMP
        WHERE SAL>(SELECT SAL
                       FROM EMP
                       WHERE ENAME='SMITH');
        ```
        
        [๋ฌธ์  2]
        
        - 10๋ฒ ๋ถ์์ ์ฌ์๋ค๊ณผ ๊ฐ์ ์๊ธ์ ๋ฐ๋ ์ฌ์๋ค์ ์ด๋ฆ, ์๊ธ, ๋ถ์๋ฒํธ๋ฅผ ์ถ๋ ฅํ๋ผ.
        
        ```sql
        SELECT ENAME, SAL, DEPTNO
        FROM EMP
        WHERE SAL IN(SELECT SAL
                         FROM EMP
                         WHERE DEPTNO=10);
        ```
        
        [๋ฌธ์  3]
        
        [๋ฌธ์  4]
        
        [๋ฌธ์  5]
        
        [๋ฌธ์  6]
        
        [๋ฌธ์  7]
        
        [๋ฌธ์  8]
        
        [๋ฌธ์  9]
        
        [๋ฌธ์  10]
        
        [๋ฌธ์  11]
        

# 2. DML (๋ฐ์ดํฐ ์กฐ์์ด)

---

#์ค๋ผํด.pdf(168page)
์๊ธฐํ์ธ์!! (๊ทธ์ ๋๋ก ์ค์)

## ์ค๋ผํด๊ธฐ์ค

- DDL(๋ฐ์ดํฐ ์ ์์ด) : [create, alter, drop, truncate], rename, modify
- DML(๋ฐ์ดํฐ ์กฐ์์ด) : insert, update, delete
- DQL(๋ฐ์ดํฐ ์ง์์ด) : select (ํจ์, ์กฐ์ธ, ์๋ธ์ฟผ๋ฆฌ)
- DCL(๋ฐ์ดํฐ ์ ์ด์ด) : grant, revoke (๊ด๋ฆฌ์)
- TCL(ํธ๋์ญ์)          : commit, rollback, savepoint

### transaction

- ํ๋์ ๋ผ๋ฆฌ์ ์ธ ์์ ๋จ์

[์์]

```sql
A๊ณ์ข์์ ์ถ๊ธ B๊ณ์ข ์๊ธ(์๋ฌด) >> ํ๋์ ๋ผ๋ฆฌ์ ์ธ ๋จ์ ๋ฌถ์ด์ ์ฒ๋ฆฌ
๋๋ค ์ฑ๊ณต or ๋๋ค ์คํจ
์ฒ๋ฆฌํ๋ ๋ฐฉ๋ฒ(commit, rollback)
```

## 1. insert

### 1.1 ๊ฐ์ฅ ์ผ๋ฐ์ ์ธ insert

```sql
insert into temp(id,name)
values(100, 'ํ๊ธธ๋');

select * from temp;

commit;
```

### 1.2 ์ปฌ๋ผ ๋ชฉ๋ก ์๋ต (์ฌ๋งํ๋ฉด ์ฌ์ฉx)

```sql
insert into temp
values(200,'๊น์ ์ ');

select * from temp;
```

### 1.3 ๋ฌธ์  (insert)

```sql
insert into temp(name)
values('์๋ฌด๊ฐ');      --id pk ์ ์ฝ (null x)

insert into temp(id, name)
values(100,'๊ฐ๋ฅ์ด');  -- pk์ค '100' ๋๋ฌธ์ ์๋
```

# 3. ๋๋ ๋ฐ์ดํฐ  ์ฝ์

## PL/SQL

sql์์ ํ๋ก๊ทธ๋๋ฐ for๋ฌธ ์ฒ๋ผ ์ฌ์ฉํ  ์ ์๋ค.

### [์์]

```sql
create table temp2(id varchar2(50));
BEGIN
    FOR i IN 1..100 LOOP
        insert into temp2(id) values('A' || to_char(i));
    END LOOP;
END;

select * from temp2;
```

[์ถ๋ ฅ]

![https://user-images.githubusercontent.com/92353613/192948973-40eccad9-d380-4a8c-9805-b350418efcf3.png](https://user-images.githubusercontent.com/92353613/192948973-40eccad9-d380-4a8c-9805-b350418efcf3.png)

### [์์]

```sql
create table temp3(
    memberid number(3) not null, --3์๋ฆฌ ์ ์
    name varchar2(10), -- nullํ์ฉ
    regdate date default sysdate -- ์ด๊ธฐ๊ฐ ์ค์ (๊ธฐ๋ณธ๊ฐ) (์์คํ ๋ ์ง๋ฅผ ๊ธฐ๋ณธ๊ฐ ์ฌ์ฉ)
);

select * from col where tname = 'TEMP3';

select sysdate from dual;
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
```

- ๊ธฐ๋ณธ ์ค์ 

```sql
insert into temp3(memberid, name, regdate)
values(100,'ํ๊ธธ๋','2022-09-29');

select * from temp3;
commit;

insert into temp3(memberid, name)
values(200,'๊น์ ์ ');

select * from temp3;
commit;

insert into temp3(memberid)
values(300);

select * from temp3;
commit;

insert into temp3(name)
values('๋๊ตฌ');
rollback;
```

์์๊ฐ์ด ๊ฐ์ ๋ฃ์ด๋ณด๊ณ  commit rollback ํด๋ณด์๋ค.

## ๋๋ insert

### ๋ฌธ๋ฒ 2๊ฐ

- insert into ํ์ด๋ธ๋ช(์ปฌ๋ผ๋ฆฌ์คํธ) values
- insert into ํ์ด๋ธ๋ช(์ปฌ๋ผ๋ฆฌ์คํธ) select ์ 
- ๋ด์ ํ์ด๋ธ์ด ์๋ ๊ฒฝ์ฐ >> ํ์ด๋ธ ๋ณต์ (๊ตฌ์กฐ: ์คํค๋ง) + ๋ฐ์ดํฐ ์ฝ์)
- ๋จ ์ ์ฝ์ ๋ณด๋ ๋ณต์  x (PK, FK)
- ์์ํ ๋ฐ์ดํฐ ๊ตฌ์กฐ ๋ณต์  + ๋ฐ์ดํฐ ๋ณต์ฌ

### [์์]

- temp4์ ์๋ ๋ชจ๋  ๋ฐ์ดํฐ๋ฅผ temp5์ ๋ฃ๊ณ ์ถ์ด์

```sql
insert into temp5(num)
select id from temp4; --๋๋๋ฐ์ดํฐ ์ฝ์...
```

```sql
create table copyemp
as
    select * from emp;
select * from copyemp;

create table copyemp2
as
    select empno, ename, sal
    from emp
    where deptno=30;

select * from copyemp2;
```

### [ํด์ฆ]

- ํ(๊ตฌ์กฐ)๋ง ๋ณต์ ํ๊ณ  ๋ฐ์ดํฐ๋ ๋ณต์ฌํ๊ณ  ์ถ์ง ์์์

```sql
create table copyemp3
as
    select * from emp where 1=2;
    
select * from copyemp3;
```

[์ถ๋ ฅ]

![https://user-images.githubusercontent.com/92353613/192951108-fde18ebf-f609-459e-9027-438bc6543a0a.png](https://user-images.githubusercontent.com/92353613/192951108-fde18ebf-f609-459e-9027-438bc6543a0a.png)

# UPDATE

update ํ์ด๋ธ๋ช
set ์ปฌ๋ผ๋ช = ๊ฐ, ์ปฌ๋ผ๋ช2 = ๊ฐ2.....
where ์กฐ๊ฑด์ 

update ํ์ด๋ธ๋ช
set ์ปฌ๋ผ = (subquery)
where ์ปฌ๋ผ๋ช = (subquery)

- ๋ด๊ฐ ์ดํดํ๊ฑด ์ฌ์ค์ ๋ฎ์ด์ฐ๊ธฐ์๋ค.

```sql
select * from copyemp;

update copyemp
set sal = 0;

select * from copyemp;
rollback;

update copyemp
set sal=1111
where deptno = 20;

select * from copyemp;
rollback;

update copyemp
set sal = (select sum(sal) from emp);

select * from copyemp;
rollback;

update copyemp
set ename='AAAA', job='BBB', hiredate=sysdate, sal=(select sum(sal) from emp)
where empno =7369;

select * from copyemp where empno = 7369;
```

# DELETE

- ์ญ์ 

```sql
delete from copyemp;
select * from copyemp;
rollback;

delete from copyemp where deptno=10;
select * from copyemp where deptno=10;  -- ์ด๋ ๊ฒ ์ง์ ํด์ ์ง์ธ์๋ ์์
commit;
```
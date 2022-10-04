# 📚 Day30_221004

Author: 고범종
Created Time: 2022년 10월 4일 오전 9:02
Status: 🖨 Published
Updated Time: 2022년 10월 4일 오후 8:16

# 1. SEQUENCE

---

(자동으로 번호를 생성하는 객체)
채번하기, 번호 추출기

CREATE SEQUENCE sequence_name
[INCREMENT BY n]
[START WITH n]
[{MAXVALUE n | NOMAXVALUE}]
[{MINVALUE n | NOMINVALUE}]
[{CYCLE | NOCYCLE}]
[{CACHE | NOCACHE}]

### [잘못된 예시]

```sql
create table board(
boardid number constraint pk_board_boardid primary key,
title nvarchar2(50)
);

select * from board;
--boardid (pk: not null, unique, 내부적으로 index 자동생성
--where boardid=10; 검색속도 향상 ...

--게시판 글쓰기 작업
insert into board(boardid, title) values(1,'처음글');
insert into board(boardid, title) values(2,'글');
-- 처음 글은 1번이고 그 다음글부터는 순차적인 값을 insert ...

insert into board(boardid, title)
values((select count(boardid) + 1 from board), '2');
insert into board(boardid, title)
values((select count(boardid) + 1 from board), '3');
```

insert into board(boardid, title)
values((select count(boardid) + 1 from board), '2');
insert into board(boardid, title)
values((select count(boardid) + 1 from board), '3');

서브쿼리를 이용해 자동으로 PK를 설정해주었다.

하지만 만약 PK 1번을 delete 할 경우 

```sql
insert into board(boardid, title)
values((select count(boardid) + 1 from board), '4');
--ORA-00001: unique constraint (HR.PK_BOARD_BOARDID) violated
--DML 문제발생
```

이런식으로 오류가 난다.
그렇기에 다른방법을 찾아보았다.

### [집계함수]

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

max함수를 이용해 중간에 값을 delete해주어도 잘 늘어난다.

하지만… 이런식으로 순번을 적으면 좀 많이 귀찮을것이다.

그렇기에 나온것이 ***sequence***

## sequence

- sequence 객체 제공: 중복값이 없고 순차적인 값을 제공하는 객체

```sql
create sequence board_num;

select board_num.nextval from dual; -- 채번

select board_num.currval from dual; -- 현재까지 채번한 번호 확인
```

### NEXTVAL 과 CURRVAL 의사열

특징)

1. NEXTVAL 는 다음 사용 가능한 SEQUENCE 값을 반환 한다.
2. SEQUENCE 가 참조될 때 마다, 다른 사용자에게 조차도 유일한 값을 반환한다.
3. CURRVAL 은 현재 SEQUENCE 값을 얻는다.
4. CURRVAL 이 참조되기 전에 NEXTVAL 이 사용되어야 한다.

### [게시판 예시]

```sql
--게시판
--게시판에 사용되는 채번기
create table kboard(
    num number constraint pk_kboard_num primary key,
    title nvarchar2(20)
);

create sequence kboard_num;

insert into kboard(num, title)
values(kboard_num.nextval, '처음');

insert into kboard(num, title)
values(kboard_num.nextval, '둘이당');

insert into kboard(num, title)
values(kboard_num.nextval, '셋이당');

select * from kboard;

delete from kboard where num=1;
delete from kboard where num=2;

insert into kboard(num, title)
values(kboard_num.nextval, '넷이당');

select * from kboard;
commit;
```

[출력]

![https://user-images.githubusercontent.com/92353613/193711010-689c20bd-1943-4d89-a09b-7dd127291110.png](https://user-images.githubusercontent.com/92353613/193711010-689c20bd-1943-4d89-a09b-7dd127291110.png)

> — 게시판 —
공지사항, 자유게시판, 관리자 게시판 등등
공지사항 1..2..3...
자유게시판 4...
관리자 게시판 5... .6....
공지사항 7....
> 
> 1. sequence 객체는 공유객체 (테이블에 종속되지 않아요)
> 하나의 시퀀스는 여러곳에서 자유롭게 사용가능하다
> sequence 하나 생성해서 >> 공지사항, 자유게시판, 관리자 게시판 사용가능
> 2. 웹 사이트 (게시판 10개)
> 상품게시판, 관리자게시판, 회원게시판 등등...
> 각각의 게시판은 순번을 따로 관리하기를 원해요
> 10개의 시퀀스를 만들어서 각각 사용하면 돼요.

### TIP)

MS-SQL: create table board(boardnum int identity(1,1).... title
insert into(title) values('방가); 자동 (1,2,3,...)

MS-SQL: 2012버전 (sequence객체)

Mysql: create table board(boardnum int auto_increment, ... title)
insert into(title) values('방가); 자동 (1,2,3,...)

mysql 만든 사람들이 open source >> mariadb(같은 엔진)
mariadb 시퀀스 객체 존재

### [예시]

```sql
create sequence seq_num
start with 10
increment by 2; --2씩증가

select seq_num.nextval from dual; -- 슝슝
select seq_num.currval from dual; -- 현재 번호출력
```

# 2. rownum(순번)

### [예시]

```sql
select rownum as 순번, empno, ename from emp;
--select 한 결과에 순번을 부여...
```

[출력]

![https://user-images.githubusercontent.com/92353613/193716291-5a795d94-39ba-4c98-8c57-001b752491f4.png](https://user-images.githubusercontent.com/92353613/193716291-5a795d94-39ba-4c98-8c57-001b752491f4.png)

- 순번이 출력이 된다.

## Top-n 쿼리 (정렬된 기준으로 위에서 몇개 추출)

테이블에서 조건에 맞는 상위(Top) 에서 레코드(row) n개를 추출

> Tip)
MS-SQP: select top 10, * from emp order by sal desc;
> 
> 
> Oracle top n (x))
> rownum: 순번을 부여 특정 조건에 맞게 top 쿼리 실행가능
> 
> 1. **정렬**의 기준을 정의 (선행)
> 2. 정렬된 데이터를 기준으로 rownum설정하고 조건을 걸고 데이터 추출

### [예시]

1단계 (sal 높은순으로 정렬)

```sql
select *
from (  select *
        from emp
        order by sal desc
     )e;
```

2단계 (순번이 붙음)

```sql
select rownum as num, e.*
from (  select *
        from emp
        order by sal desc
     )e;
```

3단계 (급여를 많이 받는 사원 5명)

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

[3단계 출력]

![https://user-images.githubusercontent.com/92353613/193717402-d8341692-380f-4b79-89d2-2045a02cc6d6.png](https://user-images.githubusercontent.com/92353613/193717402-d8341692-380f-4b79-89d2-2045a02cc6d6.png)

> 게시판
/*
100건
웹 사이트에 100건 데이터가 한 화면 출력 기능
10건씩 나누어서 화면에 출력
> 
> 
> pagesize = 10 (한 화면에 (페이지)에 보여줄 수 있는 데이터 row수)
> page 개수 = 10개
> 
> [1][2][3][4][5][6][7][8][9][10] >> java 구현 >> <a href='page.jsp?'>10</a>
> 1page >> 1~10   >> DB select 1~10글
> 2page >> 11~20  >> DB select 11~20글
> 3page >> 21~30 ....
> 

> >>rownum
>>between A and B
> 

### [예시]

1단계 (기준 데이터 만들기 (정렬))

```sql
--사번이 낮은 순으로 정렬
select * from employees order by employee_id asc;
```

2단계 (기준 데이터에 순번 부여하기)

```sql
select rownum as num, e.*
from (
     select * from employees order by employee_id asc
     )e
where rownum <=50; --정렬된 데이터에 내부적으로 생성된 rownum
```

3단계

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

3단계 간단.ver

```sql
select *
 FROM (
         SELECT ROWNUM AS NUM, E.* 
         FROM EMPLOYEES E ORDER BY EMPLOYEE_ID ASC
 ) WHERE NUM <=10;
```

[3단계 출력]

![https://user-images.githubusercontent.com/92353613/193719831-752ac445-ee62-4f6a-9156-98817b45478e.png](https://user-images.githubusercontent.com/92353613/193719831-752ac445-ee62-4f6a-9156-98817b45478e.png)

출력과 같이 정렬한 뒤 num을 통해 원하는대로 잘라서 보여줄 수가 있다.

이를통해 게시판의 1page 2page에 10개씩 보여주기 기능을 구현할 수 있다.

> 107건
pagesize = 10
[1][2][3][4][5][6][7][8][9][10][11]
[1] >> 1~10
[2] >> 11~20
...
[10] >> 91~100
[11] >> 101~107
> 

# 3. JDBC 기본구조

![https://user-images.githubusercontent.com/92353613/193723288-3f5460fe-41af-4c51-b9cd-72c35cba7969.png](https://user-images.githubusercontent.com/92353613/193723288-3f5460fe-41af-4c51-b9cd-72c35cba7969.png)

- JDBC: 자바에서 데이터베이스에 접속할 수 있도록 하는 자바 API이다.

> JDBC
> 
> 1. Java 언언(APP)을 통해서 Oracle(소프트웨어) 연결해서 CRUD작업
> 2. Java App: Oracle, My-sql, Ms-sql 등등 연결하고 작업(CRUD)
> 2.1 각각의 제품에 맞는 드라이버를 가지고 있어야 한다.
> CASE 1: 삼성 노트북 >> HP 프린터 연결 >> HP프린터 사이트에서 드라이버 다운 >> 삼성 설치
> CASE 2: HP프린터 제조 회사는 ...
> 3. 드라이버를 참조 (현재 프로젝트에서 사용) >> Java Project -> 속성 -> build path -> jar 파일 추가
> 3.1 드라이버 사용 준비 완료 >> 메모리에 load 사용 ...
> 3.2 Class.forName("oracle.jdbc.OracleDriver").... new 객체 생성 ...
> 4. JAVACODE (CRUD) >> JDBC API 제공 받는다.
> 4.1 import java.sql.* >> interface, class 제공
> 4.2 개발자는 interface를 통해서 표준화된 DB작업 수행가능
> POINT) why interface형태로 제공할까? >> JDBC API >> Oracle, Mysql, ...)
> 5. 작업순서
> 5.1 DB연결 -> 명령생성 -> 명령실행 -> 처리 -> 자원해제
> 명령: DDL (create, alter, drop)
> CRUD (insert, select, update, delete)
> 실행: 쿼리문을 DB서버에게 전달
> 처리: 결과를 받아서 화면 출력, 또는 다른 프로그램에 전달 등등
> 자원해제: 연결해제

### [이클립스 DB연결 후 정보 가져오기]

```java
public class Ex01_Oracle_Connection {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		//DB연결 -> 명령생성 -> 실행 -> 처리
		Class.forName("oracle.jdbc.OracleDriver");
		System.out.println("오라클 드라이버 로딩....");
		
		//loading 된 드라이버를 통해서 oracle연결
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","KOSA","1004");
		System.out.println(conn.isClosed() + "정상 false");

		Statement stmt = conn.createStatement(); //명령객체 얻어오기
		
		//CRUD
		String sql="select empno, ename, sal from emp";
		
		ResultSet rs = stmt.executeQuery(sql);// 명령 실행
		
		//rs를 통해서  DB서버 memory에 생성된 정보를 조회
		//처리(화면조회)
		while(rs.next()) {
			System.out.println(rs.getInt("empno") + "/" + rs.getString("ename") + rs.getInt("sal"));
		}
		
		stmt.close();
		rs.close();
		conn.close();
		System.out.println("DB 연결: " + conn.isClosed());
		
	}
}
```

[출력]

```java
오라클 드라이버 로딩....
false정상 false
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
DB 연결: true
```

## ResultSet Flow

![https://user-images.githubusercontent.com/92353613/193739783-c7d46faa-c027-425d-8291-ca6b01180c52.png](https://user-images.githubusercontent.com/92353613/193739783-c7d46faa-c027-425d-8291-ca6b01180c52.png)

## DML (insert, update, delete)

JDBC API통해서 작업

---

1. 결과 집합이 없다 (resultSet 필요 없다)
2. 반영결과 (return 행의 수) >> update 5건 >> return 5

java코드

---

update emp set sal=0 > 실행 > update 14건 >> return 14
update emp set sal=100 where empno=4444> update 0건 >> return 0

결과를 가지고 java코드로 로직처리

### KEY POINT

---

1. Oracle DML(developer, Cmd(sqlplus), tool) 하면 commit or rollback강제
2. JDBC API 사용해서 java 코드를 통해서 DML >> default >> autocommit; >> 실반영
3. JDBC API 통해서 delete from emp >> 실행 >> 자동 commit> 실반영
4. 필요에 따라 commit(), rollback 처리 코드...

### [UPDATE 예제]

```java
public class Ex02_Oracle_DML_update {
   public static void main(String[] args) {
      Connection conn = null;
      Statement stmt = null;
      
      try {
         //드라이버 로딩
         //ClassforName("oracle.jdbc.OracleDriver"); 생략가능
         
         //Connection 인터페이스를 구현하고 있는 객체의 주소가 리턴 ...
         //다형성을 통해서 COnnection 타입의 conn 변수가 주소값을 받는다
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","KOSA","1004");
         stmt = conn.createStatement(); //Statement 구현하고 있는 객체의 주소 리
         
         //INSERT
           Scanner scan = new Scanner(System.in);
           int deptno = 0;
            
           System.out.print("부서입력 : ");
           deptno = Integer.parseInt(scan.nextLine());
            
           //update dmlemp set sal=0 where deptno=부서번호
           String sql="update dmlemp set sal=0 where deptno="+deptno;
           System.out.println(sql);
         
         
         //현재
         //values(?,?,?)      >> ? parameter 별도 설정
         //executeUpdate()   >> insert, update, delete 모두 수행
         int resultrow = stmt.executeUpdate(sql);
         
         if(resultrow > 0) {
            System.out.println("반영된 행의 수: " + resultrow);
         }else {
            System.out.println("예외가 발생된 것이 아니고 : 반영된 행이 없다 ");
         }
         
      } catch (Exception e) {
         //중복데이터 insert 해서 문제가 생기면 executeUpdate() 예외 발생
         //코드 처리
         System.out.println("SQL 예외발생: " + e.getMessage());
      } finally {
         //강제 수행 블럭
         //자원해제
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

### [INSERT 예제]

```java
public class Ex02_Oracle_DML_insert {
	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		
		try {
			//드라이버 로딩
			//ClassforName("oracle.jdbc.OracleDriver"); 생략가능
			
			//Connection 인터페이스를 구현하고 있는 객체의 주소가 리턴 ...
			//다형성을 통해서 COnnection 타입의 conn 변수가 주소값을 받는다
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","KOSA","1004");
			stmt = conn.createStatement(); //Statement 구현하고 있는 객체의 주소 리
			
			//INSERT
	         int empno = 0;
	         String ename = "";
	         int deptno = 0;
	         
	         Scanner scan = new Scanner(System.in);
	         System.out.print("사번입력 : ");
	         empno = Integer.parseInt(scan.nextLine());
	         
	         System.out.print("이름입력 : ");
	         ename = scan.nextLine();
	         
	         System.out.print("부서입력 : ");
	         deptno = Integer.parseInt(scan.nextLine());
	         
	         //insert into dmlemp(empno, ename, deptno) values () 고전적인 방법
	         String sql = "insert into dmlemp(empno, ename, deptno) ";
	         sql += "values (" + empno + ", '" + ename + "'," + deptno + ")";

			
			//현재
			//values(?,?,?)		>> ? parameter 별도 설정
			//executeUpdate()	>> insert, update, delete 모두 수행
			int resultrow = stmt.executeUpdate(sql);
			
			if(resultrow > 0) {
				System.out.println("반영된 행의 수: " + resultrow);
			}else {
				System.out.println("예외가 발생된 것이 아니고 : 반영된 행이 없다 ");
			}
			
		} catch (Exception e) {
			//중복데이터 insert 해서 문제가 생기면 executeUpdate() 예외 발생
			//코드 처리
			System.out.println("SQL 예외발생: " + e.getMessage());
		} finally {
			//강제 수행 블럭
			//자원해제
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

### [DELETE 예제]

```java
public class Ex02_Oracle_DML_delete {
   public static void main(String[] args) {
      Connection conn = null;
      Statement stmt = null;
      
      try {
         //드라이버 로딩
         //ClassforName("oracle.jdbc.OracleDriver"); 생략가능
         
         //Connection 인터페이스를 구현하고 있는 객체의 주소가 리턴 ...
         //다형성을 통해서 COnnection 타입의 conn 변수가 주소값을 받는다
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","KOSA","1004");
         stmt = conn.createStatement(); //Statement 구현하고 있는 객체의 주소 리
         
         //INSERT
           Scanner scan = new Scanner(System.in);
           int deptno = 0;
            
           System.out.print("부서입력 : ");
           deptno = Integer.parseInt(scan.nextLine());
            
           //delete dmlemp where deptno=부서번호
           String sql="delete dmlemp where deptno="+deptno;
           System.out.println(sql);
         
         
         //현재
         //values(?,?,?)      >> ? parameter 별도 설정
         //executeUpdate()   >> insert, update, delete 모두 수행
         int resultrow = stmt.executeUpdate(sql);
         
         if(resultrow > 0) {
            System.out.println("반영된 행의 수: " + resultrow);
         }else {
            System.out.println("예외가 발생된 것이 아니고 : 반영된 행이 없다 ");
         }
         
      } catch (Exception e) {
         //중복데이터 insert 해서 문제가 생기면 executeUpdate() 예외 발생
         //코드 처리
         System.out.println("SQL 예외발생: " + e.getMessage());
      } finally {
         //강제 수행 블럭
         //자원해제
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

1. 설명
미리 SQL문이 셋팅된 Statement 가 DB가 전송되어져서 컴파일되어지고, SQL문의 ?만 나중에 추가 셋팅해서 실행
이 되어지는 준비된 Statement
    - ex) select * from emp where empno=7788 -> 구문분석 -> 실행계획 -> 메모리 ...
    select * from emp where EMPNO=7788 -> 구문분석 -> 실행계획 -> 메모리 ....
2.  장점
- Statement 에 비해서 반복적인 SQL문을 사용할 경우에 더 빠르다. ( 특히, 검색문 )
- DB컬럼타입과 상관없이 ?하나로 표시하면 되므로 개발자가 헷깔리지 않고 쉽다. ( 특히, INSERT문 )
(이유: ?를 제외한 SQL문이 DB에서 미리 컴파일되어져서 대기)
1.  단점
SQL문마다 PreparedStatement 객체를 각각 생성해야 하므로 재사용불가
(but, Statement 객체는 SQL문이 달라지더라도 한 개만 생성해서 재사용이 가능하다. )
2.  특징
- Statement stmt = con.createStatement(); //생성 stmt.execute(sql);//실행
- PreparedStatement pstmt = con.prepareStatement(sql); //생성 pstmt.execute(); //실행
1.  주의
DB 객체들(table, ..)의 뼈대( 테이블명 or 컬럼명 or 시퀀스명 등의 객체나 속성명)은
?로 표시할 수 없다.
    - 즉, data 자리에만 ?로 표시할 수 있다.
    cf) 그래서, DDL문에서는 PreparedStatement를 사용하지 않는다.

<aside>
💡 단점)
쿼리문이 바뀌면 다시 컴파일...

</aside>

### [PrepareStatement 예시]

```java
public class Ex05_Oracle_PrepareStatement {
	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			conn = SingletonHelper.getConnection("oracle");
			String sql="select empno, ename, from emp where deptno=?"; //파라미터값을 '?'으로 표현
			//where id=? and name=? and job=?
			// ? parameter
			pstmt = conn.prepareStatement(sql); // 미리 컴파일 시켜놓음
			
			//이후에는 parameter 설정해서 DB ... 보내면 돼요
			pstmt.setInt(1, 30); // where deptno=30
			
			rs = pstmt.executeQuery();
			//공식같은 로직
			//데이터 1건ㄴ or 1건 이상 or 없는 경우
			if(rs.next()) { //최소 1건
				do {
					System.out.println(rs.getInt(0));
				} while(rs.next());
				
			}else {
				//데이터 없다
				System.out.println("조회된 데이터가 없습니다.");
			}
			
		} catch (Exception e) {
			
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
			//싱글톤은 close() 하지 않아요 app .... 존속하는 한...
		}
			
	}
}
```

# [**JDBC 초급자 과제]**

[문제]

```java
create table sdept

as

   select * from dept;

sdept 테이블에 대해서
전체조회
조건조회
삽입
삭제
수정
을 작업 하시면 됩니다
PreparedStatement
```

[메인문]

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
	            
	           if (rs.next()) { //최소 1건
	            do {
	               System.out.println(rs.getInt(1) + " / " + rs.getString(2) + " / " + rs.getString(3));
	            } while (rs.next());
	         }else { System.out.println("조회된 데이터가 없습니다."); }

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
			System.out.println("입력하세요");
			System.out.print("deptno= ");
			int a = Integer.parseInt(sc.nextLine());
		
			conn = SingletonHelper.getConnection("oracle");
			String sql="delete from sdept where deptno=?";
			pstmt = conn.prepareStatement(sql); // 미리 컴파일 시켜놓음
			
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
			System.out.println("입력하세요");
			System.out.print("deptno= ");
			int a = Integer.parseInt(sc.nextLine());
			System.out.print("dname= ");
			String b = sc.nextLine();
			System.out.print("loc= ");
			String c = sc.nextLine();
			
			conn = SingletonHelper.getConnection("oracle");
			String sql="insert into sdept values(?,?,?)";
			pstmt = conn.prepareStatement(sql); // 미리 컴파일 시켜놓음
			
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
			System.out.println("입력하세요");
			System.out.print("deptno= ");
			int a = Integer.parseInt(sc.nextLine());
		
			conn = SingletonHelper.getConnection("oracle");
			String sql="select * from sdept where deptno=?";
			pstmt = conn.prepareStatement(sql); // 미리 컴파일 시켜놓음
			
			pstmt.setInt(1,a);
	        rs = pstmt.executeQuery();
	        
	        if (rs.next()) { //최소 1건
	            do {
	               System.out.println(rs.getInt(1) + " / " + rs.getString(2) + " / " + rs.getString(3));
	            } while (rs.next());
	         }else { System.out.println("조회된 데이터가 없습니다."); }

			
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
			System.out.println("바꿀 deptno= ");
			int d = Integer.parseInt(sc.nextLine());
			System.out.println("입력하세요");
			System.out.print("deptno= ");
			int a = Integer.parseInt(sc.nextLine());
			System.out.print("dname= ");
			String b = sc.nextLine();
			System.out.print("loc= ");
			String c = sc.nextLine();
			
			
			 conn = SingletonHelper.getConnection("oracle");
			 String sql="update sdept set deptno=?,dname=?,loc=? where deptno=?";
			 pstmt = conn.prepareStatement(sql); //미리 컴파일 ...
		
			 
			 
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

[싱글톤패턴]

```java
package kr.or.kosa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

//조별 문제
//ConnectionHelper 코드는 singleton으로 바꾸세요 ^^
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
				 conn.close();//연결해제 (DB 연결 끊기)
				 conn = null; //참조를  null 만는다  
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
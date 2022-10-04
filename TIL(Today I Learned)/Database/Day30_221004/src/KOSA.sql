show user;
-- USER이(가) "KOSA"입니다.

/*
[1일차 수업]
1. 오라클 소프트웨어 다운로드
https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64 (무료설치)

3. Oracle 설치(SYS, SYSTEM 계정의 대한 암호 : 1004)

4.Sqlplus 프로그램 제공(CMD) : GUI 환경 일반개발자 사용 불편

5.별도의 Tool 설치 무료(SqlDeveloper , https://dbeaver.io/)  ,
                 유료(토드 , 오렌지 , SqlGate) 프로젝트시 설치 활용 ^^

6. SqlDeveloper 툴을 통해서 Oracle Server 접속 ....
   >> HR 계정 : 암호 1004 , Unlock 2가지 사용가능 .... (사원관리 실습 테이블)
   >> 새로운 계정 : BITUSER

-- USER SQL
ALTER USER "HR" IDENTIFIED BY 1004 
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP"
ACCOUNT UNLOCK ;

-- QUOTAS
ALTER USER "HR" QUOTA UNLIMITED ON USERS;

-- ROLES
ALTER USER "HR" DEFAULT ROLE "RESOURCE","CONNECT";

-- SYSTEM PRIVILEGES


7. 현재 접속 계정 확인 : show user;   >> USER이(가) "BITUSER"입니다.


-- USER SQL
CREATE USER "BITUSER" IDENTIFIED BY "1004"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS

-- ROLES
GRANT "CONNECT" TO "BITUSER" WITH ADMIN OPTION;
GRANT "RESOURCE" TO "BITUSER" WITH ADMIN OPTION;
ALTER USER "BITUSER" DEFAULT ROLE "CONNECT","RESOURCE";

-- SYSTEM PRIVILEGES


*/

show user;

/*
실습코드

CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;



CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

*/

select * from emp;
select * from dept;
select * from salgrade;
--------------------------------------------------------------------------------


-- 1. 사원테이블에서 모든 데이터를 출력하세요
-- 쿼리는 대소문자 구별 x
-- 구문 & 테이블 대소문자 구별은 회사마다 다름
select * from emp;
SELECT * FROM emp;

-- 2. 특정 컬럼 데이터 출력하기
select empno, ename, sal
from emp;  --줄을 바꿔도 세미콜론 전까지 입력이라 괜찮음

select ename
from emp;

-- 3. 컬럼명 가명칭(alias) 별칭 부여하기
select empno 사번, ename 이름 from emp;
select empno "사   번", ename "이   름"from emp;

-- SQL 표준 문법 (ANSI 문법) >> 표준 >> oracle or MS-sql or Mysql 에서 사용가능
select empno as "사   번", ename as "이   름"
from emp;

-- Oracle에서 문자열 데이터는 ''(싱글쿼테이션) 사용해서 표현
-- Oracle 문자열데이터 엄격하게 [대소문자] 구문
/*
JAVA: 문자 'A' , 문자열 "AAA"
Oracle: 문자열 'A', 'AA', 'AAA'
Oracle: A, a >> 다른 문자
*/
select empno, ename
from emp
where ename='KING';  -- king 이라고 적으면 찾을 수 없음
/*
select 절   3번
from 절     1번
where 절    2번
*/


-- Oracle query(질의어) : 언어
/* 
   연산자
   java: + 문자열 (결합연산)
   java: + 숫자 (산술연산)
   
   연산자
   oracle 결합연산자: ||
   oracle 산술연산자: + (산술)
*/  
-- Tip) MS-SQL + (결합, 산술)


select '사원의 이름은' || ename || '입니다' as "사원정보"
from emp;

-- 형변환 작업 (내부적으로 숫자 (문자열) 자동 형변환)
select empno || ename   -- 숫자 || 문자열 (결합)
from emp;

desc emp;
/*
타입
java:   class Emp {private int empno, private String ename}
oracle: create table Emp(empno number, ename varchar2(20));

oracle(컬럼): 숫자, 문자열, 날씨
varchar2(10) >> 문자열 데이터의 크기
*/



-- 개발실
-- 사장님 ..
-- 우리 회사에 직종이 몇개나 있나
select job from emp;
-- 중복 데이터를 제거 키워드: distinct
select distinct job from emp;


-- distinct 원리 >> 그룹핑
select distinct deptno, job
from emp
order by deptno;


-- Oracle연산자
-- java 거의 동일  ( + - * / ) 나머지 %
-- Oracle 동일    ( + - * / ) 나머지 연산자는 없음 >> 함수를 통해서 Mod()
-- eame like '%김%'


-- 사원테이블에서 사원의 급여를 100달러 인상한 결과를 출력하세요.
select empno, ename, sal, sal + 100 as "인상급여"
from emp;

desc emp;



-- dual 임시 가상테이블
select 100 + 100 from dual;     --200
select 100 || 100 from dual;    --100100
select '100' + 100 from dual;   --숫자형 문자(형변환 가능)
select 'A100' + 100 from dual;  -- 오류

show user;

--------------------------------------------------------------------------------------------------------------------------------
--220927시작--


/*
-- 비교연산자
>, <, <=
주의
java: 같다 (==) 할당(=) , javascript(==, ===)
oracle: 같다 (=) 같지않다(!=)

논리연산자
AND, OR , NOT
*/

select empno, ename, sal
from emp
where sal >= 2000;

-- 사번이 7788번인 사원의 사번, 이름, 직종, 입사일을 출력하세요
select empno,ename,deptno,sal
from emp
where empno = 7788;

-- 개발자: CRUD >> Create (insert), Read (select), Update, delete
-- DB 작업: Read (select) 70%

-- 관리자: 백업과 복원, 장애(네트워크, 성능) 관리, 보안(사용자권한, 암호화)
-- 튜닝 (쿼리튜닝, 하드웨어) >> 문장튜닝 >> 시간을 ...
-- 설계(모델러): 설계(요구사항 정의, 분석) : 최종산출물 = erd


-- 사원의 이름이 king인 사원의 사번, 이름, 급여 정보를 출력하세요
select empno, ename, sal
from emp
where ename = 'KING'


--이상, 이하 (=)
--초관, 미만
/*

*/
-- 급여가 2000달러 이상이면서 직종이 manager인 사원의 모든 정보를 출력하세요
select *
from emp
where sal >= 2000 and job = 'MANAGER';


-- 오라클 날짜 (DB서버의 날짜)
-- 오라클 날짜 (sysdate)
select sysdate from dual;
-- 22/09/27

select * from nls_session_parameters; --시스템 테이블
-- 현재 접속한 사용자(session)가 가지는 환경정보

-- 일반적으로 2022-09-27
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
-- 변경 정보는 현재 오라클 서버에 접속한 사용자의 작업 환경 설정
-- 그래서 재접속 하면 원래 상태로 복원 (RR-MM-DD)

select hiredate from emp;

select *
from emp
where hiredate= '1980-12-17';
/*
모든 시스템 날짜 필수 구성
게시판(CRUD)
설계
글쓴이, 제목, 내용, 조회수, 작성날짜
insert into board(writer, title, content, hit, regdate)
            values('홍길동','처음방가','졸립다',0,sysdate)
regdate: 컬럼의 데이터는 서버의 시간(DB서버)

-- TIP)
ms-sql: select getdate()
Mysql : curdate(), curtime(), now(), sysdate()
*/

select *
from emp
where hiredate= '1980-12-17';

--사원의 급여가 2000이상이고 4000이하인 모든 사원의 정보를 출력하세요
select *
from emp
where sal >= 2000 and sal <= 4000;
-- 연산자: 컬럼명 between A and B (=포함)
select *
from emp
where sal between 2000 and 4000;

-- 부서번호가 10번 또는 20번 또는 30번인 사원의 사번, 이름, 급여, 부서번호를 출력하세요
select *
from emp
where deptno=10 or deptno=20 or deptno=30;
-- 연산자 (IN 연산자)
select *
from emp
where deptno in (10,20,30); -- 풀어쓰면 deptno=10 or deptno=20 or deptno=30;

-- 부서번호가 10번 또는 20번이 아닌 사원의 사번, 이름, 급여, 부서번호를 출력하세요
select *
from emp
where deptno != 10 and deptno !=20; -- 두가지 조건을 모두 만족
--IN 연산자 부정 >> NOT IN
select *
from emp
where deptno not in (10,20); --deptno != 10 and deptno !=20;


--POINT: null >> oracle 값이 없다. >> 필요악

create table member(
 userid varchar2(20) not null, --null을 허용하지 않겠다 (필수입력)
 name varchar2(20) not null, -- 이름은 필수입력 받겠다. (필수입력)
 hobby varchar2(50) -- default null 허용 : 선택적 입력사항
);

select *
from member;
-- begin insert
insert into member(userid,hobby) values('hong','농구');
--ORA-01400: cannot insert NULL into ("KOSA"."MEMBER"."NAME")
insert into member(userid,name) values('hong','홍길동');
select * from member;
-- hobby >> null

--간단하게
--DB서버 마다 설정
--DML(데이터 조작어) : insert, update, delete
--오라클 실제반영을 위해서 개발자에게: commit, rollback 강제
--Ms-sql, Mysql default commit >> begin 명시 DML 작업 ... commit
commit; -- 명령 (insert, update, delete)

-- 수당(comm) 을 받지 않는 모든 사원의 정보를 출력하세요
-- 0도 데이터(받는 조건)
select comm from emp;
-- comm 컬럼의 데이터가 null인 것만 출력

select * from emp where comm is null;
-- null 비교는 (is null, is not null) 암기...
select * from emp where comm is not null;


-- 사원테이블에서 사번, 이름, 급여, 수당, 총급여를 출력하세요
-- 총급여 정의(급여 + 수당)

select empno, ename, sal, comm, sal+comm as "총급여"
from emp;
/*
null 이란 녀석...
1. null 과의 모든 연산의 결과는 null..  ex) 100 + null = null
2. 위 문제를 해결하기 위해서 함수를 만들었음 >> nvl(), nvl2() >> 암기!!
ex) nvl(컬럼명, 대체값) >> 치환
*/

select empno, ename, sal, comm, sal+nvl(comm,0) as "총급여"
from emp;


select 1000+null from dual;

select 1000+nvl(null,0) from dual;

select comm, nvl(comm,1111111) from emp;

select nvl(null, 'hello world') from dual;


-- 사원의 급여가 1000이상이고 수당을 받지 않는 사원의 사번, 이름, 직종, 급여, 수당을 출력하세요.
select empno, ename, job, sal, comm
from emp
where sal >= 1000 and comm is null;



--DQL: select
--DDL: 정의어 : create, alter, drop (Table 생성, 수정, 삭제)
--DML: 조작어 : insert, update, delete (반드시 commit, rollback)

-- java: class Board {private int boardno}
-- DB  : create table Board(boardno number)

create table Board(
  boardid number not null, --숫자 ,필수 입력
  title varchar2(50) not null, --글제목 (한글 25자 , 영문자 50자) , 필수입력
  content varchar2(2000) not null , --글내용(한글 1000자, 영문자 2000자) 필수
  hp varchar2(20) --default null 허용 (선택사항)
);

desc board;
select * from board;
insert into Board(boardid, title, content)
values(100,'오라클','실수했네^^');

select * from board;
--데이터 잘못 넣었네
rollback;

select * from board;
commit;


select boardid, title, content, nvl(hp,'empty') as HP
from board;

-- 문자열 검색
-- 주소검색 : 검색어 : 역삼 -> 역삼 단어가 들어가 있는 모든 주소가 출력
-- LIke 패턴검색

-- Like (문자열 패턴 검색 연산자)

-- Like 연산자 (와일드 카드 문자 : 1. %(모든것) , _(한문자) 결합 패턴을 생성 일치...
-- 검색이 한정적 >> java 정규표현식 오라클 적용

select *
from emp
where ename like '%A%';  -- ename 컬럼에 앞뒤상관없이 A만 있는 글자만 뽑아라.

--주소검색
-- select * from zip where dong like '%역삼%'
-- select * from member where name like '이%'

select *
from emp
where ename like '%A%A%';  -- ename 컬럼에 A만 두개있는 row만 뽑아라.



select ename
from emp
where ename like '_A%' -- 첫글자는 어떤것이 와도 상관없고 두번째 글자는 A로 시작



--과제  regexp_like 연산자 (정규식)
select * from emp where regexp_like(ename,'[A-C]');
--regexp_like 사용 정규표현 검색 5개 만들기 (대상 EMP)


-- 데이터 정렬하기
-- order by 컬럼명 : 문자, 숫자, 날짜 정렬
-- 오름차순 : asc : 낮은순 : default
-- 내림차순 : dese : 높은순
-- 비용(cost) 많이 드는 작업

select *
from emp
order by sal; --default asc 오름차순

select *
from emp
order by sal desc; -- 내림차순

--입사일이 가장 늦은 순으로 정렬해서 사번, 이름, 급여, 입사일을 출력하세요
select empno,ename,sal,hiredate
from emp
order by hiredate desc;

-- 
select empno, ename
from emp
order by ename desc;

/*
순서)
select 절        3
from 절          1
where 절         2
order by 절      4 (select 결과를 정렬)
*/

select job, deptno
from emp
order by job asc, deptno desc;
-- order by 컬럼명 asc, 컬럼명 asc ...
-- 주로 게시판... 답변게시판...

--연산자
--합집합(union) : 테이블과 테이블의 데이터를 합치는 것 (중복값 배제)
--합집합(union all) : 중복값 허용

create table ut(name varchar2(20));

insert into ut(name) values('AAA');
insert into ut(name) values('BBB');
insert into ut(name) values('CCC');
commit;

select * from ut;
union all
select * from uta;
--ut 집에 uta 가족들이 놀러간것

--union
--1. [대응]되는 [컬럼]의 [타입이 동일
select empno, ename from emp    --숫자, 문자열
union
select job, deptno from dept;   --문자열, 숫자

select empno, ename from emp
union
select deptno, dname from dept;

-- 2. 대응되는 컬럼의 개수가 동일
-- In line Interview
select m.empno
select empno, ename,job, sal from emp
union
select deptno, dname, loc, null from dept;
) m where empno


------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 220927 3시이후

--함수
--오라클 함수 사용하기
/*
단일 행 함수의 종류
1) 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다.
2) 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다.
3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를 제외하고 모두 날짜 데이터형의 값을 RETURN 한다.
4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다.
5) 일반적인 함수 : NVL, DECODE
*/
--------------------------------------------------------------------------------
--문자열 함수
select initcap('the super man') from dual; -- initcap 단어의 첫글자만 대문자로 해주기 >> The Super Man

select lower('AAA') , upper('aaa') from dual; -- lower 대문자 -> 소문자  upper 소문자 -> 대문자

select ename, lower(ename) as "ename" from emp;
select * from emp where lower(ename) = 'king'; -- king을 대문자가 아닌 소문자로 적어도 검색이 가능 >> 결과값 출력

select length('abcd') from dual; -- length는 문자열의 갯수 출력 >> 4
select length('    홍 길 동  a ')  from dual; -- 공백도 문자입니다. >> 13

select concat('a','b') from dual; -- 두개의 문자열을 합침 >> ab
select 'a' || 'b' || 'c' from dual; -- 3개 이상부턴 연산자 쓰는게 편함 >> abc
select ename || '        ' || job from emp; -- 연산자는 중간에 공백을 넣어줄수있어 유연한 표현이가능
select concat(ename,job) from emp;

--java:     substring
--oracle:   substr

select substr('ABCDE',2,3) from dual; --  >> BCD
select substr('ABCDE',1,1) from dual; --  >> A
select substr('ABCDE',3,1) from dual; --  >> C

select substr('abcdkenslkenfslfeflkenklskleflknsef',3) from dual; -- >> cdkenslkenfslfeflkenklskleflknsef

select substr('ABCDE',-2,1) from dual; -- >> D
select substr('ABCDE',-2,2) from dual; -- >> DE

-- 사원테이블에서 ename 컬럼의 데이터에 대해 첫글자는 소문자로 나머지 글자는 대문자로 출력하고
-- 하나의 컬럼으로 만들어 출력하시고 컬럼의 별칭은 fullname
-- 첫글자와 나머지 문자 사이에는 공백하나를 넣으세요

select concat(substr(lower(ename),1,1),substr(upper(ename),2,4)) as fullname
from emp;
select substr(lower(ename),1,1) || ' ' ||substr(upper(ename),2) as fullname
from emp;



select lpad('ABC',10,'*') from dual; -- >> *******ABC
select rpad('ABC',10,'*') from dual; -- >> ABC*******


--사용자의 비번: hong1007 or k1234
--화면: 앞 두글자 >> ho******
--              >> k1***
select rpad(substr('hong1007',1,2),length('hong1007'),'*') from dual; -- >> ho******
select rpad(substr('k1234',1,2),length('k1234'),'*') from dual; -- >> k1***

--emp테이블에서 ename 컬럼의 데이터를 출력하되 첫글자만 출력하고 나머지를 *로 출력
select rpad(substr(ename,1,2),length(ename),'*')
from emp;

create table member2(
    id number,
    jumin varchar2(14)
);
insert into member2(id, jumin) values(100,'123456-1235467');
insert into member2(id, jumin) values(200,'234567-1235467');

select *
from member2;

--출력결과
-- 100 : 123456-*******
-- 200 : 234567-*******
-- 가명칭은 "juminnumber"

select id || ' : ' || rpad(substr(jumin,1,7),length(jumin),'*') as juminnumber
from member2;



-- rtrim 함수
-- 오른쪽 문자 지워라
select rtrim('MILLER','ER') from dual;  -- 오른쪽 문자를 지워라 >> MILL
select ltrim('MILLLLLLLLLLLLLER','MIL') from dual; -- 왼쪽 문자를 지워라 >> ER

-- 공백제거
select '>' || rtrim('MILLER     ',' ') || '<' from dual; -- >> >MILLER<     -- 오른쪽 공백 제거
select '>' || ltrim('       MILLER',' ') || '<' from dual; -- >> >MILLER<   -- 왼쪽 공백 제거

-- 치환함수
select ename, replace(ename,'A','와우') from emp;

--------------------------------------------------------------------------------
--숫자 함수
    --round (반올림 함수)
    --trunc (절삭 함수)
    --Mod() (나머지를 구하는 함수)
    
--  -3 -2 -1 0(정수) 1 2 3
select round(12.345,0) as r from dual; -- >> 12
select round(12.567,0) as r from dual; -- >> 13

select round(12.345,1) as r from dual; -- >> 12.3
select round(12.567,1) as r from dual; -- >> 12.6

select round(12.345,-1) as r from dual; -- >> 10
select round(12.345,-1) as r from dual; -- >> 10
select round(12.345,-2) as r from dual; -- >> 0

------

select trunc(12.345,0) as r from dual; -- >> 12
select trunc(12.567,0) as r from dual; -- >> 12

select trunc(12.345,1) as r from dual; -- >> 12.3
select trunc(12.567,1) as r from dual; -- >> 12.5

select trunc(12.345,-1) as r from dual; -- >> 10
select trunc(12.345,-1) as r from dual; -- >> 10
select trunc(12.345,-2) as r from dual; -- >> 0

------
--나머지

select 12/10 from dual; -- >> 1.2
select mod(12,10) from dual; -- >> 2
select mod(0,0) from dual; -- >> 0

--------------------------------------------------------------------------------
--[날짜 함수]

select sysdate from dual; -- >> 2022-09-27 16:01:08

-- POINT (날짜 연산)
-- 1. Date + Number >> Date
-- 2. Date - Number >> Date
-- 3. Date - Date >> Number (일수)

select sysdate + 100 from dual; -- >> 2023-01-05 16:05:50
select sysdate + 1000 from dual; -- >> 2025-06-23 16:05:56

select hiredate from emp;
select months_between(sysdate, '1997-02-19') from dual; -- >> 307개월
select trunc(months_between('2022-09-27','2020-09-20'),0) from dual;  -- trunc를 통해 소숫점 아랫값 삭제

select '2022-01-01' + 100 from dual;  -- '2022-01-01' [날짜형식]을 가지는 문자
--POINT 변환함수 to_date()

select to_date('2022-01-01') + 100 from dual;

--사원 테이블에서 사원들의 입사일에서 현재날짜까지의 근속월수를 구하세요
--사원이름, 입사일, 근속월수 출력
--단 근속월수는 정수부분만 출력 (반올림 하지 마세요)

select ename,hiredate,trunc(months_between(sysdate,hiredate),0)
from emp;

-- 2. 한달이 31일 이라는 기준에서 근속월수를 구하세요
select trunc((sysdate-hiredate)/31,0)
from emp;

--------------------------------------------------------------------------------
--함수
--------------------------------------------------------------------------------
--[변환함수] Today's point
--Oracle 데이터 : 문자열, 숫자, 날짜
--to_char() : 숫자 -> 문자 (1000 -> $100,000) >> format 출력형식 정의
--            날짜 -> 문자 ('2022-09-29' -> 2022년09월29일)

-- to_char()쓰는이유 == 그냥 이쁘게 출력할려고 ㅋㅋ

--to_date: 문자 -> 날짜
--select to_date('2022-01-01') + 100 from dual;

--to_number(): 문자 -> 숫자 >> 자동형변환
--select '100' + 100 from dual;
--select to_number('100') + 100 from dual;

--1.
select '1' + 1 from dual; -- '1' 문자 -> 숫자 (형변환)
--원칙
select to_number('1') + 1 from dual;


--2.
select sysdate, to_char(sysdate,'YYYY') || '년' as "YYYY",
to_char(sysdate,'YEAR') as "YYYY",
to_char(sysdate,'MM') as "MM",
to_char(sysdate,'DD') as "DD",
to_char(sysdate,'DAY') as "DAY",
to_char(sysdate,'DY') as "DY"
from dual;

-- 입사일이 12월인 사원의 사번, 이름, 입사일, 입사년도, 입사월을 출력하세요
select empno, ename, hiredate, to_char(hiredate, 'YYYY') as YYYY, to_char(hiredate, 'MM') as MM
from emp
where to_char(hiredate, 'MM') = '12';
-- 오라클.pdf 68page 표 참조






-- to_char: 숫자 -> 형식문자 변환
-- 오라클.pdf 71page 표 참조
-- 10000000 -> $10,000,000
select '>' || to_char(12345,'999999999999') || '<' from dual; -- >> >        12345<
select '>' || ltrim(to_char(12345,'999999999999')) || '<' from dual; -- >> >12345<

select '>' || to_char(12345,'$999,999,999,999') || '<' from dual; -- >> >          $12,345<

select sal , to_char(sal, '$999,999') from emp;
select sal from emp;

--------------------------------------------------------------------------------
--HR 계정으로 변경
show user;
select * from employees;
select sysdate from dual;

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

/*
사원테이블(employees)에서 사원의 이름은 last_name , first_name 합쳐서 fullname 별칭 
부여해서 출력하고 입사일은  YYYY-MM-DD 형식으로 출력하고 연봉(급여 *12)을 구하고 
연봉의 10%(연봉 * 1.1)인상한 값을
출력하고 그 결과는 1000단위 콤마 처리해서 출력하세요
단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로  출력하세요
*/
select last_name || first_name as fullname,
to_char(hire_date, 'YYYY-MM-DD') as hire_date,
salary,
salary*12 as 연봉,
to_char(((salary*12)*1.1), '999,999,999,999') as 인상분

from employees
where to_char(hire_date,'YYYY') >= 2005
order by 연봉 desc;
--order by절은 select 다음에 실행 > select 된 결과 컬럼값을 사용가능 (가명칭)


--문자함수, 숫자함수, 날짜함수
--변환함수 (to_char())


--내일배울것(
--일반함수(nvl, nvl2 ...)
--집계함수(avg(), sum(), min(), max())


show user;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
select sysdate from dual;

desc board;

---------------------------------------------------------------------------------------------------------------------------------------
-- 220928 아침수업 시작 
--create table 테이블명 (컬러명 타입, 컬럼명 타입)
create table member3(age number);
--1건 또는 100건
insert into member3(age) values(100);
insert into member3(age) values(200);
insert into member3(age) values(300);
insert into member3(age) values(400);
/*
만약 자바였다면
class member3 (private int age;}
--1건
member3 m = new member3();
m.setAge(100);

100건 데이터 넣어라 (new를 100개 만들어라)
List<member3> mlist = new ArrayList<member3>();
mlist.add(new member(100));

데이터 타입
문자열 타입
char(10)        >> 10byte >> (한글5자), (영문,특수,공백 10자) >> 고정길이 문자열
varchar2(10)    >> 10byte >> (한글5자), (영문,특수,공백 10자) >> 가변길이 문자열
Char는 고정길이 문자열
varchar는 가변길이 문자열
>>
char(10)    >> 'abc' >> 3byte >> [a][b][c][][][][][][][] >> 공간의 변화가 없음
varchar(10) >> 'abc' >> 3byte >> [a][b][c].. >> 데이터 크기만큼만 공간 확보 (빈공간 없어짐)

if 사람의 이름
create table member (name char(30))
create table member (name varchar(30)) (0)

if 성별 (남 또는 여)
create table member (name char(3))      (0)
create table member (name varchar(3)) 

약속)
고정길이 문자열 ((남,여),(대,중,소),(주민번호)) >> char()   -> 튜닝성능이 더 좋음
가변길이 문자열 (사람의 이름, 취미, 주소) >> varchar2()


char(), varchar2() 고민: 한글과 영어 혼합
varchar2(10)

unicode (2byte): 한글, 영문자, 특수문자, 공백 >> 2byte
nchar == unicode character

nchar(20)       >> 20자 >> 2*20 >> 40byte
nvarchar2(20)   >> 20자
*/
select * from SYS.NLS_DATABASE_PARAMETERS;
--NLS_CHARACTERSET  : 	AL32UTF8  한글 3byte 인식
--KO16KSC5601 2Byte (현재 변환하면 한글 다깨짐)
select * from nls_database_parameters where parameter like '%CHAR%';
------------------------------------------------------------------------------
create table test2(name varchar2(2));

insert into test2(name) values('a');
insert into test2(name) values('aa');
insert into test2(name) values('가'); --한글 1자 3byte 인지 그래서 추가 x
-------------------------------------------------------------------------------
select * from test2;





-------------------------------------------------------------------------------
-- 일반함수(프로그램 성격이 강한 함수)
-- nvl(), nvl2() >> null 처리하는 함수
-- decode() >> java if문
-- case()   << java switch문
--
-- 오라클 SQL (변수, 제어문 개념이 없다)
-- 오라클 PL-SQL(변수, 제어문) 고급기능

select comm, nvl(comm, 0) from emp;

create table t_emp(
    id number(6), -- 정수 6자리
    job nvarchar2(20)
);    

select * from t_emp;

insert into t_emp(id,job) values(100,'IT');
insert into t_emp(id,job) values(200,'SALES');
insert into t_emp(id,job) values(300,'MGR');
insert into t_emp(id) values(400);
insert into t_emp(id,job) values(500,'MGR');
commit;

--decode 사용해보기
select id, decode(id,100,'아이티',200,'영업부',300,'관리팀','기타부서') as 부서이름
from t_emp;

select id, decode(id,100,'아이티',
                     200,'영업부',
                     300,'관리팀',
                     '기타부서') as 부서이름
from t_emp;


--또 다른 예시
select empno, ename, deptno, decode(deptno, 10, '인사부',
                                            20, '관리부',
                                            30, '회계부',
                                            40, '부서',
                                            'ETC') as 부서이름
from emp;                           


CREATE TABLE t_emp2(
id NUMBER(2),
jumin CHAR(7)
);
INSERT INTO t_emp2(id, jumin) VALUES(1,'1234567');
INSERT INTO t_emp2(id, jumin) VALUES(2,'2234567');
INSERT INTO t_emp2(id, jumin) VALUES(3,'3234567');
INSERT INTO t_emp2(id, jumin) VALUES(4,'4234567');
INSERT INTO t_emp2(id, jumin) VALUES(5,'5234567');
COMMIT;

select * from t_emp2;

/*
문제
t_emp2 테이블에서 id, jumin 데이터를 출력하되 jumin 컬럼의 앞자리가 1이면
'남성' 출력 2이면 '여성' 3이면 '중성' 그외는  '기타' 라고 출력하세요
컬럼명은 '성별'
*/

select id, decode(substr(jumin,1,1), 1,'남성',
                                     2,'여성',
                                     3,'중성',
                                     '기타') as 성별
from t_emp2;

/*
문제

*/

select empno, deptno, decode(deptno, 20, decode(ename, 'SMITH', 'HELLO',
                                        'WORLD'),'ETC')
from emp;

select * from emp;

--CASE문
/*
CASE 조건식 WHEN 결과1 THEN 출력1
           WHEN 결과2 THEN 출력2
           WHEN 결과3 THEN 출력3
           ELSE 출력4
END "컬럼명"
*/
create table t_zip
(
    zipcode number(10)
);

select * from t_zip;

insert into t_zip(zipcode) values(2);
insert into t_zip(zipcode) values(31);
insert into t_zip(zipcode) values(32);
insert into t_zip(zipcode) values(41);
commit;

select * from t_zip;

select '0' || to_char(zipcode) , case zipcode when 2    then '서울'
                                              when 31   then '경기'
                                              when 41   then '제주'
                                              else  '기타지역'
                                 end "지역이름"
from t_zip;                               

/*
사원테이블에서 사원급여가 1000달러 이하면 4급
1001달러 2000달러 이하면 3급
2001달러 3000달러 이하면 2급
3001달러 4000달러 이하면 1급
4001달러 이상이면 '특급' 이라는 데이터를 출력하세요

-- 1. case 컬럼명 when 결과 the 출력
-- 2. 비교식이 필요하다면
        case when 조건 비교식 then
             when ...
             when ...
*/
select case when sal <= 1000 then '4급'
            when sal between 1001 and 2000 then '3급'
            when sal between 2001 and 3000 then '2급'
            when sal between 3001 and 4000 then '1급'
            else '특급'
       end "급수" , empno, ename
from emp;


--------------------------------------------------------------------------------

--집계함수(그룹) 함수
--오라클.pdf (p68)
/*
1. count(*) >> row수, count(컬럼명) >> 데이터 건수 > (null은 포함하지 않아요)
2. sum()
3. ave()
4. mac()
5. min()
--기타

1. 집계함수는 group by 절과 같이 사용
2. 모든 집계 함수는 null값을 무시한다.
3. select 절에 집계함수 이외에 다른 컬럼이 오면 반드시 그 컬럼은 group by 절에 명시
*/

select count(*) from emp; -- 14개의 row  >> 14

select count(empno) from emp; -- >> 14

select count(comm) from emp; -- null값은 제외하고 카운트함 >> 6
select count(nvl(comm,0)) from emp; --point >> 14

--급여의 합
select sum(sal) as 급여의합 from emp; -- >> 29025

select round(avg(sal),0) as 급여의평균 from emp; --round를 적어줌으로 정수만 표현 >> 2073

-- 사장님 우리회의 총 수당이 얼마나 지급 되었나
select sum(comm) from emp;

select trunc(avg(comm)) from emp; -- 721달러
select trunc(avg(nvl(comm,0))) from emp; -- 309달러

--------------
--여기서부터 작성

select max(sal) from emp;
select min(sal) from emp;
select empno, count(empno) from emp; --ORA-00937: not a single-group group function
-- 14건          1건

select sum(sal), avg(sal), max(sal), min(sal), count(sal) from emp;

--부서별 평균 급여를 구하세요
select deptno, avg(sal)     --3
from emp                    --1
group by deptno;            --2


--직종별 평균 급여를 구하세요
select job, trunc(avg(sal))
from emp
group by job;

-- 직종별, 평균급여, 급여합, 최대급여, 최소급여, 건수를 출력하세요
select job, avg(sal), sum(sal), max(sal), min(sal), count(sal)
from emp
group by job;

/* 그룹
distinct 컬럼명1, 컬럼명2
order by 컬럼명1, 컬럼명2
group by 컬럼명1, 컬럼명2
*/


--부서별, 직종별, 급여의 합을 구하세요
select deptno, job, sum(sal)
from emp
group by deptno, job;


/*
순서

select 절    4
from 절      1
where 절     2
group by 절  3
order by 절  5
*/


--
-- [문제]
-- 직종별 평균급여가 3000달러 이상인 사원의 직종과 평균급여를 출력하세요

select job, avg(sal) as avgsal
from emp
--where 조건 -- 집계된 결과를 조건을 못해요
group by job
having  avg(sal) >=3000;-- group by 조건절
-- having 절에서는 select 가명칭을 사용불가. (실행순서 때문에)

--1. from     조건절 where
--2. group by 조건절 having

/*
select      5
from        1
where       2
group by    3
having      4
order by    6
*/

/*
[문제 1]
사원테이블에서 직종별 급여합을 출력하되 수당은 지급 받고 급여의 합이 5000 이상인
사원들의 목록을 출력하세요
급여의 합이 낮은 순으로 출력하세요
*/
--[문제 1]
select job, sum(sal) as samsal
from emp
where comm is not null
group by job
having sum(sal) >= 5000
order by samsal asc;
--

/*
[문제 2]
사원테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력하세요
*/
select deptno , count(*) as "부서별인원" , sum(sal) as "부서별 급여의 합"
from emp
group by deptno
having count(*) > 4;



select count(*) from emp where job is null; -- null이 있는지 확인해보기

/*
[문제 3]
사원테이블에서 직종별 급여의 합이 5000을 초과하는 직종과 급여의 합을 출력하세요
단, 판매직종(salesman)은 제외하고 급여합으로 내림차순 정렬하세요
*/
select job, sum(sal) as "sumsal"
from emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000
order by sum(sal) desc;



-- 기본과정끝
-- 단일 테이블에 데이터를 가져오는 것은 END----
------------------------------------------------------------------------------------------------------------------------ 
-- 여러개의 테이블에서 원하는 데이터를 추출하는 방법
-- JOIN(조인)

--Cartesian Product 모든 가능한 행들의 Join
--Equijoin Join 조건이 정확히 일치하는 경우 사용(일반적으로 PK 와 FK 사용)
--Non-Equijoin Join 조건이 정확히 일치하지 않는 경우에 사용(등급,학점)
--Outer Join Join 조건이 정확히 일치하지 않는 경우에도 모든 행들을 출력
--Self Join 하나의 테이블에서 행들을 Join 하고자 할 경우에 사용
--Set Operators 여러 개의 SELECT 문장을 연결하여 작성한다

-- RDBMS (관계형)
/*
관계 (테이블과 테이블과의 관계)
1:1
1:N (70%) 
M:N
*/

create table M (M1 char(6) , M2 char(10));
create table S (S1 char(6) , S2 char(10));
create table X (X1 char(6) , X2 char(10));

insert into M values('A','1');
insert into M values('B','1');
insert into M values('C','3');
insert into M values(null,'3');
commit;

insert into S values('A','X');
insert into S values('B','Y');
insert into S values(null,'Z');
commit;

insert into X values('A','DATA');
commit;

select * from m;
select * from s;
select * from x;

/*
1. 등가조인(equl join)
원테이블과 대응되는 테이블에 있는 컬럼의 데이터를 1:1 매핑
    1.1 문법
    - SQL JOIN 문법(오라클 문법) > 간단
    - ANSI 문법 - 권장 > 무조건 > [inner] join on 조건절
*/
-- sql 문법
select *
from m, s
where m.m1 = s.s1; -- 권장사항 아니다

--ANSI 문법
select *
from m inner join s
on m.m1 = s.s1;

select *
from m join s -- inner를 빼도 위에랑 똑같음
on m.m1 = s.s1; -- join의 조건절

-- [문제] 사원번호, 사원이름, 부서번호, 부서이름을 출력하세요
select e.empno, e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;


select m.m1,m.m2
from m join x
on m.m1 = x.x1;

--join
--테이블 2개, 3개, 4개
--SQL JOIN

select m.m1, m.m2, s.s2, x.x2
from m,s,x
where m.m1 = s.s1 and s.s1 = x.x1;

--ANSI 문법
select *
from m join s on m.m1 = s.s1 
       join x on s.s1 = x.x1; --새로 들어온 테이블만 작성
       
       
-- HR계정으로 이동
show user; -- USER이(가) "HR"입니다.
select * from employees;
select * from departments;
select * from locations;

-- [문제1] 사번, 이름(last_name), 부서번호, 부서이름을 출력하세요

select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;
-- 문제점
-- 사원수 107명 (누군가 누락)
select * from employees where department_id is null;
-- 등가조인 null 처리 불가 >> 다른 조인 >> 잠시 후에



-- [문제2] 사번, 이름(last_name), 부서번호, 부서이름, 지역코드, 도시명을 출력하시오
select e.employee_id, e.last_name, e.department_id, d.department_name, d.location_id, l.city
from employees e join departments d on e.department_id = d.department_id
                 join locations l on d.location_id = l.location_id;


-------------------------------------------------------------------------------------
show user; -- USER이(가) "KOSA"입니다.
--비등가조인

--2. 비등가 조인 (non-equl join) => 1:1 로 비교할 컬럼이 없다 
--의미만 존재 >> 등가조인의 문법을 그대로 사용
-- 1:1매핑 on emp.deptno = dept.deptno

select * from emp;
select * from salgrade;

select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal;

-------------------------------------------------------------------------------------
--3. 외부조인 (outer join) (equl join 먼저 선행하고 나서 + 남아있는 데이터 가져오면 됩니다.)
-- outer join (주종관계 파악)
-- 주인이 되는 테이블의 남은 데이터를 가져 올 수 있다  -- 거의 Null값 출력때문에 가져옴
-- 문법
-- 3.1 left outer join (왼쪽이 주인)
-- 3.2 right outer join (오른쪽 주인)
-- 3.3 full outer join (left, right >> union)

select *
from m left join s  -- outer 생략해도 됨
on m.m1  = s.s1;

select *
from m right join s  -- outer 생략해도 됨
on m.m1  = s.s1;

select *
from m full join s
on m.m1 = s.s1;


-- [문제1] 사번, 이름(last_name), 부서번호, 부서이름을 출력하세요
select e.employee_id,
        e.last_name,
        e.department_id,
        d.department_name
from employees e left join departments d 
on e.department_id = d.department_id;
-- 마지막 null값을 가진 회원까지 출력 완료


--------------------------------------------------------------------------------
select * from emp;

-- 3. self join (자기참조) -> 문법(x) 의미만 존재 >> 등가조인(문법)
-- 하나의 테이블에 있는 컬럼이 자신의 테이블에 있는 다른 컬럼을 참조하는 경우
-- Emp >> Mgr (관리자)
select e.empno, e.ename, m.empno, m.ename
from emp e join emp m  -- 가명칭만 다르게 하면 됨
on e.mgr = m.empno; -- 13명

select *
from emp e left join emp m  -- 가명칭만 다르게 하면 됨
on e.mgr = m.empno; -- 14명





--------------------------------------------------------------------------------
-- 접속계정 (kosa)
-- 내가푼것
-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
select e.ename, e.deptno, d.dname
from emp e left join dept d
on e.deptno = d.deptno;

?
-- 2. DALLAS에서 근무하는 사원의 이름, 직종, 부서번호, 부서이름을
-- 출력하라.
select e.ename, e.job, d.deptno ,d.dname
from emp e left join dept d
on e.deptno = d.deptno
where loc = 'DALLAS';

?

-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.
select *
from emp e left join dept d
on e.deptno = d.deptno
where ename like '%A%';



-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라.
select e.ename, d.dname, e.sal
from emp e left join dept d
on e.deptno = d.deptno
where e.sal >= 3000;

-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하라.
select e.job, e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';
?
-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,
-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하라.
--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다
select e.empno as 사원번호, e.ename as 사원이름, e.sal*12 as 연봉, e.sal*12+comm as 실급여, s.grade as 급여등급
from emp e join salgrade s
on e.sal between s.losal and s.hisal
where comm is not null;
?

-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름, 
-- 월급, 급여등급을 출력하라.
select e.deptno, d.dname, e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal
join dept d
on e.deptno = d.deptno
where e.deptno = 10;

-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,
-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로 정렬하라.
select e.deptno, d.dname, e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal
join dept d
on e.deptno = d.deptno
where e.deptno in (10,20);


-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)


--------------------------------------------------------------------------------
-- 강사님 작성한것
-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO;
 
-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을
-- 출력하라.
SELECT E.ENAME, E.JOB, D.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE  D.LOC='DALLAS';
 
-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.
SELECT E.ENAME, D.DNAME
FROM EMP E  join DEPT D  on D.DEPTNO=E.DEPTNO
WHERE  E.ENAME LIKE '%A%';
--WHERE Regexp_like(E.ENAME,'^A'); 
-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라.
SELECT E.ENAME, D.DNAME, E.SAL 
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.SAL>=3000;
 
-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하라.
SELECT E.JOB, E.ENAME, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.JOB='SALESMAN';
 
-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,
-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하라.
--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다
SELECT         E.EMPNO AS "사원번호",
               E.ENAME AS "사원이름",
               E.SAL*12 AS "연봉",
           --E.SAL*12+NVL(COMM,0) AS "실급여",
               E.SAL*12+COMM AS "실급여",
               S.GRADE AS "급여등급"
FROM EMP E  join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.Comm is not null;
 
-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,
-- 월급, 급여등급을 출력하라.
-- inner 는 생략 가능
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
            join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO=10;
 
SELECT * FROM SALGRADE;
 
 
-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,
-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로
-- 정렬하라.
-- inner 는 생략 가능
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E  join DEPT D        on E.DEPTNO=D.DEPTNO
            join SALGRADE S    on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO IN (10,20) -- WHERE  E.DEPTNO<=20  -- e.deptno = 10 or 
ORDER BY E.DEPTNO ASC,  E.SAL DESC;
 
 
-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)
 
SELECT E.EMPNO, E.ENAME , M.EMPNO, M.ENAME
FROM EMP E  left outer join EMP M
on e.MGR = m.EMPNO;
--------------------------------------------------------------------------------
--기타
--NATURAL JOIN
--Equijoin과 동일하다고 보시면 됩니다.
-- [두 테이블]의 [동일한 이름]을 가지는 칼럼은 [모두 조인]이 됩니다.
SELECT empno, ename, deptno , dname FROM emp NATURAL JOIN dept ;

--JOIN ~ USING 
--NATURAL JOIN의 단점은 동일한 이름을 가지는 칼럼은 모두 조인이 되었는데 
--USING 문을 사용하면 컬럼을 선택해서 조인을 할 수가 있습니다.
SELECT e.empno, e.ename, deptno , dname FROM emp e JOIN dept d USING(deptno);

--조인 조건이 없는 조인결과
select * from emp , dept;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 220929 아침

-- 해결 (초급개발자 반드시
--------------------------------------------------------------------------------
/*
subquery
오라클.pdf(7장 100page)

sql꽃 .... sql 만능 해결사

1. 함수 > 단일테이블, 다중 테이블 (join, union) >> subquery
*/
-- [문제] 사원테이블에서 사원들의 평균 월급보다 더 많은 월급을 받는 사원의 사번, 이름, 급여를 출력하세요
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp);
-- 2개의 쿼리를 하나로 통합

-- subquery
/*
1. single row subquery: 실행결과가 단일 row 단일 column인 경우를 (단 한개의 반환)
ex) select avg(sal) from emp
연산자: ( =  !=  <  > )

2. multi row subquery: 실행결과가 단일 column row 여러개인 경우
ex) select sal from emp
연산자: IN, NOT IN, ANY, ALL
ALL : sal > 1000 and sal > 4000 and ...
ANY : sal > 1000 or  sal > 4000 or

문법)
1. 괄호안에 있어야 한다 >> (select max(sal) from emp)
2. 단일 컬럼으로 구성 >> selecet max(sal), sum(sal) from emp (이런식 x)
3. 단독으로 실행 가능

실행순서
1. subquery 먼저 실행
2. 결과를 가지고 메인 query 실행
--TIP)
select ...(subquery) >> 한개의 행만 반환할 경우 (Scala subquery)
from (subquery)      >> inline view(가상테이블) ... ^^
where (subquery)     >> 조건
*/


-- 멀티는 'in' 싱글은 '연산자'


-- 사원테이블에서 jones 의 급여보다 더 많은 급여를 받는 사원 사번, 이름, 급여를 출력하세요

select sal
from emp
where ename = 'JONES';  -- >> 2975

select empno, ename, sal
from emp
where sal > (select sal from emp where ename = 'JONES'); -- 단일

select *
from emp
where sal IN (select sal from emp where deptno = 30); -- 멀티
-- sal=1600 or sal=1250 or sal=1250 or sal=2580 or sal=1500 and sal=950

select *
from emp
where sal NOT IN (select sal from emp where deptno = 30);
-- sal!=1600 or sal!=1250 or sal!=1250 or sal!=2580 or sal!=1500 and sal!=950

--------------------------------------------------------------------------------
-- 부하직원이 있는 사원의 사번과 이름을 출력하세요
-- 내 사번이 mgr 컬럼에 있으면
select mgr from emp;
select *
from emp
where empno in (select mgr from emp);
-- where empno=7902 or empno=7788 or empno=null (or 에선 null 영향x)

-- 부하직원이 있는 사원의 사번과 이름을 출력하세요
select mgr from emp;
select *
from emp
where empno not in (select mgr from emp);
-- where empno!=7902 and empno!=7788 and empno!=null (and 에선 null 영향o)

-- 부하직원이 있는 사원의 사번과 이름을 출력하세요
select mgr from emp;
select *
from emp
where empno not in (select nvl(mgr,0) from emp);
--------------------------------------------------------------------------------

-- [문제] king 에게 보고하는 즉 직속상관이 king인 사원의 사번, 이름, 직종, 관리자사번을 출력하세요
select empno, ename, job, mgr
from emp
where mgr = (select empno from emp where ename='KING');

-- [문제] 20번 부서의 사언중에서 가장 많은 급여를 받는 사원보다 더 많은 급여를 받는 사원의
--     사번, 이름, 급여, 부서번호를 출력하세요
select max(sal)
from emp
where deptno = 20;

select empno, ename, sal, deptno
from emp
where sal > (select max(sal) from emp where deptno = 20);

--자기 부서의 평균 월급보다 더 많은 월급을 받는 사원의 사번, 이름, 부서번호,
--부서별 평균 월급을 출력하세요

select e.empno, e.ename, e.deptno, e.sal, s.avgsal
from emp e join (select deptno, round(avg(sal),0) as avgsal from emp group by deptno) s
on e.deptno = s.deptno
where e.sal > s.avgsal;

select deptno, round(avg(sal),0) as avgsal
from emp
group by deptno;


--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.
select sal
from emp
where ename='SMITH';

select ename, sal
from emp
where sal > (select sal from emp where ename='SMITH');

--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급,
-- 부서번호를 출력하라.

select sal from emp where deptno = 10;

select ename, sal, deptno
from emp
where sal in (select sal from emp where deptno = 10);

?
--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
-- 'BLAKE'는 빼고 출력하라. ///?
select deptno from emp where ename='BLAKE';

select ename, hiredate
from emp
where deptno = (select deptno from emp where ename='BLAKE')
and ename != 'BLAKE';

--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을
-- 출력하되, 월급이 높은 사람 순으로 출력하라.
select avg(sal) from emp;

select empno, ename, sal
from emp
where sal > (select avg(sal) from emp)
order by sal desc;
?

--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고
-- 있는 사원의 사원번호와 이름을 출력하라.

select ename from emp where ename like '%T%';

select empno, ename
from emp
where ename in (select ename from emp where ename like '%T%');


--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)

select max(sal) from emp where deptno = 30;

select ename, deptno, sal
from emp
where sal > (select max(sal) from emp where deptno = 30);
?

--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
-- 이름, 부서번호, 직업을 출력하라. ///?
select * from emp;
select * from dept;

select e.ename, e.deptno, job
from emp e join dept d
on e.deptno = d.deptno
where loc = 'DALLAS';



--8. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력하라.

select e.deptno, e.ename, e.job
from emp e join dept d
on e.deptno = d.deptno
where d.dname = 'SALES'; 

--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라
--king 이 사수인 사람 (mgr 데이터가 king 사번)

select * from emp where mgr = 7839;

select ename, sal
from emp
where mgr in (select mgr from emp where mgr = 7839);


--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는
-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,
-- 급여를 출력하라.

select avg(sal)
from emp;

select *
from emp
where ename like '%S%';

--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의

-- 이름, 월급, 부서번호를 출력하라.


--12. 30번 부서 사원들과 월급과 커미션이 같지 않은

-- 사원들의 이름, 월급, 커미션을 출력하라.



----------------------------------------------------------------------------
--데이터 조작어(암기) >> DML
-- 오라클.pdf(168page)
-- insert, update, delete (반드시 암기)


/*
오라클 기준
DDL(데이터 정의어) : [create, alter, drop, truncate], rename, modify
DML(데이터 조작어) : insert, update, delete
DQL(데이터 질의어) : select (함수, 조인, 서브쿼리)
DCL(데이터 제어어) : grant, revoke (관리자)
TCL(트랜잭션)      : commit, rollback, savepoint
*/

--DML (insert, update, delete) 작업

--transaction: 하나의 논리적인 작업 단위

--A계좌에서 출금 B계좌 입금(업무) >> 하나의 논리적인 단위 묶어서 처리
--둘다 성공 or 둘다 실패
--처리하는 방법(commit, rollback)

desc emp; --컬럼명, null, type

select * from tab; --현재 접속 계정이 가지고 있는 테이블 목록

--create table 이름
select * from tab where tname = 'BOARD';
select * from tab where tname = 'BOARD2';

select * from col where tname = 'EMP';

--------------------------------------------------------------------------------
-- 1. insert

create table temp(
    id number primary key, --null(x), 중복데이터 허용 않겠다
    name nvarchar2(20)
);

desc temp;
select * from tab where tname='TEMP';
select * from col where tname='TEMP';


-- 1. 가장 일반적인 insert
insert into temp(id,name)
values(100, '홍길동');

select * from temp;

--commit;



-- 2. 컬럼 목록 생략 (웬만하면 사용x)
insert into temp
values(200,'김유신');

select * from temp;

rollback;

-- 3. 문제 (insert)
insert into temp(name)
values('아무개');      --id pk 제약 (null x)

insert into temp(id, name)
values(100,'개똥이');  -- pk중 '100' 때문에 안댐


--------------------------------------------------------------------------------
--TIP)
--일반적인 SQL은 프로그램적인 요소 x
--PL/SQL
/*
create table temp2(id varchar2(50));
BEGIN
    FOR i IN 1..100 LOOP
        insert into temp2(id) values('A' || to_char(i));
    END LOOP;
END;
*/

select * from temp2;

create table temp3(
    memberid number(3) not null, --3자리 정수
    name varchar2(10), -- null허용
    regdate date default sysdate -- 초기값 설정(기본값) (시스템 날짜를 기본값 사용)
);

select * from col where tname = 'TEMP3';

select sysdate from dual;
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

insert into temp3(memberid, name, regdate)
values(100,'홍길동','2022-09-29');

select * from temp3;
commit;

insert into temp3(memberid, name)
values(200,'김유신');

select * from temp3;
commit;

insert into temp3(memberid)
values(300);

select * from temp3;
commit;

insert into temp3(name)
values('누구');
rollback;

--------------------------------------------------------------------------------
--Tip)
--1. 대량 데이터 삽입하기
create table temp4(id number);
create table temp5(num number);

insert into temp4(id) values(1);
insert into temp4(id) values(2);
insert into temp4(id) values(3);
insert into temp4(id) values(4);
insert into temp4(id) values(5);
insert into temp4(id) values(6);
insert into temp4(id) values(7);
insert into temp4(id) values(8);
insert into temp4(id) values(9);
insert into temp4(id) values(10);

commit;
select * from temp4;

select * from temp5;
--요구사항 temp4에 있는 모든 데이터를 temp5에 넣고싶어요
-- 문법 2개
-- insert into 테이블명(컬럼리스트) values
-- insert into 테이블명(컬럼리스트) select 절

insert into temp5(num)
select id from temp4; --대량데이터 삽입...

select * from temp5;

-- 2. 대량 insert
-- 담을 테이블이 없는 경우 >> 테이블 복제(구조: 스키마) + 데이터 삽입)
-- 단 제약정보는 복제 x (PK, FK)
-- 순수한 데이터 구조 복제 + 데이터 복사

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

--퀴즈
--틀(구조)만 복제하고 데이터는 복사하고 싶지 않아요
create table copyemp3
as
    select * from emp where 1=2;
    
select * from copyemp3;
--------------------------- INSERT END------------------------------------------

--update
/*
update 테이블명
set 컬럼명 = 값, 컬럼명2 = 값2.....
where 조건절

update 테이블명
set 컬럼 = (subquery)
where 컬럼명 = (subquery)
*/

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
----------------------------[UPDATE END]----------------------------------------
--delete
delete from copyemp;
select * from copyemp;
rollback;

delete from copyemp where deptno=10;
select * from copyemp where deptno=10;
commit;
---------------------------[DELETE END]-----------------------------------------
/*
개발자(SQL) >> 
1. CRUD관점(create>insert, read>select, update, delete)
2. APP(JAVA) -  JDBC API   - ORACLE
3. insert, update, delete, select (70%)

하나의 테이블에 대해서 작업
JAVA에서 EMP테이블에 대해서 CRUD작업
App(JAVA) 입장에서
1. 전체조회(함수) >> publicList<EMP> getEmpList() { select * from emp }
2. 조건조회(함수) >> public Emp getEmpListByEMpno(int empno) {select * from emp where empno = 7788}
3. 삽입(함수) >> public int insertEmp(Emp emp) { insert into emp(...) values(...)}
4. 수정(함수) >> 
5. 삭제(함수)
개발 >> JAVA코드 >> DAO
-----------------------------------[DML END]-------------------------------------------------
*/

-- DDL(create, alter, drop, rename) 테이블을 생성

select * from board;
drop table board;

create table board(
    boardid number,
    title nvarchar2(50),
    content nvarchar2(2000),
    regdate date
); 

desc board;


--TIP) 제약정보 확인하기
select * from user_tables where lower(table_name) = 'board';
select * from col where lower(tname) = 'board'; -- 개발자
-- 제약정보

select * from user_constraints where lower(table_name) = 'board';


--Oracle 11g >> 가상컬럼(조합컬럼)
-- 학생 성적 테이블: 국어, 영어, 수학

create table vtable(
    no1 number,
    no2 number,
    no3 number GENERATED ALWAYS as (no1 + no2) VIRTUAL
);    
select * from col where lower(tname) = 'vtable';
insert into vtable(no1, no2) values(100,50);

select * from vtable;

--insert into vtable(no1, no2, no3) values(10,20,30); (x)
--실무에서 활용되는 코드 
--제품정보 (입고) : 분기별 데이터 추출(4분기)
--입고일 (2022-09-10)
create table vtable2(
  no number , --순번
  p_code char(4) , --제품코드(A001 , B002)
  p_date char(8), --입고일(20220922)
  p_qty  number, --수량
  p_bungi number(1) GENERATED ALWAYS as (
                    CASE WHEN substr(p_date,5,2) in ('01','02','03') THEN 1
                         WHEN substr(p_date,5,2) in ('04','05','06') THEN 2
                         WHEN substr(p_date,5,2) in ('07','08','09') THEN 3
                         ELSE 4
                     END )VIRTUAL
);

insert into vtable2(p_date) values('20190101');
insert into vtable2(p_date) values('20190501');
insert into vtable2(p_date) values('20190601');
insert into vtable2(p_date) values('20191101');
insert into vtable2(p_date) values('20191201');
commit;

select* from vtable2;
select * from vtable2 where p_bungi = 1;

--------------------------------------------------------------------------------
--DDL 테이블 만들고 수정, 삭제
--1. 테이블 생성하기
create table temp6(id number);
desc temp6;

--2. 테이블 생성 후에 컬럼 추가하기
alter table temp6
add ename varchar2(20);

desc temp6;

--3. 기존 테이블에 있는 컬럼이름 잘못 표기(ename -> username)
--기존 테이블에 있는 기존 컬럼의 이름 바꾸기(rename)
alter table temp6
rename column ename to username;

desc temp6;

--기존 테이블에 있는 기존 컬럼의 타입 크기 수정 (기억) = modify
alter table temp6
modify(username varchar2(2000));

desc temp6;

--5. 기존 테이블에 있는 기존 컬럼 삭제
alter table temp6
drop column username;

desc temp6;
-- 위 모든 작업들은 툴을 사용해서 마우스로 작업 가능

--6. 테이블 전체가 필요 없어요
--6.1 delete: 데이터만 삭제
-- 테이블 처음 만들면 처음 크기 >> 데이터 넣으면 >> 크기만큼 테이블 크기 증가
-- ex) 처음 1M >> 데이터 10만건 >> 100M >> delete 10만건 >> 테이블 크기 100M 

--테이블(데이터) 삭제(공간의 크기도 함께)
--truncate (단점 where절 사용 불가)
-- ex) 처음 1M >> 데이터 10만건 >> 100M >> delete 10만건 >> 테이블 크기 1M 
-- truncate table emp

--테이블 삭제
drop table temp6;

--------------------------------------------------------------------------------
-- 테이블에 제약 설정하기
-- 오라클.pdf (144page)
-- 데이터 무결성 확보
-- insert, update 제약

PRIMARY KEY(PK) 유일하게 테이블의 각행을 식별(NOT NULL 과 UNIQUE 조건을 만족)
-- where empno=7788 >> 데이터 1건 보장 >> 성능 >> 조회 >> index 자동 생성

--제약을 만드는 방법 (create table 안에서 생성)
--테이블이 생성된 다음 추가 (alter table add constraint ....) 많이 사용 >> 툴..

--TIP)
--제약 정보 확인
select * from user_constraints where table_name='EMP';

create table temp7(
    --id number primary key --권장하지 않아요 (제약이름 자동생성 > SYS_C006997
                          --제약 삭제시 수정시 찾기 어려워요 (유지보수 어려움)
    id number constraint pk_temp7_id primary key, --관용적 표현
    name varchar2(20) not null, -- constraint 표현 쓰지 마세요
    addr varchar2(50)
);
select * from user_constraints where lower(table_name)='temp7';

--PK (not null 하고  unique 제약)
--PK 테이블 당 1개만 사용 (컬럼 1개, 여러개의 컬럼을 묶어서 1개 : 복합키)

insert into temp7(name,addr) values('홍길동','서울시 강남구');
--ORA-01400: cannot insert NULL into ("KOSA"."TEMP7"."ID")

insert into temp7(id,name,addr) values(10,'홍길동','서울시 강남구');
select * from temp7;
commit;

insert into temp7(id,name,addr) values(10,'야무지개','서울시 강남구');
--ORA-00001: unique constraint (KOSA.PK_TEMP7_ID) violated


--UNIQUE key(UK) 테이블의 모든 행을 유일하게 하는 값을 가진 열(NULL 을 허용)
--컬럼의 수 만큼 생성 가능
--null 허용
--not null, unique
create table temp8(
    id number constraint pk_temp8_id primary key,
    name nvarchar2(20) not null,
    jumin nchar(6) constraint uk_temp8_jumin unique, -- null허용
    addr nvarchar2(1000)
);
select * from user_constraints where lower(table_name)='temp8';

insert into temp8 (id, name, jumin, addr)
values(10, '홍길동', '123456', '경기도');

commit;

insert into temp8 (id, name, jumin, addr)
values(20, '길동', '123456', '경기도');

insert into temp8(id,name,addr)
values(20,'김유신','강원도'); -- unique null 허락

select * from temp8;

--그럼 null도 중복체크
insert into temp8(id, name, addr)
values(30,'이씨','강원도');

select * from temp8;
-- 생성시
-- jumin nchar(6) not null constraint uk_temp8_jumin unique,


--테이블 생성 후에 제약 걸기(
create table temp9 (id number);
--기존 테이블에 제약 추가하기
--제약 추가시 테이블에 있는 데이터 검사 >> 중복데이터 >> 개발자 >> 중복데이터 강제 삭제

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--220930 금요일 수업
alter table temp9
add constraint pk_temp9_id primary key(id);

--add constraint pk_temp9_primary key(id,jumin); 복합키

select *from user_constraints where lower(table_name) = 'temp9';
desc temp9;

alter table temp9
add ename varchar2(50);

desc temp9;

--ename not null 제약 추가
alter table temp9
modify(ename not null);

desc temp9;

select * from user_constraints where lower(table_name)='temp9';

--------------------------------------------------------------------------------
CHECK(CK) 참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정)
--where 조건과 동일한 형태의 제약
--where gender in ('남','여')


create table temp10(
id number constraint pk_temp10_id primary key,
name varchar2(20) not null,
jumin char(6) constraint uk_temp10_jumin unique,
addr varchar2(20),
age number constraint ck_temp10_age check(age>=19) --where age >= 19
);

select *from user_constraints where lower(table_name) = 'temp10';

insert into temp10(id,name,jumin,addr,age)
values(100,'홍길동','123456','서울시',25);

select * from temp10;
commit;

insert into temp10(id,name,jumin,addr,age)
values(200,'홍길동','123456','서울시',15);

--------------------------------------------------------------------------------
FOREIGN KEY(FK) 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다.
--참조제약 (테이블과 테이블의 관계 설정)

create table c_emp
as
    select empno, ename, deptno from emp where 1=2; -- 테이블의 구조(스키마) 만 복사하기

--create table 테이블명 as select...
select * from c_emp;

create table c_dept
as
    select deptno, dname from dept where 1=2;
    
select * from c_emp;
select * from c_dept;

--c_emp 테이블에 있는 deptno는 c_dept테이블에 있는 deptno 컬럼에 있는 데이터만
--제약(참조)

alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);

--foreign key(deptno) 성립하기 위해서는 >> c_dept(deptno) >> 믿음을 >> 내 데이터는
-- 무결성해 (중복,null) >> pk >> c_dept(deptno) >> unique, primary key

--반드시 c_dept에 pk 설정되어 있어야 한다
alter table c_dept
add constraint pk_c_dept_deptno primary key (deptno); -- 신용확보

select * from user_constraints where lower(table_name)='c_dept';


--pk선행되고 나서
alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);

--제약
insert into c_dept(deptno,dname) values(100,'인사팀');
insert into c_dept(deptno,dname) values(200,'관리팀');
insert into c_dept(deptno,dname) values(300,'회계팀');
commit;

select* from c_dept;
--신입사원 입사

insert into c_emp(empno, ename) values(100,'홍길동');

--deptno 컬럼에 FK 설정되어 있어도 not null 강제하지 않으면 null값은 허용된다
--요구사항 정의에 따라서 ...
--입사시 부서를 가지지 않을 수도 있다.

--신입사원은 반드시 부서를 가져야한다
--create table c_emp(deptno not null ...fk)

insert into c_emp(empno, ename, deptno) values(1,'홍길동',100);
select * from c_emp;

insert into c_emp(empno, ename, deptno) values(2,'김유신',600);
commit;

--------------------------------------------------------------------------------
/*
개발자
테이블과의 주종관계 (부모, 자식)
c_emp, c_dept [deptno] 관계로 해석하면
부모 (master) : PK (deptno)
자식 (detail) : FK (deptno)

c_dept 에서 100번 부서를 삭제할 수 있을까요
*/
select * from c_emp;
select * from c_dept;

delete from c_dept where deptno=100;
--ORA-02292: integrity constraint (KOSA.FK_C_EMP_DEPTNO) violated - child record found

--자식에서 ....
delete from c_emp where empno = 1;
delete from c_dept where deptno=100;
rollback;

/*
column datatype [CONSTRAINT constraint_name]
 REFERENCES table_ name (column1[,column2,..] [ON DELETE CASCADE])
column datatype,
. . . . . . . ,
[CONSTRAINT constraint_name] FOREIGN KEY (column1[,column2,..])
 REFERENCES table_name (column1[,column2,..] [ON DELETE CASCADE])
 
 
ON DELETE CASCADE: 부모테이블과 생명을 같이 하겠다
--100번부서 삭제 : yes
--delete from c_dept where deptno = 100;
--참조하는 자식데이터 같이 삭제
 */

alter table c_emp
drop constraint fk_c_emp_deptno;

alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);
ON DELETE CASCADE;

select * from c_emp;
delete from c_emp where deptno=100;
commit;


select * from c_dept;
select * from c_emp;

insert into c_emp(empno, ename, deptno) values(1,'김유신',100);

delete from c_dept where deptno=100;

---TIP)
-- MS-SQL
--ON DELETE CASCADE  -- 참조관계에서 부모쪽에 있는 데이터를 지우면 참조하는 자식 데이터도 없어진다
--ON UPDATE CASCADE

---CASCADE  -- 참조관계에서 부모쪽에 있는 데이터를 지우면 참조하는 자식 데이터도 없어진다
--------------------------------------------------------------------------------
--EMP empno pk
--DEPT deptno pk
--EMP deptno FK


alter table emp
add constraint pk_emp_empno primary key (empno);

alter table dept
add constraint pk_dept_deptno primary key (deptno);

alter table emp
add constraint fk_emp_to_dept foreign key(deptno) references dept(deptno);


--------------------------------------------------------------------------------
create table score_exam(
sid number constraint pk_score_exam_sid primary key,
name varchar2(15) not null,
korean number DEFAULT 0,
english number DEFAULT 0,
math number DEFAULT 0,
total number GENERATED ALWAYS as (korean + english + math) VIRTUAL,
avg number GENERATED ALWAYS as (trunc((korean + english + math)/3)) VIRTUAL,
dept number not null -- constraint uk_score_exam_sid unique
);
drop table score_exam;
desc score_exam;
select * from score_exam;
insert into score_exam(sid,name,korean,english,math,dept) values(321,'홍길동',32,54,42,100);
insert into score_exam(sid,name,korean,math,dept) values(133,'김길동',32,42,100);

delete from score_exam where name like '홍길동';


create table s_dept(
dept number not null constraint uk_score_exam_dept unique,
dname varchar(20) not null
);

select * from s_dept;

insert into s_dept(dept,dname) values(100, '1조');
insert into s_dept(dept,dname) values(200, '2조');
insert into s_dept(dept,dname) values(300, '3조');
insert into s_dept(dept,dname) values(400, '4조');

select e.sid,e.name,e.total,e.avg,e.dept,d.dname
from score_exam e join s_dept d
on e.dept = d.dept;


NOT NULL(NN) 열은 NULL 값을 포함할 수 없습니다.

--여기까지 초급과정완료
-----------------------------------------------------------------------------------------------------------
--중급( View )
--View 객체 (가상테이블)
--create 생성 ... 생성된 view 영속적으로 저장
/*
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias[,alias,...])]
AS Subquery 
[WITH CHECK OPTION [CONSTRAINT constraint ]]
[WITH READ ONLY]

OR REPLACE       이미 존재한다면 다시 생성한다.
FORCE            Base Table 유무에 관계없이 VIEW 을 만든다.
NOFORCE          기본 테이블이 존재할 경우에만 VIEW 를 생성한다.
view_name         VIEW 의 이름
Alias Subquery 를 통해 선택된 값에 대한 Column 명이 된다.
Subquery SELECT 문장을 기술한다.
WITH CHECK OPTION VIEW 에 의해 액세스 될 수 있는 행만이 입력,갱신될 수 있다. 
Constraint CHECK OPTON 제약 조건에 대해 지정된 이름이다.
WITH READ ONLY 이 VIEW 에서 DML 이 수행될 수 없게 한다
*/
create  view view001
as
  select * from emp;
  
select * from view001;  

--view는 테이블처럼 사용가능한 가상테이블 : 데이터를 가지고 있지 않아요
--view 메모리상에만 존재하는 가상테이블
--subquery -> in line view > from (.....)

--view 가상테이블 
--사용법 : 일반테이블과 사용법이 동일 (select , insert , update , delete)
--단 view가 볼수 있는 데이터에 한해서
--DML(insert , update , delete) -> 단일테이블에 대한 view > DML가능

create OR REPLACE view v_001
as 
   select empno , ename from emp;

select * from v_001; --view가 가지고 있는 sql 문장이 실행

--view  목적
--1. 개발자 편리성 : join, subquery >> view 사용 >> 성능(x) >> 개발자 편리성
--2. 쿼리 단순화 (편리성) : 복잡한 쿼리를 미리 만들어 두고 사용
--3. 보안성 (특정 컬럼만 노출)

--신입사원 입사 >> DBA 권한 부여 부탁 >> 인사정보 >> 특정 컬럼만 노출 >> view
create or replace view v_emp
as
   select empno , ename , job , hiredate from emp;
   
--출근
select * from v_emp;

select * from v_emp where empno=7902;

select * from v_emp where job='CLERK';

--편리성
create  or replace view v_002
as
  select e.empno, e.ename, e.deptno , d.dname
  from emp e join dept d
  on e.deptno = d.deptno;

select * from v_002;  

create view v_003  --자존심 나도 테이블처럼 사용되는데 (컬럼며은 있어야)
as
  select deptno , avg(sal) as avgsal
  from emp
  group by deptno;

select * from v_003; --직종별 평균 급여를 볼 수 있는 view
/*
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias[,alias,...])]
AS Subquery 
[WITH CHECK OPTION [CONSTRAINT constraint ]]
[WITH READ ONLY]

OR REPLACE              이미 존재한다면 다시 생성한다.
FORCE                  Base Table 유무에 관계없이 VIEW 을 만든다.
NOFORCE                기본 테이블이 존재할 경우에만 VIEW 를 생성한다.
view_name                    VIEW 의 이름
Alias Subquery              를 통해 선택된 값에 대한 Column 명이 된다.
Subquery                    SELECT 문장을 기술한다.
WITH CHECK OPTION VIEW      에 의해 액세스 될 수 있는 행만이 입력,갱신될 수 있다. 
Constraint CHECK OPTON      제약 조건에 대해 지정된 이름이다.
WITH READ ONLY              이 VIEW 에서 DML 이 수행될 수 없게 한다
*/
create or replace view v_004
as
  select round(avg(sal),0) as avgsal from emp;
  
select * from v_004;  

/*
view 는 가상 테이블 그런데 view통해서 insert, update , delete가능
단 단일테이블
*/
select * from v_emp;

update v_emp
set sal=0;  --v_emp 는 sal컬럼의 데이터를 볼 수 없어요

update v_emp
set job='IT';

select * from v_emp;
select * from emp;
rollback;
/*
create or replace view v_emp
as
   select empno , ename , job , hiredate from emp;
*/
select * from v_emp;


-- 30번 부서 사원들의  직종, 이름, 월급을 담는 VIEW를 만드는데,
-- 각각의 컬럼명을 직종, 사원이름, 월급으로 ALIAS를 주고 월급이
-- 300보다 많은 사원들만 추출하도록 하라.
create or replace view view101(직종,사원이름,월급)
as
   select job , ename , sal
   from emp
   where deptno=30 and sal > 300;

select * from view101;

--부서별 평균월급을 담는 VIEW를 만들되, 평균월급이 2000 이상인
--부서만 출력하도록 하라.
create or replace view view102
as
  select deptno , avg(sal) as avgsal
  from emp
  group by deptno
  having avg(sal) >=2000;
  
create or replace view view103
as  
  select deptno , avg(sal) as avgsal
  from emp
  group by deptno;

select v.deptno , v.avgsal, d.dname 
from dept d join view103 v
on d.deptno = v.deptno;



--Quiz
--아래 3개의 테이블 이용하여  문제 3개를 만드세요 
--필수사항) 함수 및 JOIN 퀴리는 반드시 필수 .....
--좋은 문제가 나온 조에게 포상 할게요 ^^


select e.email as 이메일, e.last_name || ' ' || e.first_name as fullname, d.department_name as 직종,
        l.city as 도시, to_char(e.salary,'$999,999,999') as 월급
from employees e join departments d on e.department_id = d.department_id
    join locations l on d.location_id = l.location_id
where e.salary >=10000
and e.department_id in(select department_id from departments where phone_number like '%011%');

create or replace view asd
as
select e.email , e.last_name || ' ' || e.first_name as fullname, d.department_name as 직종,
        l.city as 도시, e.salary as 월급
from employees e join departments d on e.department_id = d.department_id
    join locations l on d.location_id = l.location_id
where e.salary >=10000
and e.department_id in(select department_id from departments where phone_number like '%011%');

select e.first_name, d.department_name
from employees e join  departments d on nvl(e.department_id,0) = d.department_id
where salary > (select 월급 from asd where email = 'EZLOTKEY' );


select e.email as "메일", 
        e.last_name || ' ' || e.first_name as "이름", 
        d.department_name as "부서이름", 
        l.city as "도시", 
        to_char(e.salary, '$999,999,999')as "급여"
from employees e left join departments d on e.department_id = d.department_id
                    join locations l on d.location_id = l.location_id
where substr(phone_number,1,3)='011' and salary > 10000 and salary > (select salary from employees
where email = 'EZLOTKEY');
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
--221004 수업 아침

--개발자 관점에서 SQL
--오라클.pdf(185page)

/*

SEQUENCE (자동으로 번호를 생성하는 객체)
채번하기, 번호 추출기
                                
CREATE SEQUENCE sequence_name
[INCREMENT BY n]
[START WITH n]
[{MAXVALUE n | NOMAXVALUE}]
[{MINVALUE n | NOMINVALUE}]
[{CYCLE | NOCYCLE}]
[{CACHE | NOCACHE}];

sequence_name SEQUENCE 의 이름입니다.
INCREMENT BY n 정수 값인 n 으로 SEQUENCE 번호 사이의 간격을 지정.
이 절이 생략되면 SEQUENCE 는 1 씩 증가.
START WITH n 생성하기 위해 첫번째 SEQUENCE 를 지정.
이 절이 생략되면 SEQUENCE 는 1 로 시작.
MAXVALUE n SEQUENCE 를 생성할 수 있는 최대 값을 지정.
NOMAXVALUE 오름차순용 10^27 최대값과 내림차순용-1 의 최소값을 지정.
MINVALUE n 최소 SEQUENCE 값을 지정.
NOMINVALUE 오름차순용 1 과 내림차순용-(10^26)의 최소값을 지정.
CYCLE | NOCYCLE 최대 또는 최소값에 도달한 후에 계속 값을 생성할 지의 여부를
지정. NOCYCLE 이 디폴트.
CACHE | NOCACHE 얼마나 많은 값이 메모리에 오라클 서버가 미리 할당하고 유지
하는가를 지정. 디폴트로 오라클 서버는 20 을 CACHE.

*/

desc board;

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

--CRUD 관점에서
--create (insert)
--read (select)
--update
--delete

delete from board where boardid=1;
commit;

--새글 ,,,,
insert into board(boardid, title)
values((select count(boardid) + 1 from board), '4');
--ORA-00001: unique constraint (HR.PK_BOARD_BOARDID) violated
--DML 문제발생

select * from board;

--다른 방법
delete from board;
commit;

select * from board;
--집계함수

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

--글번호 고민 ..... 순번....
--sequence 객체 제공: 중복값이 없고 순차적인 값을 제공하는 객체

create sequence board_num;

select board_num.nextval from dual; -- 채번

select board_num.currval from dual; -- 현재까지 채번한 번호 확인
/*
1.4.1 NEXTVAL 과 CURRVAL 의사열
가) 특징
1) NEXTVAL 는 다음 사용 가능한 SEQUENCE 값을 반환 한다.
－188－
2) SEQUENCE 가 참조될 때 마다, 다른 사용자에게 조차도 유일한 값을 반환한다.
3) CURRVAL 은 현재 SEQUENCE 값을 얻는다.
4) CURRVAL 이 참조되기 전에 NEXTVAL 이 사용되어야 한다.
*/

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

--------------------------------------------------------------------------------
/*
게시판
공지사항, 자유게시판, 관리자 게시판 등등
공지사항 1..2..3...
자유게시판 4...
관리자 게시판 5... .6....
공지사항 7....

1. sequence 객체는 공유객체 (테이블에 종속되지 않아요)
하나의 시퀀스는 여러곳에서 자유롭게 사용가능하다
sequence 하나 생성해서 >> 공지사항, 자유게시판, 관리자 게시판 사용가능

2. 웹 사이트 (게시판 10개)
상품게시판, 관리자게시판, 회원게시판 등등...
각각의 게시판은 순번을 따로 관리하기를 원해요
10개의 시퀀스를 만들어서 각각 사용하면 돼요.

-- TIP)
MS-SQL: create table board(boardnum int identity(1,1).... title
insert into(title) values('방가); 자동 (1,2,3,...)

MS-SQL: 2012버전 (sequence객체)

Mysql: create table board(boardnum int auto_increment, ... title)
insert into(title) values('방가); 자동 (1,2,3,...)

-- mysql 만든 사람들이 open source >> mariadb(같은 엔진)
--mariadb 시퀀스 객체 존재
*/

--------------------------------------------------------------------------------
--옵션
create sequence seq_num
start with 10
increment by 2;



select seq_num.nextval from dual;

select seq_num.currval from dual;

--게시판 글 100개
--num, title, writer, content
--1, 2, 3, ..... 100
--일반적으로 게시판 글 볼때 (최신글) -가장나중에 쓴글.. 화면출력

select * from kboard order by num desc; --일반 게시판 첫 쿼리

-- 개발자 관점
-- rownum 의사컬럼: 실제 물리적으로 존재하는 컬럼x 논리적인 존재
-- rownum: 실제로 테이블에 컬럼으로 존재하지 않지만 내부적으로 행 번호를 부여하는 컬럼

select * from emp;
select rownum as 순번, empno, ename from emp;
--select 한 결과에 순번을 부여...

--Top-n 쿼리 (정렬된 기준으로 위에서 몇개 추출)
--테이블에서 조건에 맞는 상위(Top) 에서 레코드(row) n개를 추출
--Tip)
--MS-SQP: select top 10, * from emp order by sal desc;
--
--Oracle top n (x))
--rownum: 순번을 부여 특정 조건에 맞게 top 쿼리 실행가능
--1. **정렬**의 기준을 정의 (선행)
--2. 정렬된 데이터를 기준으로 rownum설정하고 조건을 걸고 데이터 추출

--1단계 (sal 높은순으로 정렬)
select *
from (  select *
        from emp
        order by sal desc
     )e;
     
--2단계 (순번이 붙음)
select rownum as num, e.*
from (  select *
        from emp
        order by sal desc
     )e;
     
--3단계 (급여를 많이 받는 사원 5명)
select *
from    (
        select rownum as num, e.*
        from (  select *
            from emp
            order by sal desc
         )e
     ) n where num <= 5;
     

--------------------------------------------------------------------------------
--게시판
/*
100건
웹 사이트에 100건 데이터가 한 화면 출력 기능
10건씩 나누어서 화면에 출력

pagesize = 10 (한 화면에 (페이지)에 보여줄 수 있는 데이터 row수)
page 개수 = 10개

[1][2][3][4][5][6][7][8][9][10] >> java 구현 >> <a href='page.jsp?'>10</a>
1page >> 1~10   >> DB select 1~10글
2page >> 11~20  >> DB select 11~20글
3page >> 21~30 ....

>>rownum
>>between A and B
*/
--------------------------------------------------------------------------------
--HR 계정이동

select * from employees; -- 107건

--1단계 (기준 데이터 만들기 (정렬))
--사번이 낮은 순으로 정렬
select * from employees order by employee_id asc;

--2단계 (기준 데이터에 순번 부여하기)
select rownum as num, e.*
from (
     select * from employees order by employee_id asc
     )e
where rownum <=50; --정렬된 데이터에 내부적으로 생성된 rownum

--3단계 
select *
from(
        select rownum as num, e.*
        from (
             select * from employees order by employee_id asc
             )e
        where rownum <=10
    ) n where num >= 1;
    
--where rownum between 1 and 10

--간단
select *
 FROM (
         SELECT ROWNUM AS NUM, E.* 
         FROM EMPLOYEES E ORDER BY EMPLOYEE_ID ASC
 ) WHERE NUM <=30;
--------------------------------------------------------------------------------
--107건
--pagesize = 10
--[1][2][3][4][5][6][7][8][9][10][11]
--[1] >> 1~10
--[2] >> 11~20
--...
--[10] >> 91~100
--[11] >> 101~107

--KOSA계정에서
create table dmlemp
as
    select * from emp;

--제약정보는 복사가 안돼요
select * from dmlemp;

alter table dmlemp
add constraint pk_dmlemp_empno primary key (empno);

select * from user_constraints where table_name='DMLEMP';

select * from dmlemp;
commit;

select * from dept;

create table sdept
as
   select * from dept;
   

select * from sdept;

desc sdept;

insert into sdept values(493,123,123);

delete from sdept where deptno=60;

update sdept set deptno=123,dname=22,loc=22 where deptno=123;
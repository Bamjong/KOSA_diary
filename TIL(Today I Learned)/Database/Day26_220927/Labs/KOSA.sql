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
select rpad(substr('hong1007',1,2),length('hong1007'),'*') from dual;
select rpad(substr('k1234',1,2),length('k1234'),'*') from dual;

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
from member2

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
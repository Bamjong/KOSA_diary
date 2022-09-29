# 📚 Day28_220929

Author: 고범종
Created Time: 2022년 9월 29일 오전 9:21
Status: 🖨 Published
Updated Time: 2022년 9월 29일 오후 6:55

# 1. 서브쿼리

---

- 메인쿼리 안에있는 쿼리를 사용하는걸 서브쿼리라고 한다.
- 2개의 쿼리를 하나로 통합

## single row subquery

- 실행결과가 단일 row 단일 column인 경우를 (단 한개의 반환)
- ex) select avg(sal) from emp
연산자: ( =  !=  <  > )

## multi row subquery

- 실행결과가 단일 column row 여러개인 경우
- ex) select sal from emp
연산자: IN, NOT IN, ANY, ALL
ALL : sal > 1000 and sal > 4000 and ...
ANY : sal > 1000 or  sal > 4000 or

### 문법)

1. 괄호안에 있어야 한다 >> (select max(sal) from emp)
2. 단일 컬럼으로 구성 >> selecet max(sal), sum(sal) from emp (이런식 x)
3. 단독으로 실행 가능

### [예시]

- 사원테이블에서 사원들의 평균 월급보다 더 많은 월급을 받는 사원의 사번, 이름, 급여를 출력하세요

```sql
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp);
```

[출력]

![https://user-images.githubusercontent.com/92353613/192912594-73669602-57af-4964-836e-b259aff88c86.png](https://user-images.githubusercontent.com/92353613/192912594-73669602-57af-4964-836e-b259aff88c86.png)

where에 [select from where] 전부를 적어주어 사용한다

### 실행순서

1. subquery 먼저 실행
2. 결과를 가지고 메인 query 실행

### TIP)

select ...(subquery) >> 한개의 행만 반환할 경우 (Scala subquery)
from (subquery) >> inline view(가상테이블) ... ^^
where (subquery) >> 조건

멀티는 'in' 싱글은 '연산자’

### [문제]

- 사원테이블에서 jones 의 급여보다 더 많은 급여를 받는 사원 사번, 이름, 급여를 출력하세요

```sql
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
```

### [문제]

- 부하직원이 있는 사원의 사번과 이름을 출력하세요

```sql
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
```

위와같이 데이터가 null값이 있어 출력이 되지않을때 이유가 적혀있다

or일땐 null은 무시하지만 and일땐 null의 영향이 있으므로 나오지 않는다.

- 문제모음집
    - [문제 1]
        - 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.
        
        ```sql
        SELECT ENAME, SAL
        FROM EMP
        WHERE SAL>(SELECT SAL
                       FROM EMP
                       WHERE ENAME='SMITH');
        ```
        
        [문제 2]
        
        - 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급, 부서번호를 출력하라.
        
        ```sql
        SELECT ENAME, SAL, DEPTNO
        FROM EMP
        WHERE SAL IN(SELECT SAL
                         FROM EMP
                         WHERE DEPTNO=10);
        ```
        
        [문제 3]
        
        [문제 4]
        
        [문제 5]
        
        [문제 6]
        
        [문제 7]
        
        [문제 8]
        
        [문제 9]
        
        [문제 10]
        
        [문제 11]
        

# 2. DML (데이터 조작어)

---

#오라클.pdf(168page)
암기하세요!! (그정도로 중요)

## 오라클기준

- DDL(데이터 정의어) : [create, alter, drop, truncate], rename, modify
- DML(데이터 조작어) : insert, update, delete
- DQL(데이터 질의어) : select (함수, 조인, 서브쿼리)
- DCL(데이터 제어어) : grant, revoke (관리자)
- TCL(트랜잭션)          : commit, rollback, savepoint

### transaction

- 하나의 논리적인 작업 단위

[예시]

```sql
A계좌에서 출금 B계좌 입금(업무) >> 하나의 논리적인 단위 묶어서 처리
둘다 성공 or 둘다 실패
처리하는 방법(commit, rollback)
```

## 1. insert

### 1.1 가장 일반적인 insert

```sql
insert into temp(id,name)
values(100, '홍길동');

select * from temp;

commit;
```

### 1.2 컬럼 목록 생략 (웬만하면 사용x)

```sql
insert into temp
values(200,'김유신');

select * from temp;
```

### 1.3 문제 (insert)

```sql
insert into temp(name)
values('아무개');      --id pk 제약 (null x)

insert into temp(id, name)
values(100,'개똥이');  -- pk중 '100' 때문에 안댐
```

# 3. 대량 데이터  삽입

## PL/SQL

sql에서 프로그래밍 for문 처럼 사용할 수 있다.

### [예시]

```sql
create table temp2(id varchar2(50));
BEGIN
    FOR i IN 1..100 LOOP
        insert into temp2(id) values('A' || to_char(i));
    END LOOP;
END;

select * from temp2;
```

[출력]

![https://user-images.githubusercontent.com/92353613/192948973-40eccad9-d380-4a8c-9805-b350418efcf3.png](https://user-images.githubusercontent.com/92353613/192948973-40eccad9-d380-4a8c-9805-b350418efcf3.png)

### [예시]

```sql
create table temp3(
    memberid number(3) not null, --3자리 정수
    name varchar2(10), -- null허용
    regdate date default sysdate -- 초기값 설정(기본값) (시스템 날짜를 기본값 사용)
);

select * from col where tname = 'TEMP3';

select sysdate from dual;
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
```

- 기본 설정

```sql
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
```

위와같이 값을 넣어보고 commit rollback 해보았다.

## 대량 insert

### 문법 2개

- insert into 테이블명(컬럼리스트) values
- insert into 테이블명(컬럼리스트) select 절
- 담을 테이블이 없는 경우 >> 테이블 복제(구조: 스키마) + 데이터 삽입)
- 단 제약정보는 복제 x (PK, FK)
- 순수한 데이터 구조 복제 + 데이터 복사

### [예시]

- temp4에 있는 모든 데이터를 temp5에 넣고싶어요

```sql
insert into temp5(num)
select id from temp4; --대량데이터 삽입...
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

### [퀴즈]

- 틀(구조)만 복제하고 데이터는 복사하고 싶지 않아요

```sql
create table copyemp3
as
    select * from emp where 1=2;
    
select * from copyemp3;
```

[출력]

![https://user-images.githubusercontent.com/92353613/192951108-fde18ebf-f609-459e-9027-438bc6543a0a.png](https://user-images.githubusercontent.com/92353613/192951108-fde18ebf-f609-459e-9027-438bc6543a0a.png)

# UPDATE

update 테이블명
set 컬럼명 = 값, 컬럼명2 = 값2.....
where 조건절

update 테이블명
set 컬럼 = (subquery)
where 컬럼명 = (subquery)

- 내가 이해한건 사실상 덮어쓰기였다.

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

- 삭제

```sql
delete from copyemp;
select * from copyemp;
rollback;

delete from copyemp where deptno=10;
select * from copyemp where deptno=10;  -- 이렇게 지정해서 지울수도 있음
commit;
```
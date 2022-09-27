# 2022년 9월 27일 화요일
<br>

## 1. 비교연산자
    주의
    java: 같다 (==) 할당(=) , javascript(==, ===)
    oracle: 같다 (=) 같지않다(!=)

    논리연산자
    AND, OR , NOT

```sql
-- 사번이 7788번인 사원의 사번, 이름, 직종, 입사일을 출력하세요
select empno,ename,deptno,sal
from emp
where empno = 7788;
```

[출력]  
![image](https://user-images.githubusercontent.com/92353613/192403118-8c54f3f9-1afc-4d44-9788-4ee7adbcb829.png)

<br>

### 개발자: CRUD >> Create (insert), Read (select), Update, delete 
- DB 작업: Read (select) 70%

- 관리자: 백업과 복원, 장애(네트워크, 성능) 관리, 보안(사용자권한, 암호화)
- 튜닝 (쿼리튜닝, 하드웨어) >> 문장튜닝 >> 시간을 ...
- 설계(모델러): 설계(요구사항 정의, 분석) : 최종산출물 = erd

<br>

### [문제] 사원의 이름이 king인 사원의 사번, 이름, 급여 정보를 출력하세요  
![image](https://user-images.githubusercontent.com/92353613/192405732-22efa141-efe2-4af3-9583-1825b4e6b62e.png)

    king을 소문자로 작성하면 안나온다
    Oracle은 대소문자를 확실하게 구별하는 엄격한 시스템이기 때문이다.

### [문제] 급여가 2000달러 이상이면서 직종이 manager인 사원의 모든 정보를 출력하세요

![image](https://user-images.githubusercontent.com/92353613/192405837-e3602170-d8ab-4f28-ba0c-e541dc154828.png)

    sql에선 &&(and)를  그냥 'and'로 작성하여 출력한다.

<br>

### between 연산자
```sql
    --사원의 급여가 2000이상이고 4000이하인 모든 사원의 정보를 출력하세요
    select *
    from emp
    where sal >= 2000 and sal <= 4000;

    -- 연산자: 컬럼명 between A and B (=포함)
    select *
    from emp
    where sal between 2000 and 4000;

    위에 두개는 같다.

    초과 미만의 경우에는 사용 불가
```

### IN 연산자
```sql
    -- 부서번호가 10번 또는 20번 또는 30번인 사원의 사번, 이름, 급여, 부서번호를 출력하세요
    select *
    from emp
    where deptno=10 or deptno=20 or deptno=30;
    -- 연산자 (IN 연산자)

    select *
    from emp
    where deptno in (10,20,30); -- 풀어쓰면 deptno=10 or deptno=20 or deptno=30;
```

### NOT IN 연산자
```sql
    -- 부서번호가 10번 또는 20번이 아닌 사원의 사번, 이름, 급여, 부서번호를 출력하세요
    select *
    from emp
    where deptno != 10 and deptno !=20; -- 두가지 조건을 모두 만족
    --IN 연산자 부정 >> NOT IN
    select *
    from emp
    where deptno not in (10,20); --deptno != 10 and deptno !=20;
```

<br>

## 2. DB날짜 

[시스템 테이블]  
![image](https://user-images.githubusercontent.com/92353613/192406205-7ae8ef63-4eba-4c01-a4f0-0ab62f688dfc.png)  

    select * from nls_session_parameters; --시스템 테이블
    작성하면 현재 DB에 연결되어있는 정보가 출력이 됨

[날짜 형식 변환하기]  
![image](https://user-images.githubusercontent.com/92353613/192406457-c63a23c3-958c-4b7d-a884-2fd3d42d7800.png)

    위 시스템 테이블 사진과 다른점은 nls_date_format 이 바뀌었다.
    이를 통해 날짜형식을 변환할수 있지만.

    변경 정보는 현재 오라클 서버에 접속한 사용자의 작업 환경 설정이기 때문에
    재접속 하면 원래 상태로 복원(RR-MM-DD)이 된다.

<br>

## 3. CRUD(게시판)

    설계
    글쓴이, 제목, 내용, 조회수, 작성날짜
    insert into board(writer, title, content, hit, regdate)
                values('홍길동','처음방가','졸립다',0,sysdate)
    regdate: 컬럼의 데이터는 서버의 시간(DB서버)

TIP)
- ms-sql: select getdate()
- Mysql : curdate(), curtime(), now(), sysdate()


### Null
    POINT: null >> oracle 값이 없다. >> 필요악

```sql
create table member(
 userid varchar2(20) not null, --null을 허용하지 않겠다 (필수입력)
 name varchar2(20) not null, -- 이름은 필수입력 받겠다. (필수입력)
 hobby varchar2(50) -- default null 허용 : 선택적 입력사항
);
```
    not null 은 무조건 입력하게 만드는 것.
    default 값은 null이다.


### [문제] 수당(comm) 을 받지 않는 모든 사원의 정보를 출력하세요
```sql
-- 0도 데이터(받는 조건)
select comm from emp;
-- comm 컬럼의 데이터가 null인 것만 출력

select * from emp where comm is null;
-- null 비교는 (is null, is not null) 암기...
select * from emp where comm is not null;
```

### [문제] 사원테이블에서 사번, 이름, 급여, 수당, 총급여를 출력하세요
- 총급여 정의(급여 + 수당)

```sql
select empno, ename, sal, comm, sal+comm as "총급여"
from emp;
```
[출력]  
![image](https://user-images.githubusercontent.com/92353613/192415072-6ecfd417-3cca-456d-b485-c2d4814cd445.png)  


```sql
select empno, ename, sal, comm, sal+nvl(comm,0) as "총급여"
from emp;
```
[출력]  
![image](https://user-images.githubusercontent.com/92353613/192415200-5f12ca9b-bffb-4a93-a468-01ca09d9ba2a.png)  

    null 이란 녀석...
    1. null 과의 모든 연산의 결과는 null..  ex) 100 + null = null
    2. 위 문제를 해결하기 위해서 함수를 만들었음 >> nvl(), nvl2() >> 암기!!
    ex) nvl(컬럼명, 대체값) >> 치환
<br>

### [문제] 사원의 급여가 1000이상이고 수당을 받지 않는 사원의 사번, 이름, 직종, 급여, 수당을 출력하세요.
```sql
select empno, ename, job, sal, comm
from emp
where sal >= 1000 and comm is null
```
[출력]  
![image](https://user-images.githubusercontent.com/92353613/192416171-503ba000-71d2-4a6d-bf41-23398a5f5949.png)



## 4. commit
    간단하게
    DB서버 마다 설정
    DML(데이터 조작어) : insert, update, delete
    오라클 실제반영을 위해서 개발자에게: commit, rollback 강제
    Ms-sql, Mysql default commit >> begin 명시 DML 작업 ... commit
    commit; -- 명령 (insert, update, delete)

```sql
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
```

    Board 테이블을 작성 한 뒤
    100, '오라클', '실수했네^^' 를 삽입한 뒤
    rollback 을 입력하면 다시 입력 전으로 돌아온다.
    이후 commit 하면 최종 저장완료가 된다.


## 5. Like 연산자

    문자열 검색
    주소검색 : 검색어 : 역삼 -> 역삼 단어가 들어가 있는 모든 주소가 출력
    LIke 패턴검색

    Like (문자열 패턴 검색 연산자)

    Like 연산자 (와일드 카드 문자 : 1. %(모든것) , _(한문자) 결합 패턴을 생성 일치...
    검색이 한정적 >> java 정규표현식 오라클 적용

['%'예시]  
```sql
select *
from emp
where ename like '%A%';  -- ename 컬럼에 앞뒤상관없이 A만 있는 글자만 뽑아라.
```  
[출력]  
![image](https://user-images.githubusercontent.com/92353613/192421643-7885b542-4910-4c61-b89d-91e36ace2c7f.png)

<br>

['%' 예시2]   
```sql
select *
from emp
where ename like '%A%A%';  -- ename 컬럼에 A만 두개있는 row만 뽑아라.
```
[출력]  
![image](https://user-images.githubusercontent.com/92353613/192421976-969e9620-417b-4ce0-9e5d-19e655253165.png)  

<br>

['_' 예시]
```sql
select ename
from emp
where ename like '_A%' -- 첫글자는 어떤것이 와도 상관없고 두번째 글자는 A로 시작
```

[출력]  
![image](https://user-images.githubusercontent.com/92353613/192422299-cde80631-e91f-40eb-8489-7fe9a406811f.png)

<br><br>

## 6. 데이터 정렬하기
    order by 컬럼명 : 문자, 숫자, 날짜 정렬
    오름차순 : asc : 낮은순 : default
    내림차순 : dese : 높은순
    비용(cost) 많이 드는 작업

[예시]
```sql
select *
from emp
order by sal; --default asc 오름차순

select *
from emp
order by sal desc; -- 내림차순
```


쿼리 튜닝 순서

1. select 절        3
2. from 절          1
3. where 절         2
4. order by 절      4 (select 결과를 정렬)

<br><br>

[order by 중첩 예시]  
```sql
select job, deptno
from emp
order by job asc, deptno desc;
-- order by 컬럼명 asc, 컬럼명 asc ...
```   
![image](https://user-images.githubusercontent.com/92353613/192436684-184ee43d-4185-46b1-b1e5-eeeb13c6fbe2.png)

    주로 게시판...
    답변게시판...
    에서 쓰인다

## 7. Union

연산자
- 합집합(UNION) : 테이블과 테이블의 데이터를 합치는것(중복값 배제)
- 합집합(UNION ALL) : 중복값 허용

```sql
--중복데이터를 죽이고 합침.
SELECT * FROM UT
UNION
SELECT * FROM UTA

SELECT * FROM UT
UNION ALL
SELECT * FROM UTA
--UT 집에 UTA 가족들이 놀러간것
```

1. 대응되는 컬럼의 타입이 동일해야함.  
아래를 보면 각 대응되는 컬럼의 타입이 다르기 때문에 UNION  사용이 불가능.

```sql
SELECT EMPNO, ENAME FROM EMP
UNION
SELECT DNAME, DEPTNO FROM DEPT; --불가능

SELECT EMPNO, ENAME FROM EMP
UNION
SELECT DEPTNO, DNAME FROM DEPT; -- 가능
```  

2. [대응]대는 [컬럼]의 개수가 동일
```sql
SELECT EMPNO, ENAME, JOB, SAL FROM EMP
UNION
SELECT DEPTNO, DNAME, LOC, NULL FROM DEPT;
```


## 8. Oracle 함수

<br>

단일 행 함수의 종류
1. 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다.
2. 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다.
3. 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를 제외하고 모두 날짜 데이터형의 값을 RETURN 한다.
4. 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다.
5. 일반적인 함수 : NVL, DECODE

<br>

### 1. 문자형 함수

- initcap  
[첫글자만 대문자로 해주기]
- lower, upper  
[lower 대문자 -> 소문자  upper 소문자 -> 대문자]
- length  
[length는 문자열의 갯수 출력]
- concat  
[두개의 문자열을 합침]
- ||  
[3개 이상부턴 연산자 쓰는게 편함]
- substr  
[문자열 추출]


```sql
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
```
<br><br>

substr() [문자열추출]

    Java    : substring  
    Oracle  : substr

```sql
select substr('ABCDE',2,3) from dual; --  >> BCD
select substr('ABCDE',1,1) from dual; --  >> A
select substr('ABCDE',3,1) from dual; --  >> C

select substr('abcdkenslkenfslfeflkenklskleflknsef',3) from dual; -- >> cdkenslkenfslfeflkenklskleflknsef

select substr('ABCDE',-2,1) from dual; -- >> D
select substr('ABCDE',-2,2) from dual; -- >> DE
```

[문제]
- 사원테이블에서 ename 컬럼의 데이터에 대해 첫글자는 소문자로 나머지 글자는 대문자로 출력하고  
하나의 컬럼으로 만들어 출력하시고 컬럼의 별칭은 fullname
- 첫글자와 나머지 문자 사이에는 공백하나를 넣으세요

```sql
select substr(lower(ename),1,1) || ' ' ||substr(upper(ename),2) as fullname
from emp;
```

[출력]  
![image](https://user-images.githubusercontent.com/92353613/192485552-c9f434b7-c3c0-4e9c-96bb-17615e2e9c99.png)

<br><br>

lpad(), rpad() (채우기 함수)
```sql
select lpad('ABC',10,'*') from dual; -- >> *******ABC
select rpad('ABC',10,'*') from dual; -- >> ABC*******

select rpad(substr('hong1007',1,2),length('hong1007'),'*') from dual; -- >> ho******
select rpad(substr('k1234',1,2),length('k1234'),'*') from dual; -- >> k1***
```
<br>

[문제]
- 100 : 123456-*******
- 200 : 234567-*******
- 가명칭은 "juminnumber"

```sql
create table member2(
    id number,
    jumin varchar2(14)
);
insert into member2(id, jumin) values(100,'123456-1235467');
insert into member2(id, jumin) values(200,'234567-1235467');

select id || ' : ' || rpad(substr(jumin,1,7),length(jumin),'*') as juminnumber
from member2;
```
<br><br>

ltrim(), rtrim() (지우기 함수)
```sql
select rtrim('MILLER','ER') from dual;  -- 오른쪽 문자를 지워라 >> MILL
select ltrim('MILLLLLLLLLLLLLER','MIL') from dual; -- 왼쪽 문자를 지워라 >> ER

-- 공백제거
select '>' || rtrim('MILLER     ',' ') || '<' from dual; -- >> >MILLER<     -- 오른쪽 공백 제거
select '>' || ltrim('       MILLER',' ') || '<' from dual; -- >> >MILLER<   -- 왼쪽 공백 제거
```
<br><br>

replace() (글자 바꾸기 함수)
```sql
select ename, replace(ename,'A','와우') from emp;
```

<br><br>


### 2. 숫자형 함수
- round (반올림 함수)
- trunc (절삭 함수)
- Mod() (나머지를 구하는 함수)

<br>

round() (반올림 함수)
```sql
 -3 -2 -1 0(정수) 1 2 3
select round(12.345,0) as r from dual; -- >> 12
select round(12.567,0) as r from dual; -- >> 13

select round(12.345,1) as r from dual; -- >> 12.3
select round(12.567,1) as r from dual; -- >> 12.6

select round(12.345,-1) as r from dual; -- >> 10
select round(12.345,-1) as r from dual; -- >> 10
select round(12.345,-2) as r from dual; -- >> 0
```
<br>

trunc() (절삭 함수)
```sql
select trunc(12.345,0) as r from dual; -- >> 12
select trunc(12.567,0) as r from dual; -- >> 12

select trunc(12.345,1) as r from dual; -- >> 12.3
select trunc(12.567,1) as r from dual; -- >> 12.5

select trunc(12.345,-1) as r from dual; -- >> 10
select trunc(12.345,-1) as r from dual; -- >> 10
select trunc(12.345,-2) as r from dual; -- >> 0
```
<br>

mod() (나머지 함수)
```sql
select 12/10 from dual; -- >> 1.2
select mod(12,10) from dual; -- >> 2
select mod(0,0) from dual; -- >> 0
```

### 3. 날짜형 함수
날짜 연산 중요
1. Date + Number >> Date
2. Date - Number >> Date
3. Date - Date >> Number (일수)

<br>

sysdate (현재 날짜 시간 불러오기)
```sql
select sysdate + 100 from dual; -- >> 2023-01-05 16:05:50
select sysdate + 1000 from dual; -- >> 2025-06-23 16:05:56
```
    일 단위로 더하기 가능함

months_between (달 기준 사이값)
```sql
select trunc(months_between('2022-09-27','2020-09-20'),0) from dual; -- >> 24
-- trunc를 통해 소숫점 아랫값 삭제
```

to_date (날짜형 데이터로 변환)   
```sql
select to_date('2022-01-01') + 100 from dual; -- >> 2022-04-11 00:00:00
```

[문제 1]
- 사원 테이블에서 사원들의 입사일에서 현재날짜까지의 근속월수를 구하세요
- 사원이름, 입사일, 근속월수 출력
- 단 근속월수는 정수부분만 출력 (반올림 하지 마세요)

```sql
select ename,hiredate,trunc(months_between(sysdate,hiredate),0)
from emp;
```

[출력]  
![image](https://user-images.githubusercontent.com/92353613/192493596-45b23caf-baee-4a91-b55d-35779d6ae893.png)

<br>

[문제 2]
- 한달이 31일 이라는 기준에서 근속월수를 구하세요
```sql
select trunc((sysdate-hiredate)/31,0)
from emp;
```

[출력]  
![image](https://user-images.githubusercontent.com/92353613/192493759-44b9d9ef-7b27-4489-b49a-8793f62be5be.png)



### 4. 변환형 함수
to_char() <- 제일 많이씀
- 숫자 -> 문자 (1000 -> $100,000) >> format 출력형식 정의
- 날짜 -> 문자 ('2022-09-29' -> 2022년09월29일)

    to_char()쓰는이유 == 그냥 이쁘게 출력할려고 ㅋㅋ

to_date()
- 문자 -> 날짜
- select to_date('2022-01-01') + 100 from dual;

to_number()
- 문자 -> 숫자 >> 자동형변환
- select '100' + 100 from dual;
- select to_number('100') + 100 from dual;

[문제]
- 입사일이 12월인 사원의 사번, 이름, 입사일, 입사년도, 입사월을 출력하세요
```sql
select empno, ename, hiredate, to_char(hiredate, 'YYYY') as YYYY, to_char(hiredate, 'MM') as MM
from emp
where to_char(hiredate, 'MM') = '12';
-- 오라클.pdf 68page 표 참조
```

[출력]  
![image](https://user-images.githubusercontent.com/92353613/192494858-be020b46-ee97-405f-b21c-2276e74a83ef.png)

- to_char: 숫자 -> 형식문자 변환 (오라클.pdf 71page 표 참조)

    10000000 -> $10,000,000 이런식으로 형변환 할때

```sql
select '>' || to_char(12345,'999999999999') || '<' from dual; -- >> >        12345<
select '>' || ltrim(to_char(12345,'999999999999')) || '<' from dual; -- >> >12345<

select '>' || to_char(12345,'$999,999,999,999') || '<' from dual; -- >> >          $12,345<

select sal , to_char(sal, '$999,999') from emp;
```


[오늘 최종 문제]
- 사원테이블(employees)에서 사원의 이름은 last_name , first_name 합쳐서 fullname 별칭 
부여하고 출력
- 입사일은  YYYY-MM-DD 형식으로 출력하고 연봉(급여 *12)을 구하고 출력
- 연봉의 10%(연봉 * 1.1)인상한 값을 출력
- 그 결과는 1000단위 콤마 처리해서 출력
- 단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로 출력하세요

```sql
select last_name || first_name as fullname,
to_char(hire_date, 'YYYY-MM-DD') as hire_date,
salary,
salary*12 as 연봉,
to_char(((salary*12)*1.1), '999,999,999,999') as 인상분

from employees
where to_char(hire_date,'YYYY') >= 2005
order by 연봉 desc;
--order by절은 select 다음에 실행 > select 된 결과 컬럼값을 사용가능 (가명칭)
```

[출력]  
![image](https://user-images.githubusercontent.com/92353613/192495786-0de41b7b-b10a-4cd3-af6e-4faa08b8135b.png)
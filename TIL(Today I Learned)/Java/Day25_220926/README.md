# 2022년 9월 26일 월요일
<br>

## 1. 조별 프로젝트 발표

## 2. 오라클 

- 10g ~ 11g버전 가장많이씀
- 앞으로의 수업은 OracleXE112_Win64 버전 사용

### 오라클 버전별 차이점

 - Express Edition (앞으로의 수업때 사용할 버전)
    
    개발 및 배포가 자유로운 무료버전

![이미지](https://postfiles.pstatic.net/20140828_253/itu_itu_1409213022761t3j7F_JPEG/%BF%C0%B6%F3%C5%AC%B9%F6%C0%FC%BA%B0%C2%F7%C0%CC%C1%A1_1.jpg?type=w2)


 - Standard Edition One  (여기서 부터 돈주고 사는거임)

![이미지](https://postfiles.pstatic.net/20140828_244/itu_itu_1409213023395uMGVk_JPEG/%BF%C0%B6%F3%C5%AC%B9%F6%C0%FC%BA%B0%C2%F7%C0%CC%C1%A1_2.jpg?type=w2)

- Standard Edition (One 혹은 이거까지가 대부분 현업에서 사용)

![이미지](https://postfiles.pstatic.net/20140828_246/itu_itu_1409213023122f1dxo_JPEG/%BF%C0%B6%F3%C5%AC%B9%F6%C0%FC%BA%B0%C2%F7%C0%CC%C1%A1_3.jpg?type=w2)

- Enterprise Edition (좀 큰 기업일때 이거사용)

![이미지](https://postfiles.pstatic.net/20140828_191/itu_itu_1409213024333zkm7M_JPEG/%BF%C0%B6%F3%C5%AC%B9%F6%C0%FC%BA%B0%C2%F7%C0%CC%C1%A1_4.jpg?type=w2)

- 전체적인 비교 사진

![이미지](https://postfiles.pstatic.net/20140828_193/itu_itu_1409213024061Ha4ps_JPEG/%BF%C0%B6%F3%C5%AC%B9%F6%C0%FC%BA%B0%C2%F7%C0%CC%C1%A1_5.jpg?type=w2)


<br><br>

***결론은 데이터 영속적 저장하는 SW 만드는게 중요***

<br><br>


### 시각적으로 DB작업

[무료]

- [SQL Developer 22.2.1](https://www.oracle.com/database/sqldeveloper/technologies/download/)
- [DBeaver](https://dbeaver.io/download/)
- [heidisql](https://www.heidisql.com/)

[유료]

- [toad](https://toad.co.kr/product)
- [SQLgate](https://www.sqlgate.com/pricing/productLicense) -한국


<br>



## 3. RDBMS(관계형 데이터베이스)

관계종류

- 1:1 / 1:M / N:M

<br><br>

## 4. Oracle SQL developer 수업

![image](https://user-images.githubusercontent.com/92353613/192208966-be028bbe-7c2d-4f85-981f-3287efc8cbc7.png)

- SID: 전역 데이터베이스 이름


![image](https://user-images.githubusercontent.com/92353613/192213860-f591d60c-27a5-4d83-95e3-2a9580a34fb4.png)

- HR의 employees 더미데이터 출력

![image](https://user-images.githubusercontent.com/92353613/192214308-3797471e-5aa2-4f03-b95a-2a11b4155c65.png)

- CONNECT & RESOURCE 기본적으로 주어지는 권한


<br><br>

### [1일차 수업]


1. 오라클 소프트웨어 다운로드
https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64 (무료설치)

3. Oracle 설치(SYS, SYSTEM 계정의 대한 암호 : 1004)

4. Sqlplus 프로그램 제공(CMD) : GUI 환경 일반개발자 사용 불편

5. 별도의 Tool 설치 무료(SqlDeveloper , https://dbeaver.io/)  ,
                 유료(토드 , 오렌지 , SqlGate) 프로젝트시 설치 활용 ^^

6. SqlDeveloper 툴을 통해서 Oracle Server 접속 ....
   >> HR 계정 : 암호 1004 , Unlock 2가지 사용가능 .... (사원관리 실습 테이블)
   >> 새로운 계정 : BITUSER


<br><br>

### [오라클 1일차 수업 코드]


[EMP 테이블]

```sql
CREATE TABLE EMP            -- EMP란 테이블 입력

(EMPNO number not null,     -- 열 정보 입력
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );

select * from emp;          -- emp 데이블 출력

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

COMMIT;                     -- INSERT 후 COMMIT 까지 끝내어야 데이터 입력완료

select * from emp;          -- emp 테이블 출력
```

[출력]

![image](https://user-images.githubusercontent.com/92353613/192218713-19361559-5cd9-40cc-bc90-325023c1df1e.png)


<br><br>


[DEPT 테이블]

```sql

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;

```

[출력]

![image](https://user-images.githubusercontent.com/92353613/192219313-e2634b57-8515-41fb-a7b4-d5ba88c41c81.png)

<br><br>

[SALGRADE 테이블]

```sql
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

select * from salgrade;
```

[출력]

![image](https://user-images.githubusercontent.com/92353613/192219483-6878196d-848d-4f1e-ae41-a61135f46fc9.png)



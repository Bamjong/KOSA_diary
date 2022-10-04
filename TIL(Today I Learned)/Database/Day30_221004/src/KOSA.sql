show user;
-- USER��(��) "KOSA"�Դϴ�.

/*
[1���� ����]
1. ����Ŭ ����Ʈ���� �ٿ�ε�
https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64 (���ἳġ)

3. Oracle ��ġ(SYS, SYSTEM ������ ���� ��ȣ : 1004)

4.Sqlplus ���α׷� ����(CMD) : GUI ȯ�� �Ϲݰ����� ��� ����

5.������ Tool ��ġ ����(SqlDeveloper , https://dbeaver.io/)  ,
                 ����(��� , ������ , SqlGate) ������Ʈ�� ��ġ Ȱ�� ^^

6. SqlDeveloper ���� ���ؼ� Oracle Server ���� ....
   >> HR ���� : ��ȣ 1004 , Unlock 2���� ��밡�� .... (������� �ǽ� ���̺�)
   >> ���ο� ���� : BITUSER

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


7. ���� ���� ���� Ȯ�� : show user;   >> USER��(��) "BITUSER"�Դϴ�.


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
�ǽ��ڵ�

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


-- 1. ������̺��� ��� �����͸� ����ϼ���
-- ������ ��ҹ��� ���� x
-- ���� & ���̺� ��ҹ��� ������ ȸ�縶�� �ٸ�
select * from emp;
SELECT * FROM emp;

-- 2. Ư�� �÷� ������ ����ϱ�
select empno, ename, sal
from emp;  --���� �ٲ㵵 �����ݷ� ������ �Է��̶� ������

select ename
from emp;

-- 3. �÷��� ����Ī(alias) ��Ī �ο��ϱ�
select empno ���, ename �̸� from emp;
select empno "��   ��", ename "��   ��"from emp;

-- SQL ǥ�� ���� (ANSI ����) >> ǥ�� >> oracle or MS-sql or Mysql ���� ��밡��
select empno as "��   ��", ename as "��   ��"
from emp;

-- Oracle���� ���ڿ� �����ʹ� ''(�̱������̼�) ����ؼ� ǥ��
-- Oracle ���ڿ������� �����ϰ� [��ҹ���] ����
/*
JAVA: ���� 'A' , ���ڿ� "AAA"
Oracle: ���ڿ� 'A', 'AA', 'AAA'
Oracle: A, a >> �ٸ� ����
*/
select empno, ename
from emp
where ename='KING';  -- king �̶�� ������ ã�� �� ����
/*
select ��   3��
from ��     1��
where ��    2��
*/


-- Oracle query(���Ǿ�) : ���
/* 
   ������
   java: + ���ڿ� (���տ���)
   java: + ���� (�������)
   
   ������
   oracle ���տ�����: ||
   oracle ���������: + (���)
*/  
-- Tip) MS-SQL + (����, ���)


select '����� �̸���' || ename || '�Դϴ�' as "�������"
from emp;

-- ����ȯ �۾� (���������� ���� (���ڿ�) �ڵ� ����ȯ)
select empno || ename   -- ���� || ���ڿ� (����)
from emp;

desc emp;
/*
Ÿ��
java:   class Emp {private int empno, private String ename}
oracle: create table Emp(empno number, ename varchar2(20));

oracle(�÷�): ����, ���ڿ�, ����
varchar2(10) >> ���ڿ� �������� ũ��
*/



-- ���߽�
-- ����� ..
-- �츮 ȸ�翡 ������ ��� �ֳ�
select job from emp;
-- �ߺ� �����͸� ���� Ű����: distinct
select distinct job from emp;


-- distinct ���� >> �׷���
select distinct deptno, job
from emp
order by deptno;


-- Oracle������
-- java ���� ����  ( + - * / ) ������ %
-- Oracle ����    ( + - * / ) ������ �����ڴ� ���� >> �Լ��� ���ؼ� Mod()
-- eame like '%��%'


-- ������̺��� ����� �޿��� 100�޷� �λ��� ����� ����ϼ���.
select empno, ename, sal, sal + 100 as "�λ�޿�"
from emp;

desc emp;



-- dual �ӽ� �������̺�
select 100 + 100 from dual;     --200
select 100 || 100 from dual;    --100100
select '100' + 100 from dual;   --������ ����(����ȯ ����)
select 'A100' + 100 from dual;  -- ����

show user;

--------------------------------------------------------------------------------------------------------------------------------
--220927����--


/*
-- �񱳿�����
>, <, <=
����
java: ���� (==) �Ҵ�(=) , javascript(==, ===)
oracle: ���� (=) �����ʴ�(!=)

��������
AND, OR , NOT
*/

select empno, ename, sal
from emp
where sal >= 2000;

-- ����� 7788���� ����� ���, �̸�, ����, �Ի����� ����ϼ���
select empno,ename,deptno,sal
from emp
where empno = 7788;

-- ������: CRUD >> Create (insert), Read (select), Update, delete
-- DB �۾�: Read (select) 70%

-- ������: ����� ����, ���(��Ʈ��ũ, ����) ����, ����(����ڱ���, ��ȣȭ)
-- Ʃ�� (����Ʃ��, �ϵ����) >> ����Ʃ�� >> �ð��� ...
-- ����(�𵨷�): ����(�䱸���� ����, �м�) : �������⹰ = erd


-- ����� �̸��� king�� ����� ���, �̸�, �޿� ������ ����ϼ���
select empno, ename, sal
from emp
where ename = 'KING'


--�̻�, ���� (=)
--�ʰ�, �̸�
/*

*/
-- �޿��� 2000�޷� �̻��̸鼭 ������ manager�� ����� ��� ������ ����ϼ���
select *
from emp
where sal >= 2000 and job = 'MANAGER';


-- ����Ŭ ��¥ (DB������ ��¥)
-- ����Ŭ ��¥ (sysdate)
select sysdate from dual;
-- 22/09/27

select * from nls_session_parameters; --�ý��� ���̺�
-- ���� ������ �����(session)�� ������ ȯ������

-- �Ϲ������� 2022-09-27
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
-- ���� ������ ���� ����Ŭ ������ ������ ������� �۾� ȯ�� ����
-- �׷��� ������ �ϸ� ���� ���·� ���� (RR-MM-DD)

select hiredate from emp;

select *
from emp
where hiredate= '1980-12-17';
/*
��� �ý��� ��¥ �ʼ� ����
�Խ���(CRUD)
����
�۾���, ����, ����, ��ȸ��, �ۼ���¥
insert into board(writer, title, content, hit, regdate)
            values('ȫ�浿','ó���氡','������',0,sysdate)
regdate: �÷��� �����ʹ� ������ �ð�(DB����)

-- TIP)
ms-sql: select getdate()
Mysql : curdate(), curtime(), now(), sysdate()
*/

select *
from emp
where hiredate= '1980-12-17';

--����� �޿��� 2000�̻��̰� 4000������ ��� ����� ������ ����ϼ���
select *
from emp
where sal >= 2000 and sal <= 4000;
-- ������: �÷��� between A and B (=����)
select *
from emp
where sal between 2000 and 4000;

-- �μ���ȣ�� 10�� �Ǵ� 20�� �Ǵ� 30���� ����� ���, �̸�, �޿�, �μ���ȣ�� ����ϼ���
select *
from emp
where deptno=10 or deptno=20 or deptno=30;
-- ������ (IN ������)
select *
from emp
where deptno in (10,20,30); -- Ǯ��� deptno=10 or deptno=20 or deptno=30;

-- �μ���ȣ�� 10�� �Ǵ� 20���� �ƴ� ����� ���, �̸�, �޿�, �μ���ȣ�� ����ϼ���
select *
from emp
where deptno != 10 and deptno !=20; -- �ΰ��� ������ ��� ����
--IN ������ ���� >> NOT IN
select *
from emp
where deptno not in (10,20); --deptno != 10 and deptno !=20;


--POINT: null >> oracle ���� ����. >> �ʿ��

create table member(
 userid varchar2(20) not null, --null�� ������� �ʰڴ� (�ʼ��Է�)
 name varchar2(20) not null, -- �̸��� �ʼ��Է� �ްڴ�. (�ʼ��Է�)
 hobby varchar2(50) -- default null ��� : ������ �Է»���
);

select *
from member;
-- begin insert
insert into member(userid,hobby) values('hong','��');
--ORA-01400: cannot insert NULL into ("KOSA"."MEMBER"."NAME")
insert into member(userid,name) values('hong','ȫ�浿');
select * from member;
-- hobby >> null

--�����ϰ�
--DB���� ���� ����
--DML(������ ���۾�) : insert, update, delete
--����Ŭ �����ݿ��� ���ؼ� �����ڿ���: commit, rollback ����
--Ms-sql, Mysql default commit >> begin ��� DML �۾� ... commit
commit; -- ��� (insert, update, delete)

-- ����(comm) �� ���� �ʴ� ��� ����� ������ ����ϼ���
-- 0�� ������(�޴� ����)
select comm from emp;
-- comm �÷��� �����Ͱ� null�� �͸� ���

select * from emp where comm is null;
-- null �񱳴� (is null, is not null) �ϱ�...
select * from emp where comm is not null;


-- ������̺��� ���, �̸�, �޿�, ����, �ѱ޿��� ����ϼ���
-- �ѱ޿� ����(�޿� + ����)

select empno, ename, sal, comm, sal+comm as "�ѱ޿�"
from emp;
/*
null �̶� �༮...
1. null ���� ��� ������ ����� null..  ex) 100 + null = null
2. �� ������ �ذ��ϱ� ���ؼ� �Լ��� ������� >> nvl(), nvl2() >> �ϱ�!!
ex) nvl(�÷���, ��ü��) >> ġȯ
*/

select empno, ename, sal, comm, sal+nvl(comm,0) as "�ѱ޿�"
from emp;


select 1000+null from dual;

select 1000+nvl(null,0) from dual;

select comm, nvl(comm,1111111) from emp;

select nvl(null, 'hello world') from dual;


-- ����� �޿��� 1000�̻��̰� ������ ���� �ʴ� ����� ���, �̸�, ����, �޿�, ������ ����ϼ���.
select empno, ename, job, sal, comm
from emp
where sal >= 1000 and comm is null;



--DQL: select
--DDL: ���Ǿ� : create, alter, drop (Table ����, ����, ����)
--DML: ���۾� : insert, update, delete (�ݵ�� commit, rollback)

-- java: class Board {private int boardno}
-- DB  : create table Board(boardno number)

create table Board(
  boardid number not null, --���� ,�ʼ� �Է�
  title varchar2(50) not null, --������ (�ѱ� 25�� , ������ 50��) , �ʼ��Է�
  content varchar2(2000) not null , --�۳���(�ѱ� 1000��, ������ 2000��) �ʼ�
  hp varchar2(20) --default null ��� (���û���)
);

desc board;
select * from board;
insert into Board(boardid, title, content)
values(100,'����Ŭ','�Ǽ��߳�^^');

select * from board;
--������ �߸� �־���
rollback;

select * from board;
commit;


select boardid, title, content, nvl(hp,'empty') as HP
from board;

-- ���ڿ� �˻�
-- �ּҰ˻� : �˻��� : ���� -> ���� �ܾ �� �ִ� ��� �ּҰ� ���
-- LIke ���ϰ˻�

-- Like (���ڿ� ���� �˻� ������)

-- Like ������ (���ϵ� ī�� ���� : 1. %(����) , _(�ѹ���) ���� ������ ���� ��ġ...
-- �˻��� ������ >> java ����ǥ���� ����Ŭ ����

select *
from emp
where ename like '%A%';  -- ename �÷��� �յڻ������ A�� �ִ� ���ڸ� �̾ƶ�.

--�ּҰ˻�
-- select * from zip where dong like '%����%'
-- select * from member where name like '��%'

select *
from emp
where ename like '%A%A%';  -- ename �÷��� A�� �ΰ��ִ� row�� �̾ƶ�.



select ename
from emp
where ename like '_A%' -- ù���ڴ� ����� �͵� ������� �ι�° ���ڴ� A�� ����



--����  regexp_like ������ (���Խ�)
select * from emp where regexp_like(ename,'[A-C]');
--regexp_like ��� ����ǥ�� �˻� 5�� ����� (��� EMP)


-- ������ �����ϱ�
-- order by �÷��� : ����, ����, ��¥ ����
-- �������� : asc : ������ : default
-- �������� : dese : ������
-- ���(cost) ���� ��� �۾�

select *
from emp
order by sal; --default asc ��������

select *
from emp
order by sal desc; -- ��������

--�Ի����� ���� ���� ������ �����ؼ� ���, �̸�, �޿�, �Ի����� ����ϼ���
select empno,ename,sal,hiredate
from emp
order by hiredate desc;

-- 
select empno, ename
from emp
order by ename desc;

/*
����)
select ��        3
from ��          1
where ��         2
order by ��      4 (select ����� ����)
*/

select job, deptno
from emp
order by job asc, deptno desc;
-- order by �÷��� asc, �÷��� asc ...
-- �ַ� �Խ���... �亯�Խ���...

--������
--������(union) : ���̺�� ���̺��� �����͸� ��ġ�� �� (�ߺ��� ����)
--������(union all) : �ߺ��� ���

create table ut(name varchar2(20));

insert into ut(name) values('AAA');
insert into ut(name) values('BBB');
insert into ut(name) values('CCC');
commit;

select * from ut;
union all
select * from uta;
--ut ���� uta �������� �����

--union
--1. [����]�Ǵ� [�÷�]�� [Ÿ���� ����
select empno, ename from emp    --����, ���ڿ�
union
select job, deptno from dept;   --���ڿ�, ����

select empno, ename from emp
union
select deptno, dname from dept;

-- 2. �����Ǵ� �÷��� ������ ����
-- In line Interview
select m.empno
select empno, ename,job, sal from emp
union
select deptno, dname, loc, null from dept;
) m where empno


------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 220927 3������

--�Լ�
--����Ŭ �Լ� ����ϱ�
/*
���� �� �Լ��� ����
1) ������ �Լ� : ���ڸ� �Է� �ް� ���ڿ� ���� �� ��θ� RETURN �� �� �ִ�.
2) ������ �Լ� : ���ڸ� �Է� �ް� ���ڸ� RETURN �Ѵ�.
3) ��¥�� �Լ� : ��¥���� ���� �����ϰ� ���ڸ� RETURN �ϴ� MONTHS_BETWEEN �Լ��� �����ϰ� ��� ��¥ ���������� ���� RETURN �Ѵ�.
4) ��ȯ�� �Լ� : � ���������� ���� �ٸ� ������������ ��ȯ�Ѵ�.
5) �Ϲ����� �Լ� : NVL, DECODE
*/
--------------------------------------------------------------------------------
--���ڿ� �Լ�
select initcap('the super man') from dual; -- initcap �ܾ��� ù���ڸ� �빮�ڷ� ���ֱ� >> The Super Man

select lower('AAA') , upper('aaa') from dual; -- lower �빮�� -> �ҹ���  upper �ҹ��� -> �빮��

select ename, lower(ename) as "ename" from emp;
select * from emp where lower(ename) = 'king'; -- king�� �빮�ڰ� �ƴ� �ҹ��ڷ� ��� �˻��� ���� >> ����� ���

select length('abcd') from dual; -- length�� ���ڿ��� ���� ��� >> 4
select length('    ȫ �� ��  a ')  from dual; -- ���鵵 �����Դϴ�. >> 13

select concat('a','b') from dual; -- �ΰ��� ���ڿ��� ��ħ >> ab
select 'a' || 'b' || 'c' from dual; -- 3�� �̻���� ������ ���°� ���� >> abc
select ename || '        ' || job from emp; -- �����ڴ� �߰��� ������ �־��ټ��־� ������ ǥ���̰���
select concat(ename,job) from emp;

--java:     substring
--oracle:   substr

select substr('ABCDE',2,3) from dual; --  >> BCD
select substr('ABCDE',1,1) from dual; --  >> A
select substr('ABCDE',3,1) from dual; --  >> C

select substr('abcdkenslkenfslfeflkenklskleflknsef',3) from dual; -- >> cdkenslkenfslfeflkenklskleflknsef

select substr('ABCDE',-2,1) from dual; -- >> D
select substr('ABCDE',-2,2) from dual; -- >> DE

-- ������̺��� ename �÷��� �����Ϳ� ���� ù���ڴ� �ҹ��ڷ� ������ ���ڴ� �빮�ڷ� ����ϰ�
-- �ϳ��� �÷����� ����� ����Ͻð� �÷��� ��Ī�� fullname
-- ù���ڿ� ������ ���� ���̿��� �����ϳ��� ��������

select concat(substr(lower(ename),1,1),substr(upper(ename),2,4)) as fullname
from emp;
select substr(lower(ename),1,1) || ' ' ||substr(upper(ename),2) as fullname
from emp;



select lpad('ABC',10,'*') from dual; -- >> *******ABC
select rpad('ABC',10,'*') from dual; -- >> ABC*******


--������� ���: hong1007 or k1234
--ȭ��: �� �α��� >> ho******
--              >> k1***
select rpad(substr('hong1007',1,2),length('hong1007'),'*') from dual; -- >> ho******
select rpad(substr('k1234',1,2),length('k1234'),'*') from dual; -- >> k1***

--emp���̺��� ename �÷��� �����͸� ����ϵ� ù���ڸ� ����ϰ� �������� *�� ���
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

--��°��
-- 100 : 123456-*******
-- 200 : 234567-*******
-- ����Ī�� "juminnumber"

select id || ' : ' || rpad(substr(jumin,1,7),length(jumin),'*') as juminnumber
from member2;



-- rtrim �Լ�
-- ������ ���� ������
select rtrim('MILLER','ER') from dual;  -- ������ ���ڸ� ������ >> MILL
select ltrim('MILLLLLLLLLLLLLER','MIL') from dual; -- ���� ���ڸ� ������ >> ER

-- ��������
select '>' || rtrim('MILLER     ',' ') || '<' from dual; -- >> >MILLER<     -- ������ ���� ����
select '>' || ltrim('       MILLER',' ') || '<' from dual; -- >> >MILLER<   -- ���� ���� ����

-- ġȯ�Լ�
select ename, replace(ename,'A','�Ϳ�') from emp;

--------------------------------------------------------------------------------
--���� �Լ�
    --round (�ݿø� �Լ�)
    --trunc (���� �Լ�)
    --Mod() (�������� ���ϴ� �Լ�)
    
--  -3 -2 -1 0(����) 1 2 3
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
--������

select 12/10 from dual; -- >> 1.2
select mod(12,10) from dual; -- >> 2
select mod(0,0) from dual; -- >> 0

--------------------------------------------------------------------------------
--[��¥ �Լ�]

select sysdate from dual; -- >> 2022-09-27 16:01:08

-- POINT (��¥ ����)
-- 1. Date + Number >> Date
-- 2. Date - Number >> Date
-- 3. Date - Date >> Number (�ϼ�)

select sysdate + 100 from dual; -- >> 2023-01-05 16:05:50
select sysdate + 1000 from dual; -- >> 2025-06-23 16:05:56

select hiredate from emp;
select months_between(sysdate, '1997-02-19') from dual; -- >> 307����
select trunc(months_between('2022-09-27','2020-09-20'),0) from dual;  -- trunc�� ���� �Ҽ��� �Ʒ��� ����

select '2022-01-01' + 100 from dual;  -- '2022-01-01' [��¥����]�� ������ ����
--POINT ��ȯ�Լ� to_date()

select to_date('2022-01-01') + 100 from dual;

--��� ���̺��� ������� �Ի��Ͽ��� ���糯¥������ �ټӿ����� ���ϼ���
--����̸�, �Ի���, �ټӿ��� ���
--�� �ټӿ����� �����κи� ��� (�ݿø� ���� ������)

select ename,hiredate,trunc(months_between(sysdate,hiredate),0)
from emp;

-- 2. �Ѵ��� 31�� �̶�� ���ؿ��� �ټӿ����� ���ϼ���
select trunc((sysdate-hiredate)/31,0)
from emp;

--------------------------------------------------------------------------------
--�Լ�
--------------------------------------------------------------------------------
--[��ȯ�Լ�] Today's point
--Oracle ������ : ���ڿ�, ����, ��¥
--to_char() : ���� -> ���� (1000 -> $100,000) >> format ������� ����
--            ��¥ -> ���� ('2022-09-29' -> 2022��09��29��)

-- to_char()�������� == �׳� �̻ڰ� ����ҷ��� ����

--to_date: ���� -> ��¥
--select to_date('2022-01-01') + 100 from dual;

--to_number(): ���� -> ���� >> �ڵ�����ȯ
--select '100' + 100 from dual;
--select to_number('100') + 100 from dual;

--1.
select '1' + 1 from dual; -- '1' ���� -> ���� (����ȯ)
--��Ģ
select to_number('1') + 1 from dual;


--2.
select sysdate, to_char(sysdate,'YYYY') || '��' as "YYYY",
to_char(sysdate,'YEAR') as "YYYY",
to_char(sysdate,'MM') as "MM",
to_char(sysdate,'DD') as "DD",
to_char(sysdate,'DAY') as "DAY",
to_char(sysdate,'DY') as "DY"
from dual;

-- �Ի����� 12���� ����� ���, �̸�, �Ի���, �Ի�⵵, �Ի���� ����ϼ���
select empno, ename, hiredate, to_char(hiredate, 'YYYY') as YYYY, to_char(hiredate, 'MM') as MM
from emp
where to_char(hiredate, 'MM') = '12';
-- ����Ŭ.pdf 68page ǥ ����






-- to_char: ���� -> ���Ĺ��� ��ȯ
-- ����Ŭ.pdf 71page ǥ ����
-- 10000000 -> $10,000,000
select '>' || to_char(12345,'999999999999') || '<' from dual; -- >> >        12345<
select '>' || ltrim(to_char(12345,'999999999999')) || '<' from dual; -- >> >12345<

select '>' || to_char(12345,'$999,999,999,999') || '<' from dual; -- >> >          $12,345<

select sal , to_char(sal, '$999,999') from emp;
select sal from emp;

--------------------------------------------------------------------------------
--HR �������� ����
show user;
select * from employees;
select sysdate from dual;

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

/*
������̺�(employees)���� ����� �̸��� last_name , first_name ���ļ� fullname ��Ī 
�ο��ؼ� ����ϰ� �Ի�����  YYYY-MM-DD �������� ����ϰ� ����(�޿� *12)�� ���ϰ� 
������ 10%(���� * 1.1)�λ��� ����
����ϰ� �� ����� 1000���� �޸� ó���ؼ� ����ϼ���
�� 2005�� ���� �Ի��ڵ鸸 ����ϼ��� �׸��� ������ ���� ������  ����ϼ���
*/
select last_name || first_name as fullname,
to_char(hire_date, 'YYYY-MM-DD') as hire_date,
salary,
salary*12 as ����,
to_char(((salary*12)*1.1), '999,999,999,999') as �λ��

from employees
where to_char(hire_date,'YYYY') >= 2005
order by ���� desc;
--order by���� select ������ ���� > select �� ��� �÷����� ��밡�� (����Ī)


--�����Լ�, �����Լ�, ��¥�Լ�
--��ȯ�Լ� (to_char())


--���Ϲ���(
--�Ϲ��Լ�(nvl, nvl2 ...)
--�����Լ�(avg(), sum(), min(), max())


show user;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
select sysdate from dual;

desc board;

---------------------------------------------------------------------------------------------------------------------------------------
-- 220928 ��ħ���� ���� 
--create table ���̺�� (�÷��� Ÿ��, �÷��� Ÿ��)
create table member3(age number);
--1�� �Ǵ� 100��
insert into member3(age) values(100);
insert into member3(age) values(200);
insert into member3(age) values(300);
insert into member3(age) values(400);
/*
���� �ڹٿ��ٸ�
class member3 (private int age;}
--1��
member3 m = new member3();
m.setAge(100);

100�� ������ �־�� (new�� 100�� ������)
List<member3> mlist = new ArrayList<member3>();
mlist.add(new member(100));

������ Ÿ��
���ڿ� Ÿ��
char(10)        >> 10byte >> (�ѱ�5��), (����,Ư��,���� 10��) >> �������� ���ڿ�
varchar2(10)    >> 10byte >> (�ѱ�5��), (����,Ư��,���� 10��) >> �������� ���ڿ�
Char�� �������� ���ڿ�
varchar�� �������� ���ڿ�
>>
char(10)    >> 'abc' >> 3byte >> [a][b][c][][][][][][][] >> ������ ��ȭ�� ����
varchar(10) >> 'abc' >> 3byte >> [a][b][c].. >> ������ ũ�⸸ŭ�� ���� Ȯ�� (����� ������)

if ����� �̸�
create table member (name char(30))
create table member (name varchar(30)) (0)

if ���� (�� �Ǵ� ��)
create table member (name char(3))      (0)
create table member (name varchar(3)) 

���)
�������� ���ڿ� ((��,��),(��,��,��),(�ֹι�ȣ)) >> char()   -> Ʃ�׼����� �� ����
�������� ���ڿ� (����� �̸�, ���, �ּ�) >> varchar2()


char(), varchar2() ���: �ѱ۰� ���� ȥ��
varchar2(10)

unicode (2byte): �ѱ�, ������, Ư������, ���� >> 2byte
nchar == unicode character

nchar(20)       >> 20�� >> 2*20 >> 40byte
nvarchar2(20)   >> 20��
*/
select * from SYS.NLS_DATABASE_PARAMETERS;
--NLS_CHARACTERSET  : 	AL32UTF8  �ѱ� 3byte �ν�
--KO16KSC5601 2Byte (���� ��ȯ�ϸ� �ѱ� �ٱ���)
select * from nls_database_parameters where parameter like '%CHAR%';
------------------------------------------------------------------------------
create table test2(name varchar2(2));

insert into test2(name) values('a');
insert into test2(name) values('aa');
insert into test2(name) values('��'); --�ѱ� 1�� 3byte ���� �׷��� �߰� x
-------------------------------------------------------------------------------
select * from test2;





-------------------------------------------------------------------------------
-- �Ϲ��Լ�(���α׷� ������ ���� �Լ�)
-- nvl(), nvl2() >> null ó���ϴ� �Լ�
-- decode() >> java if��
-- case()   << java switch��
--
-- ����Ŭ SQL (����, ��� ������ ����)
-- ����Ŭ PL-SQL(����, ���) ��ޱ��

select comm, nvl(comm, 0) from emp;

create table t_emp(
    id number(6), -- ���� 6�ڸ�
    job nvarchar2(20)
);    

select * from t_emp;

insert into t_emp(id,job) values(100,'IT');
insert into t_emp(id,job) values(200,'SALES');
insert into t_emp(id,job) values(300,'MGR');
insert into t_emp(id) values(400);
insert into t_emp(id,job) values(500,'MGR');
commit;

--decode ����غ���
select id, decode(id,100,'����Ƽ',200,'������',300,'������','��Ÿ�μ�') as �μ��̸�
from t_emp;

select id, decode(id,100,'����Ƽ',
                     200,'������',
                     300,'������',
                     '��Ÿ�μ�') as �μ��̸�
from t_emp;


--�� �ٸ� ����
select empno, ename, deptno, decode(deptno, 10, '�λ��',
                                            20, '������',
                                            30, 'ȸ���',
                                            40, '�μ�',
                                            'ETC') as �μ��̸�
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
����
t_emp2 ���̺��� id, jumin �����͸� ����ϵ� jumin �÷��� ���ڸ��� 1�̸�
'����' ��� 2�̸� '����' 3�̸� '�߼�' �׿ܴ�  '��Ÿ' ��� ����ϼ���
�÷����� '����'
*/

select id, decode(substr(jumin,1,1), 1,'����',
                                     2,'����',
                                     3,'�߼�',
                                     '��Ÿ') as ����
from t_emp2;

/*
����

*/

select empno, deptno, decode(deptno, 20, decode(ename, 'SMITH', 'HELLO',
                                        'WORLD'),'ETC')
from emp;

select * from emp;

--CASE��
/*
CASE ���ǽ� WHEN ���1 THEN ���1
           WHEN ���2 THEN ���2
           WHEN ���3 THEN ���3
           ELSE ���4
END "�÷���"
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

select '0' || to_char(zipcode) , case zipcode when 2    then '����'
                                              when 31   then '���'
                                              when 41   then '����'
                                              else  '��Ÿ����'
                                 end "�����̸�"
from t_zip;                               

/*
������̺��� ����޿��� 1000�޷� ���ϸ� 4��
1001�޷� 2000�޷� ���ϸ� 3��
2001�޷� 3000�޷� ���ϸ� 2��
3001�޷� 4000�޷� ���ϸ� 1��
4001�޷� �̻��̸� 'Ư��' �̶�� �����͸� ����ϼ���

-- 1. case �÷��� when ��� the ���
-- 2. �񱳽��� �ʿ��ϴٸ�
        case when ���� �񱳽� then
             when ...
             when ...
*/
select case when sal <= 1000 then '4��'
            when sal between 1001 and 2000 then '3��'
            when sal between 2001 and 3000 then '2��'
            when sal between 3001 and 4000 then '1��'
            else 'Ư��'
       end "�޼�" , empno, ename
from emp;


--------------------------------------------------------------------------------

--�����Լ�(�׷�) �Լ�
--����Ŭ.pdf (p68)
/*
1. count(*) >> row��, count(�÷���) >> ������ �Ǽ� > (null�� �������� �ʾƿ�)
2. sum()
3. ave()
4. mac()
5. min()
--��Ÿ

1. �����Լ��� group by ���� ���� ���
2. ��� ���� �Լ��� null���� �����Ѵ�.
3. select ���� �����Լ� �̿ܿ� �ٸ� �÷��� ���� �ݵ�� �� �÷��� group by ���� ���
*/

select count(*) from emp; -- 14���� row  >> 14

select count(empno) from emp; -- >> 14

select count(comm) from emp; -- null���� �����ϰ� ī��Ʈ�� >> 6
select count(nvl(comm,0)) from emp; --point >> 14

--�޿��� ��
select sum(sal) as �޿����� from emp; -- >> 29025

select round(avg(sal),0) as �޿������ from emp; --round�� ���������� ������ ǥ�� >> 2073

-- ����� �츮ȸ�� �� ������ �󸶳� ���� �Ǿ���
select sum(comm) from emp;

select trunc(avg(comm)) from emp; -- 721�޷�
select trunc(avg(nvl(comm,0))) from emp; -- 309�޷�

--------------
--���⼭���� �ۼ�

select max(sal) from emp;
select min(sal) from emp;
select empno, count(empno) from emp; --ORA-00937: not a single-group group function
-- 14��          1��

select sum(sal), avg(sal), max(sal), min(sal), count(sal) from emp;

--�μ��� ��� �޿��� ���ϼ���
select deptno, avg(sal)     --3
from emp                    --1
group by deptno;            --2


--������ ��� �޿��� ���ϼ���
select job, trunc(avg(sal))
from emp
group by job;

-- ������, ��ձ޿�, �޿���, �ִ�޿�, �ּұ޿�, �Ǽ��� ����ϼ���
select job, avg(sal), sum(sal), max(sal), min(sal), count(sal)
from emp
group by job;

/* �׷�
distinct �÷���1, �÷���2
order by �÷���1, �÷���2
group by �÷���1, �÷���2
*/


--�μ���, ������, �޿��� ���� ���ϼ���
select deptno, job, sum(sal)
from emp
group by deptno, job;


/*
����

select ��    4
from ��      1
where ��     2
group by ��  3
order by ��  5
*/


--
-- [����]
-- ������ ��ձ޿��� 3000�޷� �̻��� ����� ������ ��ձ޿��� ����ϼ���

select job, avg(sal) as avgsal
from emp
--where ���� -- ����� ����� ������ ���ؿ�
group by job
having  avg(sal) >=3000;-- group by ������
-- having �������� select ����Ī�� ���Ұ�. (������� ������)

--1. from     ������ where
--2. group by ������ having

/*
select      5
from        1
where       2
group by    3
having      4
order by    6
*/

/*
[���� 1]
������̺��� ������ �޿����� ����ϵ� ������ ���� �ް� �޿��� ���� 5000 �̻���
������� ����� ����ϼ���
�޿��� ���� ���� ������ ����ϼ���
*/
--[���� 1]
select job, sum(sal) as samsal
from emp
where comm is not null
group by job
having sum(sal) >= 5000
order by samsal asc;
--

/*
[���� 2]
������̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ����ϼ���
*/
select deptno , count(*) as "�μ����ο�" , sum(sal) as "�μ��� �޿��� ��"
from emp
group by deptno
having count(*) > 4;



select count(*) from emp where job is null; -- null�� �ִ��� Ȯ���غ���

/*
[���� 3]
������̺��� ������ �޿��� ���� 5000�� �ʰ��ϴ� ������ �޿��� ���� ����ϼ���
��, �Ǹ�����(salesman)�� �����ϰ� �޿������� �������� �����ϼ���
*/
select job, sum(sal) as "sumsal"
from emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000
order by sum(sal) desc;



-- �⺻������
-- ���� ���̺� �����͸� �������� ���� END----
------------------------------------------------------------------------------------------------------------------------ 
-- �������� ���̺��� ���ϴ� �����͸� �����ϴ� ���
-- JOIN(����)

--Cartesian Product ��� ������ ����� Join
--Equijoin Join ������ ��Ȯ�� ��ġ�ϴ� ��� ���(�Ϲ������� PK �� FK ���)
--Non-Equijoin Join ������ ��Ȯ�� ��ġ���� �ʴ� ��쿡 ���(���,����)
--Outer Join Join ������ ��Ȯ�� ��ġ���� �ʴ� ��쿡�� ��� ����� ���
--Self Join �ϳ��� ���̺��� ����� Join �ϰ��� �� ��쿡 ���
--Set Operators ���� ���� SELECT ������ �����Ͽ� �ۼ��Ѵ�

-- RDBMS (������)
/*
���� (���̺�� ���̺���� ����)
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
1. �����(equl join)
�����̺�� �����Ǵ� ���̺� �ִ� �÷��� �����͸� 1:1 ����
    1.1 ����
    - SQL JOIN ����(����Ŭ ����) > ����
    - ANSI ���� - ���� > ������ > [inner] join on ������
*/
-- sql ����
select *
from m, s
where m.m1 = s.s1; -- ������� �ƴϴ�

--ANSI ����
select *
from m inner join s
on m.m1 = s.s1;

select *
from m join s -- inner�� ���� ������ �Ȱ���
on m.m1 = s.s1; -- join�� ������

-- [����] �����ȣ, ����̸�, �μ���ȣ, �μ��̸��� ����ϼ���
select e.empno, e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;


select m.m1,m.m2
from m join x
on m.m1 = x.x1;

--join
--���̺� 2��, 3��, 4��
--SQL JOIN

select m.m1, m.m2, s.s2, x.x2
from m,s,x
where m.m1 = s.s1 and s.s1 = x.x1;

--ANSI ����
select *
from m join s on m.m1 = s.s1 
       join x on s.s1 = x.x1; --���� ���� ���̺� �ۼ�
       
       
-- HR�������� �̵�
show user; -- USER��(��) "HR"�Դϴ�.
select * from employees;
select * from departments;
select * from locations;

-- [����1] ���, �̸�(last_name), �μ���ȣ, �μ��̸��� ����ϼ���

select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;
-- ������
-- ����� 107�� (������ ����)
select * from employees where department_id is null;
-- ����� null ó�� �Ұ� >> �ٸ� ���� >> ��� �Ŀ�



-- [����2] ���, �̸�(last_name), �μ���ȣ, �μ��̸�, �����ڵ�, ���ø��� ����Ͻÿ�
select e.employee_id, e.last_name, e.department_id, d.department_name, d.location_id, l.city
from employees e join departments d on e.department_id = d.department_id
                 join locations l on d.location_id = l.location_id;


-------------------------------------------------------------------------------------
show user; -- USER��(��) "KOSA"�Դϴ�.
--������

--2. �� ���� (non-equl join) => 1:1 �� ���� �÷��� ���� 
--�ǹ̸� ���� >> ������� ������ �״�� ���
-- 1:1���� on emp.deptno = dept.deptno

select * from emp;
select * from salgrade;

select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal;

-------------------------------------------------------------------------------------
--3. �ܺ����� (outer join) (equl join ���� �����ϰ� ���� + �����ִ� ������ �������� �˴ϴ�.)
-- outer join (�������� �ľ�)
-- ������ �Ǵ� ���̺��� ���� �����͸� ���� �� �� �ִ�  -- ���� Null�� ��¶����� ������
-- ����
-- 3.1 left outer join (������ ����)
-- 3.2 right outer join (������ ����)
-- 3.3 full outer join (left, right >> union)

select *
from m left join s  -- outer �����ص� ��
on m.m1  = s.s1;

select *
from m right join s  -- outer �����ص� ��
on m.m1  = s.s1;

select *
from m full join s
on m.m1 = s.s1;


-- [����1] ���, �̸�(last_name), �μ���ȣ, �μ��̸��� ����ϼ���
select e.employee_id,
        e.last_name,
        e.department_id,
        d.department_name
from employees e left join departments d 
on e.department_id = d.department_id;
-- ������ null���� ���� ȸ������ ��� �Ϸ�


--------------------------------------------------------------------------------
select * from emp;

-- 3. self join (�ڱ�����) -> ����(x) �ǹ̸� ���� >> �����(����)
-- �ϳ��� ���̺� �ִ� �÷��� �ڽ��� ���̺� �ִ� �ٸ� �÷��� �����ϴ� ���
-- Emp >> Mgr (������)
select e.empno, e.ename, m.empno, m.ename
from emp e join emp m  -- ����Ī�� �ٸ��� �ϸ� ��
on e.mgr = m.empno; -- 13��

select *
from emp e left join emp m  -- ����Ī�� �ٸ��� �ϸ� ��
on e.mgr = m.empno; -- 14��





--------------------------------------------------------------------------------
-- ���Ӱ��� (kosa)
-- ����Ǭ��
-- 1. ������� �̸�, �μ���ȣ, �μ��̸��� ����϶�.
select e.ename, e.deptno, d.dname
from emp e left join dept d
on e.deptno = d.deptno;

?
-- 2. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸���
-- ����϶�.
select e.ename, e.job, d.deptno ,d.dname
from emp e left join dept d
on e.deptno = d.deptno
where loc = 'DALLAS';

?

-- 3. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����϶�.
select *
from emp e left join dept d
on e.deptno = d.deptno
where ename like '%A%';



-- 4. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������
--����ϴµ� ������ 3000�̻��� ����� ����϶�.
select e.ename, d.dname, e.sal
from emp e left join dept d
on e.deptno = d.deptno
where e.sal >= 3000;

-- 5. ����(����)�� 'SALESMAN'�� ������� ������ �� ����̸�, �׸���
-- �� ����� ���� �μ� �̸��� ����϶�.
select e.job, e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';
?
-- 6. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,
-- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',
-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����϶�.
--(�� ) 1 : 1 ���� ��� �÷��� ����
select e.empno as �����ȣ, e.ename as ����̸�, e.sal*12 as ����, e.sal*12+comm as �Ǳ޿�, s.grade as �޿����
from emp e join salgrade s
on e.sal between s.losal and s.hisal
where comm is not null;
?

-- 7. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�, 
-- ����, �޿������ ����϶�.
select e.deptno, d.dname, e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal
join dept d
on e.deptno = d.deptno
where e.deptno = 10;

-- 8. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�,
-- ����̸�, ����, �޿������ ����϶�. �׸��� �� ��µ�
-- ������� �μ���ȣ�� ���� ������, ������ ���� ������ �����϶�.
select e.deptno, d.dname, e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal
join dept d
on e.deptno = d.deptno
where e.deptno in (10,20);


-- 9. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� ��������
-- �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',
-- '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����϶�.
--SELF JOIN (�ڱ� �ڽ����̺��� �÷��� ���� �ϴ� ���)


--------------------------------------------------------------------------------
-- ����� �ۼ��Ѱ�
-- 1. ������� �̸�, �μ���ȣ, �μ��̸��� ����϶�.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO;
 
-- 2. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸���
-- ����϶�.
SELECT E.ENAME, E.JOB, D.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE  D.LOC='DALLAS';
 
-- 3. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����϶�.
SELECT E.ENAME, D.DNAME
FROM EMP E  join DEPT D  on D.DEPTNO=E.DEPTNO
WHERE  E.ENAME LIKE '%A%';
--WHERE Regexp_like(E.ENAME,'^A'); 
-- 4. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������
--����ϴµ� ������ 3000�̻��� ����� ����϶�.
SELECT E.ENAME, D.DNAME, E.SAL 
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.SAL>=3000;
 
-- 5. ����(����)�� 'SALESMAN'�� ������� ������ �� ����̸�, �׸���
-- �� ����� ���� �μ� �̸��� ����϶�.
SELECT E.JOB, E.ENAME, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.JOB='SALESMAN';
 
-- 6. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,
-- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',
-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����϶�.
--(�� ) 1 : 1 ���� ��� �÷��� ����
SELECT         E.EMPNO AS "�����ȣ",
               E.ENAME AS "����̸�",
               E.SAL*12 AS "����",
           --E.SAL*12+NVL(COMM,0) AS "�Ǳ޿�",
               E.SAL*12+COMM AS "�Ǳ޿�",
               S.GRADE AS "�޿����"
FROM EMP E  join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.Comm is not null;
 
-- 7. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�,
-- ����, �޿������ ����϶�.
-- inner �� ���� ����
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
            join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO=10;
 
SELECT * FROM SALGRADE;
 
 
-- 8. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�,
-- ����̸�, ����, �޿������ ����϶�. �׸��� �� ��µ�
-- ������� �μ���ȣ�� ���� ������, ������ ���� ������
-- �����϶�.
-- inner �� ���� ����
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E  join DEPT D        on E.DEPTNO=D.DEPTNO
            join SALGRADE S    on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO IN (10,20) -- WHERE  E.DEPTNO<=20  -- e.deptno = 10 or 
ORDER BY E.DEPTNO ASC,  E.SAL DESC;
 
 
-- 9. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� ��������
-- �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',
-- '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����϶�.
--SELF JOIN (�ڱ� �ڽ����̺��� �÷��� ���� �ϴ� ���)
 
SELECT E.EMPNO, E.ENAME , M.EMPNO, M.ENAME
FROM EMP E  left outer join EMP M
on e.MGR = m.EMPNO;
--------------------------------------------------------------------------------
--��Ÿ
--NATURAL JOIN
--Equijoin�� �����ϴٰ� ���ø� �˴ϴ�.
-- [�� ���̺�]�� [������ �̸�]�� ������ Į���� [��� ����]�� �˴ϴ�.
SELECT empno, ename, deptno , dname FROM emp NATURAL JOIN dept ;

--JOIN ~ USING 
--NATURAL JOIN�� ������ ������ �̸��� ������ Į���� ��� ������ �Ǿ��µ� 
--USING ���� ����ϸ� �÷��� �����ؼ� ������ �� ���� �ֽ��ϴ�.
SELECT e.empno, e.ename, deptno , dname FROM emp e JOIN dept d USING(deptno);

--���� ������ ���� ���ΰ��
select * from emp , dept;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 220929 ��ħ

-- �ذ� (�ʱް����� �ݵ��
--------------------------------------------------------------------------------
/*
subquery
����Ŭ.pdf(7�� 100page)

sql�� .... sql ���� �ذ��

1. �Լ� > �������̺�, ���� ���̺� (join, union) >> subquery
*/
-- [����] ������̺��� ������� ��� ���޺��� �� ���� ������ �޴� ����� ���, �̸�, �޿��� ����ϼ���
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp);
-- 2���� ������ �ϳ��� ����

-- subquery
/*
1. single row subquery: �������� ���� row ���� column�� ��츦 (�� �Ѱ��� ��ȯ)
ex) select avg(sal) from emp
������: ( =  !=  <  > )

2. multi row subquery: �������� ���� column row �������� ���
ex) select sal from emp
������: IN, NOT IN, ANY, ALL
ALL : sal > 1000 and sal > 4000 and ...
ANY : sal > 1000 or  sal > 4000 or

����)
1. ��ȣ�ȿ� �־�� �Ѵ� >> (select max(sal) from emp)
2. ���� �÷����� ���� >> selecet max(sal), sum(sal) from emp (�̷��� x)
3. �ܵ����� ���� ����

�������
1. subquery ���� ����
2. ����� ������ ���� query ����
--TIP)
select ...(subquery) >> �Ѱ��� �ุ ��ȯ�� ��� (Scala subquery)
from (subquery)      >> inline view(�������̺�) ... ^^
where (subquery)     >> ����
*/


-- ��Ƽ�� 'in' �̱��� '������'


-- ������̺��� jones �� �޿����� �� ���� �޿��� �޴� ��� ���, �̸�, �޿��� ����ϼ���

select sal
from emp
where ename = 'JONES';  -- >> 2975

select empno, ename, sal
from emp
where sal > (select sal from emp where ename = 'JONES'); -- ����

select *
from emp
where sal IN (select sal from emp where deptno = 30); -- ��Ƽ
-- sal=1600 or sal=1250 or sal=1250 or sal=2580 or sal=1500 and sal=950

select *
from emp
where sal NOT IN (select sal from emp where deptno = 30);
-- sal!=1600 or sal!=1250 or sal!=1250 or sal!=2580 or sal!=1500 and sal!=950

--------------------------------------------------------------------------------
-- ���������� �ִ� ����� ����� �̸��� ����ϼ���
-- �� ����� mgr �÷��� ������
select mgr from emp;
select *
from emp
where empno in (select mgr from emp);
-- where empno=7902 or empno=7788 or empno=null (or ���� null ����x)

-- ���������� �ִ� ����� ����� �̸��� ����ϼ���
select mgr from emp;
select *
from emp
where empno not in (select mgr from emp);
-- where empno!=7902 and empno!=7788 and empno!=null (and ���� null ����o)

-- ���������� �ִ� ����� ����� �̸��� ����ϼ���
select mgr from emp;
select *
from emp
where empno not in (select nvl(mgr,0) from emp);
--------------------------------------------------------------------------------

-- [����] king ���� �����ϴ� �� ���ӻ���� king�� ����� ���, �̸�, ����, �����ڻ���� ����ϼ���
select empno, ename, job, mgr
from emp
where mgr = (select empno from emp where ename='KING');

-- [����] 20�� �μ��� ����߿��� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� �����
--     ���, �̸�, �޿�, �μ���ȣ�� ����ϼ���
select max(sal)
from emp
where deptno = 20;

select empno, ename, sal, deptno
from emp
where sal > (select max(sal) from emp where deptno = 20);

--�ڱ� �μ��� ��� ���޺��� �� ���� ������ �޴� ����� ���, �̸�, �μ���ȣ,
--�μ��� ��� ������ ����ϼ���

select e.empno, e.ename, e.deptno, e.sal, s.avgsal
from emp e join (select deptno, round(avg(sal),0) as avgsal from emp group by deptno) s
on e.deptno = s.deptno
where e.sal > s.avgsal;

select deptno, round(avg(sal),0) as avgsal
from emp
group by deptno;


--1. 'SMITH'���� ������ ���� �޴� ������� �̸��� ������ ����϶�.
select sal
from emp
where ename='SMITH';

select ename, sal
from emp
where sal > (select sal from emp where ename='SMITH');

--2. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����,
-- �μ���ȣ�� ����϶�.

select sal from emp where deptno = 10;

select ename, sal, deptno
from emp
where sal in (select sal from emp where deptno = 10);

?
--3. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ�
-- 'BLAKE'�� ���� ����϶�. ///?
select deptno from emp where ename='BLAKE';

select ename, hiredate
from emp
where deptno = (select deptno from emp where ename='BLAKE')
and ename != 'BLAKE';

--4. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������
-- ����ϵ�, ������ ���� ��� ������ ����϶�.
select avg(sal) from emp;

select empno, ename, sal
from emp
where sal > (select avg(sal) from emp)
order by sal desc;
?

--5. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ�
-- �ִ� ����� �����ȣ�� �̸��� ����϶�.

select ename from emp where ename like '%T%';

select empno, ename
from emp
where ename in (select ename from emp where ename like '%T%');


--6. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� �������
-- ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����϶�.
--(��, ALL(and) �Ǵ� ANY(or) �����ڸ� ����� ��)

select max(sal) from emp where deptno = 30;

select ename, deptno, sal
from emp
where sal > (select max(sal) from emp where deptno = 30);
?

--7. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� �����
-- �̸�, �μ���ȣ, ������ ����϶�. ///?
select * from emp;
select * from dept;

select e.ename, e.deptno, job
from emp e join dept d
on e.deptno = d.deptno
where loc = 'DALLAS';



--8. SALES �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ����϶�.

select e.deptno, e.ename, e.job
from emp e join dept d
on e.deptno = d.deptno
where d.dname = 'SALES'; 

--9. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�
--king �� ����� ��� (mgr �����Ͱ� king ���)

select * from emp where mgr = 7839;

select ename, sal
from emp
where mgr in (select mgr from emp where mgr = 7839);


--10. �ڽ��� �޿��� ��� �޿����� ����, �̸��� 'S'�� ����
-- ����� ������ �μ����� �ٹ��ϴ� ��� ����� �����ȣ, �̸�,
-- �޿��� ����϶�.

select avg(sal)
from emp;

select *
from emp
where ename like '%S%';

--11. Ŀ�̼��� �޴� ����� �μ���ȣ, ������ ���� �����

-- �̸�, ����, �μ���ȣ�� ����϶�.


--12. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ����

-- ������� �̸�, ����, Ŀ�̼��� ����϶�.



----------------------------------------------------------------------------
--������ ���۾�(�ϱ�) >> DML
-- ����Ŭ.pdf(168page)
-- insert, update, delete (�ݵ�� �ϱ�)


/*
����Ŭ ����
DDL(������ ���Ǿ�) : [create, alter, drop, truncate], rename, modify
DML(������ ���۾�) : insert, update, delete
DQL(������ ���Ǿ�) : select (�Լ�, ����, ��������)
DCL(������ �����) : grant, revoke (������)
TCL(Ʈ�����)      : commit, rollback, savepoint
*/

--DML (insert, update, delete) �۾�

--transaction: �ϳ��� ������ �۾� ����

--A���¿��� ��� B���� �Ա�(����) >> �ϳ��� ������ ���� ��� ó��
--�Ѵ� ���� or �Ѵ� ����
--ó���ϴ� ���(commit, rollback)

desc emp; --�÷���, null, type

select * from tab; --���� ���� ������ ������ �ִ� ���̺� ���

--create table �̸�
select * from tab where tname = 'BOARD';
select * from tab where tname = 'BOARD2';

select * from col where tname = 'EMP';

--------------------------------------------------------------------------------
-- 1. insert

create table temp(
    id number primary key, --null(x), �ߺ������� ��� �ʰڴ�
    name nvarchar2(20)
);

desc temp;
select * from tab where tname='TEMP';
select * from col where tname='TEMP';


-- 1. ���� �Ϲ����� insert
insert into temp(id,name)
values(100, 'ȫ�浿');

select * from temp;

--commit;



-- 2. �÷� ��� ���� (�����ϸ� ���x)
insert into temp
values(200,'������');

select * from temp;

rollback;

-- 3. ���� (insert)
insert into temp(name)
values('�ƹ���');      --id pk ���� (null x)

insert into temp(id, name)
values(100,'������');  -- pk�� '100' ������ �ȴ�


--------------------------------------------------------------------------------
--TIP)
--�Ϲ����� SQL�� ���α׷����� ��� x
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
    memberid number(3) not null, --3�ڸ� ����
    name varchar2(10), -- null���
    regdate date default sysdate -- �ʱⰪ ����(�⺻��) (�ý��� ��¥�� �⺻�� ���)
);

select * from col where tname = 'TEMP3';

select sysdate from dual;
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

insert into temp3(memberid, name, regdate)
values(100,'ȫ�浿','2022-09-29');

select * from temp3;
commit;

insert into temp3(memberid, name)
values(200,'������');

select * from temp3;
commit;

insert into temp3(memberid)
values(300);

select * from temp3;
commit;

insert into temp3(name)
values('����');
rollback;

--------------------------------------------------------------------------------
--Tip)
--1. �뷮 ������ �����ϱ�
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
--�䱸���� temp4�� �ִ� ��� �����͸� temp5�� �ְ�;��
-- ���� 2��
-- insert into ���̺��(�÷�����Ʈ) values
-- insert into ���̺��(�÷�����Ʈ) select ��

insert into temp5(num)
select id from temp4; --�뷮������ ����...

select * from temp5;

-- 2. �뷮 insert
-- ���� ���̺��� ���� ��� >> ���̺� ����(����: ��Ű��) + ������ ����)
-- �� ���������� ���� x (PK, FK)
-- ������ ������ ���� ���� + ������ ����

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

--����
--Ʋ(����)�� �����ϰ� �����ʹ� �����ϰ� ���� �ʾƿ�
create table copyemp3
as
    select * from emp where 1=2;
    
select * from copyemp3;
--------------------------- INSERT END------------------------------------------

--update
/*
update ���̺��
set �÷��� = ��, �÷���2 = ��2.....
where ������

update ���̺��
set �÷� = (subquery)
where �÷��� = (subquery)
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
������(SQL) >> 
1. CRUD����(create>insert, read>select, update, delete)
2. APP(JAVA) -  JDBC API   - ORACLE
3. insert, update, delete, select (70%)

�ϳ��� ���̺� ���ؼ� �۾�
JAVA���� EMP���̺� ���ؼ� CRUD�۾�
App(JAVA) ���忡��
1. ��ü��ȸ(�Լ�) >> publicList<EMP> getEmpList() { select * from emp }
2. ������ȸ(�Լ�) >> public Emp getEmpListByEMpno(int empno) {select * from emp where empno = 7788}
3. ����(�Լ�) >> public int insertEmp(Emp emp) { insert into emp(...) values(...)}
4. ����(�Լ�) >> 
5. ����(�Լ�)
���� >> JAVA�ڵ� >> DAO
-----------------------------------[DML END]-------------------------------------------------
*/

-- DDL(create, alter, drop, rename) ���̺��� ����

select * from board;
drop table board;

create table board(
    boardid number,
    title nvarchar2(50),
    content nvarchar2(2000),
    regdate date
); 

desc board;


--TIP) �������� Ȯ���ϱ�
select * from user_tables where lower(table_name) = 'board';
select * from col where lower(tname) = 'board'; -- ������
-- ��������

select * from user_constraints where lower(table_name) = 'board';


--Oracle 11g >> �����÷�(�����÷�)
-- �л� ���� ���̺�: ����, ����, ����

create table vtable(
    no1 number,
    no2 number,
    no3 number GENERATED ALWAYS as (no1 + no2) VIRTUAL
);    
select * from col where lower(tname) = 'vtable';
insert into vtable(no1, no2) values(100,50);

select * from vtable;

--insert into vtable(no1, no2, no3) values(10,20,30); (x)
--�ǹ����� Ȱ��Ǵ� �ڵ� 
--��ǰ���� (�԰�) : �б⺰ ������ ����(4�б�)
--�԰��� (2022-09-10)
create table vtable2(
  no number , --����
  p_code char(4) , --��ǰ�ڵ�(A001 , B002)
  p_date char(8), --�԰���(20220922)
  p_qty  number, --����
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
--DDL ���̺� ����� ����, ����
--1. ���̺� �����ϱ�
create table temp6(id number);
desc temp6;

--2. ���̺� ���� �Ŀ� �÷� �߰��ϱ�
alter table temp6
add ename varchar2(20);

desc temp6;

--3. ���� ���̺� �ִ� �÷��̸� �߸� ǥ��(ename -> username)
--���� ���̺� �ִ� ���� �÷��� �̸� �ٲٱ�(rename)
alter table temp6
rename column ename to username;

desc temp6;

--���� ���̺� �ִ� ���� �÷��� Ÿ�� ũ�� ���� (���) = modify
alter table temp6
modify(username varchar2(2000));

desc temp6;

--5. ���� ���̺� �ִ� ���� �÷� ����
alter table temp6
drop column username;

desc temp6;
-- �� ��� �۾����� ���� ����ؼ� ���콺�� �۾� ����

--6. ���̺� ��ü�� �ʿ� �����
--6.1 delete: �����͸� ����
-- ���̺� ó�� ����� ó�� ũ�� >> ������ ������ >> ũ�⸸ŭ ���̺� ũ�� ����
-- ex) ó�� 1M >> ������ 10���� >> 100M >> delete 10���� >> ���̺� ũ�� 100M 

--���̺�(������) ����(������ ũ�⵵ �Բ�)
--truncate (���� where�� ��� �Ұ�)
-- ex) ó�� 1M >> ������ 10���� >> 100M >> delete 10���� >> ���̺� ũ�� 1M 
-- truncate table emp

--���̺� ����
drop table temp6;

--------------------------------------------------------------------------------
-- ���̺� ���� �����ϱ�
-- ����Ŭ.pdf (144page)
-- ������ ���Ἲ Ȯ��
-- insert, update ����

PRIMARY KEY(PK) �����ϰ� ���̺��� ������ �ĺ�(NOT NULL �� UNIQUE ������ ����)
-- where empno=7788 >> ������ 1�� ���� >> ���� >> ��ȸ >> index �ڵ� ����

--������ ����� ��� (create table �ȿ��� ����)
--���̺��� ������ ���� �߰� (alter table add constraint ....) ���� ��� >> ��..

--TIP)
--���� ���� Ȯ��
select * from user_constraints where table_name='EMP';

create table temp7(
    --id number primary key --�������� �ʾƿ� (�����̸� �ڵ����� > SYS_C006997
                          --���� ������ ������ ã�� ������� (�������� �����)
    id number constraint pk_temp7_id primary key, --������ ǥ��
    name varchar2(20) not null, -- constraint ǥ�� ���� ������
    addr varchar2(50)
);
select * from user_constraints where lower(table_name)='temp7';

--PK (not null �ϰ�  unique ����)
--PK ���̺� �� 1���� ��� (�÷� 1��, �������� �÷��� ��� 1�� : ����Ű)

insert into temp7(name,addr) values('ȫ�浿','����� ������');
--ORA-01400: cannot insert NULL into ("KOSA"."TEMP7"."ID")

insert into temp7(id,name,addr) values(10,'ȫ�浿','����� ������');
select * from temp7;
commit;

insert into temp7(id,name,addr) values(10,'�߹�����','����� ������');
--ORA-00001: unique constraint (KOSA.PK_TEMP7_ID) violated


--UNIQUE key(UK) ���̺��� ��� ���� �����ϰ� �ϴ� ���� ���� ��(NULL �� ���)
--�÷��� �� ��ŭ ���� ����
--null ���
--not null, unique
create table temp8(
    id number constraint pk_temp8_id primary key,
    name nvarchar2(20) not null,
    jumin nchar(6) constraint uk_temp8_jumin unique, -- null���
    addr nvarchar2(1000)
);
select * from user_constraints where lower(table_name)='temp8';

insert into temp8 (id, name, jumin, addr)
values(10, 'ȫ�浿', '123456', '��⵵');

commit;

insert into temp8 (id, name, jumin, addr)
values(20, '�浿', '123456', '��⵵');

insert into temp8(id,name,addr)
values(20,'������','������'); -- unique null ���

select * from temp8;

--�׷� null�� �ߺ�üũ
insert into temp8(id, name, addr)
values(30,'�̾�','������');

select * from temp8;
-- ������
-- jumin nchar(6) not null constraint uk_temp8_jumin unique,


--���̺� ���� �Ŀ� ���� �ɱ�(
create table temp9 (id number);
--���� ���̺� ���� �߰��ϱ�
--���� �߰��� ���̺� �ִ� ������ �˻� >> �ߺ������� >> ������ >> �ߺ������� ���� ����

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--220930 �ݿ��� ����
alter table temp9
add constraint pk_temp9_id primary key(id);

--add constraint pk_temp9_primary key(id,jumin); ����Ű

select *from user_constraints where lower(table_name) = 'temp9';
desc temp9;

alter table temp9
add ename varchar2(50);

desc temp9;

--ename not null ���� �߰�
alter table temp9
modify(ename not null);

desc temp9;

select * from user_constraints where lower(table_name)='temp9';

--------------------------------------------------------------------------------
CHECK(CK) ���̾�� �ϴ� ������ ������(��κ� ���� ��Ģ�� ����)
--where ���ǰ� ������ ������ ����
--where gender in ('��','��')


create table temp10(
id number constraint pk_temp10_id primary key,
name varchar2(20) not null,
jumin char(6) constraint uk_temp10_jumin unique,
addr varchar2(20),
age number constraint ck_temp10_age check(age>=19) --where age >= 19
);

select *from user_constraints where lower(table_name) = 'temp10';

insert into temp10(id,name,jumin,addr,age)
values(100,'ȫ�浿','123456','�����',25);

select * from temp10;
commit;

insert into temp10(id,name,jumin,addr,age)
values(200,'ȫ�浿','123456','�����',15);

--------------------------------------------------------------------------------
FOREIGN KEY(FK) ���� ������ �� ������ �ܷ�Ű ���踦 �����ϰ� �����մϴ�.
--�������� (���̺�� ���̺��� ���� ����)

create table c_emp
as
    select empno, ename, deptno from emp where 1=2; -- ���̺��� ����(��Ű��) �� �����ϱ�

--create table ���̺�� as select...
select * from c_emp;

create table c_dept
as
    select deptno, dname from dept where 1=2;
    
select * from c_emp;
select * from c_dept;

--c_emp ���̺� �ִ� deptno�� c_dept���̺� �ִ� deptno �÷��� �ִ� �����͸�
--����(����)

alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);

--foreign key(deptno) �����ϱ� ���ؼ��� >> c_dept(deptno) >> ������ >> �� �����ʹ�
-- ���Ἲ�� (�ߺ�,null) >> pk >> c_dept(deptno) >> unique, primary key

--�ݵ�� c_dept�� pk �����Ǿ� �־�� �Ѵ�
alter table c_dept
add constraint pk_c_dept_deptno primary key (deptno); -- �ſ�Ȯ��

select * from user_constraints where lower(table_name)='c_dept';


--pk����ǰ� ����
alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);

--����
insert into c_dept(deptno,dname) values(100,'�λ���');
insert into c_dept(deptno,dname) values(200,'������');
insert into c_dept(deptno,dname) values(300,'ȸ����');
commit;

select* from c_dept;
--���Ի�� �Ի�

insert into c_emp(empno, ename) values(100,'ȫ�浿');

--deptno �÷��� FK �����Ǿ� �־ not null �������� ������ null���� ���ȴ�
--�䱸���� ���ǿ� ���� ...
--�Ի�� �μ��� ������ ���� ���� �ִ�.

--���Ի���� �ݵ�� �μ��� �������Ѵ�
--create table c_emp(deptno not null ...fk)

insert into c_emp(empno, ename, deptno) values(1,'ȫ�浿',100);
select * from c_emp;

insert into c_emp(empno, ename, deptno) values(2,'������',600);
commit;

--------------------------------------------------------------------------------
/*
������
���̺���� �������� (�θ�, �ڽ�)
c_emp, c_dept [deptno] ����� �ؼ��ϸ�
�θ� (master) : PK (deptno)
�ڽ� (detail) : FK (deptno)

c_dept ���� 100�� �μ��� ������ �� �������
*/
select * from c_emp;
select * from c_dept;

delete from c_dept where deptno=100;
--ORA-02292: integrity constraint (KOSA.FK_C_EMP_DEPTNO) violated - child record found

--�ڽĿ��� ....
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
 
 
ON DELETE CASCADE: �θ����̺�� ������ ���� �ϰڴ�
--100���μ� ���� : yes
--delete from c_dept where deptno = 100;
--�����ϴ� �ڽĵ����� ���� ����
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

insert into c_emp(empno, ename, deptno) values(1,'������',100);

delete from c_dept where deptno=100;

---TIP)
-- MS-SQL
--ON DELETE CASCADE  -- �������迡�� �θ��ʿ� �ִ� �����͸� ����� �����ϴ� �ڽ� �����͵� ��������
--ON UPDATE CASCADE

---CASCADE  -- �������迡�� �θ��ʿ� �ִ� �����͸� ����� �����ϴ� �ڽ� �����͵� ��������
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
insert into score_exam(sid,name,korean,english,math,dept) values(321,'ȫ�浿',32,54,42,100);
insert into score_exam(sid,name,korean,math,dept) values(133,'��浿',32,42,100);

delete from score_exam where name like 'ȫ�浿';


create table s_dept(
dept number not null constraint uk_score_exam_dept unique,
dname varchar(20) not null
);

select * from s_dept;

insert into s_dept(dept,dname) values(100, '1��');
insert into s_dept(dept,dname) values(200, '2��');
insert into s_dept(dept,dname) values(300, '3��');
insert into s_dept(dept,dname) values(400, '4��');

select e.sid,e.name,e.total,e.avg,e.dept,d.dname
from score_exam e join s_dept d
on e.dept = d.dept;


NOT NULL(NN) ���� NULL ���� ������ �� �����ϴ�.

--������� �ʱް����Ϸ�
-----------------------------------------------------------------------------------------------------------
--�߱�( View )
--View ��ü (�������̺�)
--create ���� ... ������ view ���������� ����
/*
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias[,alias,...])]
AS Subquery 
[WITH CHECK OPTION [CONSTRAINT constraint ]]
[WITH READ ONLY]

OR REPLACE       �̹� �����Ѵٸ� �ٽ� �����Ѵ�.
FORCE            Base Table ������ ������� VIEW �� �����.
NOFORCE          �⺻ ���̺��� ������ ��쿡�� VIEW �� �����Ѵ�.
view_name         VIEW �� �̸�
Alias Subquery �� ���� ���õ� ���� ���� Column ���� �ȴ�.
Subquery SELECT ������ ����Ѵ�.
WITH CHECK OPTION VIEW �� ���� �׼��� �� �� �ִ� �ุ�� �Է�,���ŵ� �� �ִ�. 
Constraint CHECK OPTON ���� ���ǿ� ���� ������ �̸��̴�.
WITH READ ONLY �� VIEW ���� DML �� ����� �� ���� �Ѵ�
*/
create  view view001
as
  select * from emp;
  
select * from view001;  

--view�� ���̺�ó�� ��밡���� �������̺� : �����͸� ������ ���� �ʾƿ�
--view �޸𸮻󿡸� �����ϴ� �������̺�
--subquery -> in line view > from (.....)

--view �������̺� 
--���� : �Ϲ����̺�� ������ ���� (select , insert , update , delete)
--�� view�� ���� �ִ� �����Ϳ� ���ؼ�
--DML(insert , update , delete) -> �������̺� ���� view > DML����

create OR REPLACE view v_001
as 
   select empno , ename from emp;

select * from v_001; --view�� ������ �ִ� sql ������ ����

--view  ����
--1. ������ ���� : join, subquery >> view ��� >> ����(x) >> ������ ����
--2. ���� �ܼ�ȭ (����) : ������ ������ �̸� ����� �ΰ� ���
--3. ���ȼ� (Ư�� �÷��� ����)

--���Ի�� �Ի� >> DBA ���� �ο� ��Ź >> �λ����� >> Ư�� �÷��� ���� >> view
create or replace view v_emp
as
   select empno , ename , job , hiredate from emp;
   
--���
select * from v_emp;

select * from v_emp where empno=7902;

select * from v_emp where job='CLERK';

--����
create  or replace view v_002
as
  select e.empno, e.ename, e.deptno , d.dname
  from emp e join dept d
  on e.deptno = d.deptno;

select * from v_002;  

create view v_003  --������ ���� ���̺�ó�� ���Ǵµ� (�÷����� �־��)
as
  select deptno , avg(sal) as avgsal
  from emp
  group by deptno;

select * from v_003; --������ ��� �޿��� �� �� �ִ� view
/*
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias[,alias,...])]
AS Subquery 
[WITH CHECK OPTION [CONSTRAINT constraint ]]
[WITH READ ONLY]

OR REPLACE              �̹� �����Ѵٸ� �ٽ� �����Ѵ�.
FORCE                  Base Table ������ ������� VIEW �� �����.
NOFORCE                �⺻ ���̺��� ������ ��쿡�� VIEW �� �����Ѵ�.
view_name                    VIEW �� �̸�
Alias Subquery              �� ���� ���õ� ���� ���� Column ���� �ȴ�.
Subquery                    SELECT ������ ����Ѵ�.
WITH CHECK OPTION VIEW      �� ���� �׼��� �� �� �ִ� �ุ�� �Է�,���ŵ� �� �ִ�. 
Constraint CHECK OPTON      ���� ���ǿ� ���� ������ �̸��̴�.
WITH READ ONLY              �� VIEW ���� DML �� ����� �� ���� �Ѵ�
*/
create or replace view v_004
as
  select round(avg(sal),0) as avgsal from emp;
  
select * from v_004;  

/*
view �� ���� ���̺� �׷��� view���ؼ� insert, update , delete����
�� �������̺�
*/
select * from v_emp;

update v_emp
set sal=0;  --v_emp �� sal�÷��� �����͸� �� �� �����

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


-- 30�� �μ� �������  ����, �̸�, ������ ��� VIEW�� ����µ�,
-- ������ �÷����� ����, ����̸�, �������� ALIAS�� �ְ� ������
-- 300���� ���� ����鸸 �����ϵ��� �϶�.
create or replace view view101(����,����̸�,����)
as
   select job , ename , sal
   from emp
   where deptno=30 and sal > 300;

select * from view101;

--�μ��� ��տ����� ��� VIEW�� �����, ��տ����� 2000 �̻���
--�μ��� ����ϵ��� �϶�.
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
--�Ʒ� 3���� ���̺� �̿��Ͽ�  ���� 3���� ���弼�� 
--�ʼ�����) �Լ� �� JOIN ������ �ݵ�� �ʼ� .....
--���� ������ ���� ������ ���� �ҰԿ� ^^


select e.email as �̸���, e.last_name || ' ' || e.first_name as fullname, d.department_name as ����,
        l.city as ����, to_char(e.salary,'$999,999,999') as ����
from employees e join departments d on e.department_id = d.department_id
    join locations l on d.location_id = l.location_id
where e.salary >=10000
and e.department_id in(select department_id from departments where phone_number like '%011%');

create or replace view asd
as
select e.email , e.last_name || ' ' || e.first_name as fullname, d.department_name as ����,
        l.city as ����, e.salary as ����
from employees e join departments d on e.department_id = d.department_id
    join locations l on d.location_id = l.location_id
where e.salary >=10000
and e.department_id in(select department_id from departments where phone_number like '%011%');

select e.first_name, d.department_name
from employees e join  departments d on nvl(e.department_id,0) = d.department_id
where salary > (select ���� from asd where email = 'EZLOTKEY' );


select e.email as "����", 
        e.last_name || ' ' || e.first_name as "�̸�", 
        d.department_name as "�μ��̸�", 
        l.city as "����", 
        to_char(e.salary, '$999,999,999')as "�޿�"
from employees e left join departments d on e.department_id = d.department_id
                    join locations l on d.location_id = l.location_id
where substr(phone_number,1,3)='011' and salary > 10000 and salary > (select salary from employees
where email = 'EZLOTKEY');
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
--221004 ���� ��ħ

--������ �������� SQL
--����Ŭ.pdf(185page)

/*

SEQUENCE (�ڵ����� ��ȣ�� �����ϴ� ��ü)
ä���ϱ�, ��ȣ �����
                                
CREATE SEQUENCE sequence_name
[INCREMENT BY n]
[START WITH n]
[{MAXVALUE n | NOMAXVALUE}]
[{MINVALUE n | NOMINVALUE}]
[{CYCLE | NOCYCLE}]
[{CACHE | NOCACHE}];

sequence_name SEQUENCE �� �̸��Դϴ�.
INCREMENT BY n ���� ���� n ���� SEQUENCE ��ȣ ������ ������ ����.
�� ���� �����Ǹ� SEQUENCE �� 1 �� ����.
START WITH n �����ϱ� ���� ù��° SEQUENCE �� ����.
�� ���� �����Ǹ� SEQUENCE �� 1 �� ����.
MAXVALUE n SEQUENCE �� ������ �� �ִ� �ִ� ���� ����.
NOMAXVALUE ���������� 10^27 �ִ밪�� ����������-1 �� �ּҰ��� ����.
MINVALUE n �ּ� SEQUENCE ���� ����.
NOMINVALUE ���������� 1 �� ����������-(10^26)�� �ּҰ��� ����.
CYCLE | NOCYCLE �ִ� �Ǵ� �ּҰ��� ������ �Ŀ� ��� ���� ������ ���� ���θ�
����. NOCYCLE �� ����Ʈ.
CACHE | NOCACHE �󸶳� ���� ���� �޸𸮿� ����Ŭ ������ �̸� �Ҵ��ϰ� ����
�ϴ°��� ����. ����Ʈ�� ����Ŭ ������ 20 �� CACHE.

*/

desc board;

create table board(
boardid number constraint pk_board_boardid primary key,
title nvarchar2(50)
);

select * from board;
--boardid (pk: not null, unique, ���������� index �ڵ�����
--where boardid=10; �˻��ӵ� ��� ...

--�Խ��� �۾��� �۾�
insert into board(boardid, title) values(1,'ó����');
insert into board(boardid, title) values(2,'��');
-- ó�� ���� 1���̰� �� �����ۺ��ʹ� �������� ���� insert ...


insert into board(boardid, title)
values((select count(boardid) + 1 from board), '2');
insert into board(boardid, title)
values((select count(boardid) + 1 from board), '3');

--CRUD ��������
--create (insert)
--read (select)
--update
--delete

delete from board where boardid=1;
commit;

--���� ,,,,
insert into board(boardid, title)
values((select count(boardid) + 1 from board), '4');
--ORA-00001: unique constraint (HR.PK_BOARD_BOARDID) violated
--DML �����߻�

select * from board;

--�ٸ� ���
delete from board;
commit;

select * from board;
--�����Լ�

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

--�۹�ȣ ��� ..... ����....
--sequence ��ü ����: �ߺ����� ���� �������� ���� �����ϴ� ��ü

create sequence board_num;

select board_num.nextval from dual; -- ä��

select board_num.currval from dual; -- ������� ä���� ��ȣ Ȯ��
/*
1.4.1 NEXTVAL �� CURRVAL �ǻ翭
��) Ư¡
1) NEXTVAL �� ���� ��� ������ SEQUENCE ���� ��ȯ �Ѵ�.
��188��
2) SEQUENCE �� ������ �� ����, �ٸ� ����ڿ��� ������ ������ ���� ��ȯ�Ѵ�.
3) CURRVAL �� ���� SEQUENCE ���� ��´�.
4) CURRVAL �� �����Ǳ� ���� NEXTVAL �� ���Ǿ�� �Ѵ�.
*/

--�Խ���
--�Խ��ǿ� ���Ǵ� ä����
create table kboard(
    num number constraint pk_kboard_num primary key,
    title nvarchar2(20)
);

create sequence kboard_num;

insert into kboard(num, title)
values(kboard_num.nextval, 'ó��');

insert into kboard(num, title)
values(kboard_num.nextval, '���̴�');

insert into kboard(num, title)
values(kboard_num.nextval, '���̴�');

select * from kboard;

delete from kboard where num=1;
delete from kboard where num=2;

insert into kboard(num, title)
values(kboard_num.nextval, '���̴�');

select * from kboard;
commit;

--------------------------------------------------------------------------------
/*
�Խ���
��������, �����Խ���, ������ �Խ��� ���
�������� 1..2..3...
�����Խ��� 4...
������ �Խ��� 5... .6....
�������� 7....

1. sequence ��ü�� ������ü (���̺� ���ӵ��� �ʾƿ�)
�ϳ��� �������� ���������� �����Ӱ� ��밡���ϴ�
sequence �ϳ� �����ؼ� >> ��������, �����Խ���, ������ �Խ��� ��밡��

2. �� ����Ʈ (�Խ��� 10��)
��ǰ�Խ���, �����ڰԽ���, ȸ���Խ��� ���...
������ �Խ����� ������ ���� �����ϱ⸦ ���ؿ�
10���� �������� ���� ���� ����ϸ� �ſ�.

-- TIP)
MS-SQL: create table board(boardnum int identity(1,1).... title
insert into(title) values('�氡); �ڵ� (1,2,3,...)

MS-SQL: 2012���� (sequence��ü)

Mysql: create table board(boardnum int auto_increment, ... title)
insert into(title) values('�氡); �ڵ� (1,2,3,...)

-- mysql ���� ������� open source >> mariadb(���� ����)
--mariadb ������ ��ü ����
*/

--------------------------------------------------------------------------------
--�ɼ�
create sequence seq_num
start with 10
increment by 2;



select seq_num.nextval from dual;

select seq_num.currval from dual;

--�Խ��� �� 100��
--num, title, writer, content
--1, 2, 3, ..... 100
--�Ϲ������� �Խ��� �� ���� (�ֽű�) -���峪�߿� ����.. ȭ�����

select * from kboard order by num desc; --�Ϲ� �Խ��� ù ����

-- ������ ����
-- rownum �ǻ��÷�: ���� ���������� �����ϴ� �÷�x ������ ����
-- rownum: ������ ���̺� �÷����� �������� ������ ���������� �� ��ȣ�� �ο��ϴ� �÷�

select * from emp;
select rownum as ����, empno, ename from emp;
--select �� ����� ������ �ο�...

--Top-n ���� (���ĵ� �������� ������ � ����)
--���̺��� ���ǿ� �´� ����(Top) ���� ���ڵ�(row) n���� ����
--Tip)
--MS-SQP: select top 10, * from emp order by sal desc;
--
--Oracle top n (x))
--rownum: ������ �ο� Ư�� ���ǿ� �°� top ���� ���డ��
--1. **����**�� ������ ���� (����)
--2. ���ĵ� �����͸� �������� rownum�����ϰ� ������ �ɰ� ������ ����

--1�ܰ� (sal ���������� ����)
select *
from (  select *
        from emp
        order by sal desc
     )e;
     
--2�ܰ� (������ ����)
select rownum as num, e.*
from (  select *
        from emp
        order by sal desc
     )e;
     
--3�ܰ� (�޿��� ���� �޴� ��� 5��)
select *
from    (
        select rownum as num, e.*
        from (  select *
            from emp
            order by sal desc
         )e
     ) n where num <= 5;
     

--------------------------------------------------------------------------------
--�Խ���
/*
100��
�� ����Ʈ�� 100�� �����Ͱ� �� ȭ�� ��� ���
10�Ǿ� ����� ȭ�鿡 ���

pagesize = 10 (�� ȭ�鿡 (������)�� ������ �� �ִ� ������ row��)
page ���� = 10��

[1][2][3][4][5][6][7][8][9][10] >> java ���� >> <a href='page.jsp?'>10</a>
1page >> 1~10   >> DB select 1~10��
2page >> 11~20  >> DB select 11~20��
3page >> 21~30 ....

>>rownum
>>between A and B
*/
--------------------------------------------------------------------------------
--HR �����̵�

select * from employees; -- 107��

--1�ܰ� (���� ������ ����� (����))
--����� ���� ������ ����
select * from employees order by employee_id asc;

--2�ܰ� (���� �����Ϳ� ���� �ο��ϱ�)
select rownum as num, e.*
from (
     select * from employees order by employee_id asc
     )e
where rownum <=50; --���ĵ� �����Ϳ� ���������� ������ rownum

--3�ܰ� 
select *
from(
        select rownum as num, e.*
        from (
             select * from employees order by employee_id asc
             )e
        where rownum <=10
    ) n where num >= 1;
    
--where rownum between 1 and 10

--����
select *
 FROM (
         SELECT ROWNUM AS NUM, E.* 
         FROM EMPLOYEES E ORDER BY EMPLOYEE_ID ASC
 ) WHERE NUM <=30;
--------------------------------------------------------------------------------
--107��
--pagesize = 10
--[1][2][3][4][5][6][7][8][9][10][11]
--[1] >> 1~10
--[2] >> 11~20
--...
--[10] >> 91~100
--[11] >> 101~107

--KOSA��������
create table dmlemp
as
    select * from emp;

--���������� ���簡 �ȵſ�
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
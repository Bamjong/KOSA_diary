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
select rpad(substr('hong1007',1,2),length('hong1007'),'*') from dual;
select rpad(substr('k1234',1,2),length('k1234'),'*') from dual;

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
from member2

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
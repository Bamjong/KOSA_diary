# π Day84_221216

Author: κ³ λ²μ’
Created Time: 2022λ 12μ 16μΌ μ€μ  9:43
Status: π¨ Published
Tags: SQL, νλ‘μμ 
Updated Time: 2022λ 12μ 16μΌ μ€μ  11:39

# 1. Procedure(νλ‘μμ )

- μ§κΈκΉμ§ λ§λ€μλ μμμ΄ μμμ μΌλ‘ μ μ₯ λμ§ μμλ€
crerate table , create view
λ΄κ° μμμ λ§λ  [μ»€μ]λ₯Ό μμμ μΌλ‘ μ μ₯ (κ°μ²΄)
κ°μ²΄ ννλ‘ μ μ₯ ν΄λμΌλ©΄ κ·Έ λ€μλ²μ μ½λ©νμ§ μκ³  [λΆλ¬ μ¬μ©]
- νμ¬ ν BY ν μλ°μμ ν΄κ²°νλμ§ sqlλ‘ ν΄κ²°νλ λ°©ν₯μ€ μ΄κ±΄
sqlλ‘ ν΄κ²°νλ λ°©λ²μ΄λ€
- Oracle : subprogram(procedure)
Ms-sql : procedure

```java
μμ£Ό μ¬μ©λλ μΏΌλ¦¬λ₯Ό λͺ¨λν μμΌμ κ°μ²΄λ‘ μ μ₯νκ³ 
νμν μμ μ λΆλ¬(νΈμΆ) ν΄μ μ¬μ©νκ² λ€
```

### μ₯μ 

κΈ°μ‘΄ : APP(emp.java > select .... κ΅¬λ¬Έ) ->λ€νΈμν¬ > DBμ°κ²° > selet... > DBμ
μ§κΈ : APP(emp.java > usp_emplist κ΅¬λ¬Έ) ->λ€νΈμν¬ > DBμ°κ²° > usp_emplist > DBμ

1. μ₯μ  : λ€νΈμν¬ νΈλν½ κ°μ(μκ° λ¨μΆ)
2. μ₯μ  : λ³΄μ (λ€νΈμν¬ μμμ ...λ³΄μ μμ)ν΄κ²°

## κ²°κ΅­ νλ‘μμ λ SQL λ©μ΄λ¦¬λ₯Ό λ»νλ€

### procedure λ parameter μ’λ₯ 2κ°μ§

1.  input paramter : μ¬μ©μ λ°λμ μλ ₯ (IN : μλ΅νλ default)
2.  output parmater : μ¬μ©μ μλ ₯κ°μ λ°μ§ μμμ (OUT)

```sql
create or replace procedure app_get_emplist
(
  vempno IN emp.empno%TYPE,
  vename OUT emp.ename%TYPE,
  vsal   OUT emp.sal%TYPE
)
is
  BEGIN
    select ename, sal
      into vename , vsal
    from emp
    where empno=vempno;
  END;
```

```sql
--μ€λΌν΄ μ€ν νμ€νΈ
DECLARE
  out_ename emp.ename%TYPE;
  out_sal   emp.sal%TYPE;
BEGIN
   app_get_emplist(7902,out_ename,out_sal);
   DBMS_OUTPUT.put_line('μΆλ ₯κ° : ' || out_ename || '-' || out_sal);
END;
```

μμ)

```sql
CREATE OR REPLACE PROCEDURE usp_EmpList
(
  p_sal IN number,
  p_cursor OUT SYS_REFCURSOR --APP μ¬μ©νκΈ° μν νμ (νκ±΄μ΄μμ λ°μ΄ν° select λ΄λΆμ μΌλ‘ cursor μ¬μ©
)
IS
 BEGIN
     OPEN p_cursor
     FOR  SELECT empno, ename, sal FROM EMP WHERE sal > p_sal;
  END;

create table usp_emp
as
    select * from emp;

alter table usp_emp
add constraint pk_usp_emp_empno primary key(empno);

select * from SYS.USER_CONSTRAINTS where table_name='USP_EMP';
```

```sql
CREATE OR REPLACE PROCEDURE usp_insert_emp
(
 vempno IN emp.empno%TYPE,
 vename IN emp.ename%TYPE,
 vjob   IN emp.job%TYPE,
 p_outmsg OUT VARCHAR2
 )
 IS
   BEGIN
      INSERT INTO USP_EMP(empno , ename, job) VALUES(vempno ,vename , vjob);
      COMMIT;
        p_outmsg := 'success';
        EXCEPTION WHEN OTHERS THEN
        p_outmsg := SQLERRM;
        ROLLBACK;
    END;

DECLARE
  out_msg varchar2(200);
BEGIN
   usp_insert_emp(9998,'νκΈΈλ','IT',out_msg);
   DBMS_OUTPUT.put_line('μΆλ ₯κ° : ' || out_msg);
END;
```

# 2. μ¬μ©μ μ μ ν¨μ

- to_char() , sum() μ€λΌν΄μμ μ κ³΅
- μ¬μ©μκ° μ§μ  νμν ν¨μλ₯Ό λ§λ€μ΄ μ¬μ©κ°λ₯
- μ¬μ©λ°©λ²μ λ€λ₯Έ ν¨μμ¬μ©λ²κ³Ό λμΌ
- μ¬μ©μ μ μ ν¨μ paramter μ μ , return κ°

μμ)

```sql
create or replace function f_max_sal
(s_deptno emp.deptno%TYPE)
return number   -- public int f_max_sal(int deptno) {  return 10}
is
  max_sal emp.sal%TYPE;
BEGIN
      select max(sal)
          into max_sal
      from emp
      where deptno = s_deptno;
      return max_sal;
END;
```

μμ) μ΄λ¦ λ€μ ~~λ λΆνκΈ°

```sql
create or replace function f_callname
(vempno emp.empno%TYPE)
return varchar2 -- public String f_callname() {  String  v_name; return "νκΈΈλ"}
is
  v_name emp.ename%TYPE;
BEGIN
    select ename || 'λ'
      into v_name
    from emp
    where empno=vempno;
    return v_name;
END;
```

```sql
select empno, ename , f_callname(empno) , sal
from emp
where empno=7788;
```

μμ)  parmater μ¬λ²μ μλ ₯λ°μμ μ¬λ²μ ν΄λΉλλ λΆμμ΄λ¦μ λ¦¬ν΄νλ ν¨μ

```sql
create or replace function f_get_dname
(vempno emp.empno%TYPE)
return varchar2
is
    v_dname dept.dname%TYPE;
  BEGIN
    select dname
      into v_dname
    from dept
    where deptno = (select deptno from emp where empno=vempno);
    return v_dname;
  END;
```

```sql
select empno , ename ,deptno, f_get_dname(empno)
from emp 
where empno=7788;
```

![https://user-images.githubusercontent.com/92353613/208003321-7e921791-8c8a-4d21-8bbd-a63a7c7ab15d.png](https://user-images.githubusercontent.com/92353613/208003321-7e921791-8c8a-4d21-8bbd-a63a7c7ab15d.png)

# 3. νΈλ¦¬κ±° (Trigger)

- νΈλ¦¬κ±°(trigger)μ μ¬μ μ μΈ μλ―Έλ λ°©μμ λ (λ°©μμ λ₯Ό) μλ€, λ°μ¬νλ€,
- (μ¬κ±΄μ) μ λ°μν€λ€λΌλ μλ―Έκ° μλ€.
- [μκ³ ] [μ¬κ³ ] [μΆκ³ ]       β κ°μ₯ νΈλ¦¬κ±° λ§μ΄ λ§λλ μμ

- μκ³  INSERT (λ΄λΆμ μΌλ‘ [νΈλμ­μ]μ΄ λμ)
- μ¬κ³  INSERT
- μνλΆλ΄ : lock

- PL/SQLμμμ νΈλ¦¬κ±° μ­μ λ°©μμ κ° λΉκ²¨μ§λ©΄ μλμΌλ‘ μ΄μμ΄ λ°μ¬λλ―μ΄
- μ΄λ ν μ΄λ²€νΈκ° λ°μνλ©΄ κ·Έμ λ°λΌ λ€λ₯Έ μμμ΄ μλμΌλ‘ μ²λ¦¬λλ κ²μ μλ―Ένλ€.

```sql
νΈλ¦¬κ±°λ νΉμ  νμ΄λΈμ λ°μ΄ν°μ λ³κ²½μ΄ κ°ν΄μ‘μ λ μλμΌλ‘ μνλλ
[μ μ₯ νλ‘μμ ]λΌκ³  ν  μ μλ€.
μμ λ°°μ΄ μ μ₯ νλ‘μμ λ νμν  λλ§λ€ μ¬μ©μκ° μ§μ 
 EXECUTE λͺλ Ήμ΄λ‘ νΈμΆν΄μΌ νλ€.
νμ§λ§ νΈλ¦¬κ±°λ μ΄μ λ¬λ¦¬ νμ΄λΈμ
λ°μ΄ν°κ° INSERT, UPDATE, DELETE λ¬Έμ μν΄ λ³κ²½λμ΄μ§ λ
[ μλμΌλ‘ μνλλ―λ‘ μ΄ κΈ°λ₯μ μ΄μ©νλ©° μ¬λ¬ κ°μ§ μμ ] μ ν  μ μλ€.
μ΄λ° μ΄μ λ‘ νΈλ¦¬κ±°λ₯Ό μ¬μ©μκ° μ§μ  μ€νμν¬ μλ μλ€.
 
 --μλ(insert, update ,delete)μ΄λ²€νΈκ° λ°μνλ©΄  μλμΌλ‘  μ€νλλ procedure ...
```

- BEFORE : νμ΄λΈμμ DML μ€νλκΈ° μ μ νΈλ¦¬κ±°κ° λμ
μ£Όλ‘ κ²μ¬ν λ λ§μ΄ μ°μ
- AFTER : νμ΄λΈμμ DML μ€ννμ νΈλ¦¬κ±° λμ
[μκ³ ] [μ¬κ³ ] [μΆκ³ ] μ κ°μ΄ μ΄μ΄μ§λ λμμ λ§μ΄ μ°μ

### FOR EACH ROW

- ν λ λ²¨ νΈλ¦¬κ±°κ° λμ΄ triggering λ¬Έμ₯μ μν΄ μν₯λ°μ νμ λν΄ κ°κ° νλ²μ© μ€ννκ³  μ¬μ©νμ§ μμΌλ©΄ λ¬Έμ₯ λ λ²¨ νΈλ¦¬κ±°κ° λμ΄ DML λ¬Έμ₯ λΉ νλ²λ§ μ€νλλ€.

μμ) insert νΈλ¦¬κ±°

```sql
create table tri_emp
as
  select empno , ename from emp where 1=2;

select * from tri_emp;
```

```sql
create or replace trigger tri_01
after insert on tri_emp
BEGIN -- μλ λμν  λ΄μ©
    DBMS_OUTPUT.PUT_LINE('μ μμ¬μ μμ¬');
END;

insert into tri_emp(empno,ename) values(100,'νκΈΈλ');
select * from tri_emp;
```

μμ) update νΈλ¦¬κ±°

```sql
create or replace trigger tri_02
after update on tri_emp
BEGIN
  DBMS_OUTPUT.PUT_LINE('μ μμ¬μ μμ ');
END;

select * from user_jobs;

--νμ΄λΈμ trigger μ λ³΄
select * from user_triggers where table_name='TRI_EMP';

insert into tri_emp values(100,'κΉμ μ ');

update tri_emp
set ename='μν'
where empno=100;
```

μμ delete νΈλ¦¬κ±°

```sql
--delete νΈλ¦¬κ±° : tri_emp
--μ¬μνμ΄λΈ μ­μ  (νλ©΄ μΆλ ₯)
create or replace trigger tri_03
after delete on tri_emp
BEGIN
  DBMS_OUTPUT.PUT_LINE('μ μμ¬μ μ­μ ');
END;

insert into tri_emp values(200,'νκΈΈλ');
update tri_emp set ename='λ³κ²½' where empno= 200;
delete from tri_emp where empno=200;
```

### νΈλ¦¬κ±° μμ  1) νΈλ¦¬κ±°λ₯Ό μ΄μ©ν λ‘κ·Έ μΆμ  μμ λ§λ€κΈ°

- νμ΄λΈμ INSERT, UPDATE, DELETE λ₯Ό ν  λ user, κ΅¬λΆ(I,U,D), sysdate λ₯Ό κΈ°λ‘νλ
- νμ΄λΈ(emp_audit)μ λ΄μ©μ μ μ₯νλ€.
- FOR EACH ROW μ΄ μ΅μμ μ¬μ©νλ©΄
- ν λ λ²¨ νΈλ¦¬κ±°κ° λμ΄ triggering λ¬Έμ₯
- μ μν΄ μν₯λ°μ νμ λν΄ κ°κ° νλ²μ© μ€ννκ³  μ¬μ©νμ§
- μμΌλ©΄ λ¬Έμ₯ λ λ²¨ νΈλ¦¬κ±°κ° λμ΄ DML λ¬Έμ₯ λΉ νλ²λ§ μ€νλλ€.

μ΄κΈ°μμ)

```sql
drop sequence emp_audit_tr;
drop table emp_audit;

create sequence emp_audit_tr
 increment by 1
 start with 1
 maxvalue 999999
 minvalue 1
 nocycle
 nocache;

create table emp_audit(
 e_id number(6) constraint emp_audit_pk primary key,
 e_name varchar2(30),
 e_gubun varchar2(10),
 e_date date);

drop table emp2;
create table emp2
as
    select * from emp;
```

νΈλ¦¬κ±° μ€μ )

```sql
create or replace trigger emp_audit_tr
 after insert or update or delete on emp2
 --for each row
begin
 if inserting then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'inserting', sysdate);
 elsif updating then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'updating', sysdate);
 elsif deleting then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'deleting', sysdate);
 end if;
end;
```

μ€ν)

```sql
-- for each row μ μΈ μνμ λ (λͺλ Ήμ΄ ν λ²μ λνμ¬ ν κ±΄μΌλ‘ κΈ°λ‘λλ€.)
select * from emp2;

update emp2 
set deptno = 20
where deptno = 10;

select * from emp_audit;

delete from emp2 where deptno = 20;

select * from emp_audit;
```

![https://user-images.githubusercontent.com/92353613/208007798-f52ef3a4-d8ff-40cc-962c-365eb35c6517.png](https://user-images.githubusercontent.com/92353613/208007798-f52ef3a4-d8ff-40cc-962c-365eb35c6517.png)

---

for each row μ μΈ νμ λ(λͺλ Ήμ΄ ν λ²μ λ³κ²½λ νλ§νΌ κΈ°λ‘λλ€.)

```sql
create or replace trigger emp_audit_tr
 after insert or update or delete on emp2
 for each row
begin
 if inserting then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'inserting', sysdate);
 elsif updating then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'updating', sysdate);
 elsif deleting then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'deleting', sysdate);
 end if;
end;

select * from emp2;
update emp2 set deptno = 20 where deptno = 10;

select * from emp_audit;
```

![https://user-images.githubusercontent.com/92353613/208008016-700221c0-38ca-4cb0-ba4d-d323151ac35e.png](https://user-images.githubusercontent.com/92353613/208008016-700221c0-38ca-4cb0-ba4d-d323151ac35e.png)

---

### νΈλ¦¬κ±° μμ  2)
INSERT, UPDATE, DELETEλ‘ λ³κ²½λλ λ΄μ©μ λνμ¬ μ /ν λ°μ΄ν°λ₯Ό κΈ°λ‘νλ€.

μ΄κΈ°μ€μ )

```sql
create table emp_audit (
 id number(6) constraint emp_audit_pk primary key,
 name varchar2(30),
 gubun varchar2(10),
 wdate date,
 etc1 varchar2(20),  -- old
 etc2 varchar2(20)   -- new
);
```

νΈλ¦¬κ±° μ€μ )

```sql
create or replace trigger emp_audit_tr
 after insert or update or delete on emp2
 for each row
begin
 if inserting then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'inserting', sysdate, :old.deptno, :new.deptno);
 elsif updating then
    insert into emp_audit
    values(emp_audit_tr.nextval, user, 'updating', sysdate, :old.deptno, :new.deptno);
 elsif deleting then
    insert into emp_audit
    values(emp_audit_tr.nextval, user, 'deleting', sysdate, :old.deptno, :new.deptno);
 end if;
end;
```

μΆλ ₯)

```sql
--insert
insert into emp2(empno,ename,deptno) values (9999,'νκΈΈλ',100);
select * from emp_audit;

--update
update emp2 set deptno=200
where empno=9999;
select * from emp_audit;

--delete
delete from emp2 where empno=9999;
select * from emp_audit;
```

---

### νΈλ¦¬κ±° μμ  3) μκ°μ λ°λ₯Έ νΈλ¦¬κ±° μλ

μ΄κΈ°μ€μ )

```sql
create table tri_order
(
  no number,
  ord_code varchar2(10),
  ord_date date
);
```

μ€ν)

```sql
--before νΈλ¦¬κ±°μ λμμμ μ΄ μ€μ  tri_order νμ΄λΈ insert λκΈ° μ μ
--νΈλ¦¬κ±° λ¨Όμ  λμ κ·Έ μ΄ν insert μμ
create or replace trigger trigger_order
before insert on tri_order
BEGIN
  IF(to_char(sysdate,'HH24:MM') not between '11:00' and '16:00') THEN
     RAISE_APPLICATION_ERROR(-20002, 'νμ©μκ° μ€λ₯ μ¬μΈμ');
  END IF;
END;

insert into tri_order values(2,'notebook',sysdate);
select * from tri_order;
commit;
rollback;
--νΈλ¦¬κ±° μ­μ 
drop trigger trigger_order;
```

---

### νΈλ¦¬κ±° μμ  4) μ½λ λͺ»λ£κ² νκΈ°

- POINT
- PL_SQL λκ°μ κ°μλ°μ΄ν°(νμ΄λΈ) μ κ³΅
- :OLD > νΈλ¦¬κ±°κ° μ²λ¦¬ν λ μ½λμ μλ κ°μ μ μ₯ (ms-sql (deleted)
- :NEW > μκ°μ ν¬ν¨ (ms-sql (inserted)

μ΄κΈ°μ€μ )

```sql
create or replace trigger tri_order2
before insert on tri_order
for each row
BEGIN
  IF(:NEW.ord_code) not in('desktop') THEN
     RAISE_APPLICATION_ERROR(-20002, 'μ νμ½λ μ€λ₯');
  END IF;
END;
```

μ€ν)

```sql
select * from tri_order;

--μ€λ₯ (desktop)
insert into tri_order values(200,'notebook',sysdate);

insert into tri_order values(200,'desktop',sysdate);

select * from tri_order;
commit;
```

---

### νΈλ¦¬κ±° μμ  5) μκ³ , μ¬κ³ 

μ΄κΈ°μ€μ )

```sql
--μκ³  , μ¬κ³ 

create table t_01 --μκ³ 
(
  no number,
  pname varchar2(20)
);

create table t_02 --μ¬κ³ 
(
  no number,
  pname varchar2(20)
);

--μκ³  λ°μ΄ν° λ€μ΄μ€λ©΄ κ°μ λ°μ΄ν°λ₯Ό μ¬κ³  μλ ₯
create or replace trigger insert_t_01
after insert on t_01
for each row
BEGIN
  insert into t_02(no, pname)
  values(:NEW.no ,:NEW.pname);
END;
```

μ€ν)

```sql
--μκ³ 
insert into t_01 values(1,'notebook');

select * from t_01;
select * from t_02;

-- μκ³  μ νμ΄ λ³κ²½ (μ¬κ³  λ³κ²½)
create or replace trigger update_t_01
after update on t_01
for each row
BEGIN
  update t_02
  set pname = :NEW.pname
  where no = :OLD.no;
END;

update t_01
set pname = 'notebook2'
where no = 1;

select * from t_01;

select * from t_02;
```

μ€ν)

```sql
--delete νΈλ¦¬κ±° λ§λ€μ΄ λ³΄μΈμ 
--μκ³  λ°μ΄ν° delete from t_01 where no =1 μ­μ  λλ©΄ μ¬κ³  μ­μ 
create or replace trigger delete_tri_01
after delete on t_01
for each row
BEGIN
  delete from t_02
  where no=:OLD.no;
END;

delete from t_01 where no=1;

select* from t_01;
select* from t_02;
```
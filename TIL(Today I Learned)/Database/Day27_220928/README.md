# ๐ Day27_220928

Author: ๊ณ ๋ฒ์ข
Category: 2022
Created Time: 2022๋ 9์ 28์ผ ์ค์  9:01
Main Category: Log
Status: ๐จ Published
Updated Time: 2022๋ 9์ 28์ผ ์คํ 9:28

# 1. ๋ฐ์ดํฐ ํ์

---

## varchar์ char์  ํน์ง

**Char๋ ๊ณ ์ ๊ธธ์ด ๋ฌธ์์ด**

- char(10)        >> 10byte >> (ํ๊ธ5์), (์๋ฌธ,ํน์,๊ณต๋ฐฑ 10์) >> ๊ณ ์ ๊ธธ์ด ๋ฌธ์์ด
- char(10) >> 'abc' >> 3byte >> [a][b][c][][][][][][][] >> ๊ณต๊ฐ์ ๋ณํ๊ฐ ์์

**varchar๋ ๊ฐ๋ณ๊ธธ์ด ๋ฌธ์์ด**

- varchar2(10) >> 10byte >> (ํ๊ธ5์), (์๋ฌธ,ํน์,๊ณต๋ฐฑ 10์) >> ๊ฐ๋ณ๊ธธ์ด ๋ฌธ์์ด
- varchar(10) >> 'abc' >> 3byte >> [a][b][c].. >> ๋ฐ์ดํฐ ํฌ๊ธฐ๋งํผ๋ง ๊ณต๊ฐ ํ๋ณด (๋น๊ณต๊ฐ ์์ด์ง)

### [์์]

if ์ฌ๋์ ์ด๋ฆ
create table member (name char(30))
create table member (name varchar(30))  (์ ๋ต!)

if ์ฑ๋ณ (๋จ ๋๋ ์ฌ)
create table member (name char(3))      (์ ๋ต!)
create table member (name varchar(3))

### [์ฝ์]

๊ณ ์ ๊ธธ์ด ๋ฌธ์์ด ((๋จ,์ฌ),(๋,์ค,์),(์ฃผ๋ฏผ๋ฒํธ))  >> char()   -> ํ๋์ฑ๋ฅ์ด ๋ ์ข์
๊ฐ๋ณ๊ธธ์ด ๋ฌธ์์ด (์ฌ๋์ ์ด๋ฆ, ์ทจ๋ฏธ, ์ฃผ์)  >> varchar2()

## nchar์ nvarchar2์ ํน์ง

char(), varchar2() ๊ณ ๋ฏผ: ํ๊ธ๊ณผ ์์ด ํผํฉ

nchar == unicode character

**unicode (2byte): ํ๊ธ, ์๋ฌธ์, ํน์๋ฌธ์, ๊ณต๋ฐฑ >> 2byte**

**nchar**

nchar(20)       >> 20์ >> 2*20 >> 40byte
nvarchar2(20)   >> 20์

```sql
select * from SYS.NLS_DATABASE_PARAMETERS;
--NLS_CHARACTERSET  : 	AL32UTF8  ํ๊ธ 3byte ์ธ์
--KO16KSC5601 2Byte (ํ์ฌ ๋ณํํ๋ฉด ํ๊ธ ๋ค๊นจ์ง)
select * from nls_database_parameters where parameter like '%CHAR%';
------------------------------------------------------------------------------
create table test2(name varchar2(2));

insert into test2(name) values('a');
insert into test2(name) values('aa');
insert into test2(name) values('๊ฐ'); --ํ๊ธ 1์ 3byte ์ธ์ง ๊ทธ๋์ ์ถ๊ฐ x
-------------------------------------------------------------------------------
select * from test2;
```

# 2. ์ผ๋ฐํจ์ (ํ๋ก๊ทธ๋จ ์ฑ๊ฒฉ์ด ๊ฐํ ํจ์)

---

nvl(), nvl2() >> null ์ฒ๋ฆฌํ๋ ํจ์
decode() >> java if๋ฌธ
case()   << java switch๋ฌธ

์ค๋ผํด SQL (๋ณ์, ์ ์ด๋ฌธ ๊ฐ๋์ด ์๋ค)
์ค๋ผํด PL-SQL(๋ณ์, ์ ์ด๋ฌธ) ๊ณ ๊ธ๊ธฐ๋ฅ

## decode (java if๋ฌธ)

### [์์]

```sql
select id, decode(id,100,'์์ดํฐ',200,'์์๋ถ',300,'๊ด๋ฆฌํ','๊ธฐํ๋ถ์') as ๋ถ์์ด๋ฆ
from t_emp;

----------------------------------------------------------------------------------

select id, decode(id,100,'์์ดํฐ',
                     200,'์์๋ถ',
                     300,'๊ด๋ฆฌํ',
                     '๊ธฐํ๋ถ์') as ๋ถ์์ด๋ฆ
from t_emp;
```

์์ ์๋๋ ๊ฐ์ decode ๋ฌธ์ด์ง๋ง ์๋๊ฒ์ด ์ข ๋ ์ด์๊ฒ ์ ๋์ด์๋ค.

### [๋ค๋ฅธ์์]

```sql
select empno, ename, deptno, decode(deptno, 10, '์ธ์ฌ๋ถ',
                                            20, '๊ด๋ฆฌ๋ถ',
                                            30, 'ํ๊ณ๋ถ',
                                            40, '๋ถ์',
                                            'ETC') as ๋ถ์์ด๋ฆ
from emp;
```

### [๋ฌธ์ ]

- t_emp2 ํ์ด๋ธ์์ id, jumin ๋ฐ์ดํฐ๋ฅผ ์ถ๋ ฅํ๋
- jumin ์ปฌ๋ผ์ ์์๋ฆฌ๊ฐ 1์ด๋ฉด '๋จ์ฑ' ์ถ๋ ฅ 2์ด๋ฉด '์ฌ์ฑ' 3์ด๋ฉด '์ค์ฑ' ๊ทธ์ธ๋  '๊ธฐํ' ๋ผ๊ณ  ์ถ๋ ฅํ์ธ์
- ์ปฌ๋ผ๋ช์ '์ฑ๋ณ'

```sql
select id, decode(substr(jumin,1,1), 1,'๋จ์ฑ',
                                     2,'์ฌ์ฑ',
                                     3,'์ค์ฑ',
                                     '๊ธฐํ') as ์ฑ๋ณ
from t_emp2;

```

[์ถ๋ ฅ]

![https://user-images.githubusercontent.com/92353613/192666101-6e3dae90-9218-4de9-b0ba-3521907fa190.png](https://user-images.githubusercontent.com/92353613/192666101-6e3dae90-9218-4de9-b0ba-3521907fa190.png)

### [๋ฌธ์ ]

- ๋ถ์๋ฒํธ๊ฐ 20๋ฒ์ธ ์ฌ์์ค์์ SMITH ๋ผ๋ ์ด๋ฆ์ ๊ฐ์ง ์ฌ์์ด๋ผ๋ฉด HELLO ๋ฌธ์ ์ถ๋ ฅํ๊ณ 
- ๋ถ์๋ฒํธ๊ฐ 20๋ฒ์ธ ์ฌ์์ค์์ SMITH ๋ผ๋ ์ด๋ฆ์ ๊ฐ์ง ์ฌ์์ด ์๋๋ผ๋ฉด WORLD ๋ฌธ์ ์ถ๋ ฅํ๊ณ 
- ๋ถ์๋ฒํธ๊ฐ 20๋ฒ์ธ ์ฌ์์ด ์๋๋ผ๋ฉด ETC ๋ผ๋ ๋ฌธ์๋ฅผ ์ถ๋ ฅํ์ธ์

```sql
select empno, deptno, decode(deptno, 20, decode(ename, 'SMITH', 'HELLO',
                                        'WORLD'),'ETC')
from emp;
```

[์ถ๋ ฅ]

![https://user-images.githubusercontent.com/92353613/192668413-25071e72-7faf-4708-9bee-5b191110ecfc.png](https://user-images.githubusercontent.com/92353613/192668413-25071e72-7faf-4708-9bee-5b191110ecfc.png)

## CASE๋ฌธ

---

### [์ฌ์ฉ๋ฒ]

```sql
--ํ์ด๋ธ๋ง๋ค๊ธฐ
create table t_zip
(
    zipcode number(10)
);

select * from t_zip;

--๊ฐ ๋ฃ์ด์ฃผ๊ธฐ
insert into t_zip(zipcode) values(2);
insert into t_zip(zipcode) values(31);
insert into t_zip(zipcode) values(32);
insert into t_zip(zipcode) values(41);
commit;

-- case๋ฌธ ์ฌ์ฉ
select '0' || to_char(zipcode) , case zipcode when 2    then '์์ธ'
                                              when 31   then '๊ฒฝ๊ธฐ'
                                              when 41   then '์ ์ฃผ'
                                              else  '๊ธฐํ์ง์ญ'
                                 end "์ง์ญ์ด๋ฆ"
from t_zip;
```

case ์์ํ ์ด์ ๋ง์ถฐ์ end ์ ์ด์ฃผ๊ณ 

when ์์ํ๊ฑฐ์ ์ญ์ญ ๋ด๋ ค๊ฐ ์ฃผ๋ฉด ์ข๋ค

### [๋ฌธ์ ]

- ์ฌ์ํ์ด๋ธ์์ ์ฌ์๊ธ์ฌ๊ฐ 1000๋ฌ๋ฌ ์ดํ๋ฉด 4๊ธ
- 1001๋ฌ๋ฌ 2000๋ฌ๋ฌ ์ดํ๋ฉด 3๊ธ
- 2001๋ฌ๋ฌ 3000๋ฌ๋ฌ ์ดํ๋ฉด 2๊ธ
- 3001๋ฌ๋ฌ 4000๋ฌ๋ฌ ์ดํ๋ฉด 1๊ธ
- 4001๋ฌ๋ฌ ์ด์์ด๋ฉด 'ํน๊ธ' ์ด๋ผ๋ ๋ฐ์ดํฐ๋ฅผ ์ถ๋ ฅํ์ธ์

```sql
select case when sal <= 1000 then '4๊ธ'
            when sal between 1001 and 2000 then '3๊ธ'
            when sal between 2001 and 3000 then '2๊ธ'
            when sal between 3001 and 4000 then '1๊ธ'
            else 'ํน๊ธ'
       end "๊ธ์" , empno, ename
from emp;
```

[์ถ๋ ฅ]

![https://user-images.githubusercontent.com/92353613/192670088-19318a6a-5bcf-4722-abc9-f84a8f6a1d40.png](https://user-images.githubusercontent.com/92353613/192670088-19318a6a-5bcf-4722-abc9-f84a8f6a1d40.png)

# 2. ์ง๊ณํจ์(๊ทธ๋ฃน) ํจ์

---

-์ค๋ผํด.pdf (p68)

1. count(*) >> row์, count(์ปฌ๋ผ๋ช) >> ๋ฐ์ดํฐ ๊ฑด์ > (null์ ํฌํจํ์ง ์์์)
2. sum()
3. ave()
4. mac()
5. min()

---

์ง๊ณํจ์๋ group by ์ ๊ณผ ๊ฐ์ด ์ฌ์ฉ

๋ชจ๋  ์ง๊ณ ํจ์๋ null๊ฐ์ ๋ฌด์ํ๋ค.

select ์ ์ ์ง๊ณํจ์ ์ด์ธ์ ๋ค๋ฅธ ์ปฌ๋ผ์ด ์ค๋ฉด ๋ฐ๋์ ๊ทธ ์ปฌ๋ผ์ group by ์ ์ ๋ช์

### [์์]

```sql
select count(*) from emp; -- 14๊ฐ์ row  >> 14

select count(empno) from emp; -- >> 14

select count(comm) from emp; -- null๊ฐ์ ์ ์ธํ๊ณ  ์นด์ดํธํจ >> 6
select count(nvl(comm,0)) from emp; --point >> 14
```

### [๊ธ์ฌ์ ํฉ_์์]

```sql
select sum(sal) as ๊ธ์ฌ์ํฉ from emp; -- >> 29025

select round(avg(sal),0) as ๊ธ์ฌ์ํ๊ท  from emp; --round๋ฅผ ์ ์ด์ค์ผ๋ก ์ ์๋ง ํํ >> 2073
```

### [๋ฌธ์ ]

- ์ฌ์ฅ๋ ์ฐ๋ฆฌํ์ ์ด ์๋น์ด ์ผ๋ง๋ ์ง๊ธ ๋์๋

```sql
select sum(comm) from emp;

select trunc(avg(comm)) from emp; -- 721๋ฌ๋ฌ
select trunc(avg(nvl(comm,0))) from emp; -- 309๋ฌ๋ฌ
```

- ์ค๊ฐ์ Null๊ฐ์ ์ธ์ ํ๊ณ  ๋๋ด๋ ์ธ์  ์ํ๊ณ  ๋๋ด๋์ ๋ฐ๋ผ ๊ฐ์ด ๋ฌ๋ผ์ก๋ค.

### [์ง๊ณํจ์ ์์]

```sql
select sum(sal), avg(sal), max(sal), min(sal), count(sal) from emp;
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled.png)

## group by์  ์ด์ฉํ๊ธฐ

---

### [๋ฌธ์ ]

- ์ง์ข๋ณ, ํ๊ท ๊ธ์ฌ, ๊ธ์ฌํฉ, ์ต๋๊ธ์ฌ, ์ต์๊ธ์ฌ, ๊ฑด์๋ฅผ ์ถ๋ ฅํ์ธ์

```sql
select job, avg(sal), sum(sal), max(sal), min(sal), count(sal)
from emp
group by job;
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%201.png)

### [๋ฌธ์ ]

- ๋ถ์๋ณ, ์ง์ข๋ณ, ๊ธ์ฌ์ ํฉ์ ๊ตฌํ์ธ์

```sql
select deptno, job, sum(sal)
from emp
group by deptno, job;
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%202.png)

- ์์๊ฐ์ด ๊ทธ๋ฃน์ ๋๊ฐ ์ด์๋ ์ง์ด์ค ์ ์๋ค.

## ์คํ์์ (์ค์)

select ์        4
from ์         1
where ์       2
group by ์  3
order by ์   5

## Having์  ์ด์ฉํ๊ธฐ

---

### [๋ฌธ์ ]

- ์ง์ข๋ณ ํ๊ท ๊ธ์ฌ๊ฐ 3000๋ฌ๋ฌ ์ด์์ธ ์ฌ์์ ์ง์ข๊ณผ ํ๊ท ๊ธ์ฌ๋ฅผ ์ถ๋ ฅํ์ธ์

```sql
select job, avg(sal) as avgsal
from emp
--where ์กฐ๊ฑด -- ์ง๊ณ๋ ๊ฒฐ๊ณผ๋ฅผ ์กฐ๊ฑด์ ๋ชปํด์
group by job
having  avg(sal) >=3000;-- group by ์กฐ๊ฑด์ 
-- having ์ ์์๋ select ๊ฐ๋ช์นญ์ ์ฌ์ฉ๋ถ๊ฐ. (์คํ์์ ๋๋ฌธ์)
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%203.png)

๋ง์ฝ ์์๊ฐ์ ์ํฉ์์
โ์ง์ข๋ณ ํ๊ท ๊ธ์ฌ๊ฐ 3000๋ฌ๋ฌ ์ด์โ ์ผ๋ก ์๋ฅด๋ ค๋ฉด ์ด๋ป๊ฒ ํด์ผํ ๊น?
where์ ์ฐ๊ฒ๋๋ฉด ์์์ ๊ทธ๋ฃน์ ์ง๊ธฐ์ ์ ์๋ฅด๊ฒ ๋์ด ์ค๋ฅ๊ฐ ๋๊ฒ ๋๋ค.

**๊ทธ๋ ๊ธฐ์ ๋์จ๊ฒ์ด having์ด๋ค.**

having์ ์ด์ฉํ๋ฉด

## ์คํ์์

select         5
from          1
where        2
group by   3
having       4
order by    6

์์๊ฐ ๊ทธ๋ฃน์ ์ง์ด์ค ํ having์ผ๋ก ์๋ฅผ ์๊ฐ ์๊ธฐ ๋๋ฌธ์ ์์ ์ฝ๋๋ก ํ๋ฉด ์ ๋๋ก ์ถ๋ ฅ์ด ๋๋ค.

๊ทธ๋ฆฌ๊ณ  ์์์ ***having์ด select๋ณด๋ค ๋นจ๋ผ*** ๊ฐ๋ช์นญ ์ฌ์ฉ์ด ๋ถ๊ฐํ๋ค. 

**[์ง๊ถ]**

1. from ์กฐ๊ฑด์  where
2. group by ์กฐ๊ฑด์  having

### [๋ฌธ์  1]

- ์ฌ์ํ์ด๋ธ์์ ์ง์ข๋ณ ๊ธ์ฌํฉ์ ์ถ๋ ฅํ๋ ์๋น์ ์ง๊ธ ๋ฐ๊ณ  ๊ธ์ฌ์ ํฉ์ด 5000 ์ด์์ธ
์ฌ์๋ค์ ๋ชฉ๋ก์ ์ถ๋ ฅํ์ธ์
- ๊ธ์ฌ์ ํฉ์ด ๋ฎ์ ์์ผ๋ก ์ถ๋ ฅํ์ธ์

```sql
select job, sum(sal) as samsal
from emp
where comm is not null
group by job
having sum(sal) >= 5000
order by samsal asc;
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%204.png)

### [๋ฌธ์  2]

- ์ฌ์ํ์ด๋ธ์์ ๋ถ์ ์ธ์์ด 4๋ช๋ณด๋ค ๋ง์ ๋ถ์์ ๋ถ์๋ฒํธ, ์ธ์์, ๊ธ์ฌ์ ํฉ์ ์ถ๋ ฅํ์ธ์

```sql
select deptno , count(*) as "๋ถ์๋ณ์ธ์" , sum(sal) as "๋ถ์๋ณ ๊ธ์ฌ์ ํฉ"
from emp
group by deptno
having count(*) > 4;
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%205.png)

### TIP)

```sql
select count(*) from emp where job is null; -- null์ด ์๋์ง ํ์ธํด๋ณด๊ธฐ
```

### [๋ฌธ์  3]

- ์ฌ์ํ์ด๋ธ์์ ์ง์ข๋ณ ๊ธ์ฌ์ ํฉ์ด 5000์ ์ด๊ณผํ๋ ์ง์ข๊ณผ ๊ธ์ฌ์ ํฉ์ ์ถ๋ ฅํ์ธ์
- ๋จ, ํ๋งค์ง์ข(salesman)์ ์ ์ธํ๊ณ  ๊ธ์ฌํฉ์ผ๋ก ๋ด๋ฆผ์ฐจ์ ์ ๋ ฌํ์ธ์

```sql
select job, sum(sal) as "sumsal"
from emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000
order by sum(sal) desc;

```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%206.png)

# 3. JOIN (์กฐ์ธ)

---

์ฌ๋ฌ๊ฐ์ ํ์ด๋ธ์์ ์ํ๋ ๋ฐ์ดํฐ๋ฅผ ์ถ์ถํ๋ ๋ฐฉ๋ฒ

- Cartesian Product ๋ชจ๋  ๊ฐ๋ฅํ ํ๋ค์ Join
- Equijoin Join ์กฐ๊ฑด์ด ์ ํํ ์ผ์นํ๋ ๊ฒฝ์ฐ ์ฌ์ฉ(์ผ๋ฐ์ ์ผ๋ก PK ์ FK ์ฌ์ฉ)
- Non-Equijoin Join ์กฐ๊ฑด์ด ์ ํํ ์ผ์นํ์ง ์๋ ๊ฒฝ์ฐ์ ์ฌ์ฉ(๋ฑ๊ธ,ํ์ )
- Outer Join Join ์กฐ๊ฑด์ด ์ ํํ ์ผ์นํ์ง ์๋ ๊ฒฝ์ฐ์๋ ๋ชจ๋  ํ๋ค์ ์ถ๋ ฅ
- Self Join ํ๋์ ํ์ด๋ธ์์ ํ๋ค์ Join ํ๊ณ ์ ํ  ๊ฒฝ์ฐ์ ์ฌ์ฉ
- Set Operators ์ฌ๋ฌ ๊ฐ์ SELECT ๋ฌธ์ฅ์ ์ฐ๊ฒฐํ์ฌ ์์ฑํ๋ค

## RDBMS (๊ด๊ณํ)

๊ด๊ณ (ํ์ด๋ธ๊ณผ ํ์ด๋ธ๊ณผ์ ๊ด๊ณ)

- 1:1
- 1:N (70%)
- M:N

## ๋ฑ๊ฐ์กฐ์ธ(equl join)

- ์ํ์ด๋ธ๊ณผ ๋์๋๋ ํ์ด๋ธ์ ์๋ ์ปฌ๋ผ์ ๋ฐ์ดํฐ๋ฅผ 1:1 ๋งคํ
    - 1. ๋ฌธ๋ฒ
    - SQL JOIN ๋ฌธ๋ฒ(์ค๋ผํด ๋ฌธ๋ฒ) > ๊ฐ๋จ
    - ANSI ๋ฌธ๋ฒ - ๊ถ์ฅ > ๋ฌด์กฐ๊ฑด > [inner] join on ์กฐ๊ฑด์ 

### [๋ฌธ๋ฒ]

```sql
-- sql ๋ฌธ๋ฒ
select *
from m, s
where m.m1 = s.s1; -- ๊ถ์ฅ์ฌํญ ์๋๋ค

--ANSI ๋ฌธ๋ฒ
select *
from m inner join s
on m.m1 = s.s1;

select *
from m join s -- inner๋ฅผ ๋นผ๋ ์์๋ ๋๊ฐ์
on m.m1 = s.s1; -- join์ ์กฐ๊ฑด์ 
```

์ด ์ดํ๋ถํฐ๋ ANSI๋ฌธ๋ฒ์ผ๋ก ์์ฑํ์์.

### [๋ฌธ์ 1]

- ์ฌ์๋ฒํธ, ์ฌ์์ด๋ฆ, ๋ถ์๋ฒํธ, ๋ถ์์ด๋ฆ์ ์ถ๋ ฅํ์ธ์

```sql
select e.empno, e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%207.png)

### [๋ฌธ์  2]

- ์ฌ๋ฒ, ์ด๋ฆ(last_name), ๋ถ์๋ฒํธ, ๋ถ์์ด๋ฆ์ ์ถ๋ ฅํ์ธ์

```sql
select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;
-- ๋ฌธ์ ์ 
-- ์ฌ์์ 107๋ช (๋๊ตฐ๊ฐ ๋๋ฝ)
select * from employees where department_id is null;
-- ๋ฑ๊ฐ์กฐ์ธ null ์ฒ๋ฆฌ ๋ถ๊ฐ >> ๋ค๋ฅธ ์กฐ์ธ >> ์ ์ ํ์
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%208.png)

์๋๋ 107์ด์ง๋ง ์ถ๋ ฅ์ 106๋ช์ด๋คโฆ
์ด์ ๋ department_id์ค null๊ฐ์ด ์๊ธฐ ๋๋ฌธ์ ์ ์ธํ๊ณ  ์ถ๋ ฅ์ด ๋์๊ธฐ ๋๋ฌธ์ด๋ค.

๋ฌธ์  ํด๊ฒฐ์ ์ฐจ์ฐจ ์๋์์ ํ์ ํ๊ฒ ๋ค.

## ๋น๋ฑ๊ฐ์กฐ์ธ(non-equl join)

---

=> 1:1 ๋ก ๋น๊ตํ  ์ปฌ๋ผ์ด ์๋ค
ex) ์์ [[๋ฌธ์  2]](%F0%9F%93%9A%20Day27_220928%20d10ed3dd25a74236a65e44d874d47e19.md)์์ on e.department_id = d.department_id; ์ด๊ฒ์ฒ๋ผ ๊ฐ์๊ฒ์ด ์์๊ฒฝ์ฐ์ด๋ค.

- ์๋ฏธ๋ง ์กด์ฌ >> ๋ฑ๊ฐ์กฐ์ธ์ ๋ฌธ๋ฒ์ ๊ทธ๋๋ก ์ฌ์ฉ
- 1:1๋งคํ on emp.deptno = dept.deptno

![Untitled](./pictures//Untitled%209.png)

[salgrade ํ์ด๋ธ ๊ฐ]

์ด๊ณณ์์ ์ต์๊ฐ ์ต๋๊ฐ์ด ์ฃผ์ด์ ธ์๊ณ 
๊ฐ์ ๋ฐ๋ผ grade๊ฐ ์ฐ์ ์ด ๋์ด์๋ค.

![Untitled](./pictures/Untitled%2010.png)

[emp ํ์ด๋ธ ๊ฐ]

ํด๋น ์๊ธ์ ๋ฐ๋ผ grade๊ฐ ๋๋์ด์ง๋๋ก ํ  ๊ฒ์ด๋ค.

### [์์]

```sql
select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal;
```

![Untitled](./pictures/Untitled%2011.png)

- ์ด์ฒ๋ผ ๋น๊ตํ  ์ปฌ๋ผ์ด ์์ด๋ ์กฐ์ธ์ด ๊ฐ๋ฅํ๋ค.

## ์ธ๋ถ์กฐ์ธ (outer join)

---

equl join ๋จผ์  ์ ํํ๊ณ  ๋์ + ๋จ์์๋ ๋ฐ์ดํฐ ๊ฐ์ ธ์ค๋ฉด ๋ฉ๋๋ค.

- outer join (์ฃผ์ข๊ด๊ณ ํ์)
- ์ฃผ์ธ์ด ๋๋ ํ์ด๋ธ์ ๋จ์ ๋ฐ์ดํฐ๋ฅผ ๊ฐ์ ธ ์ฌ ์ ์๋ค  -- ๊ฑฐ์ Null๊ฐ ์ถ๋ ฅ๋๋ฌธ์ ๊ฐ์ ธ์ด

### ๋ฌธ๋ฒ

1. left outer join (์ผ์ชฝ์ด ์ฃผ์ธ)
2. right outer join (์ค๋ฅธ์ชฝ ์ฃผ์ธ)
3. full outer join (left, right >> union)

์ด๋ฅผ ํตํด ์์์ ๋งํ [Null ๋๋ฌธ์ ์คํธ๋ ์ค ๋ฐ๋ ๋ฌธ์ ](%F0%9F%93%9A%20Day27_220928%20d10ed3dd25a74236a65e44d874d47e19.md)๋ฅผ ํ ์๊ฐ ์๋ค.

### [๋ฌธ์ ]

- ์ฌ๋ฒ, ์ด๋ฆ(last_name), ๋ถ์๋ฒํธ, ๋ถ์์ด๋ฆ, ์ง์ญ์ฝ๋, ๋์๋ช์ ์ถ๋ ฅํ์์ค

```sql
select e.employee_id,
        e.last_name,
        e.department_id,
        d.department_name
from employees e left join departments d 
on e.department_id = d.department_id;
-- ๋ง์ง๋ง null๊ฐ์ ๊ฐ์ง ํ์๊น์ง ์ถ๋ ฅ ์๋ฃ
```

- from employees e left join departments d
์ ๋ถ๋ถ์์ **โleftโ๋ฅผ** ์์ฑํด ์ค์ผ๋ก์จ null๋ ๋์ค๋๋ก ํ  ์ ์๊ฒ ๋์๋ค.

## ์๊ธฐ์ฐธ์กฐ (self join)

---

๋ฌธ๋ฒ(x) ์๋ฏธ๋ง ์กด์ฌ >> ๋ฑ๊ฐ์กฐ์ธ(๋ฌธ๋ฒ)

- ํ๋์ ํ์ด๋ธ์ ์๋ ์ปฌ๋ผ์ด ์์ ์ ํ์ด๋ธ์ ์๋ ๋ค๋ฅธ ์ปฌ๋ผ์ ์ฐธ์กฐํ๋ ๊ฒฝ์ฐ
- Emp >> Mgr (๊ด๋ฆฌ์)

### [์์]

```sql
select e.empno, e.ename, m.empno, m.ename
from emp e join emp m  -- ๊ฐ๋ช์นญ๋ง ๋ค๋ฅด๊ฒ ํ๋ฉด ๋จ
on e.mgr = m.empno; -- 13๋ช

```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%2012.png)

# ๋ฌธ์ ํ๊ธฐ

### [๋ฌธ์  1]

- ์ฌ์๋ค์ ์ด๋ฆ, ๋ถ์๋ฒํธ, ๋ถ์์ด๋ฆ์ ์ถ๋ ฅํ๋ผ.

```sql
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO;
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%2013.png)

### [๋ฌธ์  2]

- DALLAS์์ ๊ทผ๋ฌดํ๋ ์ฌ์์ ์ด๋ฆ, ์ง์ข, ๋ถ์๋ฒํธ, ๋ถ์์ด๋ฆ์ ์ถ๋ ฅํ๋ผ.

```sql
SELECT E.ENAME, E.JOB, D.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE  D.LOC='DALLAS';
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%2014.png)

### [๋ฌธ์  3]

- ์ด๋ฆ์ 'A'๊ฐ ๋ค์ด๊ฐ๋ ์ฌ์๋ค์ ์ด๋ฆ๊ณผ ๋ถ์์ด๋ฆ์ ์ถ๋ ฅํ๋ผ.

```sql
SELECT E.ENAME, D.DNAME
FROM EMP E  join DEPT D  on D.DEPTNO=E.DEPTNO
WHERE  E.ENAME LIKE '%A%';
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%2015.png)

### [๋ฌธ์  4]

- ์ฌ์์ด๋ฆ๊ณผ ๊ทธ ์ฌ์์ด ์ํ ๋ถ์์ ๋ถ์๋ช, ๊ทธ๋ฆฌ๊ณ  ์๊ธ์ ์ถ๋ ฅํ๋๋ฐ ์๊ธ์ด 3000์ด์์ธ ์ฌ์์ ์ถ๋ ฅํ๋ผ.

```sql
SELECT E.ENAME, D.DNAME, E.SAL 
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.SAL>=3000;
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%2016.png)

### [๋ฌธ์  5]

- ์ง์(์ง์ข)๊ฐ 'SALESMAN'์ธ ์ฌ์๋ค์ ์ง์์ ๊ทธ ์ฌ์์ด๋ฆ, ๊ทธ๋ฆฌ๊ณ  ๊ทธ ์ฌ์์ด ์ํ ๋ถ์ ์ด๋ฆ์ ์ถ๋ ฅํ๋ผ.

```sql
SELECT E.JOB, E.ENAME, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.JOB='SALESMAN';
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%2017.png)

### [๋ฌธ์  6]

- ์ปค๋ฏธ์์ด ์ฑ์ ๋ ์ฌ์๋ค์ ์ฌ์๋ฒํธ, ์ด๋ฆ, ์ฐ๋ด, ์ฐ๋ด+์ปค๋ฏธ์,
- ๊ธ์ฌ๋ฑ๊ธ์ ์ถ๋ ฅํ๋, ๊ฐ๊ฐ์ ์ปฌ๋ผ๋ช์ '์ฌ์๋ฒํธ', '์ฌ์์ด๋ฆ',
- '์ฐ๋ด','์ค๊ธ์ฌ', '๊ธ์ฌ๋ฑ๊ธ'์ผ๋ก ํ์ฌ ์ถ๋ ฅํ๋ผ.
- (๋น๋ฑ๊ฐ ) 1 : 1 ๋งคํ ๋๋ ์ปฌ๋ผ์ด ์๋ค.

```sql
SELECT         E.EMPNO AS "์ฌ์๋ฒํธ",
               E.ENAME AS "์ฌ์์ด๋ฆ",
               E.SAL*12 AS "์ฐ๋ด",
           --E.SAL*12+NVL(COMM,0) AS "์ค๊ธ์ฌ",
               E.SAL*12+COMM AS "์ค๊ธ์ฌ",
               S.GRADE AS "๊ธ์ฌ๋ฑ๊ธ"
FROM EMP E  join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.Comm is not null;
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%2018.png)

### [๋ฌธ์  7]

- ๋ถ์๋ฒํธ๊ฐ 10๋ฒ์ธ ์ฌ์๋ค์ ๋ถ์๋ฒํธ, ๋ถ์์ด๋ฆ, ์ฌ์์ด๋ฆ, ์๊ธ, ๊ธ์ฌ๋ฑ๊ธ์ ์ถ๋ ฅํ๋ผ.

```sql
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
            join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO=10;
 
SELECT * FROM SALGRADE;
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%2019.png)

### [๋ฌธ์  8]

- ๋ถ์๋ฒํธ๊ฐ 10๋ฒ, 20๋ฒ์ธ ์ฌ์๋ค์ ๋ถ์๋ฒํธ, ๋ถ์์ด๋ฆ,
- ์ฌ์์ด๋ฆ, ์๊ธ, ๊ธ์ฌ๋ฑ๊ธ์ ์ถ๋ ฅํ๋ผ. ๊ทธ๋ฆฌ๊ณ  ๊ทธ ์ถ๋ ฅ๋
- ๊ฒฐ๊ณผ๋ฌผ์ ๋ถ์๋ฒํธ๊ฐ ๋ฎ์ ์์ผ๋ก, ์๊ธ์ด ๋์ ์์ผ๋ก ์ ๋ ฌํ๋ผ.

```sql
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E  join DEPT D        on E.DEPTNO=D.DEPTNO
            join SALGRADE S    on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO IN (10,20) -- WHERE  E.DEPTNO<=20  -- e.deptno = 10 or 
ORDER BY E.DEPTNO ASC,  E.SAL DESC;
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%2020.png)

### [๋ฌธ์  9]

- ์ฌ์๋ฒํธ์ ์ฌ์์ด๋ฆ, ๊ทธ๋ฆฌ๊ณ  ๊ทธ ์ฌ์์ ๊ด๋ฆฌํ๋ ๊ด๋ฆฌ์์
- ์ฌ์๋ฒํธ์ ์ฌ์์ด๋ฆ์ ์ถ๋ ฅํ๋ ๊ฐ๊ฐ์ ์ปฌ๋ผ๋ช์ '์ฌ์๋ฒํธ',
- '์ฌ์์ด๋ฆ', '๊ด๋ฆฌ์๋ฒํธ', '๊ด๋ฆฌ์์ด๋ฆ'์ผ๋ก ํ์ฌ ์ถ๋ ฅํ๋ผ.
- SELF JOIN (์๊ธฐ ์์ ํ์ด๋ธ์ ์ปฌ๋ผ์ ์ฐธ์กฐ ํ๋ ๊ฒฝ์ฐ)

```sql
SELECT E.EMPNO, E.ENAME , M.EMPNO, M.ENAME
FROM EMP E  left outer join EMP M
on e.MGR = m.EMPNO;
```

[์ถ๋ ฅ]

![Untitled](./pictures/Untitled%2021.png)

# ๊ธฐํ

---

- -NATURAL JOIN
--Equijoin๊ณผ ๋์ผํ๋ค๊ณ  ๋ณด์๋ฉด ๋ฉ๋๋ค.
-- [๋ ํ์ด๋ธ]์ [๋์ผํ ์ด๋ฆ]์ ๊ฐ์ง๋ ์นผ๋ผ์ [๋ชจ๋ ์กฐ์ธ]์ด ๋ฉ๋๋ค.

```sql
SELECT empno, ename, deptno , dname FROM emp NATURAL JOIN dept ;
```

- -JOIN ~ USING
--NATURAL JOIN์ ๋จ์ ์ ๋์ผํ ์ด๋ฆ์ ๊ฐ์ง๋ ์นผ๋ผ์ ๋ชจ๋ ์กฐ์ธ์ด ๋์๋๋ฐ
--USING ๋ฌธ์ ์ฌ์ฉํ๋ฉด ์ปฌ๋ผ์ ์ ํํด์ ์กฐ์ธ์ ํ  ์๊ฐ ์์ต๋๋ค.

```sql
SELECT e.empno, e.ename, deptno , dname FROM emp e JOIN dept d USING(deptno);
```

- -์กฐ์ธ ์กฐ๊ฑด์ด ์๋ ์กฐ์ธ๊ฒฐ๊ณผ

```sql
select * from emp , dept;
```
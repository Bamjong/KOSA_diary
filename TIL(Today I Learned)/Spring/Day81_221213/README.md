# π Day81_221213

Author: κ³ λ²μ’
Created Time: 2022λ 12μ 13μΌ μ€ν 2:06
Status: π¨ Published
Updated Time: 2022λ 12μ 13μΌ μ€ν 9:29

# 1. Maven

### μ€μΉλ°©λ²

μ΄ν΄λ¦½μ€ κΈ°μ€

- Spring Legacy Projectλ₯Ό ν΅ν΄ μλ‘μ΄ νλ‘μ νΈ λ§λ€κΈ°
- κΈ°μ‘΄ μλ νμΌμ Configure β Convert to Maven Project μ€μ νκΈ°

### λ€μ΄λ νμΌκ²½λ‘λ μ΄λμΈκ°μ?

MavenμΌλ‘ λ€μ΄ν ν΄λλ 

```java
C:\Users\μ¬μ©μ\.m2\repository

μ΄κ³³μμμ!
```

### λμ²΄ μ΄λκ²½λ‘λ‘ μ΄λμ λ€μ΄λ°μμ Έ μ€λμ?

Maven Repository μμ νμΌμ΄ λ±λ‘λμμ΄μΌ μ€μ μ΄ κ°λ₯

[](https://mvnrepository.com/)

### κ·ΈλΌ μ΄λ»κ² μ€μ νλ©΄ λ κΉμ?

![https://user-images.githubusercontent.com/92353613/207234544-f67a4997-da9e-4e4f-a1d1-3b4db81e7a1a.png](https://user-images.githubusercontent.com/92353613/207234544-f67a4997-da9e-4e4f-a1d1-3b4db81e7a1a.png)

```java
pom.xml νμΌμ ν΅ν΄ μμ ν©λλ€
```

# 2. Mybatis

Ibaties β Mybatis λ²μ μ λμμ

### Mybatisλ?

- κ°λ°μκ° μ§μ ν SQL, μ μ₯νλ‘μμ  κ·Έλ¦¬κ³  λͺκ°μ§ κ³ κΈ λ§€νμ μ§μνλ νΌμμ€ν΄μ€ νλ μμν¬μ΄λ€.
- λ§μ΄λ°ν°μ€λ JDBCλ‘ μ²λ¦¬νλ μλΉλΆλΆμ μ½λμ νλΌλ―Έν° μ€μ λ° κ²°κ³Ό λ§€νμ λμ ν΄μ€λ€.
- λ§μ΄λ°ν°μ€λ λ°μ΄ν°λ² μ΄μ€ λ μ½λμ μμνμκ³Ό Map μΈν°νμ΄μ€ κ·Έλ¦¬κ³  μλ° POJO λ₯Ό μ€μ ν΄μ λ§€ννκΈ° μν΄ XMLκ³Ό μ λΈνμ΄μμ μ¬μ©ν  μ μλ€.

[MyBatis - λ§μ΄λ°ν°μ€ 3 | μκ°](https://mybatis.org/mybatis-3/ko/index.html)

### μ€μ μ μ΄λ»κ² νλμ?

![https://user-images.githubusercontent.com/92353613/207246720-4870356c-9718-4ed7-9f1e-6806fa7d82af.png](https://user-images.githubusercontent.com/92353613/207246720-4870356c-9718-4ed7-9f1e-6806fa7d82af.png)

μμκ°μ΄ sqlMapConfig.xml νμΌμμ μ°κ²°μ ν΄μ€λ€.

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE sqlMapConfig
PUBLIC "-//ibatis.apache.org//DTD SQL Map Config 2.0//EN"
"http://ibatis.apache.org/dtd/sql-map-config-2.dtd">
<sqlMapConfig>
	<transactionManager type="JDBC" commitRequired="true">
		<dataSource type="SIMPLE">
			<property name="JDBC.Driver" value="oracle.jdbc.driver.OracleDriver"/>
			<property name="JDBC.ConnectionURL" value="jdbc:oracle:thin:@localhost:1521:XE"/>
			<property name="JDBC.Username" value="bituser"/>
			<property name="JDBC.Password" value="1004"/>
		</dataSource>	
	</transactionManager>
	<sqlMap resource="Config/member.xml" />
</sqlMapConfig>
```

## TIP)

**DBμ Inputκ³Ό μ»¬λΌλͺμ΄ κ°μΌλ©΄ μλλμμ΄ λλ€.**

```xml
*** KEY POINT ***
		 select * from guest where name like '%hong%'
		 
		 # [νμ]μ λν μ²λ¦¬ : where name=#name# > name='κΉμ μ ' (DB μΏΌλ¦¬κ° μ€νμ 'name')
		
		>>ibatis >> #name#
		 >>Mybatis >> #{name}
		 
		 
		 # [νμ]μ λν μ²λ¦¬ : where age=#age# > age=100
		
		
		 $ μλ κ·Έλλ‘ μΆλ ₯ : where name=$name$ > name=κΉμ μ  
		 >>Mybatis >> ${name}  >> #{name}
		 
		 
		 parameterClass="String" > #name# > νκΈΈλ > κ²°κ³Ό : 'νκΈΈλ'
		 >where ename like '%#name#%' > '%'νκΈΈλ'%'  (x)
		 
		 parameterClass="String" > $name$ > νκΈΈλ > κ²°κ³Ό : νκΈΈλ
	     >where ename like '%$name$%' > '%νκΈΈλ%'
	     
	     >> int >> #a# >> 100
	     >> String >> #a# >> '100'
	     
	     >> input 100
	     >> int >> $a$ >> 100
	     >> String >> $a$ >> 100
	    
	     μ»¬λΌλͺ , νμ΄λΈλͺ > $μ»¬λΌλͺ$
	     
	     select #{ename}  >> select 'ename'
	     
	     select ${ename}  >>  select ename ...
```

- β#βμ μ°λ©΄ νμμΌλ‘ μλ λ³ν
- β$βμ μ°λ©΄ μλ κ·Έλλ‘ λ€μ΄κ° (Likeλ¬Έ μΈλ ββ μλ€μ΄κ°μ λ¬΄μ‘°κ±΄ μ κ²½μ¨μΌν¨)

# 3. MyBatis β

- νμ΅μ¬μ΄νΈ : [https://mybatis.org/mybatis-3/ko/index.html](https://mybatis.org/mybatis-3/ko/index.html)
- λ§μ΄λ°ν°μ€λ κ°λ°μκ° μ§μ ν SQL, μ μ₯νλ‘μμ  κ·Έλ¦¬κ³  λͺκ°μ§ κ³ κΈ λ§€νμ μ§μνλ νΌμμ€ν΄μ€ νλ μμν¬
- λ§μ΄λ°ν°μ€λ JDBCλ‘ μ²λ¦¬νλ μλΉλΆλΆμ μ½λμ νλΌλ―Έν° μ€μ λ° κ²°κ³Ό λ§€νμ λμ ν΄μ€λ€.
- λ§μ΄λ°ν°μ€λ λ°μ΄ν°λ² μ΄μ€ λ μ½λμ μμνμκ³Ό Map μΈν°νμ΄μ€ κ·Έλ¦¬κ³  μλ° POJO λ₯Ό μ€μ ν΄μ λ§€ννκΈ° μν΄ XMLκ³Ό μ λΈνμ΄μμ μ¬μ©ν  μ μλ€.

### λ΄μΌ μ§λ λκ°μ~!

# 4. IBatis β

## 1) λ°©λ² 1 : ν xml μμμ λ€ μ²λ¦¬νκΈ°

### [SqlMapConfig.xml]

- μ μΌλ¨Όμ  μ€ν...

```
<sqlMapConfig>
	<transactionManager type="JDBC" commitRequired="true">
		<dataSource type="SIMPLE">
			<property name="JDBC.Driver" value="oracle.jdbc.driver.OracleDriver"/>
			<property name="JDBC.ConnectionURL" value="jdbc:oracle:thin:@localhost:1521:XE"/>
			<property name="JDBC.Username" value="bituser"/>
			<property name="JDBC.Password" value="1004"/>
		</dataSource>
	</transactionManager>
	<sqlMap resource="Config/member.xml" />
</sqlMapConfig>

```

- DBμμ μ°κ²°
<br>

## 2) λ°©λ² 2 : λ xmlμΌλ‘ λλκΈ°

### [SqlMapConfig.xml]

```
<sqlMapConfig>
	<properties resource="kosta/ibatis/sqlmap/SqlMapConnection.properties" />

	<transactionManager type="JDBC">
		<dataSource type="SIMPLE">
			<property name="JDBC.Driver" value="${driver}"/>
			<property name="JDBC.ConnectionURL" value="${url}"/>
			<property name="JDBC.Username" value="${username}" />
			<property name="JDBC.Password" value="${password}"/>
		</dataSource>
	</transactionManager>
	<sqlMap resource="kosta/ibatis/sqlmap/User.xml" />

</sqlMapConfig>

```

- valueκ°μ parameterλ‘ λ°μμ€κΈ°
<br>

### [SqlMapConnection.properties]

```
driver=oracle.jdbc.driver.OracleDriver
url=jdbc:oracle:thin:@localhost:1521:XE
username=springuser
password=1004

```

- parameter κ° μ κ³΅ν¨

### κ΅³μ΄ μ΄λ κ² νλ μ΄μ λβ

λ³΄μμμ μ΄μ λ‘ μ¬μ©μμκ² μ¨κΈ°κ³  μΆμ μ λ³΄μ΄κΈ° λλ¬Έ! κΉμ μ¬λ¦΄ λλ git ignoreλ‘ μ²λ¦¬ κ°λ₯<br>

### [μΏΌλ¦¬λ¬Έλ΄λ.xml]

```
<!-- ORM κ°μ²΄ λ§€ν  Framework
     input  parameter > java bean  void insert(Board board){}
     output parameter > java bean  Board select(){}
       κΈ°μ‘΄μ SQL κ΅¬λ¬Έμ Map νμΌ κ΅¬ν

  select μ€ν ->    Ibatis.dto.Emp  -> Emp κ°μ²΄ μμ± -> setter (μλ μ£Όμ) -> Emp κ°μ²΄ μ£Όμ λ¦¬ν΄
 -->
 <sqlMap>
  	<select id="selectEmp" parameterClass="java.lang.String" resultClass="Ibatis.dto.Emp">
 		select empno,ename,job,sal
 		from emp
 		where ename=#ename#
 	</select>
 	<insert id="insertEmp" parameterClass="Ibatis.dto.Emp">
 		insert into emp(empno,ename,job,sal)
 		values(#empno#,#ename#,#job#,#sal#)
 	</insert>
 </sqlMap>

```

- id : DAOμμ λΆλ¬μ¬ λ©μλμμ μ§μ ν΄μ€ κ°κ³Ό κ°μμΌν¨
- parameterClass="java.lang.String" : λ¬Έμμ΄ν, μΈνΈν (java.lang.int)
- resultClass="Ibatis.dto.Emp" : λΆλ¬μ¬ DTOμ κ²½λ‘
- '#' : Ibatisλ₯Ό μ¬μ©νκ² μ, '' λΆμ¬μ£Όκ² μ

```
<!-- κ°λͺμΉ­μ λΆμ¬ν΄μ κ°μ²΄μ λ³μΉ­μ λΆμ¬  -->
<typeAlias alias="user" type="kosta.ibatis.dto.UserDto"/>

```

- λ§μ½ DTO μ΄λ¦μ΄ λλ¬΄ κΈΈ λλ μ μ½λμ²λΌ κ²ΉμΉλ λΆλΆμ λΉΌμ alias= " "μΌλ‘ μ μ₯ν΄ μλ μΉκ΅¬λ€μ resultClassλ₯Ό κ°λ¨νκ² μ μ΄μ€ μ μμ (κ°λ°μλ κ·μ°?λ€)

```
*** KEY POINT ***
    select * from guest where name like '%hong%'
  1) # [νμ]μ λν μ²λ¦¬ : where name=#name# > name='κΉμ μ ' (DB μΏΌλ¦¬κ° μ€νμ 'name')
     >>ibatis >> #name#
     >>Mybatis >> #{name}

    # [νμ]μ λν μ²λ¦¬ : where age=#age# > age=100

  2) $ μλ κ·Έλλ‘ μΆλ ₯ : where name=$name$ > name=κΉμ μ 
    >>Mybatis >> ${name}  >> #{name}

    parameterClass="String" > #name# > νκΈΈλ > κ²°κ³Ό : 'νκΈΈλ'
    >where ename like '%#name#%' > '%'νκΈΈλ'%'  (x)

    parameterClass="String" > $name$ > νκΈΈλ > κ²°κ³Ό : νκΈΈλ
    >where ename like '%$name$%' > '%νκΈΈλ%'

    >> int >> #a# >> 100
    >> String >> #a# >> '100'

    >> input 100
    >> int >> $a$ >> 100
    >> String >> $a$ >> 100

    μ»¬λΌλͺ , νμ΄λΈλͺ > $μ»¬λΌλͺ$

    select #{ename}  >> select 'ename'

    select ${ename}  >>  select ename ...

      <select id="getGuestSearch" resultMap="guestResult">
	  	select * from guest where name like '%$value$%'
	  </select>

```

- queryλ¬Έμμ like μΈ λ μ£ΌμνκΈ° β
<br>

### [DAO.java]

```
public void insertEmp(Emp e) throws SQLException {
    //values(?,?,?,?)
    //pstmt.setInt(e.getEmpno())
    //pstmt.setString(e.getEname()) ...
        sqlMap.insert("insertEmp",e);
}
public Emp SelectEmp(String ename) throws SQLException {

    return (Emp)sqlMap.queryForObject("selectEmp",ename);

    //Emp e = new Emp();
    //e.setEmpno(rs.getInt(1));
    //.....
}

```

- μλλ DAOμμ queryλ¬Έμ μ μ΄μ£Όκ³  νλ€λ©΄, μ΄μ λ queryλ¬Έμ 'μΏΌλ¦¬λ¬Έμλ΄λ.xml'μ λ°λ‘ λΉΌμ κ΄λ¦¬νλ€κ³  μκ°νλ©΄ λ  λ―
- λμ  id κ°κ³Ό column λͺμ μΌμΉμμΌμ£Όλ κ²μ΄ μ€μν¨
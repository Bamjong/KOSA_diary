# 📚 Day81_221213

Author: 고범종
Created Time: 2022년 12월 13일 오후 2:06
Status: 🖨 Published
Updated Time: 2022년 12월 13일 오후 9:29

# 1. Maven

### 설치방법

이클립스 기준

- Spring Legacy Project를 통해 새로운 프로젝트 만들기
- 기존 있던 파일에 Configure → Convert to Maven Project 설정하기

### 다운된 파일경로는 어디인가요?

Maven으로 다운한 폴더는 

```java
C:\Users\사용자\.m2\repository

이곳에있음!
```

### 대체 어느경로로 어디서 다운받아져 오나요?

Maven Repository 안에 파일이 등록되있어야 설정이 가능

[](https://mvnrepository.com/)

### 그럼 어떻게 설정하면 될까요?

![https://user-images.githubusercontent.com/92353613/207234544-f67a4997-da9e-4e4f-a1d1-3b4db81e7a1a.png](https://user-images.githubusercontent.com/92353613/207234544-f67a4997-da9e-4e4f-a1d1-3b4db81e7a1a.png)

```java
pom.xml 파일을 통해 수정합니다
```

# 2. Mybatis

Ibaties → Mybatis 버전업 되었음

### Mybatis란?

- 개발자가 지정한 SQL, 저장프로시저 그리고 몇가지 고급 매핑을 지원하는 퍼시스턴스 프레임워크이다.
- 마이바티스는 JDBC로 처리하는 상당부분의 코드와 파라미터 설정및 결과 매핑을 대신해준다.
- 마이바티스는 데이터베이스 레코드에 원시타입과 Map 인터페이스 그리고 자바 POJO 를 설정해서 매핑하기 위해 XML과 애노테이션을 사용할 수 있다.

[MyBatis - 마이바티스 3 | 소개](https://mybatis.org/mybatis-3/ko/index.html)

### 설정은 어떻게 하나요?

![https://user-images.githubusercontent.com/92353613/207246720-4870356c-9718-4ed7-9f1e-6806fa7d82af.png](https://user-images.githubusercontent.com/92353613/207246720-4870356c-9718-4ed7-9f1e-6806fa7d82af.png)

위와같이 sqlMapConfig.xml 파일에서 연결을 해준다.

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

**DB와 Input과 컬럼명이 같으면 자동대입이 된다.**

```xml
*** KEY POINT ***
		 select * from guest where name like '%hong%'
		 
		 # [타입]에 대한 처리 : where name=#name# > name='김유신' (DB 쿼리가 실행시 'name')
		
		>>ibatis >> #name#
		 >>Mybatis >> #{name}
		 
		 
		 # [타입]에 대한 처리 : where age=#age# > age=100
		
		
		 $ 있는 그래로 출력 : where name=$name$ > name=김유신 
		 >>Mybatis >> ${name}  >> #{name}
		 
		 
		 parameterClass="String" > #name# > 홍길동 > 결과 : '홍길동'
		 >where ename like '%#name#%' > '%'홍길동'%'  (x)
		 
		 parameterClass="String" > $name$ > 홍길동 > 결과 : 홍길동
	     >where ename like '%$name$%' > '%홍길동%'
	     
	     >> int >> #a# >> 100
	     >> String >> #a# >> '100'
	     
	     >> input 100
	     >> int >> $a$ >> 100
	     >> String >> $a$ >> 100
	    
	     컬럼명 , 테이블명 > $컬럼명$
	     
	     select #{ename}  >> select 'ename'
	     
	     select ${ename}  >>  select ename ...
```

- ‘#’을 쓰면 타입으로 자동 변환
- ‘$’을 쓰면 있는 그대로 들어감 (Like문 쓸때 ‘’ 안들어가서 무조건 신경써야함)

# 3. MyBatis ✔

- 학습사이트 : [https://mybatis.org/mybatis-3/ko/index.html](https://mybatis.org/mybatis-3/ko/index.html)
- 마이바티스는 개발자가 지정한 SQL, 저장프로시저 그리고 몇가지 고급 매핑을 지원하는 퍼시스턴스 프레임워크
- 마이바티스는 JDBC로 처리하는 상당부분의 코드와 파라미터 설정및 결과 매핑을 대신해준다.
- 마이바티스는 데이터베이스 레코드에 원시타입과 Map 인터페이스 그리고 자바 POJO 를 설정해서 매핑하기 위해 XML과 애노테이션을 사용할 수 있다.

### 내일 진도 나가요~!

# 4. IBatis ✔

## 1) 방법 1 : 한 xml 안에서 다 처리하기

### [SqlMapConfig.xml]

- 제일먼저 실행...

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

- DB와의 연결
<br>

## 2) 방법 2 : 두 xml으로 나누기

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

- value값을 parameter로 받아오기
<br>

### [SqlMapConnection.properties]

```
driver=oracle.jdbc.driver.OracleDriver
url=jdbc:oracle:thin:@localhost:1521:XE
username=springuser
password=1004

```

- parameter 값 제공함

### 굳이 이렇게 하는 이유는❓

보안상의 이유로 사용자에게 숨기고 싶은 정보이기 때문! 깃에 올릴 때도 git ignore로 처리 가능<br>

### [쿼리문담는.xml]

```
<!-- ORM 객체 매핑  Framework
     input  parameter > java bean  void insert(Board board){}
     output parameter > java bean  Board select(){}
       기존의 SQL 구문은 Map 파일 구현

  select 실행 ->    Ibatis.dto.Emp  -> Emp 객체 생성 -> setter (자동 주입) -> Emp 객체 주소 리턴
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

- id : DAO에서 불러올 메소드에서 지정해준 값과 같아야함
- parameterClass="java.lang.String" : 문자열화, 인트화 (java.lang.int)
- resultClass="Ibatis.dto.Emp" : 불러올 DTO의 경로
- '#' : Ibatis를 사용하겠음, '' 붙여주겠음

```
<!-- 가명칭을 부여해서 객체의 별칭을 부여  -->
<typeAlias alias="user" type="kosta.ibatis.dto.UserDto"/>

```

- 만약 DTO 이름이 너무 길 때는 위 코드처럼 겹치는 부분을 빼서 alias= " "으로 저장해 아래 친구들의 resultClass를 간단하게 적어줄 수 있음 (개발자는 귀찮다)

```
*** KEY POINT ***
    select * from guest where name like '%hong%'
  1) # [타입]에 대한 처리 : where name=#name# > name='김유신' (DB 쿼리가 실행시 'name')
     >>ibatis >> #name#
     >>Mybatis >> #{name}

    # [타입]에 대한 처리 : where age=#age# > age=100

  2) $ 있는 그래로 출력 : where name=$name$ > name=김유신
    >>Mybatis >> ${name}  >> #{name}

    parameterClass="String" > #name# > 홍길동 > 결과 : '홍길동'
    >where ename like '%#name#%' > '%'홍길동'%'  (x)

    parameterClass="String" > $name$ > 홍길동 > 결과 : 홍길동
    >where ename like '%$name$%' > '%홍길동%'

    >> int >> #a# >> 100
    >> String >> #a# >> '100'

    >> input 100
    >> int >> $a$ >> 100
    >> String >> $a$ >> 100

    컬럼명 , 테이블명 > $컬럼명$

    select #{ename}  >> select 'ename'

    select ${ename}  >>  select ename ...

      <select id="getGuestSearch" resultMap="guestResult">
	  	select * from guest where name like '%$value$%'
	  </select>

```

- query문에서 like 쓸 때 주의하기 ❗
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

- 원래는 DAO에서 query문을 적어주고 했다면, 이제는 query문을 '쿼리문을담는.xml'에 따로 빼서 관리한다고 생각하면 될 듯
- 대신 id 값과 column 명을 일치시켜주는 것이 중요함
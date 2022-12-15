# 📚 Day83_221215

Author: 고범종
Created Time: 2022년 12월 15일 오전 9:21
Status: 🖨 Published
Tags: Connection Pool, DriverSpy, Spring
Updated Time: 2022년 12월 15일 오전 10:22

# 1. DriverSpy

Log4jdbc는 스프링에서 SQL문을 실행한 로그를 효과적이고 직관적으로 볼 수 있도록 해주는 라이브러리입니다

### 순서

```java
1.
pom.xml
		<!-- SQL LOG  -->
		<dependency>
		    <groupId>org.bgee.log4jdbc-log4j2</groupId>
		    <artifactId>log4jdbc-log4j2-jdbc4</artifactId>
		    <version>1.16</version>
		</dependency>
추가하기

2.
DB연결 설정에서 DriverSpy 적용하기
<!-- <property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" /> -->
 	<property name="driverClassName" value="net.sf.log4jdbc.sql.jdbcapi.DriverSpy" />
 	<property name="url" value="jdbc:log4jdbc:oracle:thin:@localhost:1521:XE" />
 	
3.설정파일 
log4j.xml 같은 경로에
log4jdbc.log4j2.properties 파일 생성

log4jdbc.spylogdelegator.name=net.sf.log4jdbc.log.slf4j.Slf4jSpyLogDelegator

xml 추가
<!-- SQL Logger -->

	<logger name="jdbc.sqltiming" additivity="false">
		<level value="warn" />
		<appender-ref ref="console"/> 
	</logger>
	<logger name="jdbc.sqlonly" additivity="false"> 
		<level value="info"/> 
		<appender-ref ref="console"/> 
	</logger>
	<logger name="jdbc.audit" additivity="false"> 
		<level value="warn"/>  
		<appender-ref ref="console"/> 
	</logger> 
	<logger name="jdbc.resultset" additivity="false">
		<level value="warn" />
		<appender-ref ref="console"/> 
	</logger>
	<logger name="jdbc.resultsettable" additivity="false"> 
		<level value="info"/>  
		<appender-ref ref="console"/> 
	</logger>
```

### 결과)

![https://user-images.githubusercontent.com/92353613/207745757-3dad3e64-b091-47ba-970f-192915a824a1.png](https://user-images.githubusercontent.com/92353613/207745757-3dad3e64-b091-47ba-970f-192915a824a1.png)

이런식으로 콘솔창에 뜨므로 디버깅하기 편함

하지만 최종 배포할땐 빼고 올리도록.

---

# 2. **Connection Pool**

[Spring - 이론 + 설정하기(HikariCP, MyBatis)](https://velog.io/@cyhse7/Spring-%EC%9D%B4%EB%A1%A0-%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0HikariCP-MyBatis)

일정량의 Connection 객체(DB 연결 객체)를 미리 만들어서 pool에 저장해놓고, 요청이 왔을 때 객체를 사용할 수 있도록 빌려줬다가, 일이 끝나면 다시 돌려받아 pool에 저장하는 기법

![https://velog.velcdn.com/images%2Fcyhse7%2Fpost%2F7f115962-8b52-4325-bb41-ecf897de1089%2Fimage.png](https://velog.velcdn.com/images%2Fcyhse7%2Fpost%2F7f115962-8b52-4325-bb41-ecf897de1089%2Fimage.png)

### 1. 장점

- 보통 DB 접근의 경우 객체를 생성 후 사용하고 하나씩 다시 삭제를 해줘야 하는데, 커넥션 풀을 사용할 경우 객체를 미리 만들어놓고 사용하기 때문에 불필요한 생성과 삭제에 드는 메모리 차지를 줄일 수 있다.> 불필요한 작업의 반복 (커넥션 생성, 삭제 반복)이 사라지기 때문에 성능과 속도 향상을 기대할 수 있다

### 2. 주의할 점

- 커넥션은 적정량만 저장해 놓고 사용하기- 커넥션을 적게 생성 : 한정된 커넥션 내에서 사용해야 하기 때문에 너무 많은 DB가 접근시 사용중인 커넥션이 반납될 때 까지 기다려야 한다- 커넥션을 많이 생성 : 커넥션 또한 객체이기 때문에 많은 메모리를 차지할 수 밖에 없다. 따라서 쓸데없이 많은 커넥션은 프로그램의 성능을 저하시키는 원인이 될 수 있다

### 순서

pom.xml

```java
<!-- Connection POOL 히카리 -->	
    <dependency>
		<groupId>com.zaxxer</groupId>
		<artifactId>HikariCP</artifactId>
		<version>3.4.5</version>
	</dependency>
```
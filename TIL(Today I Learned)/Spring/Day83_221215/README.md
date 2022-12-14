# ๐ Day83_221215

Author: ๊ณ ๋ฒ์ข
Created Time: 2022๋ 12์ 15์ผ ์ค์  9:21
Status: ๐จ Published
Tags: Connection Pool, DriverSpy, Spring
Updated Time: 2022๋ 12์ 15์ผ ์ค์  10:22

# 1. DriverSpy

Log4jdbc๋ ์คํ๋ง์์ SQL๋ฌธ์ ์คํํ ๋ก๊ทธ๋ฅผ ํจ๊ณผ์ ์ด๊ณ  ์ง๊ด์ ์ผ๋ก ๋ณผ ์ ์๋๋ก ํด์ฃผ๋ ๋ผ์ด๋ธ๋ฌ๋ฆฌ์๋๋ค

### ์์

```java
1.
pom.xml
		<!-- SQL LOG  -->
		<dependency>
		    <groupId>org.bgee.log4jdbc-log4j2</groupId>
		    <artifactId>log4jdbc-log4j2-jdbc4</artifactId>
		    <version>1.16</version>
		</dependency>
์ถ๊ฐํ๊ธฐ

2.
DB์ฐ๊ฒฐ ์ค์ ์์ DriverSpy ์ ์ฉํ๊ธฐ
<!-- <property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" /> -->
 	<property name="driverClassName" value="net.sf.log4jdbc.sql.jdbcapi.DriverSpy" />
 	<property name="url" value="jdbc:log4jdbc:oracle:thin:@localhost:1521:XE" />
 	
3.์ค์ ํ์ผ 
log4j.xml ๊ฐ์ ๊ฒฝ๋ก์
log4jdbc.log4j2.properties ํ์ผ ์์ฑ

log4jdbc.spylogdelegator.name=net.sf.log4jdbc.log.slf4j.Slf4jSpyLogDelegator

xml ์ถ๊ฐ
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

### ๊ฒฐ๊ณผ)

![https://user-images.githubusercontent.com/92353613/207745757-3dad3e64-b091-47ba-970f-192915a824a1.png](https://user-images.githubusercontent.com/92353613/207745757-3dad3e64-b091-47ba-970f-192915a824a1.png)

์ด๋ฐ์์ผ๋ก ์ฝ์์ฐฝ์ ๋จ๋ฏ๋ก ๋๋ฒ๊นํ๊ธฐ ํธํจ

ํ์ง๋ง ์ต์ข ๋ฐฐํฌํ ๋ ๋นผ๊ณ  ์ฌ๋ฆฌ๋๋ก.

---

# 2. **Connection Pool**

[Spring - ์ด๋ก  + ์ค์ ํ๊ธฐ(HikariCP, MyBatis)](https://velog.io/@cyhse7/Spring-%EC%9D%B4%EB%A1%A0-%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0HikariCP-MyBatis)

์ผ์ ๋์ Connection ๊ฐ์ฒด(DB ์ฐ๊ฒฐ ๊ฐ์ฒด)๋ฅผ ๋ฏธ๋ฆฌ ๋ง๋ค์ด์ pool์ ์ ์ฅํด๋๊ณ , ์์ฒญ์ด ์์ ๋ ๊ฐ์ฒด๋ฅผ ์ฌ์ฉํ  ์ ์๋๋ก ๋น๋ ค์คฌ๋ค๊ฐ, ์ผ์ด ๋๋๋ฉด ๋ค์ ๋๋ ค๋ฐ์ pool์ ์ ์ฅํ๋ ๊ธฐ๋ฒ

![https://velog.velcdn.com/images%2Fcyhse7%2Fpost%2F7f115962-8b52-4325-bb41-ecf897de1089%2Fimage.png](https://velog.velcdn.com/images%2Fcyhse7%2Fpost%2F7f115962-8b52-4325-bb41-ecf897de1089%2Fimage.png)

### 1. ์ฅ์ 

- ๋ณดํต DB ์ ๊ทผ์ ๊ฒฝ์ฐ ๊ฐ์ฒด๋ฅผ ์์ฑ ํ ์ฌ์ฉํ๊ณ  ํ๋์ฉ ๋ค์ ์ญ์ ๋ฅผ ํด์ค์ผ ํ๋๋ฐ, ์ปค๋ฅ์ ํ์ ์ฌ์ฉํ  ๊ฒฝ์ฐ ๊ฐ์ฒด๋ฅผ ๋ฏธ๋ฆฌ ๋ง๋ค์ด๋๊ณ  ์ฌ์ฉํ๊ธฐ ๋๋ฌธ์ ๋ถํ์ํ ์์ฑ๊ณผ ์ญ์ ์ ๋๋ ๋ฉ๋ชจ๋ฆฌ ์ฐจ์ง๋ฅผ ์ค์ผ ์ ์๋ค.> ๋ถํ์ํ ์์์ ๋ฐ๋ณต (์ปค๋ฅ์ ์์ฑ, ์ญ์  ๋ฐ๋ณต)์ด ์ฌ๋ผ์ง๊ธฐ ๋๋ฌธ์ ์ฑ๋ฅ๊ณผ ์๋ ํฅ์์ ๊ธฐ๋ํ  ์ ์๋ค

### 2. ์ฃผ์ํ  ์ 

- ์ปค๋ฅ์์ ์ ์ ๋๋ง ์ ์ฅํด ๋๊ณ  ์ฌ์ฉํ๊ธฐ- ์ปค๋ฅ์์ ์ ๊ฒ ์์ฑ : ํ์ ๋ ์ปค๋ฅ์ ๋ด์์ ์ฌ์ฉํด์ผ ํ๊ธฐ ๋๋ฌธ์ ๋๋ฌด ๋ง์ DB๊ฐ ์ ๊ทผ์ ์ฌ์ฉ์ค์ธ ์ปค๋ฅ์์ด ๋ฐ๋ฉ๋  ๋ ๊น์ง ๊ธฐ๋ค๋ ค์ผ ํ๋ค- ์ปค๋ฅ์์ ๋ง์ด ์์ฑ : ์ปค๋ฅ์ ๋ํ ๊ฐ์ฒด์ด๊ธฐ ๋๋ฌธ์ ๋ง์ ๋ฉ๋ชจ๋ฆฌ๋ฅผ ์ฐจ์งํ  ์ ๋ฐ์ ์๋ค. ๋ฐ๋ผ์ ์ธ๋ฐ์์ด ๋ง์ ์ปค๋ฅ์์ ํ๋ก๊ทธ๋จ์ ์ฑ๋ฅ์ ์ ํ์ํค๋ ์์ธ์ด ๋  ์ ์๋ค

### ์์

pom.xml

```java
<!-- Connection POOL ํ์นด๋ฆฌ -->	
    <dependency>
		<groupId>com.zaxxer</groupId>
		<artifactId>HikariCP</artifactId>
		<version>3.4.5</version>
	</dependency>
```
# ๐ Day48_221031

Author: ๊ณ ๋ฒ์ข
Category: 2021
Created Time: 2022๋ 10์ 31์ผ ์ค์  9:01
Main Category: Log
Status: ๐จ Published
Tags: ConnectionHelper, Servlet
Updated Time: 2022๋ 10์ 31์ผ ์คํ 9:56

# 1. **์ปค๋ฅ์ ํ (DBCP)**

([https://cafe.naver.com/kosait?iframe_url_utf8=%2FArticleRead.nhn%253Fclubid%3D30787723%2526articleid%3D811%2526referrerAllArticles%3Dtrue](https://cafe.naver.com/kosait?iframe_url_utf8=%2FArticleRead.nhn%253Fclubid%3D30787723%2526articleid%3D811%2526referrerAllArticles%3Dtrue))

## **JNDI(Java Naming and Directory Interface) ๋?**

JNDI์ ์ ์๋ฅผ ๋ณด๋ฉด ๋๋ ํฐ๋ฆฌ ์๋น์ค์์ ์ ๊ณตํ๋ ๋ฐ์ดํฐ ๋ฐ ๊ฐ์ฒด๋ฅผ ๋ฐ๊ฒฌํ๊ณ  ์ฐธ๊ณ (lookup)ํ๊ธฐ ์ํ ์๋ฐ API๋ผ๊ณ  ๋์ด์๋ค. ์ฝ๊ฒ ๋งํ๋ฉด ์ธ๋ถ์ ์๋ ๊ฐ์ฒด๋ฅผ ๊ฐ์ ธ์ค๊ธฐ ์ํ ๊ธฐ์ ์ด๋ค. Tomcat์ ๊ฐ์ WAS๋ฅผ ๋ณด๋ฉด ํน์  ํด๋์ ํ์ํ ๋ฐ์ดํฐ ์์ค(๋ผ์ด๋ธ๋ฌ๋ฆฌ)๊ฐ ์๋๋ฐ ๊ทธ๊ฒ์ ์ฐ๋ฆฌ๊ฐ ์ฌ์ฉํ๊ธฐ ์ํด JNDI๋ฅผ ์ด์ฉํด์ ๊ฐ์ ธ์ค๋ ๊ฒ์ด๋ค.

## **DBCP(Database Connection Pool, ์ปค๋ฅ์ ํ) ๋?**

๋ฐ์ดํฐ๋ฒ ์ด์ค์ ์ฐ๊ฒฐ๋ ์ปค๋ฅ์์ ๋ฏธ๋ฆฌ ๋ง๋ค์ด์ ์ ์ฅํด๋๊ณ  ์๋ค๊ฐ ํ์ํ  ๋ ์ ์ฅ๋ ๊ณต๊ฐ(pool)์์ ๊ฐ์ ธ๋ค ์ฐ๊ณ  ๋ฐํํ๋ ๊ธฐ๋ฒ์ ๋งํ๋ค. ์ปค๋ฅ์ ํ์ ์ด์ฉํ๋ฉด ์ปค๋ฅ์์ ๋ฏธ๋ฆฌ ๋ง๋ค์ด๋๊ณ  ์ฌ์ฉํ๊ธฐ ๋๋ฌธ์ ๋งค๋ฒ ์ฌ์ฉ์๊ฐ ์์ฒญํ  ๊ฒฝ์ฐ ๋๋ผ์ด๋ฒ๋ฅผ ๋ก๋ํ๊ณ , ์ปค๋ฅ์ ๊ฐ์ฒด๋ฅผ ์์ฑํด ์ฐ๊ฒฐํ๊ณ  ์ข๋ฃํ๋ ๋นํจ์จ์ ์ธ ์์์ ํ์ง ์์๋ ๋๋ค.  ์ฆ ๋ฐ์ดํฐ๋ฒ ์ด์ค์ ๋ถํ๋ฅผ ์ค์ผ ์ ์๊ณ  ์์์ ํจ์จ์ ์ผ๋ก ๊ด๋ฆฌํ  ์ ์๋ค.

[https://t1.daumcdn.net/cfile/tistory/2629B3375492CD3E10?original](https://t1.daumcdn.net/cfile/tistory/2629B3375492CD3E10?original)

([https://devbox.tistory.com/entry/JSP-์ปค๋ฅ์-ํ-1](https://devbox.tistory.com/entry/JSP-%EC%BB%A4%EB%84%A5%EC%85%98-%ED%92%80-1))

context.xml

```java
<?xml version="1.0" encoding="UTF-8"?>
<Context>
<!-- 
Resource  ์ปค๋ฅ์ํ์ ๋ง๋๋ ๊ธฐ๋ณธ ์ค์  (์ด๋คDB , ๊ณ์ ์ ๊ฐ์ง๊ณ  ์ ์ ์ค์ )
<Resource
auth="Container"  
driverClassName="oracle.jdbc.driver.OracleDriver"
maxTotal="20"  //์ปค๋ฅ์ ๊ฐ์ฒด์ ์ต๋ ๊ฐฏ์  (default 8)
maxIdle="20"   //์ฌ์ฉํ์ง  ์๋ idle(๋๊ธฐ)์ํ์ ์ต๋ ์ 
maxActive="20"  //DataSource๋ก๋ถํฐ ๊บผ๋ผ ์ ์๋ ์ปค๋ฅ์ ์ต๋ ๊ฐ์ ๊ธฐ๋ณธ๊ฐ : 8๊ฐ
name="jdbc/myoracle"  // ์ฌ์ฉ์๊ฐ ์ง์ ํ๋ ์์์ ์ด๋ฆ 
type="javax.sql.DataSource" 
url="jdbc:oracle:thin:@127.0.0.1:1521:orcl"  //์๊ฒฉ์ ์์ ๊ฒฝ์ฐ ๋ฐ๋์ @๋ก ์ค์ ํ๋ค. 
username="scott"   //์ฐ๊ฒฐํ db ์ฌ์ฉ์ ์ด๋ฆ
password="tiger"   // ์ฐ๊ฒฐํ db์ ๋น๋ฐ๋ฒํธ 
/>
 -->
	<Resource maxWait="-1" 
			  maxIdle="20" 
			  maxTotal="20" 
			  maxActive="20"
			  password="1004" 
			  username="kosa" 
			  url="jdbc:oracle:thin:@192.168.0.218:1521:XE"
			  driverClassName="oracle.jdbc.OracleDriver" 
              type="javax.sql.DataSource"
			  auth="Container" 
              name="jdbc/oracle" />
</Context>
```

# 2. DB ์ฝ๊ฒ ๋ถ๋ฌ์ค๊ธฐ

1. kr.or.kosa.utils์์ [ConnectionHelper.java](http://ConnectionHelper.java) ๋ถ์ฌ๋ฃ๊ธฐ
2. DAO์์
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
์์ฑ ํ try์์  
conn = ConnectionHelper.getConnection("oracle"); ์์ฑ
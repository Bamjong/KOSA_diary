# 📚 Day48_221031

Author: 고범종
Category: 2021
Created Time: 2022년 10월 31일 오전 9:01
Main Category: Log
Status: 🖨 Published
Tags: ConnectionHelper, Servlet
Updated Time: 2022년 10월 31일 오후 9:56

# 1. **커넥션 풀 (DBCP)**

([https://cafe.naver.com/kosait?iframe_url_utf8=%2FArticleRead.nhn%253Fclubid%3D30787723%2526articleid%3D811%2526referrerAllArticles%3Dtrue](https://cafe.naver.com/kosait?iframe_url_utf8=%2FArticleRead.nhn%253Fclubid%3D30787723%2526articleid%3D811%2526referrerAllArticles%3Dtrue))

## **JNDI(Java Naming and Directory Interface) 란?**

JNDI의 정의를 보면 디렉터리 서비스에서 제공하는 데이터 및 객체를 발견하고 참고(lookup)하기 위한 자바 API라고 되어있다. 쉽게 말하면 외부에 있는 객체를 가져오기 위한 기술이다. Tomcat와 같은 WAS를 보면 특정 폴더에 필요한 데이터 소스(라이브러리)가 있는데 그것을 우리가 사용하기 위해 JNDI를 이용해서 가져오는 것이다.

## **DBCP(Database Connection Pool, 커넥션 풀) 란?**

데이터베이스와 연결된 커넥션을 미리 만들어서 저장해두고 있다가 필요할 때 저장된 공간(pool)에서 가져다 쓰고 반환하는 기법을 말한다. 커넥션 풀을 이용하면 커넥션을 미리 만들어두고 사용하기 때문에 매번 사용자가 요청할 경우 드라이버를 로드하고, 커넥션 객체를 생성해 연결하고 종료하는 비효율적인 작업을 하지 않아도 된다.  즉 데이터베이스의 부하를 줄일 수 있고 자원을 효율적으로 관리할 수 있다.

[https://t1.daumcdn.net/cfile/tistory/2629B3375492CD3E10?original](https://t1.daumcdn.net/cfile/tistory/2629B3375492CD3E10?original)

([https://devbox.tistory.com/entry/JSP-커넥션-풀-1](https://devbox.tistory.com/entry/JSP-%EC%BB%A4%EB%84%A5%EC%85%98-%ED%92%80-1))

context.xml

```java
<?xml version="1.0" encoding="UTF-8"?>
<Context>
<!-- 
Resource  커넥션풀을 만드는 기본 설정 (어떤DB , 계정을 가지고 접속 설정)
<Resource
auth="Container"  
driverClassName="oracle.jdbc.driver.OracleDriver"
maxTotal="20"  //커넥션 객체의 최대 갯수  (default 8)
maxIdle="20"   //사용하지  않는 idle(대기)상태의 최대 수 
maxActive="20"  //DataSource로부터 꺼낼 수 있는 커넥션 최대 개수 기본값 : 8개
name="jdbc/myoracle"  // 사용자가 지정하는 임의의 이름 
type="javax.sql.DataSource" 
url="jdbc:oracle:thin:@127.0.0.1:1521:orcl"  //원격접속의 경우 반드시 @로 설정한다. 
username="scott"   //연결한 db 사용자 이름
password="tiger"   // 연결한 db의 비밀번호 
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

# 2. DB 쉽게 불러오기

1. kr.or.kosa.utils에서 [ConnectionHelper.java](http://ConnectionHelper.java) 붙여넣기
2. DAO에서
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
작성 후 try안에  
conn = ConnectionHelper.getConnection("oracle"); 작성
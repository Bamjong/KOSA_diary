# 📚 Day80_221212

Author: 고범종
Created Time: 2022년 12월 12일 오전 9:24
Status: 🖨 Published
Updated Time: 2022년 12월 12일 오후 8:59

# 1. Jdbc, tx(트랜젝션) 추가

## SpringMVC > 필수 jar

-기본 : core , beans , expression , aop , context ...
-웹   : web , webmvc
-의존 : logging ....
-jsp  : jstl
-DB   : ojdbc6.jar

- Spring JDBC : spring-jdbc , spring-tx 추가 > 현실 > ORM (객체 매핑) > JPA , Mybatis
-DB자체가 ORM 구현 >> ORDB > MongoDB (JSON 객체 데이터 저장) > no-sql

### 현실에선 Jdbc보다 Mybatis가 좀 더 많이 쓰임

# 2. 루트컨테이너 & 하위 컨테이너

공통빈 설정하기
(DB 작업 , JDBC 설정 코드)

```java
<!--  
  	Root Container(ApplicationContext)
  	listener 를 통해서 web.xml 실행시 가장 먼저 실행
  	applicationContext.xml > IOC DI 구성 파일로 (공통빈 : 다른 IOC 컨테이너 참조하는 Bean 구성)
  	org.springframework.web.context.ContextLoaderListener
  -->
  
		

  <listener>
  	<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
  </listener>
  <context-param>
  	<param-name>contextConfigLocation</param-name>
  	<param-value>/WEB-INF/applicationContext.xml</param-value>
  </context-param>
  
  
  <servlet>
  	 <servlet-name>dispatcher</servlet-name>
  	 <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
 	<!--  <init-param>
    	<param-name>contextConfigLocation</param-name>
    	<param-value>
     		classpath:/WEB-INF/servlet.xml
     		classpath:/WEB-INF/base2.xml
    	</param-value>
   	 </init-param> -->
  </servlet>
  <servlet-mapping>
  	<servlet-name>dispatcher</servlet-name>
  	<url-pattern>*.do</url-pattern>
  </servlet-mapping>
  <!-- DI 구성하는 xml 파일 : [servlet이름]-servlet.xml  -->
```

네이버 카페 링크

[](https://cafe.naver.com/kosait?iframe_url=/MyCafeIntro.nhn%3Fclubid=30787723)

# 3. web.xml을 통한 한글처리 (filter)

```java
<!-- Filter 사용한 한글 처리 
  org.springframework.web.filter.CharacterEncodingFilter
  -->
  <filter>
  	<filter-name>EncodingFilter</filter-name>
  	<filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
  	<init-param>
  		<param-name>encoding</param-name>
  		<param-value>UTF-8</param-value>
  	</init-param>
  </filter>
  <filter-mapping>
  	<filter-name>EncodingFilter</filter-name>
  	<url-pattern>/*</url-pattern> //
  </filter-mapping>
```

# 4. JDBC API

- 기존 : Model2 기반의 MVC 패턴 : JDBC API 사용 (Connection , Statement , PrepareStatement ,ResultSet..)
함수 사용 실행 : ResultSet rs = st.executeQuery();
함수 사용 실행 : int result = st.executeUpdate();
- select a, b, c, d, e, f, g from data;
dto 담아라 ...
class data {private int a, b, c, d, e, f, .....}
while(rs.next()){ data d = new data(); d.setA(rs.getInt("a"))}
단순한 작업을 안했으면 좋겠어요.....
- Spring 제공하는 > JDBCTemplate(틀) > [코드량 감소] , [일원화된 코드 작업 가능] (유지보수)
문제점) 인터페이스 기반 (설계) > 익명클래스 > 코드 생략 > 추상화 > 개발자 입장에서 가독성

```java
public class MemberDAOImpl implements MemberDAO{

	/*
	JdbcTemplate template = new JdbcTemplate();
	public void m() { template.execute("select...");}
	IOC 컨테이너 안에 Bean 으로 생성 되어 있어요
	
	
	MemberDAOImpl 객체 JdbcTemplate 객체에 의존한다
	*/
	private JdbcTemplate jdbctemplate;
	
	@Autowired //by type
	public void setJdbctemplate(JdbcTemplate jdbctemplate) {
		this.jdbctemplate = jdbctemplate;
	}
```

- MemberDAOImpl 객체 JdbcTemplate 객체에 의존하기때문에
@Autowired 혹은 @Resource로 주입을 해줘야함

```java
@Override
	public boolean memberInsert(String id, String name, String pwd, String email, int age) {
		String sql="insert into usermember(id,name,pwd,email,age) values(?,?,?,?,?)";
		boolean result = false;
		
				
		Object[] params = {id,name,pwd,email,age};
		//[hong][홓길동][1004][hong@naver.com][100]
		
		jdbctemplate.update(sql)
		if(this.jdbctemplate.update(sql,params) > 0)
		{
			result = true;
		}
		return result;
	}
```

- 이후로 sql문과 value값을 넣어줘서 update함
- update안에 insert와 같은 문 포함

### Spring의 꽃

```java
@Override
	public MemberVO selectMemberById(String id) throws SQLException {
		
		/*
			JDBC API
			preparestatement pstmt = conn....(sql)
			ResultSet rs = pstsm.executeQuery();
			
			MemberVO membervo = new MemberVO()
			while(rs.next()){
				membervo.setName(rs.getString("name"));
				..
				..
			
			}
			
			자원 해제 ...
			return membervo

            **아래 처리 자동화된 코드를 원하면 : select 컬럼명  == VO 객체 변수명이 같으면 된다  *******
			
			>>new BeanPropertyRowMapper<MemberVO>(MemberVO.class)
			or MyBatis 사용하면 아래 코드는 자동화 한다 ......
			아래 작업을 자동화 한다.....
		    >>new BeanPropertyRowMapper<MemberVO>(MemberVO.class)
			MemberVO membervo = new MemberVO()
			while(rs.next()){
				membervo.setName(rs.getString("name"));
				..
				..
			
			}
		
		*/
		String sql="select id,name,pwd,email,age from usermember where id=?";
		//Query 문 실행 -> resultset 결과 담아서 >[ VO 객체 생성 > rs 에서 vo setter 사용 데이터 넣고 ]> VO 객체 리턴
		return this.jdbctemplate.queryForObject(sql,
				                               new BeanPropertyRowMapper<MemberVO>(MemberVO.class),
				                               id);
	}
```

- >>new BeanPropertyRowMapper<MemberVO>(MemberVO.class)
			MemberVO membervo = new MemberVO()
			while(rs.next()){
				membervo.setName(rs.getString("name"));
				..
				..
- new BeanPropertyRowMapper<MemberVO>(MemberVO.class)
- 위와 같은 작업을 자동화 하겠다

```java
@Override
	public boolean memberCheck(String id, String pwd) throws SQLException {
		String sql="select * from usermember where id=? and pwd=?";
		
		boolean result = false;
		Object[] params = {id,pwd};
		/*
		 this.jdbctemplate.queryForList(sql,params) return List<>   게시판 전체 조회 , 회원목록 조회
		 * 
		 */
		
		if(this.jdbctemplate.queryForList(sql,params).size() > 0 ) {
			result = true;
		}
		return result;
	}
```

- select문 가져올때 쓰는거
- size()를 통해 들어왔는지 안들어왔는지 알 수 있음

### <a href="${pageContext.request.contextPath}/index.htm">HOME</a>

앞에 링크 주소가 바뀌어도 같음

---

# 5. SpringMVC_Basic05_JdbcTemplate 설명

웬만하면 순서대로 하지만 아닐수도있음 ㅋㅋ

### XML

web.xml

```java
//걍 시작하자 첫번째로 뭘 연결해줄건지 적어주는 코드
<welcome-file-list>
    <welcome-file>index.html</welcome-file>
  </welcome-file-list>
  
 
  //applicationContext.xml을 연결해주기 위한 공통빈 설정
	//applicationContext라는 IoC컨테이너를 따로 만듬
  <listener>
  	<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
  </listener>
//dispatcher-servlet.xml 같은경우 적을필요 없지만
//새로만드는 xml을 연결해주기위해선 context-param을 작성해줘야함
  <context-param>
  	<param-name>contextConfigLocation</param-name>
  	<param-value>/WEB-INF/applicationContext.xml</param-value>
  </context-param>
  
  

//기본 dispatcher-servlet.xml 연결
  <servlet>
  	 <servlet-name>dispatcher</servlet-name>
  	 <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
  </servlet>
  <servlet-mapping>
  	<servlet-name>dispatcher</servlet-name>
  	<url-pattern>*.do</url-pattern>
  </servlet-mapping>

//한글처리 (filter)

  <filter>
  	<filter-name>EncodingFilter</filter-name>
  	<filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
  	<init-param>
  		<param-name>encoding</param-name>
  		<param-value>UTF-8</param-value>
  	</init-param>
  </filter>
  <filter-mapping>
  	<filter-name>EncodingFilter</filter-name>
  	<url-pattern>/*</url-pattern>
  </filter-mapping>
```

dispatcher-servlet.xml 생략

applicationContext.xml

```java
<!--  
  Root 공통빈
  DB관련 작업 (드라이버 로딩 , 템플릿 객체)
  view 작업 (공통 UI) (internalResourceViewResolver)
  
  import org.springframework.jdbc.datasource.DriverManagerDataSource;
  import org.springframework.jdbc.core.JdbcTemplate;
-->

//JDBC 이용할때 연결해줄코드
//나는 Oracle을 사용하였고  계정spinguser//1004 을 썼다.
<!-- 공통 DB작업  -->
  <bean id="driverManagerDataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
  	<property name="driverClassName" 	value="oracle.jdbc.driver.OracleDriver"></property> <!-- ojdbc6.jar 파일 불러오는거 -->
  	<property name="url" 				value="jdbc:oracle:thin:@Localhost:1521:xe"></property>
  	<property name="username" 			value="springuser"></property>
  	<property name="password"			value="1004"></property>
  </bean>
 
//위와 세트 느낌으로 jdbc 템플릿 적을때 필요함
 <!-- JDBC Template -->
 <bean id="" class="org.springframework.jdbc.core.JdbcTemplate">
 	<property name="dataSource" ref="driverManagerDataSource"/>
 </bean>
 
 
//이곳 컨테이너를 통하는건 /WEB-INF/view/를 타도록한다
 <!-- 공통 UI  -->
 <bean id="internalResourceViewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver">
 		<property name="prefix">
 			<value>/WEB-INF/view/</value>
 		</property>
 		<property name="suffix">
 			<value>.jsp</value>
 		</property>
 </bean>
```

### com.model

MemberDAO.java

```java
//기본적으로 Spring에선 인터페이스를 기반으로 생성하기때문에
//MemberDAO에서 만들어 준 후 Impl들을 생성한다

public interface MemberDAO {
	
	//회원가입 
	boolean memberInsert(String id, String name, String pwd , String email, int age);
	
	//회원상세조회
	MemberVO selectMemberById(String id) throws SQLException;
	
	//회원유뮤 판단
	boolean memberCheck(String id, String pwd) throws SQLException;
}
```

MemberDAOImpl.java

```java
public class MemberDAOImpl implements MemberDAO{

		
		//IOC 컨테이너 안에 Bean 으로 생성 되어 있고
		//MemberDAOImpl 객체 JdbcTemplate 객체에 의존한다
		//JDBC 쓰려면 필요한것임
	   private JdbcTemplate jdbctemplate;
	   
	   @Autowired //by type
	   public void setJdbctemplate(JdbcTemplate jdbctemplate) {
	      this.jdbctemplate = jdbctemplate;
	   }

	   
	   //DB의 컬럼과 파라미터가 같으면 자동으로 매칭이 되어 입력이 된다.
	   @Override
	   public boolean memberInsert(String id, String name, String pwd, String email, int age) {
	      String sql="insert into usermember(id,name,pwd,email,age) values(?,?,?,?,?)";
	      boolean result = false;
	            
	      Object[] params = {id,name,pwd,email,age};
	      //[hong][홍길동][1004][hong@naver.com][100]
	      
	      if(this.jdbctemplate.update(sql,params) > 0)
	      {
	         result = true;
	      }
	      return result;
	   }

		
	   @Override
	   public MemberVO selectMemberById(String id) throws SQLException {
		   
	      String sql="select id,name,pwd,email,age from usermember where id=?";
	      return this.jdbctemplate.queryForObject(sql,
	                                           new BeanPropertyRowMapper<MemberVO>(MemberVO.class),
	                                           id);
	   }

	   @Override
	   public boolean memberCheck(String id, String pwd) throws SQLException {
	      String sql="select * from usermember where id=? and pwd=?";
	      
	      boolean result = false;
	      Object[] params = {id,pwd};
	      
	      if(this.jdbctemplate.queryForList(sql,params).size() > 0 ) {
	         result = true;
	      }
	      return result;
	   }

}
```
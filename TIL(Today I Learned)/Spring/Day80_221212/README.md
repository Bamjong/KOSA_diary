# ๐ Day80_221212

Author: ๊ณ ๋ฒ์ข
Created Time: 2022๋ 12์ 12์ผ ์ค์  9:24
Status: ๐จ Published
Updated Time: 2022๋ 12์ 13์ผ ์ค์  1:34

# 1. Jdbc, tx(ํธ๋์ ์) ์ถ๊ฐ

## SpringMVC > ํ์ jar

-๊ธฐ๋ณธ : core , beans , expression , aop , context ...
-์น   : web , webmvc
-์์กด : logging ....
-jsp  : jstl
-DB   : ojdbc6.jar

- Spring JDBC : spring-jdbc , spring-tx ์ถ๊ฐ > ํ์ค > ORM (๊ฐ์ฒด ๋งคํ) > JPA , Mybatis
-DB์์ฒด๊ฐ ORM ๊ตฌํ >> ORDB > MongoDB (JSON ๊ฐ์ฒด ๋ฐ์ดํฐ ์ ์ฅ) > no-sql

### ํ์ค์์  Jdbc๋ณด๋ค Mybatis๊ฐ ์ข ๋ ๋ง์ด ์ฐ์

# 2. ๋ฃจํธ์ปจํ์ด๋ & ํ์ ์ปจํ์ด๋

๊ณตํต๋น ์ค์ ํ๊ธฐ
(DB ์์ , JDBC ์ค์  ์ฝ๋)

```java
<!--  
  	Root Container(ApplicationContext)
  	listener ๋ฅผ ํตํด์ web.xml ์คํ์ ๊ฐ์ฅ ๋จผ์  ์คํ
  	applicationContext.xml > IOC DI ๊ตฌ์ฑ ํ์ผ๋ก (๊ณตํต๋น : ๋ค๋ฅธ IOC ์ปจํ์ด๋ ์ฐธ์กฐํ๋ Bean ๊ตฌ์ฑ)
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
  <!-- DI ๊ตฌ์ฑํ๋ xml ํ์ผ : [servlet์ด๋ฆ]-servlet.xml  -->
```

๋ค์ด๋ฒ ์นดํ ๋งํฌ

[](https://cafe.naver.com/kosait?iframe_url=/MyCafeIntro.nhn%3Fclubid=30787723)

# 3. web.xml์ ํตํ ํ๊ธ์ฒ๋ฆฌ (filter)

```java
<!-- Filter ์ฌ์ฉํ ํ๊ธ ์ฒ๋ฆฌ 
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

- ๊ธฐ์กด : Model2 ๊ธฐ๋ฐ์ MVC ํจํด : JDBC API ์ฌ์ฉ (Connection , Statement , PrepareStatement ,ResultSet..)
ํจ์ ์ฌ์ฉ ์คํ : ResultSet rs = st.executeQuery();
ํจ์ ์ฌ์ฉ ์คํ : int result = st.executeUpdate();
- select a, b, c, d, e, f, g from data;
dto ๋ด์๋ผ ...
class data {private int a, b, c, d, e, f, .....}
while(rs.next()){ data d = new data(); d.setA(rs.getInt("a"))}
๋จ์ํ ์์์ ์ํ์ผ๋ฉด ์ข๊ฒ ์ด์.....
- Spring ์ ๊ณตํ๋ > JDBCTemplate(ํ) > [์ฝ๋๋ ๊ฐ์] , [์ผ์ํ๋ ์ฝ๋ ์์ ๊ฐ๋ฅ] (์ ์ง๋ณด์)
๋ฌธ์ ์ ) ์ธํฐํ์ด์ค ๊ธฐ๋ฐ (์ค๊ณ) > ์ต๋ชํด๋์ค > ์ฝ๋ ์๋ต > ์ถ์ํ > ๊ฐ๋ฐ์ ์์ฅ์์ ๊ฐ๋์ฑ

```java
public class MemberDAOImpl implements MemberDAO{

	/*
	JdbcTemplate template = new JdbcTemplate();
	public void m() { template.execute("select...");}
	IOC ์ปจํ์ด๋ ์์ Bean ์ผ๋ก ์์ฑ ๋์ด ์์ด์
	
	
	MemberDAOImpl ๊ฐ์ฒด JdbcTemplate ๊ฐ์ฒด์ ์์กดํ๋ค
	*/
	private JdbcTemplate jdbctemplate;
	
	@Autowired //by type
	public void setJdbctemplate(JdbcTemplate jdbctemplate) {
		this.jdbctemplate = jdbctemplate;
	}
```

- MemberDAOImpl ๊ฐ์ฒด JdbcTemplate ๊ฐ์ฒด์ ์์กดํ๊ธฐ๋๋ฌธ์
@Autowired ํน์ @Resource๋ก ์ฃผ์์ ํด์ค์ผํจ

```java
@Override
	public boolean memberInsert(String id, String name, String pwd, String email, int age) {
		String sql="insert into usermember(id,name,pwd,email,age) values(?,?,?,?,?)";
		boolean result = false;
		
				
		Object[] params = {id,name,pwd,email,age};
		//[hong][ํ๊ธธ๋][1004][hong@naver.com][100]
		
		jdbctemplate.update(sql)
		if(this.jdbctemplate.update(sql,params) > 0)
		{
			result = true;
		}
		return result;
	}
```

- ์ดํ๋ก sql๋ฌธ๊ณผ value๊ฐ์ ๋ฃ์ด์ค์ updateํจ
- update์์ insert์ ๊ฐ์ ๋ฌธ ํฌํจ

### Spring์ ๊ฝ

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
			
			์์ ํด์  ...
			return membervo

            **์๋ ์ฒ๋ฆฌ ์๋ํ๋ ์ฝ๋๋ฅผ ์ํ๋ฉด : select ์ปฌ๋ผ๋ช  == VO ๊ฐ์ฒด ๋ณ์๋ช์ด ๊ฐ์ผ๋ฉด ๋๋ค  *******
			
			>>new BeanPropertyRowMapper<MemberVO>(MemberVO.class)
			or MyBatis ์ฌ์ฉํ๋ฉด ์๋ ์ฝ๋๋ ์๋ํ ํ๋ค ......
			์๋ ์์์ ์๋ํ ํ๋ค.....
		    >>new BeanPropertyRowMapper<MemberVO>(MemberVO.class)
			MemberVO membervo = new MemberVO()
			while(rs.next()){
				membervo.setName(rs.getString("name"));
				..
				..
			
			}
		
		*/
		String sql="select id,name,pwd,email,age from usermember where id=?";
		//Query ๋ฌธ ์คํ -> resultset ๊ฒฐ๊ณผ ๋ด์์ >[ VO ๊ฐ์ฒด ์์ฑ > rs ์์ vo setter ์ฌ์ฉ ๋ฐ์ดํฐ ๋ฃ๊ณ  ]> VO ๊ฐ์ฒด ๋ฆฌํด
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
- ์์ ๊ฐ์ ์์์ ์๋ํ ํ๊ฒ ๋ค

```java
@Override
	public boolean memberCheck(String id, String pwd) throws SQLException {
		String sql="select * from usermember where id=? and pwd=?";
		
		boolean result = false;
		Object[] params = {id,pwd};
		/*
		 this.jdbctemplate.queryForList(sql,params) return List<>   ๊ฒ์ํ ์ ์ฒด ์กฐํ , ํ์๋ชฉ๋ก ์กฐํ
		 * 
		 */
		
		if(this.jdbctemplate.queryForList(sql,params).size() > 0 ) {
			result = true;
		}
		return result;
	}
```

- select๋ฌธ ๊ฐ์ ธ์ฌ๋ ์ฐ๋๊ฑฐ
- size()๋ฅผ ํตํด ๋ค์ด์๋์ง ์๋ค์ด์๋์ง ์ ์ ์์

### <a href="${pageContext.request.contextPath}/index.htm">HOME</a>

์์ ๋งํฌ ์ฃผ์๊ฐ ๋ฐ๋์ด๋ ๊ฐ์

---

# 5. SpringMVC_Basic05_JdbcTemplate ์ค๋ช

์ฌ๋งํ๋ฉด ์์๋๋ก ํ์ง๋ง ์๋์๋์์ ใใ

### XML

web.xml

```java
//๊ฑ ์์ํ์ ์ฒซ๋ฒ์งธ๋ก ๋ญ ์ฐ๊ฒฐํด์ค๊ฑด์ง ์ ์ด์ฃผ๋ ์ฝ๋
<welcome-file-list>
    <welcome-file>index.html</welcome-file>
  </welcome-file-list>
  
 
  //applicationContext.xml์ ์ฐ๊ฒฐํด์ฃผ๊ธฐ ์ํ ๊ณตํต๋น ์ค์ 
	//applicationContext๋ผ๋ IoC์ปจํ์ด๋๋ฅผ ๋ฐ๋ก ๋ง๋ฌ
  <listener>
  	<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
  </listener>
//dispatcher-servlet.xml ๊ฐ์๊ฒฝ์ฐ ์ ์ํ์ ์์ง๋ง
//์๋ก๋ง๋๋ xml์ ์ฐ๊ฒฐํด์ฃผ๊ธฐ์ํด์  context-param์ ์์ฑํด์ค์ผํจ
  <context-param>
  	<param-name>contextConfigLocation</param-name>
  	<param-value>/WEB-INF/applicationContext.xml</param-value>
  </context-param>
  
  

//๊ธฐ๋ณธ dispatcher-servlet.xml ์ฐ๊ฒฐ
  <servlet>
  	 <servlet-name>dispatcher</servlet-name>
  	 <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
  </servlet>
  <servlet-mapping>
  	<servlet-name>dispatcher</servlet-name>
  	<url-pattern>*.do</url-pattern>
  </servlet-mapping>

//ํ๊ธ์ฒ๋ฆฌ (filter)

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

dispatcher-servlet.xml ์๋ต

applicationContext.xml

```java
<!--  
  Root ๊ณตํต๋น
  DB๊ด๋ จ ์์ (๋๋ผ์ด๋ฒ ๋ก๋ฉ , ํํ๋ฆฟ ๊ฐ์ฒด)
  view ์์ (๊ณตํต UI) (internalResourceViewResolver)
  
  import org.springframework.jdbc.datasource.DriverManagerDataSource;
  import org.springframework.jdbc.core.JdbcTemplate;
-->

//JDBC ์ด์ฉํ ๋ ์ฐ๊ฒฐํด์ค์ฝ๋
//๋๋ Oracle์ ์ฌ์ฉํ์๊ณ   ๊ณ์ spinguser//1004 ์ ์ผ๋ค.
<!-- ๊ณตํต DB์์  -->
  <bean id="driverManagerDataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
  	<property name="driverClassName" 	value="oracle.jdbc.driver.OracleDriver"></property> <!-- ojdbc6.jar ํ์ผ ๋ถ๋ฌ์ค๋๊ฑฐ -->
  	<property name="url" 				value="jdbc:oracle:thin:@Localhost:1521:xe"></property>
  	<property name="username" 			value="springuser"></property>
  	<property name="password"			value="1004"></property>
  </bean>
 
//์์ ์ธํธ ๋๋์ผ๋ก jdbc ํํ๋ฆฟ ์ ์๋ ํ์ํจ
 <!-- JDBC Template -->
 <bean id="" class="org.springframework.jdbc.core.JdbcTemplate">
 	<property name="dataSource" ref="driverManagerDataSource"/>
 </bean>
 
 
//์ด๊ณณ ์ปจํ์ด๋๋ฅผ ํตํ๋๊ฑด /WEB-INF/view/๋ฅผ ํ๋๋กํ๋ค
 <!-- ๊ณตํต UI  -->
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
//๊ธฐ๋ณธ์ ์ผ๋ก Spring์์  ์ธํฐํ์ด์ค๋ฅผ ๊ธฐ๋ฐ์ผ๋ก ์์ฑํ๊ธฐ๋๋ฌธ์
//MemberDAO์์ ๋ง๋ค์ด ์ค ํ Impl๋ค์ ์์ฑํ๋ค

public interface MemberDAO {
	
	//ํ์๊ฐ์ 
	boolean memberInsert(String id, String name, String pwd , String email, int age);
	
	//ํ์์์ธ์กฐํ
	MemberVO selectMemberById(String id) throws SQLException;
	
	//ํ์์ ๋ฎค ํ๋จ
	boolean memberCheck(String id, String pwd) throws SQLException;
}
```

MemberDAOImpl.java

```java
public class MemberDAOImpl implements MemberDAO{

		
		//IOC ์ปจํ์ด๋ ์์ Bean ์ผ๋ก ์์ฑ ๋์ด ์๊ณ 
		//MemberDAOImpl ๊ฐ์ฒด JdbcTemplate ๊ฐ์ฒด์ ์์กดํ๋ค
		//JDBC ์ฐ๋ ค๋ฉด ํ์ํ๊ฒ์
	   private JdbcTemplate jdbctemplate;
	   
	   @Autowired //by type
	   public void setJdbctemplate(JdbcTemplate jdbctemplate) {
	      this.jdbctemplate = jdbctemplate;
	   }

	   
	   //DB์ ์ปฌ๋ผ๊ณผ ํ๋ผ๋ฏธํฐ๊ฐ ๊ฐ์ผ๋ฉด ์๋์ผ๋ก ๋งค์นญ์ด ๋์ด ์๋ ฅ์ด ๋๋ค.
	   @Override
	   public boolean memberInsert(String id, String name, String pwd, String email, int age) {
	      String sql="insert into usermember(id,name,pwd,email,age) values(?,?,?,?,?)";
	      boolean result = false;
	            
	      Object[] params = {id,name,pwd,email,age};
	      //[hong][ํ๊ธธ๋][1004][hong@naver.com][100]
	      
	      if(this.jdbctemplate.update(sql,params) > 0)
	      {
	         result = true;
	      }
	      return result;
	   }

		//์ฟผ๋ฆฌ๋ฌธ ํ๋๋ง ๋ฐ์๊ฒฝ์ฐ DTO๋ง ์ ์ธํ๋ฉด ๋ค ๋ฐ์ ์ ์์
		//์จ๋ณด์ง ์์์ง๋ง list๋ก ๋ฐ์ผ๋ฉด ์ญ์ญ ๋ฐ์ ์ ์์๊ฑฐ ๊ฐ์
		//queryForObject์ด๊ฑด ํ๋๋ง ๋ฐ์๋
		//queryForList ์ด๊ฑด List ํ์์ผ๋ก ๋ฐ์๋
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

JoinController.java

```java
@Controller
public class JoinController {

	---------------------------------------------------------
	MemberDAO๋ฅผ ์ฌ์ฉํ๊ธฐ ์ํด setter๋ก ์ฃผ์
	private MemberDAO memberdao;

	@Autowired  //by type
	public void setMemberdao(MemberDAO memberdao) {
		this.memberdao = memberdao;
	}
	---------------------------------------------------------
	
	@GetMapping("/join.do")
	public String form() {
		return "joinForm";
	}
 
	@PostMapping("/join.do")
	public String sumbit(@RequestParam(value="id", required = true) String id,
						 @RequestParam(value="name") String name,
						 @RequestParam(value="pwd")  String pwd,
						 @RequestParam(value="email" ,defaultValue = "1@1") String email,
						 @RequestParam(value="age" , defaultValue = "1") Integer age) {

	
		System.out.println(id + "." + name + "." + pwd + "." + email + "." + age);
		String view = null;
		boolean joinresult = memberdao.memberInsert(id, name, pwd, email, age);
		
		if(joinresult) {
			view = "joinSuccess";
		}else {
			view = "joinForm";
		}
		
		return view;

	}
	
}
```

์ด๋ฐ์์ผ๋ก ํ๋ฌ๊ฐ๊ณ  ์ดํ๋ก์ service ๋จ์ ์์์ ํ๋ฌํ๋ฌ ๊ฐ๊ฒ๋๋ค
# 2022.12.19.MON π
----------------
<br> 

# 1. Security κ°λ β
- http://www.egovframe.go.kr/wiki/doku.php?id=egovframework:rte:fdl:server_security:architecture
#### [μΉμ΄νλ¦¬μΌμ΄μ μΈμ¦μ μ°¨]
![image](https://user-images.githubusercontent.com/111114507/208329504-7e769fe2-3075-4115-b9b0-9505e70e14f2.png)
<br>

#### μ£Όμνμ΄λΈ - μ¬μ©μ μΈμ¦κ³Ό κ΄λ ¨λ νμ΄λΈμ μ¬μ©μνμ΄λΈκ³Ό μ¬μ©μκΆννμ΄λΈμ΄λ©° μ¬μ©μκΆνκ΄λ ¨ νμ΄λΈμ μ­ν , μμ, μ­ν κ³μΈ΅ λ±μ νμ΄λΈμ΄ μλ€.
![image](https://user-images.githubusercontent.com/111114507/208329905-a575a8a9-e8ba-4729-88ba-e29a6c97bd13.png)
- Enabled : νμ!!
- μ¬μ©μμ μ­ν μ λ€λλ€ κ΄κ³
- Security μ μ© μ μ¬μ©μ, μ­ν , μ¬μ©μ-κΆν λ§€ν νμ΄λΈ μ€κ³λ νμ
<BR>

### π‘ μ¬μ΄νΈ κ° μ€ν¬λ¦½ν(XSS; Cross-Site Scripting)
- μΉ μ νλ¦¬μΌμ΄μμμ λ§μ΄ λνλλ μ·¨μ½μ μ νλλ‘, μΉμ¬μ΄νΈ κ΄λ¦¬μκ° μλ μ΄κ° μΉ νμ΄μ§μ μμ± μ€ν¬λ¦½νΈλ₯Ό μ½μν  μ μλ μ·¨μ½μ μ΄λ€.
- μ΄ μ·¨μ½μ μ μΉ μ νλ¦¬μΌμ΄μμ΄ μ¬μ©μλ‘λΆν° μλ ₯ λ°μ κ°μ μ λλ‘ κ²μ¬νμ§ μκ³  μ¬μ©ν  κ²½μ° λνλλ€. μ£Όλ‘ μ¬λ¬ μ¬μ©μκ° λ³΄κ² λλ μ μ κ²μνμ μμ± μ€ν¬λ¦½νΈκ° λ΄κΈ΄ κΈμ μ¬λ¦¬λ ννλ‘ μ΄λ£¨μ΄μ§λ€.
- μ΄ μ·¨μ½μ μΌλ‘ ν΄μ»€κ° μ¬μ©μμ μ λ³΄(μΏ ν€, μΈμ λ±)λ₯Ό νμ·¨νκ±°λ, μλμΌλ‘ λΉμ μμ μΈ κΈ°λ₯μ μννκ² νκ±°λ ν  μ μλ€. μ£Όλ‘ λ€λ₯Έ μΉμ¬μ΄νΈμ μ λ³΄λ₯Ό κ΅ννλ μμΌλ‘ μλνλ€.
- λμ : Client
<BR>

### π‘ μ¬μ΄νΈ κ° μμ²­ μμ‘°(CSRF; Cross-Site Request Forgery)
- μΉμ¬μ΄νΈ μ·¨μ½μ  κ³΅κ²©μ νλλ‘, μ¬μ©μκ° μμ μ μμ§μλ λ¬΄κ΄νκ² κ³΅κ²©μκ° μλν νμ(μμ , μ­μ , λ±λ‘ λ±)λ₯Ό νΉμ  μΉμ¬μ΄νΈμ μμ²­νκ² νλ κ³΅κ²©μ λ§νλ€.
- XSSλ₯Ό μ΄μ©ν κ³΅κ²©μ΄ μ¬μ©μκ° νΉμ  μΉμ¬μ΄νΈλ₯Ό μ μ©νλ μ μ λΈλ¦° κ²μ΄λΌλ©΄, μ¬μ΄νΈκ° μμ²­ μμ‘°λ νΉμ  μΉμ¬μ΄νΈκ° μ¬μ©μμ μΉ λΈλΌμ°μ λ₯Ό μ μ©νλ μνλ₯Ό λΈλ¦° κ²μ΄λ€.
- μΌλ¨ μ¬μ©μκ° μΉμ¬μ΄νΈμ λ‘κ·ΈμΈν μνμμ μ¬μ΄νΈκ° μμ²­ μμ‘° κ³΅κ²© μ½λκ° μ½μλ νμ΄μ§λ₯Ό μ΄λ©΄, κ³΅κ²© λμμ΄ λλ μΉμ¬μ΄νΈλ μμ‘°λ κ³΅κ²© λͺλ Ήμ΄ λ―Ώμ μ μλ μ¬μ©μλ‘λΆν° λ°μ‘λ κ²μΌλ‘ νλ¨νκ² λμ΄ κ³΅κ²©μ λΈμΆλλ€.
- λμ : Server
<br>

### π‘ XSSμ CSRFμ μ°¨μ΄μμ½
- κ°λ¨νκ², XSSλ κ³΅κ²©λμμ΄ Clientμ΄κ³ , CSRFλ Serverμ΄λ€.
- XSSλ μ¬μ΄νΈλ³μ‘°λ λ°±λμ΄λ₯Ό ν΅ν΄ ν΄λΌμ΄μΈνΈμ λν μμ±κ³΅κ²©μ νλ€.
- CSRFλ μμ²­μ μμ‘°νμ¬ μ¬μ©μμ κΆνμ μ΄μ©ν΄ μλ²μ λν μμ±κ³΅κ²©μ νλ€.

β<br>

# 2. Security μ€μ  β
### 1) Security κ΄λ ¨ jar ..... (Maven -> dependency μ κ³΅)
```xml
 <dependency>
        <groupId>org.springframework.security</groupId>
        <artifactId>spring-security-web</artifactId>
        <version>4.0.1.RELEASE</version>
    </dependency>
    <dependency>
        <groupId>org.springframework.security</groupId>
        <artifactId>spring-security-config</artifactId>
        <version>4.0.1.RELEASE</version>
    </dependency>
    <dependency>
         <groupId>org.springframework.security</groupId>
         <artifactId>spring-security-taglibs</artifactId>
         <version>4.0.1.RELEASE</version>
    </dependency>
```
- pom.xmlμ μΆκ°νκΈ°

### 2) λ³΄μκ΄λ ¨(Security μ€μ  xml λ§λ€κΈ°)
![image](https://user-images.githubusercontent.com/111114507/208332898-8bf87696-d093-4457-bcdb-23db2d3fdc0d.png)
- security-context.xml μμ±
<br>

![image](https://user-images.githubusercontent.com/111114507/208332931-1a62ecca-bab4-4dc5-abfe-b666e1a75f86.png)
- Namespaceμμ security μ²΄ν¬νκΈ°
#### [securyty-context.xml]
```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xmlns:security="http://www.springframework.org/schema/security"
 xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
  http://www.springframework.org/schema/security http://www.springframework.org/schema/security/spring-security.xsd">
</beans>

 <security:http auto-config="true">
		<security:csrf disabled="true" />
		<security:form-login 
		                     login-page="/joinus/login.htm" 
		                     default-target-url="/index.htm"  
		                     authentication-failure-url="/joinus/login.htm?error" />
		<security:logout 
		                     logout-success-url="/index.htm" />
		<security:intercept-url pattern="/customer/noticeDetail.htm" access="hasRole('ROLE_USER')"  />
		<security:intercept-url pattern="/customer/noticeReg.htm"  access="hasRole('ROLE_ADMIN')" />
		<!-- <security:access-denied-handler error-page="/login/accessDenied.do"/> -->
	</security:http>
	<security:authentication-manager>
		<security:authentication-provider>
			<security:user-service>
					<security:user name="hong"  password="1004" authorities="ROLE_USER"/>
					<security:user name="admin" password="1004" authorities="ROLE_USER,ROLE_ADMIN"/>
			</security:user-service>
			
		</security:authentication-provider>
		
	</security:authentication-manager>

</beans>
```
- login-page : login μμ²­ μ
- default-target-url : login μ±κ³΅ μ
- authentication-failure-url : login μ€ν¨ μ
<br>

### 3) web.xmlμ νν° μΆκ°
```xml
 <!-- μΈμ¦κΆν κ΄λ ¨ Filter -->
   <filter>
     <filter-name>springSecurityFilterChain</filter-name>
     <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
   </filter>
   <filter-mapping>
     <filter-name>springSecurityFilterChain</filter-name>
     <url-pattern>/*</url-pattern>
   </filter-mapping>
```
```xml
<!-- The definition of the Root Spring Container shared by all Servlets and Filters -->
<context-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>
    /WEB-INF/spring/root-context.xml
   ******* /WEB-INF/spring/appServlet/security-context.xml  ****** >> μ΄κ±° μΆκ°ν΄μ€!!
    </param-value>
</context-param>
```
<br>

# 3. Security μμ  β
```jsp
<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')" ><!-- ifλ¬Έ -->
    <li>
        <a href="${pageContext.request.contextPath}/logout">${loginuser}:λ‘κ·Έμμ</a>
        </li>
</se:authorize>
```
- se:authorize : ifλ¬Έμ΄λΌκ³  μκ°νλ©΄ λ¨
<br>

```java
    //κΈ μ°κΈ° Service
   public String noticeReg(Notice n , HttpServletRequest request, Principal principal) {
```
- Principal : Sessionκ³Ό λΉμ·...? λ΄μΌ μΆκ° νμ΅ νμ!
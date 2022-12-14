# π Day86_221220

Author: κ³ λ²μ’
Created Time: 2022λ 12μ 20μΌ μ€μ  9:10
Status: π¨ Published
Updated Time: 2022λ 12μ 20μΌ μ€ν 10:00

# 1. Security

## JDBC μ°λ κ°λ₯ν ννμ μ½λ

```sql
μμΉ : Spring Security κΈ°λ₯μ μ¬μ©νκΈ° μν΄μλ 
        Table μ€κ³λ Spring Security μνλ ννλ‘
     1. μ»¬λΌλͺ κ°μ νκΈ° : USERID , PASSWORD , ENABLED 
          νμ¬ μμ€νμ :   USERID      PWD         x
     2. μμμ :
        SELECT USERID  ,  pwd AS PASSWORD ,  1 enabled FROM member;
        μ¬μ©ν΄μΌ λλ μΏΌλ¦¬λ
        SELECT USERID  ,  pwd AS PASSWORD ,  1 enabled 
        FROM member WHERE userid='kglim';
```

```sql
[κΆμ₯μ¬ν­]
μ€κ³ : Table 3κ°
USER
ROLL
USERANDROLL (λ€λλ€) : A μ¬μ©μ admin, user κΆνμΌ μλ μκ³ 
                      admin role : A, B , C

select m.userid, m.pwd , 1 enabled , r.ROLE_NAME 
from member m join roll r
on m.userid = r.userid
where m.userid='admin';
```

### κ°μ  pattern λ°©μμΌλ‘ μ ν

```sql

 <!-- 
  Pattern μν
   <security:intercept-url pattern="/customer/*"  access="ROLE_USER" /> => customer ν΄λ λͺ¨λ  νμΌ
   <security:intercept-url pattern="/customer/**" access="ROLE_USER" /> => customer ν΄λ μμ [νμ ν΄λ] **κΉμ§ ν¬ν¨
   <security:intercept-url pattern="/customer/*.htm" access="ROLE_USER" />  
   <security:intercept-url pattern="/customer/*Reg.htm" access="ROLE_USER" />
   aaaReg.htm , bbbb_Reg.htm μ μ©
   -->
  3.x.x
  <security:intercept-url pattern="/customer/*Reg.htm" access="ROLE_USER" />
  <security:intercept-url pattern="/admin/**" access="ROLE_ADMIN" />
^^
   4.x.x
  <security:intercept-url pattern="/customer/*Reg.htm" access="hasRole('ROLE_USER')" />
  <security:intercept-url pattern="/admin/**" access="hasRole('ROLE_ADMIN')" />
```

νμκ°μμ΄ μ±κ³΅νλ©΄

νμμ ROLE_USER κΆνμ λΆμ¬νκ³ 

λ§μ½μ admin νμκ°μλλ©΄

ROLE_USER, ROLE_ADMIN κΆν λΆμ¬νλ νΈλ¦¬κ±° λ§λμΈμ

```sql
create or replace trigger insert_member
after insert on member
for each row
BEGIN
    IF(:NEW.userid = 'admin') THEN  
        insert all
        into roll values(:NEW.userid ,'ROLE_ADMIN')
        into roll values(:NEW.userid ,'ROLE_USER')
        select * from dual;
    ELSE
        insert into roll(userid, role_name)
        values(:NEW.userid ,'ROLE_USER');
    END IF;
END;
```

# 2. μνΈν

bCryptPasswordEncoderλ₯Ό μ¬μ©νλ©΄ μνΈνλ κ² λΌλ¦¬ λΉκ΅ν΄μ€ (νμκ°μκ³  γλ¬΄κ΄)

```java
@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

@RequestMapping(value = "join.htm", method = RequestMethod.POST) //POST
	public String join(Member member) {
		int result = 0;
		String viewpage = "";
		//νμκ°μ
		member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
		//
		result = service.insertMember(member);
		if (result > 0) {
			System.out.println("μ½μ μ±κ³΅");
			viewpage = "redirect:/index.htm";
		} else {
			System.out.println("μ½μ μ€ν¨");
			viewpage = "join.htm";
		}
		return viewpage;
	}
```

μ«μ β1β νλλ§ λ£μ΄λ 
$[2a$10$gsxSDWDkr.b2VXFmlqzuS.VNT907Jc.SE/81h8E3GFICoT5zncsyy](http://2a%2410%24gsxsdwdkr.b2vxfmlqzus.vnt907jc.se/81h8E3GFICoT5zncsyy)
μμκ°μ΄ λ³κ²½λμ΄μ μλ ₯λ¨

@Controller μ μ©

```java
@RequestMapping(value="memberconfirm.htm",method=RequestMethod.POST)
	public String memberConfirm(@RequestParam("password") String rawPassword,	Principal principal){
		String viewpage="";
		
		//νμμ λ³΄
		Member member = service.getMember(principal.getName());
		
		
		//DBμμ κ°μ Έμ¨ μνΈνλ λ¬Έμμ΄
		String encodedPassword = member.getPwd();
		
		System.out.println("rowPassword : "+rawPassword );
		System.out.println("encodepassword : " + encodedPassword);
		
		boolean result = bCryptPasswordEncoder.matches(rawPassword, encodedPassword);
		
		if(result){
			viewpage="redirect:memberupdate.htm";
		}else{
			viewpage="redirect:memberconfirm.htm";
		}
		
		return viewpage;
	}
```

μμ)

![https://user-images.githubusercontent.com/111114507/208563884-b62edd28-1e9d-41ac-8424-2f6b4de440aa.png](https://user-images.githubusercontent.com/111114507/208563884-b62edd28-1e9d-41ac-8424-2f6b4de440aa.png)

- νμκ°μ μ λΉλ°λ²νΈλ₯Ό 1μΌλ‘ μλ ₯νλλ° DB μ μ₯μ μ΄λ κ² μνΈνκ° λμ΄μ μ μ₯λλ€.
<br>

### π‘ μ€μ 

### [root-context.xml]

```
  <bean id="bCryptPasswordEncoder" class="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder">
  </bean>

```

<br>

### [security-context.xml]

```
<security:authentication-manager>
    <security:authentication-provider><!-- μΈμ¦μ λν μ κ³΅μ -->
        <security:jdbc-user-service
        data-source-ref="driverManagerDataSource"
        users-by-username-query="SELECT USERID, pwd AS PASSWORD, 1 enabled FROM member where userid=?"

        authorities-by-username-query="select m.USERID , r.ROLE_NAME
                                            from member m join roll r
                                            on m.userid = r.userid
                                            where m.userid=?" />
  ***  <security:password-encoder ref="bCryptPasswordEncoder"/>
    </security:authentication-provider> *** >> μΆκ°ν΄μ£ΌκΈ°
</security:authentication-manager>

```

- μ΄ λΆλΆμ΄ λ‘κ·ΈμΈ λ‘μ§μ λμ  ν΄μ€λ€κ³  μκ°νλ©΄ λ  λ―
<br>

### [ν¨ν€μ§ κ΅¬μ‘°]

![https://user-images.githubusercontent.com/111114507/208645731-7364e3ea-f5a8-4ec4-bd6e-39355e9593c2.png](https://user-images.githubusercontent.com/111114507/208645731-7364e3ea-f5a8-4ec4-bd6e-39355e9593c2.png)

- κΈ°μ‘΄ NewMemberControllerλ₯Ό μ§μ°κ³  MemberController & MemberDao.xml μμ± -> MyBatis μ μ©μ μν΄μ
<br>

### π‘ νμκ°μ

### [header.jsp]

```
<se:authorize access="!hasRole('ROLE_USER')">
    <li>
        <a href="${pageContext.request.contextPath}/joinus/join.htm">νμκ°μ</a>
    </li>
</se:authorize>

```

- se:authorizeλ‘ λ‘κ·ΈμΈ λ νμμκ²λ νμκ°μ λ²νΌμ΄ λ³΄μ΄μ§ μλλ‘ μ²λ¦¬
<br>

### [JoinController.java]

```
@Controller
@RequestMapping("/joinus/")
public class JoinController {
	private MemberDao memberdao;

	@Autowired
	private MemberSerivce memberservice;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@GetMapping("join.htm")
	public String join() {
		return "joinus/join";
	}

	@PostMapping("join.htm")
	public String join(Member member) {
		System.out.println(member.toString());
		try {
			member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
			memberservice.insertMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/index.htm";
    }
}

```

- BCryptPasswordEncoder : λΉλ°λ²νΈ μνΈννκΈ° μν΄μ  μΆκ°ν΄μ€μΌ ν¨
- Controllerμ μλ λ©μλλ Daoλ Serviceμ μλ λ©μλμ κ°μ νμ X, κ·Έλ₯ λ³΄κΈ° νΈνλλ‘ νκΈ°
- Parameter κ°μλ κ·Έ λ©μλλ₯Ό μ€νν  λ μ΄λ€ κ°μ΄ λμ΄μ€λμ λ°λΌ λ¬λ¦Ό, μμ κ°μ μν©μμλ νμκ°μ μ νμ μ λ³΄κ° λμ΄μ¬ κ²μ΄λ νμμ λ³΄λ₯Ό κ°μ§κ³  μλ Dtoλ₯Ό Parameterλ‘ λ°μμ€μΌ νλ€.
- member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd())) : κ³΅μμ΄λΌ μκ°νκΈ°~
<br>

### [MemberDao.xml]

```
<insert id="insertMember" parameterType="vo.Member">
    insert into member(userid, pwd, name,regdate)
    values(#{userid}, #{pwd}, #{name},sysdate)
</insert>

```

<br>

### [MemberService.java]

```
public void insertMember(Member member) {
    MemberDao dao = sqlsession.getMapper(MemberDao.class);
    dao.insertMember(member);
}

```

<br>

### π‘ λ‘κ·ΈμΈ

### [header.jsp]

```
<se:authorize access="!hasRole('ROLE_USER')">
        <li><a href="${pageContext.request.contextPath}/joinus/login.htm">λ‘κ·ΈμΈ</a></li>
</se:authorize>

```

- se:authorize : λ‘κ·ΈμΈ λμ΄μλ μ μ μκ²λ λ‘κ·ΈμΈ λ²νΌμ΄ λ³΄μ΄μ§ μλλ‘
<br>

### [JoinController.java]

```
//λ‘κ·ΈμΈ μμ²­
@GetMapping(value="login.htm")
public String login() {
    return "joinus/login";
}

```

<br>

### [login.jsp]

```
<form action="${pageContext.request.contextPath}/login" method="post">
<fieldset>
        <legend class="hidden">λ‘κ·ΈμΈ νΌ</legend>
        <h3><img src="images/txtTitle.png" /></h3>
        <ul id="loginBox">
            <li><label for="uid">μμ΄λ</label>
                        <input type="text"        name="username" class="text" /></li>
            <li><label for="pwd">λΉλ°λ²νΈ</label>
                        <input type="password" name="password" class="text" /></li>
        </ul>
        <p><input type="submit" id="btnLogin" value="" /></p>
        <ul id="loginOption">
            <li><span>μμ΄λ λλ λΉλ°λ²νΈλ₯Ό λΆμ€νμ¨λμ?</span><a href="/Member/FindID"><img alt="ID/PWD μ°ΎκΈ°" src="images/btnFind.png" /></a></li>
            <li><span>μμ΄λκ° μμΌμ  λΆμ νμκ°μμ ν΄μ£ΌμΈμ.</span><a href="/Member/Agree"><img alt="νμκ°μ" src="images/btnJoin.png" /></a></li>
        </ul>
    </fieldset>
</form>

```

- formμμ /loginμΌλ‘ λκΈ°λ©΄ μλμΌλ‘ security-context.xmlμμ login λ‘μ§μ μ²λ¦¬ν¨!
<br>

### π‘ λ§μ΄νμ΄μ§ - νμμ λ³΄ μμ 

### [header.jsp]

```
<se:authorize access="hasRole('ROLE_USER')">
    <li>
        <a href="${pageContext.request.contextPath}/customer/mypage.htm"><img src="${pageContext.request.contextPath}/images/menuMyPage.png" alt="λ§μ΄νμ΄μ§" /></a>
    </li>
</se:authorize>

```

<br>

### [MypageController.java]

### 1) λΉλ°λ²νΈ νμΈ

```
@Controller
@RequestMapping("/customer/")
public class MypageController {

	private MemberSerivce memberservice;

	@Autowired
	public void setMemberservice(MemberSerivce memberservice) {
		this.memberservice = memberservice;
	}

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@GetMapping("mypage.htm")
	public String memberConfirm() {
		return "customer/memberConfirm";
	}

	@PostMapping("mypage.htm")
	public String memberConfirm(@RequestParam("password") String rawPassword, Principal principal){
		String viewpage="";

		//νμμ λ³΄
		Member member = memberservice.getMember(principal.getName());

		//DBμμ κ°μ Έμ¨ μνΈνλ λ¬Έμμ΄
		String encodedPassword = member.getPwd();
		boolean result = bCryptPasswordEncoder.matches(rawPassword, encodedPassword);

		if(result){
			viewpage="redirect:memberupdate.htm";
		}else{
			viewpage="redirect:mypage.htm";
		}
		return viewpage;
	}

```

- PostMapping λΆλΆμ κ³΅μμ΄λΌ μκ°νκ³  μ¬μ©νκΈ°
- λλ΅, μνΈνλμ΄μ DBμ μ μ₯λμ΄μλ λΉλ°λ²νΈμ, μλ ₯ν λΉλ°λ²νΈλ₯Ό λμ‘°νμ¬ λμΌνλ©΄ μμ  νμ΄μ§λ‘, λμΌνμ§ μμΌλ©΄ νμ΄μ§κ° λμ΄κ°μ§ μκ²
<br>

### 2) νμμ λ³΄ μμ 

```
@GetMapping("memberupdate.htm")
public String memberUpdate(Model model, Principal principal) {
    Member member = memberservice.getMember(principal.getName());
    model.addAttribute("member", member);
    return "customer/memberUpdate";
}

@PostMapping("memberupdate.htm")
public String memberUpdate(Model model, Member member, Principal principal) {
    Member updatemember = memberservice.getMember(principal.getName());
    updatemember.setName(member.getName());
    updatemember.setCphone(member.getCphone());
    updatemember.setEmail(member.getEmail());
    updatemember.setPwd(bCryptPasswordEncoder.encode(member.getPwd()));
    memberservice.updateMember(updatemember);
    return "redirect:/index.htm";
}
}

```

- GetMapping λΆλΆ : λ§μ΄νμ΄μ§λ‘ μ΄λν  λ Sessionκ°μ μλ μ λ³΄λ λΉκ΅ ν΄μ λ§μ΄νμ΄μ§λ‘ λ³΄λΌμ§ κ²°μ ..

```
Principal κ°μ²΄λ κ΅¬νμ²΄μ μ΅μμ μΈν°νμ΄μ€μ΄κΈ° λλ¬Έμ μ΄ νμμΌλ‘ λ°μΌλ©΄ μ¬μ©ν λ§ν λ©μλκ°
getName() μ λλ°μ μμ΅λλ€.
κ·Έλ₯ ID μ λ³΄λ§ κ°μ Έλ€ μ¬μ©ν  μ μλ€κ³  λ³΄λ©΄ λ©λλ€.

```

- νμ§λ§ μ μ΄μ se:authorize λ‘ κ±Έλ¬λ²λ¦¬λ©΄ μ¬μ©ν  νμκ° μμ§ μμκΉ..?π€
<br>

### [MemberDao.xml]

```
<update id="update" parameterType="vo.Notice">
    update notices
    set   title=#{title},
        content=#{content},
        filesrc=#{fileSrc, jdbcType = VARCHAR},
        filesrc2=#{fileSrc2,jdbcType=VARCHAR}
    where seq=#{seq}
</update>

```

<br>

### [MemberService.java]

```
public void updateMember(Member member){
    MemberDao dao = sqlsession.getMapper(MemberDao.class);
    int result = dao.updateMember(member);
}

```

# 3. @Secured Annotation νμ©

![https://user-images.githubusercontent.com/92353613/208604416-d420d0be-e948-4d2d-8647-98e833733e89.PNG](https://user-images.githubusercontent.com/92353613/208604416-d420d0be-e948-4d2d-8647-98e833733e89.PNG)

![https://user-images.githubusercontent.com/92353613/208604531-ecf634de-047b-4f78-9665-a3074b160f0c.PNG](https://user-images.githubusercontent.com/92353613/208604531-ecf634de-047b-4f78-9665-a3074b160f0c.PNG)

![https://user-images.githubusercontent.com/92353613/208604655-71779e3a-d8eb-4918-82b3-4d5622d18232.PNG](https://user-images.githubusercontent.com/92353613/208604655-71779e3a-d8eb-4918-82b3-4d5622d18232.PNG)

# 4. **Spring λΉλκΈ° μ²λ¦¬νκΈ°**

[SpringMVCμμ Ajaxμ JSON](https://www.nextree.co.kr/p11205/)

μ μ¬μ΄νΈμ JSONμΌλ‘ λΉλκΈ° μ²λ¦¬νλκ² μμ λμ΄μλ μ¬μ΄νΈμ΄λ€.

νμ§λ§ μ κ²λ μλ κΊΌμ΄κΈ° λλ¬Έμ μ μΌ μ΅μ  κΈ°μ μΈ

## @RestControllerλ₯Ό μ¬μ©νλ©΄ λλ€!!

## @RestController

- RESTλ βRepresentational State Transferμ μ½μλ‘ νλμ URIλ νλμ κ³ μ ν λ¦¬μμ€(Resource)λ₯Ό λννλλ‘ μ€κ³λλ€λ κ°λμ΄λ€

![https://kookyungmin.github.io/image/Spring_image/Spring_image_117.png](https://kookyungmin.github.io/image/Spring_image/Spring_image_117.png)
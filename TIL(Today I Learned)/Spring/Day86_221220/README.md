# 📚 Day86_221220

Author: 고범종
Created Time: 2022년 12월 20일 오전 9:10
Status: 🖨 Published
Updated Time: 2022년 12월 20일 오후 10:00

# 1. Security

## JDBC 연동 가능한 형태의 코드

```sql
원칙 : Spring Security 기능을 사용하기 위해서는 
        Table 설계도 Spring Security 원하는 형태로
     1. 컬럼명 강제하기 : USERID , PASSWORD , ENABLED 
          현재 시스템은 :   USERID      PWD         x
     2. 속임수 :
        SELECT USERID  ,  pwd AS PASSWORD ,  1 enabled FROM member;
        사용해야 되는 쿼리는
        SELECT USERID  ,  pwd AS PASSWORD ,  1 enabled 
        FROM member WHERE userid='kglim';
```

```sql
[권장사항]
설계 : Table 3개
USER
ROLL
USERANDROLL (다대다) : A 사용자 admin, user 권한일 수도 있고
                      admin role : A, B , C

select m.userid, m.pwd , 1 enabled , r.ROLE_NAME 
from member m join roll r
on m.userid = r.userid
where m.userid='admin';
```

### 개선 pattern 방식으로 전환

```sql

 <!-- 
  Pattern 샘플
   <security:intercept-url pattern="/customer/*"  access="ROLE_USER" /> => customer 폴더 모든 파일
   <security:intercept-url pattern="/customer/**" access="ROLE_USER" /> => customer 폴더 안의 [하위 폴더] **까지 포함
   <security:intercept-url pattern="/customer/*.htm" access="ROLE_USER" />  
   <security:intercept-url pattern="/customer/*Reg.htm" access="ROLE_USER" />
   aaaReg.htm , bbbb_Reg.htm 적용
   -->
  3.x.x
  <security:intercept-url pattern="/customer/*Reg.htm" access="ROLE_USER" />
  <security:intercept-url pattern="/admin/**" access="ROLE_ADMIN" />
^^
   4.x.x
  <security:intercept-url pattern="/customer/*Reg.htm" access="hasRole('ROLE_USER')" />
  <security:intercept-url pattern="/admin/**" access="hasRole('ROLE_ADMIN')" />
```

회원가입이 성공하면

회원은 ROLE_USER 권한을 부여하고

만약에 admin 회원가입되면

ROLE_USER, ROLE_ADMIN 권한 부여하는 트리거 만드세요

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

# 2. 암호화

bCryptPasswordEncoder를 사용하면 암호화된 것 끼리 비교해줌 (회원가입고 ㅏ무관)

```java
@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

@RequestMapping(value = "join.htm", method = RequestMethod.POST) //POST
	public String join(Member member) {
		int result = 0;
		String viewpage = "";
		//회원가입
		member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
		//
		result = service.insertMember(member);
		if (result > 0) {
			System.out.println("삽입 성공");
			viewpage = "redirect:/index.htm";
		} else {
			System.out.println("삽입 실패");
			viewpage = "join.htm";
		}
		return viewpage;
	}
```

숫자 ‘1’ 하나만 넣어도 
$[2a$10$gsxSDWDkr.b2VXFmlqzuS.VNT907Jc.SE/81h8E3GFICoT5zncsyy](http://2a%2410%24gsxsdwdkr.b2vxfmlqzus.vnt907jc.se/81h8E3GFICoT5zncsyy)
위와같이 변경되어서 입력됨

@Controller 적용

```java
@RequestMapping(value="memberconfirm.htm",method=RequestMethod.POST)
	public String memberConfirm(@RequestParam("password") String rawPassword,	Principal principal){
		String viewpage="";
		
		//회원정보
		Member member = service.getMember(principal.getName());
		
		
		//DB에서 가져온 암호화된 문자열
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

예시)

![https://user-images.githubusercontent.com/111114507/208563884-b62edd28-1e9d-41ac-8424-2f6b4de440aa.png](https://user-images.githubusercontent.com/111114507/208563884-b62edd28-1e9d-41ac-8424-2f6b4de440aa.png)

- 회원가입 시 비밀번호를 1으로 입력했는데 DB 저장시 이렇게 암호화가 되어서 저장된다.
<br>

### 💡 설정

### [root-context.xml]

```
  <bean id="bCryptPasswordEncoder" class="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder">
  </bean>

```

<br>

### [security-context.xml]

```
<security:authentication-manager>
    <security:authentication-provider><!-- 인증에 대한 제공자 -->
        <security:jdbc-user-service
        data-source-ref="driverManagerDataSource"
        users-by-username-query="SELECT USERID, pwd AS PASSWORD, 1 enabled FROM member where userid=?"

        authorities-by-username-query="select m.USERID , r.ROLE_NAME
                                            from member m join roll r
                                            on m.userid = r.userid
                                            where m.userid=?" />
  ***  <security:password-encoder ref="bCryptPasswordEncoder"/>
    </security:authentication-provider> *** >> 추가해주기
</security:authentication-manager>

```

- 이 부분이 로그인 로직을 대신 해준다고 생각하면 될 듯
<br>

### [패키지 구조]

![https://user-images.githubusercontent.com/111114507/208645731-7364e3ea-f5a8-4ec4-bd6e-39355e9593c2.png](https://user-images.githubusercontent.com/111114507/208645731-7364e3ea-f5a8-4ec4-bd6e-39355e9593c2.png)

- 기존 NewMemberController를 지우고 MemberController & MemberDao.xml 생성 -> MyBatis 적용을 위해서
<br>

### 💡 회원가입

### [header.jsp]

```
<se:authorize access="!hasRole('ROLE_USER')">
    <li>
        <a href="${pageContext.request.contextPath}/joinus/join.htm">회원가입</a>
    </li>
</se:authorize>

```

- se:authorize로 로그인 된 회원에게는 회원가입 버튼이 보이지 않도록 처리
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

- BCryptPasswordEncoder : 비밀번호 암호화하기 위해선 추가해줘야 함
- Controller에 있는 메소드는 Dao나 Service에 있는 메소드와 같을 필요 X, 그냥 보기 편한대로 하기
- Parameter 값에는 그 메소드를 실행할 때 어떤 값이 넘어오냐에 따라 달림, 위와 같은 상황에서는 회원가입 시 회원 정보가 넘어올 것이니 회원정보를 가지고 있는 Dto를 Parameter로 받아줘야 한다.
- member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd())) : 공식이라 생각하기~
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

### 💡 로그인

### [header.jsp]

```
<se:authorize access="!hasRole('ROLE_USER')">
        <li><a href="${pageContext.request.contextPath}/joinus/login.htm">로그인</a></li>
</se:authorize>

```

- se:authorize : 로그인 되어있는 유저에게는 로그인 버튼이 보이지 않도록
<br>

### [JoinController.java]

```
//로그인 요청
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
        <legend class="hidden">로그인 폼</legend>
        <h3><img src="images/txtTitle.png" /></h3>
        <ul id="loginBox">
            <li><label for="uid">아이디</label>
                        <input type="text"        name="username" class="text" /></li>
            <li><label for="pwd">비밀번호</label>
                        <input type="password" name="password" class="text" /></li>
        </ul>
        <p><input type="submit" id="btnLogin" value="" /></p>
        <ul id="loginOption">
            <li><span>아이디 또는 비밀번호를 분실하셨나요?</span><a href="/Member/FindID"><img alt="ID/PWD 찾기" src="images/btnFind.png" /></a></li>
            <li><span>아이디가 없으신 분은 회원가입을 해주세요.</span><a href="/Member/Agree"><img alt="회원가입" src="images/btnJoin.png" /></a></li>
        </ul>
    </fieldset>
</form>

```

- form에서 /login으로 넘기면 자동으로 security-context.xml에서 login 로직을 처리함!
<br>

### 💡 마이페이지 - 회원정보 수정

### [header.jsp]

```
<se:authorize access="hasRole('ROLE_USER')">
    <li>
        <a href="${pageContext.request.contextPath}/customer/mypage.htm"><img src="${pageContext.request.contextPath}/images/menuMyPage.png" alt="마이페이지" /></a>
    </li>
</se:authorize>

```

<br>

### [MypageController.java]

### 1) 비밀번호 확인

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

		//회원정보
		Member member = memberservice.getMember(principal.getName());

		//DB에서 가져온 암호화된 문자열
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

- PostMapping 부분은 공식이라 생각하고 사용하기
- 대략, 암호화되어서 DB에 저장되어있는 비밀번호와, 입력한 비밀번호를 대조하여 동일하면 수정 페이지로, 동일하지 않으면 페이지가 넘어가지 않게
<br>

### 2) 회원정보 수정

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

- GetMapping 부분 : 마이페이지로 이동할 때 Session값에 있는 정보랑 비교 해서 마이페이지로 보낼지 결정..

```
Principal 객체는 구현체의 최상위 인터페이스이기 때문에 이 타입으로 받으면 사용할만한 메소드가
getName() 정도밖에 없습니다.
그냥 ID 정보만 가져다 사용할 수 있다고 보면 됩니다.

```

- 하지만 애초에 se:authorize 로 걸러버리면 사용할 필요가 없지 않을까..?🤔
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

# 3. @Secured Annotation 활용

![https://user-images.githubusercontent.com/92353613/208604416-d420d0be-e948-4d2d-8647-98e833733e89.PNG](https://user-images.githubusercontent.com/92353613/208604416-d420d0be-e948-4d2d-8647-98e833733e89.PNG)

![https://user-images.githubusercontent.com/92353613/208604531-ecf634de-047b-4f78-9665-a3074b160f0c.PNG](https://user-images.githubusercontent.com/92353613/208604531-ecf634de-047b-4f78-9665-a3074b160f0c.PNG)

![https://user-images.githubusercontent.com/92353613/208604655-71779e3a-d8eb-4918-82b3-4d5622d18232.PNG](https://user-images.githubusercontent.com/92353613/208604655-71779e3a-d8eb-4918-82b3-4d5622d18232.PNG)

# 4. **Spring 비동기 처리하기**

[SpringMVC에서 Ajax와 JSON](https://www.nextree.co.kr/p11205/)

위 사이트에 JSON으로 비동기 처리하는게 서술되어있는 사이트이다.

하지만 저것도 옛날꺼이기 때문에 제일 최신 기술인

## @RestController를 사용하면 된다!!

## @RestController

- REST는 ‘Representational State Transfer의 약자로 하나의 URI는 하나의 고유한 리소스(Resource)를 대표하도록 설계된다는 개념이다

![https://kookyungmin.github.io/image/Spring_image/Spring_image_117.png](https://kookyungmin.github.io/image/Spring_image/Spring_image_117.png)
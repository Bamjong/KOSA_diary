# 📚 Day44_221025

Author: 고범종
Created Time: 2022년 10월 25일 오전 9:20
Status: 🖨 Published
Updated Time: 2022년 10월 25일 오후 6:04

# 1. Tomcat제공(WAS)

## 기본적인 내장 객체

1. request (요청: 클라이언트 정보)
2. response (응답: 특정 페이지 이동 , 정보 출력 , 쿠키 쓰기)
3. application(전역객체: web.xml 자원 접근 read , 전역변수)
4. session(고유객체(접속한 사용자에게 부여되는): 고유한 변수)
5. out (출력)

## session객체 (활용도 ^^)

[내부에 session변수 생성]

scope : a.jsp(session.setAtt.."member" 변수 생성)
b.jsp(session.getAtt.. "member" 사용가능)

session 변수는 (현재 Webapp  폴더 안에 있는 모든 페이지에서 사용 가능)

Life-cycle : 1. session변수는 session객체와 동일
2. session 소멸 : 서버 리부팅 , Tomcat 재실행 , session.invaildate()

## application 객체

[내부에 application변수 생성 : 전역변수 >>모든 session (접속한 모든 사용자) 공유
scope :   (현재 Webapp  폴더 안에 있는 모든 페이지에서 사용 가능) >> java >> static
Life-cycle : 소멸 (서버 리부팅)   , Tomcat 재실행

## request 객체

********* 진짜 중요*********

[내부에 변수 생성] : request.setAttribute("type","A");  
scope: 요청 페이지(login.jsp >> 요청당 request 생성 >> scope >> page

예외적으로 ^^^^^^^^^
login.jsp >> ok.jsp(**include or forward**) request 객체는 ok.jsp 공유된다

자바 웹을 다루는 기술 424p 12.6 예제 연습하면 조음

```java
Emp emp = new Emp();
emp.setEmpno(2000);
emp.setEname("홍길동");

session.setAttribute("empobj", emp);
//(String name, Object value) -> 단점 downcasting 필요

//session (예를 들어 다른 페이지라고 가정)
Emp e = (Emp)session.getAttribute("empobj");
out.print(e.getEmpno() + "<br>");
out.print(e.getEname() + "<br>");

//request
request.setAttribute("who", "king");
//Scope (현재 페이지)

String who = (String)request.getAttribute("who");
out.print(who);

/*
예외적으로
<jsp:include page="b.jsp"></jsp:include>
1. b.jsp 에서 session변수 >> empobj >> 사용(O) >> session이니 include와 상관없이.
2. b.jsp 에서 request변수 >> who >> 사용(O) >> include 했으니까

+

EL & JSTL
```

# 2. Servlet

## 2.1 JSP MVC model

- Model1

출력을 위한 view코드와 로직 처리를 위한 자바 코드가 함께 있어 JSP코드 자체가 복잡해진다.

과거에 많이 사용되었던 아키텍쳐로 간단한 페이지를 구성하거나 빠른 시간 안에 개발하는데 사용되어왔다.

- Model2

JSP에서 모든 요청과 처리를 담당하는 것이 아니라 JSP는 view단을 맡고 요청에 대한 흐름제어는

Controller인 서블릿에서 담당하며 요청에 대한 로직처리는 Model인 서비스클래스 혹은 자바빈이 담당한다.

```java
SimpleController extends HttpServlet
SimpleController는 HttpServlet 하고 있어요 
SimpleController.java 파일 >> 서블릿(일반 자바파일을 웹에서 사용할 수 있게 만들었어요)

HttpServletRequest request = new HttpServletRequest();
자동 실행 ...request 클라이언트 정보를 담아서 .... 필용한 정보를 사용

jsp 파일 같은 경우
주소창에 : http://..... /login.jsp 

servlet 파일 같은 경우
주소창에 : http://..... /SimpleController.java ...(x)
 
web.xml 파일에서 설정
[어떤 요청]이 들어오면  SimpleController 자바파일을 컴파일하고 실행하게 할 거냐 ....
[어떠한 주소로 요청 되면] ...SimpleController 자바파일을 컴파일하고 실행하게 할 거냐 ....

        <servlet-name>simplecontroller</servlet-name>
  		<url-pattern>/simple</url-pattern>

        1. http://192.168.0.26:8090/WebServlet_1/simple 요청이 되면
        2. com.SimpleController 패키지 안에 있는 ..
        3. SimpleController.java 컴파일하고 실행
  

 서블릿 조건 : 일반 java 파일이 extends HttpServlet 상속 >> 웹 요청(request),응답(response) 객체 사용
 -servlet은 url에 바로 요청이 안되요 >> 특정요청 >> mapping >> 매핑된 객체 실행
 
 설정
 1. web.xml  (구방식)
 2. @WebServlet (현재 ....) 매핑작업 .....
 
 -extends HttpServlet
 -SimpleController 서블릿 (웹 전용이라)
 -servlet  이벤트 기반 동작( 다양한 함수는 특정사건(이벤트) 가 발생하면 자동호출
 
 -자동 호출 함수
 protected void doGet 
 >> http://192.168.0.26:8090/WebServlet_1/simple 요청방식 GET 방식 doGet 자동호출

 
 protected void doPost
 >> http://192.168.0.26:8090/WebServlet_1/simple 요청방식 POST 방식 doPost 자동호출
 >> <form action=""  method="POST" ....

 doGet() 함수와 doPost()
 1. request, response 객체를 받을 수 있게
    doGet(HttpServletRequest request, HttpServletResponse response)
    함수안에서 request 와 response 사용해서 ....
```

## ********제일중요********

WebServlet_1 파일 참조

1. 한글처리
2. 데이터 받기
3. 판단하기(요청) (로직처리)
4. 데이터 저장
5. view 페이지 설정
6. view 데이터 전달(forward)

예시)

```java
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET");
		//http://192.168.0.65:8090/WebServlet_1/action.do?cmd=greeting
		
		//1. 한글처리
			request.setCharacterEncoding("UTF-8");
		//2. 데이터 받기
			String cmd = request.getParameter("cmd");
		//3. 판단하기(요청)(로직처리)
			String msg="";
			if(cmd.equals("greeting")) {
				//java 파일 용이 (DAO, DTO)
				Message m = new Message();
				msg = m.getMessage(cmd);
			}
		//4. 데이터 저장
			request.setAttribute("msg", msg);
		//5. view 페이지 설정
			RequestDispatcher dis = request.getRequestDispatcher("/greeting.jsp");
		//6. view 데이터 전달(forward)
			dis.forward(request, response);
	}
```

## 2.2 CMD 방식

```java
if (cmd == null) {
			viewpage = "/error/error.jsp";
		}else if(cmd.equals("boardlist")) {
			//실제코드
			/*
				DB연결 > select > 객체 담기 ....
				boardDao dao = new boardDad();
				List<board> boardlist = dao.selectBoardList();
				request.setAttribute("list", boardlist);
				forward > view > JSP > request.getAttribute("list");
				화면의 출력
			*/
			viewpage = "/board/boardlist.jsp";
		}else if(cmd.equals("boardwrite")) {
			viewpage = "/board/boardwrite.jsp";
		}else if(cmd.equals("boarddelete")) {
			viewpage = "/board/boarddelete.jsp";
		}else if(cmd.equals("boardlogin")) {
			viewpage = "/WEB-INF/views/login/login.jsp";
		}else {
			viewpage = "/error/error.jsp";
		}
```

위와같이 cmd = ~~~ 하는 값을 받아와 각각의 jsp를 분류해주는 방식이다
# ๐ Day44_221025

Author: ๊ณ ๋ฒ์ข
Created Time: 2022๋ 10์ 25์ผ ์ค์  9:20
Status: ๐จ Published
Updated Time: 2022๋ 10์ 25์ผ ์คํ 6:04

# 1. Tomcat์ ๊ณต(WAS)

## ๊ธฐ๋ณธ์ ์ธ ๋ด์ฅ ๊ฐ์ฒด

1. request (์์ฒญ: ํด๋ผ์ด์ธํธ ์ ๋ณด)
2. response (์๋ต: ํน์  ํ์ด์ง ์ด๋ , ์ ๋ณด ์ถ๋ ฅ , ์ฟ ํค ์ฐ๊ธฐ)
3. application(์ ์ญ๊ฐ์ฒด: web.xml ์์ ์ ๊ทผ read , ์ ์ญ๋ณ์)
4. session(๊ณ ์ ๊ฐ์ฒด(์ ์ํ ์ฌ์ฉ์์๊ฒ ๋ถ์ฌ๋๋): ๊ณ ์ ํ ๋ณ์)
5. out (์ถ๋ ฅ)

## session๊ฐ์ฒด (ํ์ฉ๋ ^^)

[๋ด๋ถ์ session๋ณ์ ์์ฑ]

scope : a.jsp(session.setAtt.."member" ๋ณ์ ์์ฑ)
b.jsp(session.getAtt.. "member" ์ฌ์ฉ๊ฐ๋ฅ)

session ๋ณ์๋ (ํ์ฌ Webapp  ํด๋ ์์ ์๋ ๋ชจ๋  ํ์ด์ง์์ ์ฌ์ฉ ๊ฐ๋ฅ)

Life-cycle : 1. session๋ณ์๋ session๊ฐ์ฒด์ ๋์ผ
2. session ์๋ฉธ : ์๋ฒ ๋ฆฌ๋ถํ , Tomcat ์ฌ์คํ , session.invaildate()

## application ๊ฐ์ฒด

[๋ด๋ถ์ application๋ณ์ ์์ฑ : ์ ์ญ๋ณ์ >>๋ชจ๋  session (์ ์ํ ๋ชจ๋  ์ฌ์ฉ์) ๊ณต์ 
scope :   (ํ์ฌ Webapp  ํด๋ ์์ ์๋ ๋ชจ๋  ํ์ด์ง์์ ์ฌ์ฉ ๊ฐ๋ฅ) >> java >> static
Life-cycle : ์๋ฉธ (์๋ฒ ๋ฆฌ๋ถํ)   , Tomcat ์ฌ์คํ

## request ๊ฐ์ฒด

********* ์ง์ง ์ค์*********

[๋ด๋ถ์ ๋ณ์ ์์ฑ] : request.setAttribute("type","A");  
scope: ์์ฒญ ํ์ด์ง(login.jsp >> ์์ฒญ๋น request ์์ฑ >> scope >> page

์์ธ์ ์ผ๋ก ^^^^^^^^^
login.jsp >> ok.jsp(**include or forward**) request ๊ฐ์ฒด๋ ok.jsp ๊ณต์ ๋๋ค

์๋ฐ ์น์ ๋ค๋ฃจ๋ ๊ธฐ์  424p 12.6 ์์  ์ฐ์ตํ๋ฉด ์กฐ์

```java
Emp emp = new Emp();
emp.setEmpno(2000);
emp.setEname("ํ๊ธธ๋");

session.setAttribute("empobj", emp);
//(String name, Object value) -> ๋จ์  downcasting ํ์

//session (์๋ฅผ ๋ค์ด ๋ค๋ฅธ ํ์ด์ง๋ผ๊ณ  ๊ฐ์ )
Emp e = (Emp)session.getAttribute("empobj");
out.print(e.getEmpno() + "<br>");
out.print(e.getEname() + "<br>");

//request
request.setAttribute("who", "king");
//Scope (ํ์ฌ ํ์ด์ง)

String who = (String)request.getAttribute("who");
out.print(who);

/*
์์ธ์ ์ผ๋ก
<jsp:include page="b.jsp"></jsp:include>
1. b.jsp ์์ session๋ณ์ >> empobj >> ์ฌ์ฉ(O) >> session์ด๋ include์ ์๊ด์์ด.
2. b.jsp ์์ request๋ณ์ >> who >> ์ฌ์ฉ(O) >> include ํ์ผ๋๊น

+

EL & JSTL
```

# 2. Servlet

## 2.1 JSP MVC model

- Model1

์ถ๋ ฅ์ ์ํ view์ฝ๋์ ๋ก์ง ์ฒ๋ฆฌ๋ฅผ ์ํ ์๋ฐ ์ฝ๋๊ฐ ํจ๊ป ์์ด JSP์ฝ๋ ์์ฒด๊ฐ ๋ณต์กํด์ง๋ค.

๊ณผ๊ฑฐ์ ๋ง์ด ์ฌ์ฉ๋์๋ ์ํคํ์ณ๋ก ๊ฐ๋จํ ํ์ด์ง๋ฅผ ๊ตฌ์ฑํ๊ฑฐ๋ ๋น ๋ฅธ ์๊ฐ ์์ ๊ฐ๋ฐํ๋๋ฐ ์ฌ์ฉ๋์ด์๋ค.

- Model2

JSP์์ ๋ชจ๋  ์์ฒญ๊ณผ ์ฒ๋ฆฌ๋ฅผ ๋ด๋นํ๋ ๊ฒ์ด ์๋๋ผ JSP๋ view๋จ์ ๋งก๊ณ  ์์ฒญ์ ๋ํ ํ๋ฆ์ ์ด๋

Controller์ธ ์๋ธ๋ฆฟ์์ ๋ด๋นํ๋ฉฐ ์์ฒญ์ ๋ํ ๋ก์ง์ฒ๋ฆฌ๋ Model์ธ ์๋น์คํด๋์ค ํน์ ์๋ฐ๋น์ด ๋ด๋นํ๋ค.

```java
SimpleController extends HttpServlet
SimpleController๋ HttpServlet ํ๊ณ  ์์ด์ 
SimpleController.java ํ์ผ >> ์๋ธ๋ฆฟ(์ผ๋ฐ ์๋ฐํ์ผ์ ์น์์ ์ฌ์ฉํ  ์ ์๊ฒ ๋ง๋ค์์ด์)

HttpServletRequest request = new HttpServletRequest();
์๋ ์คํ ...request ํด๋ผ์ด์ธํธ ์ ๋ณด๋ฅผ ๋ด์์ .... ํ์ฉํ ์ ๋ณด๋ฅผ ์ฌ์ฉ

jsp ํ์ผ ๊ฐ์ ๊ฒฝ์ฐ
์ฃผ์์ฐฝ์ : http://..... /login.jsp 

servlet ํ์ผ ๊ฐ์ ๊ฒฝ์ฐ
์ฃผ์์ฐฝ์ : http://..... /SimpleController.java ...(x)
 
web.xml ํ์ผ์์ ์ค์ 
[์ด๋ค ์์ฒญ]์ด ๋ค์ด์ค๋ฉด  SimpleController ์๋ฐํ์ผ์ ์ปดํ์ผํ๊ณ  ์คํํ๊ฒ ํ  ๊ฑฐ๋ ....
[์ด๋ ํ ์ฃผ์๋ก ์์ฒญ ๋๋ฉด] ...SimpleController ์๋ฐํ์ผ์ ์ปดํ์ผํ๊ณ  ์คํํ๊ฒ ํ  ๊ฑฐ๋ ....

        <servlet-name>simplecontroller</servlet-name>
  		<url-pattern>/simple</url-pattern>

        1. http://192.168.0.26:8090/WebServlet_1/simple ์์ฒญ์ด ๋๋ฉด
        2. com.SimpleController ํจํค์ง ์์ ์๋ ..
        3. SimpleController.java ์ปดํ์ผํ๊ณ  ์คํ
  

 ์๋ธ๋ฆฟ ์กฐ๊ฑด : ์ผ๋ฐ java ํ์ผ์ด extends HttpServlet ์์ >> ์น ์์ฒญ(request),์๋ต(response) ๊ฐ์ฒด ์ฌ์ฉ
 -servlet์ url์ ๋ฐ๋ก ์์ฒญ์ด ์๋์ >> ํน์ ์์ฒญ >> mapping >> ๋งคํ๋ ๊ฐ์ฒด ์คํ
 
 ์ค์ 
 1. web.xml  (๊ตฌ๋ฐฉ์)
 2. @WebServlet (ํ์ฌ ....) ๋งคํ์์ .....
 
 -extends HttpServlet
 -SimpleController ์๋ธ๋ฆฟ (์น ์ ์ฉ์ด๋ผ)
 -servlet  ์ด๋ฒคํธ ๊ธฐ๋ฐ ๋์( ๋ค์ํ ํจ์๋ ํน์ ์ฌ๊ฑด(์ด๋ฒคํธ) ๊ฐ ๋ฐ์ํ๋ฉด ์๋ํธ์ถ
 
 -์๋ ํธ์ถ ํจ์
 protected void doGet 
 >> http://192.168.0.26:8090/WebServlet_1/simple ์์ฒญ๋ฐฉ์ GET ๋ฐฉ์ doGet ์๋ํธ์ถ

 
 protected void doPost
 >> http://192.168.0.26:8090/WebServlet_1/simple ์์ฒญ๋ฐฉ์ POST ๋ฐฉ์ doPost ์๋ํธ์ถ
 >> <form action=""  method="POST" ....

 doGet() ํจ์์ doPost()
 1. request, response ๊ฐ์ฒด๋ฅผ ๋ฐ์ ์ ์๊ฒ
    doGet(HttpServletRequest request, HttpServletResponse response)
    ํจ์์์์ request ์ response ์ฌ์ฉํด์ ....
```

## ********์ ์ผ์ค์********

WebServlet_1 ํ์ผ ์ฐธ์กฐ

1. ํ๊ธ์ฒ๋ฆฌ
2. ๋ฐ์ดํฐ ๋ฐ๊ธฐ
3. ํ๋จํ๊ธฐ(์์ฒญ) (๋ก์ง์ฒ๋ฆฌ)
4. ๋ฐ์ดํฐ ์ ์ฅ
5. view ํ์ด์ง ์ค์ 
6. view ๋ฐ์ดํฐ ์ ๋ฌ(forward)

์์)

```java
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET");
		//http://192.168.0.65:8090/WebServlet_1/action.do?cmd=greeting
		
		//1. ํ๊ธ์ฒ๋ฆฌ
			request.setCharacterEncoding("UTF-8");
		//2. ๋ฐ์ดํฐ ๋ฐ๊ธฐ
			String cmd = request.getParameter("cmd");
		//3. ํ๋จํ๊ธฐ(์์ฒญ)(๋ก์ง์ฒ๋ฆฌ)
			String msg="";
			if(cmd.equals("greeting")) {
				//java ํ์ผ ์ฉ์ด (DAO, DTO)
				Message m = new Message();
				msg = m.getMessage(cmd);
			}
		//4. ๋ฐ์ดํฐ ์ ์ฅ
			request.setAttribute("msg", msg);
		//5. view ํ์ด์ง ์ค์ 
			RequestDispatcher dis = request.getRequestDispatcher("/greeting.jsp");
		//6. view ๋ฐ์ดํฐ ์ ๋ฌ(forward)
			dis.forward(request, response);
	}
```

## 2.2 CMD ๋ฐฉ์

```java
if (cmd == null) {
			viewpage = "/error/error.jsp";
		}else if(cmd.equals("boardlist")) {
			//์ค์ ์ฝ๋
			/*
				DB์ฐ๊ฒฐ > select > ๊ฐ์ฒด ๋ด๊ธฐ ....
				boardDao dao = new boardDad();
				List<board> boardlist = dao.selectBoardList();
				request.setAttribute("list", boardlist);
				forward > view > JSP > request.getAttribute("list");
				ํ๋ฉด์ ์ถ๋ ฅ
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

์์๊ฐ์ด cmd = ~~~ ํ๋ ๊ฐ์ ๋ฐ์์ ๊ฐ๊ฐ์ jsp๋ฅผ ๋ถ๋ฅํด์ฃผ๋ ๋ฐฉ์์ด๋ค
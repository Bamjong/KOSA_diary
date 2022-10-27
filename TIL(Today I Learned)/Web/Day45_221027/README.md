# 📚 Day46_221027

Author: 고범종
Created Time: 2022년 10월 27일 오전 9:08
Status: 🖨 Published
Tags: JSP, JSTL, ajax, format, 예외처리
Updated Time: 2022년 10월 27일 오후 9:44

# 1. 예외처리

```java
<h3>예외처리</h3>
	<!--
	<c:catch> 안에 구문이 예외가 발생하면 예외객체가 생성되고
	예외객체주소를 받아서 처리
	
	var="msg" 자바 Exception msg
	 -->
	<c:catch var="msg">
		name: <%= request.getParameter("name") %>
		<%
			if(request.getParameter("name").equals("hong")){
				out.print("당신의 이름은: " +request.getParameter("name"));
			}
		%>
	</c:catch>
	<c:if test=""${msg != null}">
		<h3>예외발생</h3>
		오류메시지 : ${msg}<br>
	</c:if>
```

# 2. JSTL format

- 숫자관련
- 날짜관련

```java
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Fmt 포맷관련</title>
</head>
<body>
 <h3>숫자관련</h3>
 변수선언 : <c:set var="price" value="1000000"></c:set><br>
 변수값 출력:${price}<br>
 fmt:
 
 <fmt:formatNumber value="${price}" type="number" /><br>
 <fmt:formatNumber value="50000000" type="currency" currencySymbol="$" /><br>
 <fmt:formatNumber value="0.13"     type="percent"/>
 변수에 설정 <br>
 <fmt:formatNumber value="123456789" pattern="###,###,###" var="pdata" />
 변수에 설정한 값 : ${pdata}<br>
 
 <hr>
 <h3>날짜 관련 format</h3>
 변수선언 : <c:set var="now" value="<%= new Date() %>" /><br>
 변수값 : ${now}<br>
 Basic Date : <fmt:formatDate value="${now}" type="date" /><br>
 DateStyle(full) : <fmt:formatDate value="${now}" type="date" dateStyle="full" /><br>
 DateStyle(short) : <fmt:formatDate value="${now}" type="date" dateStyle="short" /><br>
 시간:<fmt:formatDate value="${now}" type="time"/><br>
 날짜 + 시간:<fmt:formatDate value="${now}" type="both"/><br>
 혼합:<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full" /><br>
    혼합2:<fmt:formatDate value="${now}" type="both" dateStyle="short" timeStyle="short" /><br>
</body>
</html>
```

# 3. 앞 주소 가져오기

- JAVA: request.getContextPath()
- EL: pageContext.request.contextPath

# 4. **Servlet 요청에 대한 흐름**

![https://cafeptthumb-phinf.pstatic.net/MjAyMDEwMjFfMjU2/MDAxNjAzMjU2NTUyODk4.hKy_gYkkUx93W_XQ0Lh5FzUkaxuHFF4qRudOevlz8n8g.TjgeQ1--cw4QDjKZDOZp7xdjTWsuV-Xw0TGhjAUMFdog.PNG/%EC%84%9C%EB%B8%94%EB%A6%BF.PNG?type=w1600](https://cafeptthumb-phinf.pstatic.net/MjAyMDEwMjFfMjU2/MDAxNjAzMjU2NTUyODk4.hKy_gYkkUx93W_XQ0Lh5FzUkaxuHFF4qRudOevlz8n8g.TjgeQ1--cw4QDjKZDOZp7xdjTWsuV-Xw0TGhjAUMFdog.PNG/%EC%84%9C%EB%B8%94%EB%A6%BF.PNG?type=w1600)

## 4.1 Model2 기반의 MVC 패턴 적용 웹 프로젝트

Model1 >> 요청을 JSP 받아서 처리하는 방식
Model2 >> 요청을 servlet 받아서 처리하는 방식

+ MVC

Model: JAVA 클래스 > DTO, DAO(JDBC)
View: html or jsp(EL & JSTL)
Controller: servlet(웹용 자바파일)

# 5. ajax 비동기식 처리

(WebServlet_4_Memo_mvc)참조

AJAX is a developer's dream, because you can:

- Read data from a web server - after the page has loaded
- Update a web page without reloading the page
- Send data to a web server - in the background

• A browser built-in `XMLHttpRequest` object (to request data from a web server)

1. XMLHttpRequest 객체 얻기
2. onreadystatechange 이벤트 핸들러 구현 (함수)
3. 요청 정보 ( open() )
4. 요청 보내기 (send() )
5. 응답 처리 (Text(JSON), xml)

서버가 비동기로 클라이언트 줄 수 있는  Data
1. Text (text, html , script , css , json)  >> responseText
2. xml                                                  >> responseXML

servlet에서 out.print(”와랄라”) 한 값을 js에서 console.log(httpReq.responseText); 이런식으로 받음

```java
function sendData(data){
		      httpReq = getInstance();
		      httpReq.onreadystatechange = handlerStateChange;  // x >> (
		      httpReq.open("POST","MemoId?id="+data); //form 태그 구성
		      //jsp?no=0  or  jsp?no=1
		      httpReq.send(); // form submit 버튼 클릭
		   }
		   
		   document.getElementById("message").addEventListener("click",() => {
		    	let data = document.getElementById("id").value;
		    	console.log(data);
		    	sendData(data);
		    })
```

- html에서 servlet으로 값을 보내려고 button을 눌렀을경우 sandData함수를 통해 보내도록 함
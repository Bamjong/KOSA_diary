# π Day46_221027

Author: κ³ λ²μ’
Created Time: 2022λ 10μ 27μΌ μ€μ  9:08
Status: π¨ Published
Tags: JSP, JSTL, ajax, format, μμΈμ²λ¦¬
Updated Time: 2022λ 10μ 27μΌ μ€ν 9:44

# 1. μμΈμ²λ¦¬

```java
<h3>μμΈμ²λ¦¬</h3>
	<!--
	<c:catch> μμ κ΅¬λ¬Έμ΄ μμΈκ° λ°μνλ©΄ μμΈκ°μ²΄κ° μμ±λκ³ 
	μμΈκ°μ²΄μ£Όμλ₯Ό λ°μμ μ²λ¦¬
	
	var="msg" μλ° Exception msg
	 -->
	<c:catch var="msg">
		name: <%= request.getParameter("name") %>
		<%
			if(request.getParameter("name").equals("hong")){
				out.print("λΉμ μ μ΄λ¦μ: " +request.getParameter("name"));
			}
		%>
	</c:catch>
	<c:if test=""${msg != null}">
		<h3>μμΈλ°μ</h3>
		μ€λ₯λ©μμ§ : ${msg}<br>
	</c:if>
```

# 2. JSTL format

- μ«μκ΄λ ¨
- λ μ§κ΄λ ¨

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
<title>JSTL Fmt ν¬λ§·κ΄λ ¨</title>
</head>
<body>
 <h3>μ«μκ΄λ ¨</h3>
 λ³μμ μΈ : <c:set var="price" value="1000000"></c:set><br>
 λ³μκ° μΆλ ₯:${price}<br>
 fmt:
 
 <fmt:formatNumber value="${price}" type="number" /><br>
 <fmt:formatNumber value="50000000" type="currency" currencySymbol="$" /><br>
 <fmt:formatNumber value="0.13"     type="percent"/>
 λ³μμ μ€μ  <br>
 <fmt:formatNumber value="123456789" pattern="###,###,###" var="pdata" />
 λ³μμ μ€μ ν κ° : ${pdata}<br>
 
 <hr>
 <h3>λ μ§ κ΄λ ¨ format</h3>
 λ³μμ μΈ : <c:set var="now" value="<%= new Date() %>" /><br>
 λ³μκ° : ${now}<br>
 Basic Date : <fmt:formatDate value="${now}" type="date" /><br>
 DateStyle(full) : <fmt:formatDate value="${now}" type="date" dateStyle="full" /><br>
 DateStyle(short) : <fmt:formatDate value="${now}" type="date" dateStyle="short" /><br>
 μκ°:<fmt:formatDate value="${now}" type="time"/><br>
 λ μ§ + μκ°:<fmt:formatDate value="${now}" type="both"/><br>
 νΌν©:<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full" /><br>
    νΌν©2:<fmt:formatDate value="${now}" type="both" dateStyle="short" timeStyle="short" /><br>
</body>
</html>
```

# 3. μ μ£Όμ κ°μ Έμ€κΈ°

- JAVA: request.getContextPath()
- EL: pageContext.request.contextPath

# 4. **Servlet μμ²­μ λν νλ¦**

![https://cafeptthumb-phinf.pstatic.net/MjAyMDEwMjFfMjU2/MDAxNjAzMjU2NTUyODk4.hKy_gYkkUx93W_XQ0Lh5FzUkaxuHFF4qRudOevlz8n8g.TjgeQ1--cw4QDjKZDOZp7xdjTWsuV-Xw0TGhjAUMFdog.PNG/%EC%84%9C%EB%B8%94%EB%A6%BF.PNG?type=w1600](https://cafeptthumb-phinf.pstatic.net/MjAyMDEwMjFfMjU2/MDAxNjAzMjU2NTUyODk4.hKy_gYkkUx93W_XQ0Lh5FzUkaxuHFF4qRudOevlz8n8g.TjgeQ1--cw4QDjKZDOZp7xdjTWsuV-Xw0TGhjAUMFdog.PNG/%EC%84%9C%EB%B8%94%EB%A6%BF.PNG?type=w1600)

## 4.1 Model2 κΈ°λ°μ MVC ν¨ν΄ μ μ© μΉ νλ‘μ νΈ

Model1 >> μμ²­μ JSP λ°μμ μ²λ¦¬νλ λ°©μ
Model2 >> μμ²­μ servlet λ°μμ μ²λ¦¬νλ λ°©μ

+ MVC

Model: JAVA ν΄λμ€ > DTO, DAO(JDBC)
View: html or jsp(EL & JSTL)
Controller: servlet(μΉμ© μλ°νμΌ)

# 5. ajax λΉλκΈ°μ μ²λ¦¬

(WebServlet_4_Memo_mvc)μ°Έμ‘°

AJAX is a developer's dream, because you can:

- Read data from a web server - after the page has loaded
- Update a web page without reloading the page
- Send data to a web server - in the background

β’ A browser built-inΒ `XMLHttpRequest`Β object (to request data from a web server)

1. XMLHttpRequest κ°μ²΄ μ»κΈ°
2. onreadystatechange μ΄λ²€νΈ νΈλ€λ¬ κ΅¬ν (ν¨μ)
3. μμ²­ μ λ³΄ ( open() )
4. μμ²­ λ³΄λ΄κΈ° (send() )
5. μλ΅ μ²λ¦¬ (Text(JSON), xml)

μλ²κ° λΉλκΈ°λ‘ ν΄λΌμ΄μΈνΈ μ€ μ μλ  Data
1. Text (text, html , script , css , json)  >> responseText
2. xml                                                  >> responseXML

servletμμ out.print(βμλλΌβ) ν κ°μ jsμμ console.log(httpReq.responseText); μ΄λ°μμΌλ‘ λ°μ

```java
function sendData(data){
		      httpReq = getInstance();
		      httpReq.onreadystatechange = handlerStateChange;  // x >> (
		      httpReq.open("POST","MemoId?id="+data); //form νκ·Έ κ΅¬μ±
		      //jsp?no=0  or  jsp?no=1
		      httpReq.send(); // form submit λ²νΌ ν΄λ¦­
		   }
		   
		   document.getElementById("message").addEventListener("click",() => {
		    	let data = document.getElementById("id").value;
		    	console.log(data);
		    	sendData(data);
		    })
```

- htmlμμ servletμΌλ‘ κ°μ λ³΄λ΄λ €κ³  buttonμ λλ μκ²½μ° sandDataν¨μλ₯Ό ν΅ν΄ λ³΄λ΄λλ‘ ν¨
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	웹 환경
	
	client	->	server	(요청된 정보를 request객체사용 read 사용)
		(request: 요청)
		
	server	->	client	(response 응답 >> 결과 >> 클라이언트 웹 브라우저 해석)
		(response: 응답: 하는 내용은 해석가능(Text, html, css, script)
		
	request
	response
	session
	application
	out등등
	(아파치 톰켓 WAS : javax.객체 들을 가지고 있다)
	
	response
	1. 표현식 (출력) %=
	2. 페이지 이동 처리 (response.sendRedirect)
	response.sendRedirect("Ex01.html") => 서버 랜더링 => location.href="Ex01.html" 
	
	****javascript : 페이지 이동 처리 : location.href="Ex01.html"
	****서버에게 페이지를 재요청 : F5(새로고침)
 -->
 1. 일반적인 출력(표현식): <%= 100+200+300 %>
 2. sendRedirect : response객체 함수
 <%
 	response.sendRedirect("Ex01_index.jsp"); //이 페이지를 서버에게 재요청
 %>

</body>
</html>
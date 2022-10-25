<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error/commonError.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	Error (예외상황) 처리 페이지
	최종 배포 전에 만들어서 처리 ....
	
	1. 페이지 마다 설정하기
	2. 전역 설정하기
	
	페이지에 지역 설정 되어있으면 그 놈이 우선....
	
 -->
<%
	String data = request.getParameter("name");
	
	String data2= data.toLowerCase(); //null 인 경우
%>
전달받은 내용 : <%=data%>
</body>
</html>
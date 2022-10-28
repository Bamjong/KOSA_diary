<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	Date date = new Date();
	SimpleDateFormat formatt = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
	
	String currentTime = formatt.format(date);
	
	request.setAttribute("time", currentTime);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${time}
	
	<ul>
		<li>으악!</li>
		
	</ul>
	
</body>
</html>
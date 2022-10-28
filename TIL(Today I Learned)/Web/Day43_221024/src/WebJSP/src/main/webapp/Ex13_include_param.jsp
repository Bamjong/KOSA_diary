<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//http://192.168.0.25:8090/WebJSP/Ex13_include_param.jsp?type=A&userid=hong
	
	request.setCharacterEncoding("UTF-8");

	String type=request.getParameter("type");
	String userid=request.getParameter("userid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	type=<%=type%>
	<br>
	userid=<%=userid%>
	<hr>
	<!-- incldue 페이지는 request를 공유가능 -->
	<!-- 변수를 만들어서 include페이지 전달가능 -->
	<jsp:include page="Ex13_param.jsp">
		<jsp:param value="baseball" name="hobby"/>
	</jsp:include>
	
</body>
</html>
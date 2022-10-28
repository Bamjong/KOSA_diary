<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 배포되면 ip 도메인 바뀌므로 
   href에 http://localhost:8090/WebServlet_2/index.jsp 값을 넣지 않는다.,
 -->
   <h3>index page</h3>
   <a href="${pageContext.request.contextPath}/NowServlet">요청하기</a>
   <br>
   <a href="${pageContext.request.contextPath}/Now.do">요청하기</a>
   <br>
   <a href="${pageContext.request.contextPath}/Now.action">요청하기</a>
</body>
</html>
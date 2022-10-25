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
   
   client -> server (요청된 정보를 request 객체 사용 read 사용)
         (request : 요청)
   server -> client (response 응답 >> 결과 >> client 웹 브라우저 해석)
         (response : 응답 - 응답 내용은 해석 가능한 text, html, css, script 형태)
   request
   response
   session
   application
   out 등등
   (아파치 톰캣 WAS : javax.객체틀을 가지고 있다)
   
   response
   1. 표현식 (출력) %=
   2. 페이지 이동 처리 (response.sendRedirect)
   response.sendRedirect("Ex01.html") =>서버렌더링 => location.href = "Ex01.html"
   
   *** javascript : 페이지 이동 처리 : location.href = "Ex01.html"
   *** 서버에게 페이지를 재요청 : f5 새로고침 
   
 -->
 1. 일반적인 출력(표현식) : <%= 100+200+300 %>
 2. sendRequest : response 객체 함수
 
 <%
    //response.sendRedirect("Ex01_index.jsp"); //이 페이지를 서버에게 재 요청
 %>
 
 <script type = "text/javascript">
    location.href="Ex01_index.jsp";
 </script>
</body>
</html>
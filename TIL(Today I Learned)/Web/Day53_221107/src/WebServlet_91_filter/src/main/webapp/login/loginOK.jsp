<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글깨짐 
//	request.setCharacterEncoding("UTF-8");

//1. 한글처리
//2. 한글 처리 코드가 모든 페이지 상단에 공통사항(공통관심)
//3. 공통관심(보조관심) 분리하자 (한곳에 통합 관리) >> filter
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
한글명 : ${param.kor}<br>
영문명 : ${param.eng}<br>

</body>
</html>
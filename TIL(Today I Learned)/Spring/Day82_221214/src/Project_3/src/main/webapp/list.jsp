<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="600">
		<tr>
			<td>DEPTNO</td>
			<td>DNAME</td>
			<td>LOC</td>
			<td>Detail</td>
			<td>Delete</td>
		</tr>
		 <c:forEach var="list" items="${list}">
			<tr>
				<td>${list.deptno}</td>
				<td>${list.dname}</td>
				<td>${list.loc}</td>
				<%-- <td><a href="javascript:location.href='guest.do?cmd=detail&no=${list.no}'">상세보기</a></td>
				<td><a href="javascript:location.href='guest.do?cmd=delete&no=${list.no}'">삭제하기</a></td> --%>
			</tr>
		</c:forEach> 
	</table>	
	<a href="WriteForm.jsp">글쓰기</a>
	<a href="SearchList.jsp">조건조회</a>
</body>
</html>
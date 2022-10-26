<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="DAO.EmpDao"%>
<%@page import="DTO.Emp"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="UTILS.SingletonHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--  
종합 퀴즈 (조별 퀴즈)

EMP 테이블에서 사원전체 데이터를 출력하는 DTO , DAO 를 작성하세요 (JDBC 참고)
그리고 그 데이터 14건을 
EL & JSTL 을 사용해서 출력하세요
단)부트템플릿 사용하세요
-->    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resource/css/bootstrap.css">
<script type="text/javascript" src="/resource/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.js"></script>
</head>
<body>
<%
EmpDao dao = new EmpDao();
List<Emp> emplist =dao.getEmpAllList();
	 /* for(Emp data : emplist){
		out.print(data.toString());
	}  */
	
request.setAttribute("list", emplist);
%>


<table class="table class="table table-striped">
 <thead>
   <tr>
      <th>empno</th>
      <th>ename</th>
      <th>job</th>
      <th>mgr</th>
      <th>hiredate</th>
      <th>sal</th>
      <th>comm</th>
      <th>deptno</th>
   </tr>
 </thead>
 <tbody>
 <c:forEach var="emp" items="${requestScope.list}">
   <tr>
		<td>${emp.empno}</td>
		<td>${emp.ename}</td>
		<td>${emp.job}</td>
		<td>${emp.mgr}</td>
		<td>${emp.hiredate}</td>
		<td>${emp.sal}</td>
		<td>${emp.comm}</td>
		<td>${emp.deptno}</td>
   </tr>
   </c:forEach>
 </tbody> 

</table>

<!-- empno ename job mgr hiredate sal comm deptno -->

</body>
</html>
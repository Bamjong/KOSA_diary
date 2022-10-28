<%@page import="java.util.List"%>
<%@page import="kr.or.kosa.dto.Emp"%>
<%@page import="kr.or.kosa.dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	EmpDao dao = new EmpDao();
	List<Emp> emplist = dao.getEmpAllList();
	
	request.setAttribute("emplist", emplist);
%>

<table class="table caption-primary" >
	  <caption id="movie_date"></caption>
	  			<thead>
				    <tr>
				      <th scope="col">empno</th>
				      <th scope="col">ename</th>
				      <th scope="col">job</th>
				      <th scope="col">mgr</th>
				      <th scope="col">hiredate</th>
				      <th scope="col">sal</th>
				      <th scope="col">comm</th>
				      <th scope="col">deptno</th>
				    </tr>
				  </thead>
		<c:forEach var="emp" items="${requestScope.emplist}">
		  <tbody id="tbody">
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
		  </tbody>
		</c:forEach>
</table>
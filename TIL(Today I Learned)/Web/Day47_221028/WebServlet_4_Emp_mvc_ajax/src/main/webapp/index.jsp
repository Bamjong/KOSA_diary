<%@page import="kr.or.kosa.dto.Emp"%>
<%@page import="kr.or.kosa.dao.EmpDao"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>

<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<script type="text/javascript">
	
		let httpReq=null;
		   
		   function getInstance(){
		        if(window.XMLHttpRequest){
		           httpReq = new XMLHttpRequest(); //현재 브라우져 XMLHttpRequest 내장
		        }else if(window.ActiveXObject){ //IE6 이하   //지금 필요없어요
		           httpReq = new ActiveXObject("Msxml2.XMLHTTP");
		        }else{
		          throw new Error("AJAX 지원하지 않습니다"); 
		        }
		      return httpReq;  
		      
		   }
		   function handlerStateChange(){
		       if(httpReq.readyState == 4){ //1. 서버에서 응답이 왔다면
		          if(httpReq.status >= 200 && httpReq.status < 300){
		             //개발자 마음 (가공)
		             //서버가 비동기로 클라이언트 줄 수 있는  Data
		             //1. Text (text, html , script , css , json)  >> responseText
		             //2. xml                                      >> responseXML
		             
		             document.getElementById("change").innerHTML = httpReq.responseText;
		              
		          }else{
		             alert("status Text : " + httpReq.status);
		          }
		       }
		   }
		   
		   function sendData(empno){
				httpReq = getInstance();
				httpReq.onreadystatechange = handlerStateChange;  // x >> ()
				httpReq.open("POST","EmpServlet?empno="+ empno); //form 태그 구성
				httpReq.send(); // form submit 버튼 클릭
		   }
		   
		   
		 
	</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>

</head>
<body class="sb-nav-fixed">

	<jsp:include page="/common/top.jsp"></jsp:include>

	<%
	EmpDao dao = new EmpDao();
	List<Emp> emplist = dao.getEmpAllList();

	request.setAttribute("list", emplist);
	%>

	<div id="layoutSidenav">
		<jsp:include page="/common/sidenav.jsp"></jsp:include>

		<div id="layoutSidenav_content">
			<!--/////////////////////// 작성 부분////////////////////////////// -->
			<h3>단어 검색하기</h3>
				
				<div>
					<input type="text" id="empno_txt">
					<input type="button" value="확인" id="button">
				</div>
				<br><br>
				<fieldset>
					<legend>검색단어</legend>
					<span id="word"></span>
				</fieldset>
			
			<div id="change">
				<jsp:include page="commonyo.jsp"></jsp:include>
			</div>
		
			<!--/////////////////////// 작성 끝부분////////////////////////////// -->
			<jsp:include page="/common/footer.jsp"></jsp:include>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
	
	<script type="text/javascript">
	document.getElementById("button").addEventListener("click", function() {
		   console.log(document.getElementById("empno_txt").value);
		   sendData(document.getElementById("empno_txt").value);
	   })
	</script>

</body>
</html>
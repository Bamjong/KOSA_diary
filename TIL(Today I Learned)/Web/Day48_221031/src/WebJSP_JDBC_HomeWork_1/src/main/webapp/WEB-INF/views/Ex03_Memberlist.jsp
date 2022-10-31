<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: solid 2px black;
	border-collapse: collapse;
}

tr {
	border: solid 1px blue;
	background-color: white;
	color: black;
}

td {
	border: solid 1px red;
}
</style>
</head>
<body>

	<table
		style="width: 900px; height: 500px; margin-left: auto; margin-right: auto;">
		<tr>
			<td colspan="2"><jsp:include page="/common/Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="width: 200px"><jsp:include page="/common/Left.jsp"></jsp:include>
			</td>
			<td style="width: 700px">


				<table
					style="width: 400px; height: 100px; margin-left: auto; margin-right: auto">
					<tr>
						<th colspan="4">회원리스트</th>
					</tr>
					<c:forEach var="memberlist" items="${memberlist}">
						<tr>
							<td width="100px">
								<a href='Ex03_MemberDetail.do?id=${memberlist.id}'>${memberlist.id}</a>
							</td>
							<td width="100px">${memberlist.ip}</td>
							<td><a
								href="Ex03_MemberDelete.do?id=${memberlist.id}">[삭제]</a>
							</td>
							<td><a href="Ex03_MemberEdit.do?id=${memberlist.id}">[수정]</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				<hr>
				<form action="Ex03_MemberSearch.do" method="post">
					회원명:<input type="text" name="search"> <input type="submit"
						value="이름검색하기">
				</form>
				<hr>


			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include></td>
		</tr>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   /* 
   회원정보 수정하기
   1.DB 쿼리 : 2개 (수정정보 : select , 수정정보반영 : update)
    1.1 : select * from koreamember where id=?
    1.2 : update koreamember set ename=? where id=?       
   2.화면 1개(기존에 입력내용 보여주는 것)-> 처리 1개 (수정처리)
    2.1  DB select 한 결과 화면 출력 
      <input type="text" value="rs.getString(id)">
         수정안하고 .. 화면 .. 전송(x) : <td>rs.getString("id")</td>
         수정안하고 .. 화면 .. 전송   : <input type="text" value="rs.getString(id)" readonly>
         수정하고 ..화면  ..전송   :  <input type="text" value="rs.getString(id)">
   
   */
%>   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Tables - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
   <!-- nav include -->
       <jsp:include page="/commonmodule/nav.jsp"></jsp:include>
       <!-- nav include -->
       <div id="layoutSidenav">
          <!-- side include -->
          <jsp:include page="/commonmodule/side.jsp"></jsp:include>
          <!-- side include -->
          
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">회원관리 페이지</h1>
                        <!-- <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol> -->
                        <div class="card mb-4"><!-- 
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div> -->
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                            <table  style="margin:auto;">
                        <tr>
                           <td >
                              <form action="Ex03_MemberEditok.do" method="post">
                                 <h3 style="text-align: center;">정보 수정</h3>
                                 <div>
                                    <table style="margin:auto;">
                                       <tr>
                                          <td>아이디</td>
                                          <td>
                                               <input type="text" name="id" value="${member.id}" readonly>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td>비번</td>
                                          <td>${member.pwd}</td>
                                       </tr>
                                       <tr>
                                          <td>이름</td>
                                          <td>
                                             <input type="text" name="name" value="${member.name}">
                                          </td>
                                       </tr>
                                       <tr>
                                          <td>나이</td>
                                          <td>
                                             <input type="text" name="age" value="${member.age}">
                                          </td>
                                       </tr>
                                       <tr>
                                          <td>성별</td>
                                          <td>
                                             [${member.gender}]
                                             <input type="radio" name="gender" id="gender" value="여"
                                             <c:if test="${member.gender} == '여'">checked</c:if>>여
                                             <input type="radio" name="gender" id="gender" value="남"
                                             <c:if test="${member.gender} == '남'">checked</c:if>>남
                                          </td>
                                       </tr>
                                       <tr>
                                          <td>이메일</td>
                                          <td>
                                             <input type="text" name="email" value="${member.email}">
                                          </td>
                                       </tr>
                                       <tr>
                                          <td colspan="2">
                                          <input type="submit" value="수정하기" class="btn btn-primary">
                                          <a href='Ex03_Memberlist.do' class="btn btn-primary">리스트이동</a></td>
                                    </table>
                                    </div>
                                 </div>
                                 </div>
                              </form>
                           </td>
                        </tr>
                     </table>
                            </div>
                        </div>
                    </div>
                </main>
         <!-- footer include -->
          <jsp:include page="/commonmodule/footer.jsp"></jsp:include>
          <!-- footer include -->
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
</body>
</html>
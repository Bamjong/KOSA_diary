# 📚 Day45_221026

Author: 고범종
Created Time: 2022년 10월 26일 오전 8:50
Status: 🖨 Published
Tags: JSTL, Shell
Updated Time: 2022년 10월 26일 오후 9:44

# 1. **EL & JSTL**

- jsp에는 스크립트의 값을 간결하고 편리하게 사용할 수 있는 표현언어를 사용할 수 있다.
- jsp에는 개발자가 직접 정의한 커스텀 태그라는 것도 사용할 수 있는데, 커스텀 태그들중 많이 사용되는 것들을 모 아서 제공하는 JSTL(JSP Standard Tag Library 표준태그 라이브러리)이라는 커스텀 태그가 있다.

## **1. EL**

- **EL 표현식**

EL은 "$"와 "{}"를 사용하여 값을 표현한다. {}안에는 값으로 표현되는 것만 와야 한다.

ex)
x변수의 값을 출력하고 싶으면 ${x}
배열변수 arr의 1번째 인덱스의 값을 출력하고 싶으면 ${arr[0]} or ${arr['0']}
member변수의 getName()값을 출력하고 싶으면 ${member.name} or
 ${member['name']}

- **EL 기본객체(내장객체)**

EL에는 jsp/servlet의 객체(pageContext제외)의 속성값이나 파라미터 값등을 쉽게 표현하기 위해서 기본객체를 제공한다.

EL(Expression Language)이 제공하는 11개의 기본 객체

## 2.JSTL

## 명령어

- * <c:set> 변수생성, 값을 저장
<c:remove> 변수 삭제
***<c:if test=""> 조건문 test="조건식 true, false"
***<c:choose> 여러가지 조건 처리 (if보다 활용도가 높아요)
***<c:forEach> 반복문 (개선된for문) >> javascript >> foreach ...
<c:forTokens> for문 split 결합
<c:out> 출력식... 하지만 그냥 EL ${}사용...
* <c:catch> 예외처리도 가능

### IF쓰는법

```java
String id = request.getParameter("ID");  //ID 설정

//일반)
if(id.equals("hong")){
%>
	<%=id%><img src="images/1.jpg" style="width: 100px; height: 100px">
<%
	}
%>

//JSTL
<c:if test="${param.ID == 'hong'}"> <!--    if(id.equals("hong")){      -->
	 	${param.ID}<img src="images/1.jpg" style="width: 100px; height: 100px">
</c:if>
```

```java
<c:if test="${param.age > 20}" var="result">

이런 식으로 if 안에 var을 넣어주면 
true or false를 출력한다.
```

### 정석

```java
//0. 이런 데이터가 있을경우..
List<Emp> emplist = new ArrayList<>();
	 emplist.add(new Emp(100,"A"));
	 emplist.add(new Emp(200,"B"));
	 emplist.add(new Emp(300,"C"));
	 //3건의 데이터가 ArrayList안에 ... 출력 목적

//1. request 담는다 ... servlet 할 거에요
	 request.setAttribute("list", emplist);

//2. 아래와 같이 items에 값을 넣는다

	 <table border="1">
		<tr><td>사번</td><td>이름</td></tr>
		<c:forEach var="emp" items="${requestScope.list}">
			<tr><td>${emp.empno}</td><td>${emp.ename}</td></tr>
		</c:forEach>	 
		이걸쓰세요!!! 제발!!!
	 </table>
```

### 예시)

- 구구단 5단 출력(forEach)

```java
<h3>구구단 5단 출력(forEach)</h3>
	  <ul>
	  	<c:forEach var="i" begin="1" end="9">
	 			<li>5*${i}=${5*i}</li>
		</c:forEach>
	  </ul>
```

- EL & JSTL 구구단 출력하기 (중첩 forEach)

```java
<h3>EL & JSTL 구구단 출력하기 (중첩 forEach)</h3>
	 <table border="1">
	 	<c:forEach var="i" begin="2" end="9">
	 		<c:forEach var="j" begin="0" end="9">
	 			<c:choose>
	 				<c:when test="${j == 0 }">
	 					<tr bgcolor="gold"><th>${i}단</th></tr>
	 				</c:when>
	 				<c:otherwise>
	 					<tr><td>${i}*${j}=${i*j}</td></tr>
	 				</c:otherwise>
	 			</c:choose>
	 		</c:forEach>
	 	</c:forEach>
	 </table>
```

- JSTL forEach 사용하기 (자바로!!)

```java
<%
	 	int[] arr = new int[]{10,20,30,40,50};
	 	for(int i : arr){
	 		out.print("출력값 : <b><i>" + i + "</i><b><br>");
	 	}
	 %>
```

- JSTL forEach(items)

```java
<h3>JSTL forEach 사용하기</h3>
	 <%
	 	int[] arr = new int[]{10,20,30,40,50};
	 	for(int i : arr){
	 		out.print("출력값 : <b><i>" + i + "</i><b><br>");
	 	}
	 %>
	 <h3>EL에서 JAVA객체 접근불가 (1.request, 2.JSTL)</h3>
	 <c:set var="intarr" value="<%=arr%>"/>
	 EL접근: ${intarr}<br>
	 <hr>
	 <h3>******forEach(items) 개선된 for문******</h3>
	 <c:forEach var="arr" items="${intarr}">
	 	배열값: ${arr}<br>
	 </c:forEach>
	 
	 <h3>단순하게</h3>
	 <c:forEach var="i" items="<%=arr%>">
	 	배열값: ${i}<br>
	 </c:forEach>
	 
	 <h3>재미삼아서</h3>
	 <c:forEach var="i" items="<%= new int[]{1,2,3,4,5} %>">
	 	배열값: ${i}<br>
	 </c:forEach>

맨 위 방식대로라면
arr -> intarr -> arr식으로해서 표현했다

단순하게는
arr -> <%=arr%> -> i

재미삼아서는 (사용안함)
<%= new int[]{1,2,3,4,5} %> -> i
```

# 예제)

- 문제1)

```java
String name = request.getParameter("name");
if(name.equals("kglim")){
    out.print("<b>" + name + "</b>");
}else if(name.equals("hong")){
    out.print("<i>" + name + "</i>");
}else{
    out.print("<h3>" + name + "</h3>");
}
out.print("<hr>");

위 코드를 EL 과 JSTL 변환 하세요
```

풀이)

```java
<c:choose>
	<c:when test = ${param.name} == "kglim">
	<b>${param.name}</b>
	</c:when>
	
	<c:when test = ${param.name} == "hong">
	<i>${param.name}</i>
	</c:when>
	
	<c:otherwise>
		<h3>${param.name}</h3>
	</c:otherwise>

</c:choose>
```

- 문제2)

```java
subject 다중값을 받아서 choose 구문을 사용하여 값이 하나도 선택되지 않았다면
"선택을 하세요" 라는 문자를 출력하고 
값이 하나라도 넘어 왔다면 ... <ul><li>java-0-1</li><li>jsp-1-2</li></ul> 과 같은 형식으로
출력하도록  forEach 를 작성하세요
추가사항) 출력시  값-index-count 형식으로 나오게 출력하세요
```

```java
<form action="Ex08_EL_JSTL_QUIZ.jsp" method="post">
    JAVA:  <input type="checkbox" name="subject" value="java"><br>
    JSP:   <input type="checkbox" name="subject" value="jsp"><br>
    ORACLE:<input type="checkbox" name="subject" value="oracle"><br>
    MYSQL: <input type="checkbox" name="subject" value="mysql"><br>
    <input type="submit" value="전송하기">
</form>
```

풀이)

```java
<c:set var="subject" value="${paramValues.subject}"/>
  	 
   	 <c:choose>
	  <c:when test="${subject != null}">
	    <ul>
		  <c:forEach var="i" items="${subject}" varStatus="status">
		     <li>${i}-${status.index}-${status.count}</li>
		  </c:forEach>
	 	</ul>
	  </c:when>
	  <c:otherwise> <p>선택 하세요</p> </c:otherwise>
	 </c:choose>
```
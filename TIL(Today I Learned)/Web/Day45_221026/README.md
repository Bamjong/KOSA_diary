# ๐ Day45_221026

Author: ๊ณ ๋ฒ์ข
Created Time: 2022๋ 10์ 26์ผ ์ค์  8:50
Status: ๐จ Published
Tags: JSTL, Shell
Updated Time: 2022๋ 10์ 26์ผ ์คํ 9:44

# 1. **EL & JSTL**

- jsp์๋ ์คํฌ๋ฆฝํธ์ ๊ฐ์ ๊ฐ๊ฒฐํ๊ณ  ํธ๋ฆฌํ๊ฒ ์ฌ์ฉํ  ์ ์๋ ํํ์ธ์ด๋ฅผ ์ฌ์ฉํ  ์ ์๋ค.
- jsp์๋ ๊ฐ๋ฐ์๊ฐ ์ง์  ์ ์ํ ์ปค์คํ ํ๊ทธ๋ผ๋ ๊ฒ๋ ์ฌ์ฉํ  ์ ์๋๋ฐ, ์ปค์คํ ํ๊ทธ๋ค์ค ๋ง์ด ์ฌ์ฉ๋๋ ๊ฒ๋ค์ ๋ชจ ์์ ์ ๊ณตํ๋ JSTL(JSP Standard Tag Library ํ์คํ๊ทธ ๋ผ์ด๋ธ๋ฌ๋ฆฌ)์ด๋ผ๋ ์ปค์คํ ํ๊ทธ๊ฐ ์๋ค.

## **1. EL**

- **EL ํํ์**

EL์ "$"์ "{}"๋ฅผ ์ฌ์ฉํ์ฌ ๊ฐ์ ํํํ๋ค. {}์์๋ ๊ฐ์ผ๋ก ํํ๋๋ ๊ฒ๋ง ์์ผ ํ๋ค.

ex)
x๋ณ์์ ๊ฐ์ ์ถ๋ ฅํ๊ณ  ์ถ์ผ๋ฉด ${x}
๋ฐฐ์ด๋ณ์ arr์ 1๋ฒ์งธ ์ธ๋ฑ์ค์ ๊ฐ์ ์ถ๋ ฅํ๊ณ  ์ถ์ผ๋ฉด ${arr[0]} or ${arr['0']}
member๋ณ์์ getName()๊ฐ์ ์ถ๋ ฅํ๊ณ  ์ถ์ผ๋ฉด ${member.name} or
 ${member['name']}

- **EL ๊ธฐ๋ณธ๊ฐ์ฒด(๋ด์ฅ๊ฐ์ฒด)**

EL์๋ jsp/servlet์ ๊ฐ์ฒด(pageContext์ ์ธ)์ ์์ฑ๊ฐ์ด๋ ํ๋ผ๋ฏธํฐ ๊ฐ๋ฑ์ ์ฝ๊ฒ ํํํ๊ธฐ ์ํด์ ๊ธฐ๋ณธ๊ฐ์ฒด๋ฅผ ์ ๊ณตํ๋ค.

EL(Expression Language)์ด ์ ๊ณตํ๋ 11๊ฐ์ ๊ธฐ๋ณธ ๊ฐ์ฒด

## 2.JSTL

## ๋ช๋ น์ด

- * <c:set> ๋ณ์์์ฑ, ๊ฐ์ ์ ์ฅ
<c:remove> ๋ณ์ ์ญ์ 
***<c:if test=""> ์กฐ๊ฑด๋ฌธ test="์กฐ๊ฑด์ true, false"
***<c:choose> ์ฌ๋ฌ๊ฐ์ง ์กฐ๊ฑด ์ฒ๋ฆฌ (if๋ณด๋ค ํ์ฉ๋๊ฐ ๋์์)
***<c:forEach> ๋ฐ๋ณต๋ฌธ (๊ฐ์ ๋for๋ฌธ) >> javascript >> foreach ...
<c:forTokens> for๋ฌธ split ๊ฒฐํฉ
<c:out> ์ถ๋ ฅ์... ํ์ง๋ง ๊ทธ๋ฅ EL ${}์ฌ์ฉ...
* <c:catch> ์์ธ์ฒ๋ฆฌ๋ ๊ฐ๋ฅ

### IF์ฐ๋๋ฒ

```java
String id = request.getParameter("ID");  //ID ์ค์ 

//์ผ๋ฐ)
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

์ด๋ฐ ์์ผ๋ก if ์์ var์ ๋ฃ์ด์ฃผ๋ฉด 
true or false๋ฅผ ์ถ๋ ฅํ๋ค.
```

### ์ ์

```java
//0. ์ด๋ฐ ๋ฐ์ดํฐ๊ฐ ์์๊ฒฝ์ฐ..
List<Emp> emplist = new ArrayList<>();
	 emplist.add(new Emp(100,"A"));
	 emplist.add(new Emp(200,"B"));
	 emplist.add(new Emp(300,"C"));
	 //3๊ฑด์ ๋ฐ์ดํฐ๊ฐ ArrayList์์ ... ์ถ๋ ฅ ๋ชฉ์ 

//1. request ๋ด๋๋ค ... servlet ํ  ๊ฑฐ์์
	 request.setAttribute("list", emplist);

//2. ์๋์ ๊ฐ์ด items์ ๊ฐ์ ๋ฃ๋๋ค

	 <table border="1">
		<tr><td>์ฌ๋ฒ</td><td>์ด๋ฆ</td></tr>
		<c:forEach var="emp" items="${requestScope.list}">
			<tr><td>${emp.empno}</td><td>${emp.ename}</td></tr>
		</c:forEach>	 
		์ด๊ฑธ์ฐ์ธ์!!! ์ ๋ฐ!!!
	 </table>
```

### ์์)

- ๊ตฌ๊ตฌ๋จ 5๋จ ์ถ๋ ฅ(forEach)

```java
<h3>๊ตฌ๊ตฌ๋จ 5๋จ ์ถ๋ ฅ(forEach)</h3>
	  <ul>
	  	<c:forEach var="i" begin="1" end="9">
	 			<li>5*${i}=${5*i}</li>
		</c:forEach>
	  </ul>
```

- EL & JSTL ๊ตฌ๊ตฌ๋จ ์ถ๋ ฅํ๊ธฐ (์ค์ฒฉ forEach)

```java
<h3>EL & JSTL ๊ตฌ๊ตฌ๋จ ์ถ๋ ฅํ๊ธฐ (์ค์ฒฉ forEach)</h3>
	 <table border="1">
	 	<c:forEach var="i" begin="2" end="9">
	 		<c:forEach var="j" begin="0" end="9">
	 			<c:choose>
	 				<c:when test="${j == 0 }">
	 					<tr bgcolor="gold"><th>${i}๋จ</th></tr>
	 				</c:when>
	 				<c:otherwise>
	 					<tr><td>${i}*${j}=${i*j}</td></tr>
	 				</c:otherwise>
	 			</c:choose>
	 		</c:forEach>
	 	</c:forEach>
	 </table>
```

- JSTL forEach ์ฌ์ฉํ๊ธฐ (์๋ฐ๋ก!!)

```java
<%
	 	int[] arr = new int[]{10,20,30,40,50};
	 	for(int i : arr){
	 		out.print("์ถ๋ ฅ๊ฐ : <b><i>" + i + "</i><b><br>");
	 	}
	 %>
```

- JSTL forEach(items)

```java
<h3>JSTL forEach ์ฌ์ฉํ๊ธฐ</h3>
	 <%
	 	int[] arr = new int[]{10,20,30,40,50};
	 	for(int i : arr){
	 		out.print("์ถ๋ ฅ๊ฐ : <b><i>" + i + "</i><b><br>");
	 	}
	 %>
	 <h3>EL์์ JAVA๊ฐ์ฒด ์ ๊ทผ๋ถ๊ฐ (1.request, 2.JSTL)</h3>
	 <c:set var="intarr" value="<%=arr%>"/>
	 EL์ ๊ทผ: ${intarr}<br>
	 <hr>
	 <h3>******forEach(items) ๊ฐ์ ๋ for๋ฌธ******</h3>
	 <c:forEach var="arr" items="${intarr}">
	 	๋ฐฐ์ด๊ฐ: ${arr}<br>
	 </c:forEach>
	 
	 <h3>๋จ์ํ๊ฒ</h3>
	 <c:forEach var="i" items="<%=arr%>">
	 	๋ฐฐ์ด๊ฐ: ${i}<br>
	 </c:forEach>
	 
	 <h3>์ฌ๋ฏธ์ผ์์</h3>
	 <c:forEach var="i" items="<%= new int[]{1,2,3,4,5} %>">
	 	๋ฐฐ์ด๊ฐ: ${i}<br>
	 </c:forEach>

๋งจ ์ ๋ฐฉ์๋๋ก๋ผ๋ฉด
arr -> intarr -> arr์์ผ๋กํด์ ํํํ๋ค

๋จ์ํ๊ฒ๋
arr -> <%=arr%> -> i

์ฌ๋ฏธ์ผ์์๋ (์ฌ์ฉ์ํจ)
<%= new int[]{1,2,3,4,5} %> -> i
```

# ์์ )

- ๋ฌธ์ 1)

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

์ ์ฝ๋๋ฅผ EL ๊ณผ JSTL ๋ณํ ํ์ธ์
```

ํ์ด)

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

- ๋ฌธ์ 2)

```java
subject ๋ค์ค๊ฐ์ ๋ฐ์์ choose ๊ตฌ๋ฌธ์ ์ฌ์ฉํ์ฌ ๊ฐ์ด ํ๋๋ ์ ํ๋์ง ์์๋ค๋ฉด
"์ ํ์ ํ์ธ์" ๋ผ๋ ๋ฌธ์๋ฅผ ์ถ๋ ฅํ๊ณ  
๊ฐ์ด ํ๋๋ผ๋ ๋์ด ์๋ค๋ฉด ... <ul><li>java-0-1</li><li>jsp-1-2</li></ul> ๊ณผ ๊ฐ์ ํ์์ผ๋ก
์ถ๋ ฅํ๋๋ก  forEach ๋ฅผ ์์ฑํ์ธ์
์ถ๊ฐ์ฌํญ) ์ถ๋ ฅ์  ๊ฐ-index-count ํ์์ผ๋ก ๋์ค๊ฒ ์ถ๋ ฅํ์ธ์
```

```java
<form action="Ex08_EL_JSTL_QUIZ.jsp" method="post">
    JAVA:  <input type="checkbox" name="subject" value="java"><br>
    JSP:   <input type="checkbox" name="subject" value="jsp"><br>
    ORACLE:<input type="checkbox" name="subject" value="oracle"><br>
    MYSQL: <input type="checkbox" name="subject" value="mysql"><br>
    <input type="submit" value="์ ์กํ๊ธฐ">
</form>
```

ํ์ด)

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
	  <c:otherwise> <p>์ ํ ํ์ธ์</p> </c:otherwise>
	 </c:choose>
```
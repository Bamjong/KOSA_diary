# 📚 Day41_221020

Author: 고범종
Category: 2021
Created Time: 2022년 10월 20일 오전 8:55
Main Category: Log
Status: 🖨 Published
Tags: JSP, JavaScript, Servlet
Updated Time: 2022년 10월 21일 오전 11:21

# 1. **Servlet & JSP**

Servlet은뭐고 JSP는 무엇일까?

<aside>
💡 jsp는 html안에 자바 코드가 포함된 것으로 서버사이드 스크립트를 말한다. jsp는 실행시에는 Java Servlet 으로 변환된 후 실행되므로 서블릿과 거의 유사하다고 볼 수 있다. 하지만, 서블릿과는 달리 HTML 표준에 따라 작성되므로 웹페이지 작성이 편리해졌다. 클라이언트에서 서비스가 요청되면, JSP의 실행을 요구하고, JSP는 웹어플리케이션 서버(Tomcat)의 서블릿 컨테이너에서 서블릿 원시코드로 변환된다, 그후에 서블릿 원시코드는 바로 컴파일된 후 실행되어 결과를 HTML 형태로 클라이언트에 돌려준다. 이렇게 서블릿과 달리 JSP는 코드를 변경할 때마다 WAS에서 자동으로 빌드하고 클라이언트에 화면을 동적으로 보여주기 때문에 개발이 많이 편리해 졌다.

</aside>

### **서블릿(Servlet)의 특징**

- 동적 웹어플리케이션 일부
- .java 확장자
- Client 요청에 동적으로 작동하고 응답은 html을 이용
- java thread를 이용하여 동작하는 Servlet의 가장 큰 강점이다.
- MVC에서 Controller

### **JSP의 특징**

- 동적 웹어플리케이션 일부
- .jsp 확장자
- Client 요청에 동적으로 작동하고 응답은 html을 이용
- jsp파일은 .java 파일로 변환되고 컴파일을 거쳐서 .class 파일로 변환되어 실행
(index.jsp 파일이 index_jsp.java로 변환되고 index_jsp.class 로 변환)
- MVC에서 View

**※ 동적 웹 어플리케이션 일부**

- 일반적으로 HTML 문서는 정적이다. 연산을 요청 했을 경우 불가능하다, JSP와 Servlet은 동적이기에 가능하다.

# 2. MVC 모델

- MVC 패턴이란 애플리케이션을 크게 Model, View, Controller의 세 영역으로 구분하여 영역 간의 결합도를 소화한 패턴
- 주로 웹 애플리케이션에서 사용되며, 일반 애플리케이션에서도 사용됨

![https://camo.githubusercontent.com/d97563a67146e3bfb0ea31af66cd42c880c46a089c0650c15e5a3fbfaab8f9fe/68747470733a2f2f647468756d622d7068696e662e707374617469632e6e65742f3f7372633d253232687474702533412532462532466d312e6461756d63646e2e6e65742532466366696c653233342532465234303078302532463133373035393439353034433537454230453142373225323226747970653d636166655f7761373430](https://camo.githubusercontent.com/d97563a67146e3bfb0ea31af66cd42c880c46a089c0650c15e5a3fbfaab8f9fe/68747470733a2f2f647468756d622d7068696e662e707374617469632e6e65742f3f7372633d253232687474702533412532462532466d312e6461756d63646e2e6e65742532466366696c653233342532465234303078302532463133373035393439353034433537454230453142373225323226747970653d636166655f7761373430)

- MVC 패턴의 가장 중요한 장점 중 하나는 비즈니스 로직과 프리젠테이션 로직이 분리되었다는 것
- 디자이너와 개발자들의 영역이 분리됨으로써 서로 각자의 영역에 더 집중할 수 있다는 장점
- Model2가 Model1에 비해 개발 초기의 부하가 비교적 높고, 아키텍처에 대한 수준 높은 이해를 요구하지만 재사용성이 높고 확장이 Model1에 비해 용이함
- 무엇보다 Model2는 그 구조적 특징으로 인해 자연스럽게 MVC 각 영역의 역할이 구분되도록 해줌

### **< Model 영역 >**

- 애플리케이션에 비즈니스 로직과 사용되는 데이터를 다루는 영역
- 일반적으로 비즈니스 데이터는 DBMS에 의해 관리되고, 그 데이터를 다루는 연산은 SQL문을 통해 구현

### **< View 영역 >**

- 최종 사용자에게 보여줄 프리젠테이션 로직을 담당하는 영역
- 일반적으로 자바 웹 애플리케이션에서는 JSP를 통해서 구현

### **< Controller 영역 >**

- 컨트롤러는 흐름을 관리하는 역할을 하며, 모델과 뷰 영역간의 조정 역할
- 사용자의 요청을 받아 이를 수행하기 위한 비즈니스 로직을 선택하고 호출하며, 수행한 비즈니스 로직의 결과를 뷰를 통해 보여줌
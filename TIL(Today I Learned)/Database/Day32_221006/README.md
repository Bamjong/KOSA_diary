# 📚 Day32_221006

Author: 고범종
Created Time: 2022년 10월 6일 오전 9:23
Status: 🖨 Published
Tags: CSS, html, 데이터 모델링
Updated Time: 2022년 10월 6일 오후 9:00

# 1. 데이터 모델링

---

| 중요성 | 설명 |
| --- | --- |
| 완전성
(Completeness) | 업무에서 필요로 하는 모든 데이터가 데이터 모델에 정의되어야 함 |
| 중복배제
(Non-Redundancy) | 동일한 사실은 반드시 한 번만 기록하여야 함 |
| 업무규칙
(Business Rules) | 업무규칙이 데이터 모델에 표현되어야 함
(예: 사원에는 정규직, 임시직이 있으며, 정규직만 호봉 정보를 가짐) |
| 데이터 재사용
(Data Reusability) | 회사 전체 관점에서 공통 데이터를 도출하고, 이를 전 영역에서 사용할 수 있도록 설계해야 함 |
| 통합성
(Integration) | 동일한 데이터는 조직의 전체에서 한 번만 정의되고, 이를 여러 다른 영역에서 참조, 활용해야 함 |

![https://user-images.githubusercontent.com/92353613/194188955-8238738d-9a00-4634-a06a-6e55fdefc196.png](https://user-images.githubusercontent.com/92353613/194188955-8238738d-9a00-4634-a06a-6e55fdefc196.png)

## 엔티티(Entity) = 테이블

엔티티 정의

- 업무 수행을 위해 데이터로 관리되어져야 하는 사람, 사물, 장소, 사건 등
즉, 구축하고자 하는 업무의 목적과 범위, 전략에 따라 데이터로 관리 되어져야 하는 항모긍ㄹ 엔티티로 정의

## 속성(Attribute) = 컬럼

속성 정의

- 속성이란 정보를 나타내는 최소의 단위로써 엔티티의 성질, 분류, 수량, 상태 특성 등을 나타내는 세부 항목
- 더 이상 분리되지 않는 최소의 데이터 단위이다.

| 기초속성 | 업무로부터 원래 가지고 있는 가장 기본적인 엔티티의 일반 속성 |
| --- | --- |
| 설계속성 | 기초 속성으로부터 가공처리(계산) 등을 통해 새로 만들거나 변형하여 정의하는 속성 |
| 추출속성 | 실제로 존재하지는 않으나 시스템의 효율성을 도모하기 위해 설계자가 임의로 부여하는 속성 |

## 인스턴스(Instance) = 행

인스턴스 정의

- 데이터베이스에 저장된 데이터 내용의 전체 집합을 의미한다.

## 시나리오 (개념적 모델링) 퀴즈

- [문제 1]
    
    학원관리 주제 ... 일부 내용
    
    모델링과 데이터베이스의 설계 및 구축을 포함한 IT 기술을 전문적으로 강의하는 우리학원에는 강사가 10명이 있으며 각각의 강사는 자신이 담당하는 과목이 한과목인 강사도 있고 두 과목이상 강의하는 강사도 있다. 우리 학원에 개설된 과목은 총 17개의 과목이며 강의실은 6개가 존재하므로 강의 계획을 잘 수립하여야 한다. 강의가 끝나면 그 주에 강의했던 내용에 대해 수강생으로부터 설문지를 받아 다음 강의에 참고 자료로 이용한다. 매 주 1회씩 강사회의를 하여 서로의 강의내용과 수강생에 대한 이야기를 주고 받는다. 과목에 따라서는 선수과목을 듣지 않으면 수강할 수 없는 과목도 존재한다.
    
    엔티티 , 어트리뷰트 , 식별자 , 관계 만들어 보세요
    
    [우리조 한것]
    
    ![https://user-images.githubusercontent.com/92353613/194302609-740d62b6-3446-4578-9942-4b1b479ca4da.png](https://user-images.githubusercontent.com/92353613/194302609-740d62b6-3446-4578-9942-4b1b479ca4da.png)
    
    - 완벽한 답은 아니었지만 제일 근접한거 같다고 교수님께서 말씀하셨다.

- [문제 2]
    
    회사는 여러개의 부서로 구성되어 있다
    
    각 부서는 부서명 , 부서번호 , 부서 내 직원수, 그리고 부서를 관리하는 직원(관리자)의 정보를 가지고 있다
    
    직원은 최대 하나의 부서를 관리할 수 있다, 한편 해당 직원이 부서관리자로 근무를 시작한 정보도 저장해야 한다.
    
    각 부서는 여러 지역에 위치하고 있을 수 있으며 각 부서는 여러 프로젝트를 동시에 관리 할 수 있다. 각 프로젝트는 고유의 프로젝트명, 프로젝트 번호를 가지며 하나의 프로젝트는 하나의 지역에서만 진행된다.
    
    직원에 대한 직원명 , 주민번호 , 주소(시/도 ,상세주소) , 급여, 성별 , 생년월일의 정보를 저장한다.
    
    각 직원은 하나의 부서에 소속되어 있으며 여러 프로젝트에 참여할 수 있다.
    
    한편 각 직원이 참여한 프로젝트 대한 해당 직원의 주당근문시간 정보를 관리해야 한다.
    
    각 직원에 대한 해당 직원의 직속상사(감독자)에 대한 정보를 관리한다.
    
    각 직원은 야러 명의 부양가족을 가질 수 있다, 부양 가족에 각각의 대한 부양가족명 , 성별 , 생년월일 , 그리고 해당 직원과의 관계에 대한 정보를 관리한다
    
    [우리조 한것]
    
    ![https://user-images.githubusercontent.com/92353613/194303950-c086b0de-3f23-400b-b4dc-7c2130233ecd.png](https://user-images.githubusercontent.com/92353613/194303950-c086b0de-3f23-400b-b4dc-7c2130233ecd.png)
    
    - 아직 답은 보지 못했다.
    

# 2. HTML

[배울사이트] [https://www.w3schools.com/html/html_intro.asp](https://www.w3schools.com/html/html_intro.asp) 
기본적으로 **‘Chrome’** 사용

[예제]

```html
<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>

<h1>My First Heading</h1>
<p>My first paragraph.</p>

</body> 
```

- 위와같은 코드는 아래와 같은 구조로 되어있다.

![https://user-images.githubusercontent.com/92353613/194224609-03951f7a-6661-417d-b72f-7148a749f342.png](https://user-images.githubusercontent.com/92353613/194224609-03951f7a-6661-417d-b72f-7148a749f342.png)

## 문법

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		1.HTML describes the structure of a Web page
		<br>
		2. 웹브라우저는 해석기다 (html, css, javascript)
		<br>
		<h3>제목</h3>
		<a href="https://www.naver.com">네이버 가기</a>
		<br>
		<img src="images/chicken.png" alt="경로가 맞지 않아요" width="300" height="300">
		<img alt="경로x" src="images/chicken.png">
		<p>
		문단태그<br>엔터 처리합니다<br>정말
		아
		길다
		정말
		</p>
		<p title="John 'shotgun' nelson"> 데이터 표현</p>
		<p title='John "shotgun" nelson'> 데이터 표현</p>
		<hr>
		<pre>
		   *
		  ***
		 *****
		*******
		   *
		   *
		   *
		</pre>
	  	<hr>
	  	<!-- html 주석처리는 이렇게 합니다 -->
	  	<!-- ctrl + shift + / -->
	  	<h3>html은 전체적인 구조를 정의하는 언어... 디자인 작업 한계가 있다</h3>
	  	<h3>css를 통해서 디자인 작업을 합니다.</h3>
	  	<font style="color: gold; font-family: 궁서체"> 글자정의 </font>
	  	<br>
	  	html도 속성을 사용하면 디자인 ....
	  	<br>
	  	<font color="red" size="10px" face="명조체">글자연습</font>
	</body>
</html>
```

```html
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Css적용하기</title>
	<!-- Internal ..page 내부 적용 -->
		<style type="text/css">
			body {background-color: gray;}
			h3 {color: pink;}
		</style>
		<link rel="stylesheet" href="css/common.css">
</head>
<body>
<!-- 
Cascading Style Sheets (CSS) is used to format the layout of a webpage.

CSS can be added to HTML documents in 3 ways:

1. Inline - by using the style attribute inside HTML elements
2. Internal - by using a <style> element in the <head> section
3. External - by using a <link> element to link to an external CSS file
 -->
 <h3>1. Inline 방식(태크 안쪽)</h3>
 <p style="background-color: aqua;">문단태그</p> <!-- Inline 방식 ##실제로 사용 x-->
 <h3 style="color:green;">나는 무슨색(안쪽 속성이 우선순위)</h3>
 <h3>핑크색인가</h3>
 <h1>외부 파일을 참조합니다.</h1>
 <h3>웹상에서의 절대경로</h3>
 <img src="https://www.baemin.com/_next/static/images/qrcode@3x.png">
</body>
</html>
```

# 3. WAS

1. 개념
    - WEB 서버는 HTML 문서같은 정적 컨텐츠를 처리하는 것이고 (HTTP 프로토콜을 통해 읽힐 수 있는 문서)
    - WAS 서버는 asp, php, jsp 등 개발 언어를 읽고 처리하여 동적 컨텐츠, 웹 응용 프로그램 서비스를 처리하는 것이다.
    
    [https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fcfs2.tistory.com%2Fupload_control%2Fdownload.blog%3Ffhandle%3DYmxvZzgwMjY1QGZzMi50aXN0b3J5LmNvbTovYXR0YWNoLzAvNzIuanBn%22&type=cafe_wa740](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fcfs2.tistory.com%2Fupload_control%2Fdownload.blog%3Ffhandle%3DYmxvZzgwMjY1QGZzMi50aXN0b3J5LmNvbTovYXR0YWNoLzAvNzIuanBn%22&type=cafe_wa740)
    
    [https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fpostfiles9.naver.net%2F20130525_184%2Fidbankbox_1369409035491Jmh2C_PNG%2F052413_1523_WA1.png%3Ftype%3Dw2%22&type=cafe_wa740](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fpostfiles9.naver.net%2F20130525_184%2Fidbankbox_1369409035491Jmh2C_PNG%2F052413_1523_WA1.png%3Ftype%3Dw2%22&type=cafe_wa740)
    
    ## 웹서버
    
    - 웹브라우저의 요청을 받아서 처리한 결과를 웹브라우저에게 전달하는 역할. 만약 프로그램 처리가 필요하다면 어플리케이션 서버를 사용하거나 프로그램을 직접 호출하여 결과를 생성.
    - 주로 정적인 HTML, IMAGE, CSS, 자바스크립트 파일을 웹브라우저에게 제공할 때 웹서버를 사용한다.
    
    EX) Apache, nginx등
    
    ## **어플리케이션서버**
    
    - 웹서버가 처리하지 못하는 결과값을 처리해야하는 연산이라던지의 처리를하고나서 결과를 웹서버에게 전달하는 역할을 한다.
    - 웹서버에서는 정적인것들을 처리하고, 어플리케이션서버가 프로그램기능을 제공하는 이유는 성능때문이다.
    
    EX) Tomcat, Jboss등
    
    일반적으로 웹서버같은경우 정적인 html이나 css를 제공하는데 초점이 맞추어져 있고, 톰캣이나 웹로직 같은 어플리케이션 서버는 jsp,servlet과 같은 프로그램을 실행하여 결과를 제공하는데 초점이 맞추어져 있다.
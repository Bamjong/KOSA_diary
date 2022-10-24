# 📚 Day43_221024

Author: 고범종
Created Time: 2022년 10월 24일 오전 9:13
Status: 🖨 Published
Tags: JSP, JSP:session
Updated Time: 2022년 10월 24일 오후 5:45

# 1. JSP

### <jsp:include>

(Ex12_Main_include.jsp)

- include를 통해 구문을 내 마음대로 컨트롤 할 수 있다
- 다른 JSP 페이지의 ‘실행’결과를 현재 위치에 삽입
- 제어권을 다시 돌려받음

![https://user-images.githubusercontent.com/92353613/197425698-9a38d27c-2c58-4ea6-b2d2-921cea1cf8cb.png](https://user-images.githubusercontent.com/92353613/197425698-9a38d27c-2c58-4ea6-b2d2-921cea1cf8cb.png)

### <jsp:param> 액션태그

(Ex13_include_param.jsp)

- 신규 파라미터를 추가하는 데 사용
    - <jsp:param name=”파라미터 이름” value=”값”/>
- 기존 파라미터는 유지하고 파라미터를 새로 추가

### <jsp:forward>

(Ex14_forward_main.jsp)

- 하나의 jsp 페이지에서 다른 jsp 페이지로 요청 처리를 전달할 때 사용
- 흐름의 제어를 완전히 넘겨버림, 특정 조건에 따라 다른 페이지를 만들수 있음
- forward = 중개자

```
[요청에 대한 흐름 제어]
			
	1. include
	2. forward
	
	공통점: request객체를 공유한다 (^^!)
	차이점: 제어권 : include(제어권을 다시 가지고 온다)
				  forward(제어권을 넘겨준다) >> Spring 에서 ... (servlet) >> 요청마다 다른 서비스
				  POINT) [요청 주소]는 [동일]한데 [다른 page]의 내용을 서비스
	
	ex)
	//http://192.168.0.25:8090/WebJSP/Ex13_include_param.jsp?code=B
	//http://192.168.0.25:8090/WebJSP/Ex13_include_param.jsp?code=C
	
	1. 클라이언트가 요청한 page >> Ex14_forward.jsp
	2. 클라이언트가 받는 page 정보는 > A.jsp or B.jsp or C.jsp

원리: Buffer 주인 > Ex14_forward.jsp > Buffer는 Ex14_forward 내용을 담아야 하는데 
		 forward를 만나면 > 주인 배신 > Buffer 비워버리고 > 비워진 Buffer > forward 된 page 내용
		 > Client 서비스
```

## 2. 예외처리

Ex15_Error_Local.jsp

```
Error (예외상황) 처리 페이지
	최종 배포 전에 만들어서 처리 ....
	
	1. 페이지 마다 설정하기
	2. 전역 설정하기
	
	페이지에 지역 설정 되어있으면 그 놈이 우선....
```

web.xml

```
WebApp(context) 전체 페이지에 적용되는 Error 페이지
  	
  	1. 상태코드 (500 서버코드, 404 요청페이지 없어요, 403 접근권한 )
  	특정 페이지를 만들어서 상태코드에 맞게 페이지를 서비스
  	
  	
  	2. 예외별로 (세분화) : NullPoint ..처리 페이지, IndexOutofBound 처리 페이지 ..
  	개발시에는 ... 안돼용
  	개발자는 예외를 확인
  	
  	배포시 작업....
```

## 3. Cookie (쿠키)

```
정보(자료)데이터 > 저장 > 장소(where)
	
	[웹이라는 관점]에 데이터 어느 장소에 저장
	
	클라이언트(개인 Local PC)	: 서버(웹서버 or DB서버)
	
	어디에 저장(보관)
	고민 (기준점): 보안요소(데이터 중요성), 소멸(일시적, 영속적)
	
	보안: 클라이언트냐 서버냐
	소멸: 메모리와 DB or 파일
	
	Client (Local PC : 웹브라우저)
	1. Cookie (메모리 쿠키 & 파일 쿠키(local 디스크에 txt 저장 > 암호화 )) >> 소멸시기
	   단점) 크기 제한적 (4096byte), 보안 (사용자 삭제 ... 암호화 해독 해커가 ...)
	2. Local Storage(key, value) 형태
	   장점) 크기, value(객체 사용가능: JSON)
	   
	Server (웹 서버(WAS) (메모리) + DB서버)
	1. server memory: session객체 (사이트 접속하는 사용자마다 고유하게 무여하는 메모리(객체)) > 서버 리부팅,개발코드변경 > 소멸 > 생성
	2. server memory: application객체 (사이트 접속하는 모든 사용자에게 고유하게 무여하는 메모리(객체)) > 서버 리부팅,개발코드변경 > 소멸 > 생성
	3. server memory: 파일.txt (관리가 힘들어요)
	4. DB server	: 보안, 영속적인 데이터 관리 >> 비용은 추가 >> 클라우드 사용
```

### ex)

- 오늘하루 보지않기

# 4. Session

1. server memory: session객체 (사이트 접속하는 사용자마다 고유하게 무여하는 메모리(객체)) > 서버 리부팅,개발코드변경 > 소멸 > 생성
2. server memory: application객체 (사이트 접속하는 모든 사용자에게 고유하게 무여하는 메모리(객체)) > 서버 리부팅,개발코드변경 > 소멸 > 생성
- Key (숫자 + 문자)

```
session 객체 : 서버(Web)에 접속한 사용자 마다 고유하게 부여되는 객체
고유성 보장 (key 값) >> 각각의 session객체마다 이름표 > key값 > 클라이언트에도 전달
활용) 클라이언트마다 고유하게 부여 (session 객체)
>> 로그인ID, 장바구니(사용자마다 다른), 사용자 정보 (각각 다른 정보), 사용자마다 접속한 시간, 마지막 접속한 시간

1. http://192.168.0.65:8090/WebJSP/Ex18_Session.jsp 서버 요청 보내기
2. sessionID (key) 생성 -> session -> sessionID response 해요 (Cookie)
2.1	 JSESSIONID : B160DB3AF34621E42B9DDDB68477E449
3. 동기화 (너랑 나랑 친구다)

ex) 접속자 1000명이 Web Server에는 key 1000개 만들어지고 key이름표로 달고있는 session객체도 1000개 생성

ex) Client 로그아웃 버튼을 클릭 >> 서버는 어떠한 작업을 수행 할까요 >> 로그아웃 판단 >> key 가지고 와서 >> key (이름표) >> 객체를 찾아서 >> abandon
```

(Ex19_Session.jsp)

```
Today's POTNT
	개념 이해 (서버자원 활용하기)
	session 객체 가지고 놀기
	
	1. session 객체(사용자마다 부여되는 고유한 객체)
		>> 접속하는 브라우져마다 (sessionID)를 가지고 객체 관리
		>> 접속한 사용자 마다 고유한 변수 만들기 ..... session.setAttribute()
		>> session.setAttribute("id",request.getParameter("userid"));
		
		접속자 3명
		
		김유신 : 서버객체 생성(session): 식별값 : A1 : session객체(변수,값)
		-session객체 (id,kim)
		
		이순신 : 식별값 : A2
		-session객체 (id,Lee)
		
		등등..
```

- session 객체의 유효 Scope: webApp전체 .... 어떤 페이지든 저장한 session 객체 사용 가능
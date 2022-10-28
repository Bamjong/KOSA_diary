# 📚 Day47_221028

Author: 고범종
Created Time: 2022년 10월 28일 오전 8:52
Status: 🖨 Published
Tags: ajax, xmlHttpRequest, 과제
Updated Time: 2022년 10월 28일 오후 6:49

# 1. Ajax 비동기식 처리

1. XMLHttpRequest 객체 얻기
2. onreadystatechange 이벤트 핸들러 구현 (함수)
    - readyState : ajax통신의 진행중인 상태를 알려줍니다.
    값에 따라 의미하는 상태는 다음과 같습니다.
    - 0 : 초기화 되지 않은 상태 (open메소드가 아직 호출되지 않은 상태)
    1 : open메소드가 호출된 상태 (send메소드는 호출 되지 않은 상태)
    2 : 송신완료, 요청을 시작한 상태 ( 요청은 하지 않았지만 데이터가 아직 오지 않은 상태)
    3 : 수신 중인 상태 (데이터가 들어오고 있는 상태)
    4 : 수신 완료 (데이터를 모두 받은 상태)
    
    - Status : 데이터 수신의 성공 여부를 판단해주는 속성입니다 값에 따라 의미하는 상태는 다음과 같습니다
    - 0 : 로컬로 접근 성공을 의미합니다.
    200 : 해당 url로 접근 성공을 의미합니다.
    403 : 접근이 거부되었음을 의미합니다.
    404 : 해당 url이 없음을 의미합니다.
    500 : 서버오류를 의미합니다.
3. 요청 정보 ( open() )
4. 요청 보내기 (send() )
5. 응답 처리 (Text(JSON), xml)

# 과제 설명)

WebServlet_4_Emp_mvc_ajax

주요코드

## 1. index.jsp

```java
let httpReq=null;
		   
		   function getInstance(){
		        if(window.XMLHttpRequest){
		           httpReq = new XMLHttpRequest(); //현재 브라우져 XMLHttpRequest 내장
//비동기 ajax 실행
		        }else if(window.ActiveXObject){ //IE6 이하   //지금 필요없어요
		           httpReq = new ActiveXObject("Msxml2.XMLHTTP");
		        }else{
		          throw new Error("AJAX 지원하지 않습니다"); 
		        }
		      return httpReq;  
		      
		   }
		   function handlerStateChange(){
		       if(httpReq.readyState == 4){ 
//1. 1~4까지 완벽하게 잘 받아왔다면
		          if(httpReq.status >= 200 && httpReq.status < 300){
//2. 404 500번 처럼 오류가 안날경우 실행
		             document.getElementById("change").innerHTML = httpReq.responseText;
//3. change라는 ID의 innerHTML 속성값을 httpReq.responseText으로 덮어쓰기
// httpReq.responseText은 지정한 페이지에 text파일을 가져옴
		          }else{
		             alert("status Text : " + httpReq.status);
		          }
		       }
		   }
		   
		   function sendData(empno){
				httpReq = getInstance();
				httpReq.onreadystatechange = handlerStateChange;  // x >> ()
				httpReq.open("POST","EmpServlet?empno="+ empno); //form 태그 구성
//EmpServlet? 으로 이동하면서 empno 값을 넘겨줌 
				httpReq.send(); // form submit 버튼 클릭
//값 넘겨주기!
		   }
```

```jsx
<script type="text/javascript">
	document.getElementById("button").addEventListener("click", function() {
// ID 값이 'button'인 속성을 불러와 누를경우 이벤트 실행
		   console.log(document.getElementById("empno_txt").value);
// 값 제대로 들어오는지 확인용 console.log
		   sendData(document.getElementById("empno_txt").value);
// ajax에 정의한 sendData함수를 이용해 값을 넘겨주기
	   })
	</script>
```

## 2. EmpServlet.java

```java
private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	EmpDao dao = new EmpDao();
    	System.out.println(request.getParameter("empno"));
    	
	  	request.setCharacterEncoding("UTF-8");
//값 넣어주고
  	response.setContentType("text/html;charset=UTF-8"); 
//클라언트에게 전달한 페이지의 정보 구성
  	PrintWriter out = response.getWriter();
//out.print() 를 적을경우 필요
	  	
	  	
	  	try {
	  		int empno = Integer.parseInt(request.getParameter("empno"));
//index.jsp에서 비동기로 넘어온 값을 받아주는 request.getParameter("empno")
//empno값은 int값이어서 Integer.parseInt를 써줌
		  	Emp emp = dao.getEmpListByEmpno(empno);
//EmpDao의 조건함수 불러오기

		  	
	    	
	    	request.setAttribute("emp", emp);
//다른쪽에 값을 넘겨주기위한 setAttribute
				//5. view 페이지 설정
				RequestDispatcher dis = request.getRequestDispatcher("/Excel.jsp");
// /Excel.jsp로 페이지 넘어간다는걸 dis 라고 지정
				//6. view 데이터 전달(forward)
				dis.forward(request, response);
// /Excel.jsp로 값을 넘겨줌과 동시에 넘어감
		} catch (Exception e) {
			RequestDispatcher diss = request.getRequestDispatcher("/commonyo.jsp");
			//6. view 데이터 전달(forward)
				diss.forward(request, response);
//만약 아무값이 안넘어오거나 터질경우 초기화면 설정
		}
	  	
	}
```
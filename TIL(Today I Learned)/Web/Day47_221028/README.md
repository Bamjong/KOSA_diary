# π Day47_221028

Author: κ³ λ²μ’
Created Time: 2022λ 10μ 28μΌ μ€μ  8:52
Status: π¨ Published
Tags: ajax, xmlHttpRequest, κ³Όμ 
Updated Time: 2022λ 10μ 28μΌ μ€ν 6:49

# 1. Ajax λΉλκΈ°μ μ²λ¦¬

1. XMLHttpRequest κ°μ²΄ μ»κΈ°
2. onreadystatechange μ΄λ²€νΈ νΈλ€λ¬ κ΅¬ν (ν¨μ)
    - readyState : ajaxν΅μ μ μ§νμ€μΈ μνλ₯Ό μλ €μ€λλ€.
    κ°μ λ°λΌ μλ―Ένλ μνλ λ€μκ³Ό κ°μ΅λλ€.
    - 0 : μ΄κΈ°ν λμ§ μμ μν (openλ©μλκ° μμ§ νΈμΆλμ§ μμ μν)
    1 : openλ©μλκ° νΈμΆλ μν (sendλ©μλλ νΈμΆ λμ§ μμ μν)
    2 : μ‘μ μλ£, μμ²­μ μμν μν ( μμ²­μ νμ§ μμμ§λ§ λ°μ΄ν°κ° μμ§ μ€μ§ μμ μν)
    3 : μμ  μ€μΈ μν (λ°μ΄ν°κ° λ€μ΄μ€κ³  μλ μν)
    4 : μμ  μλ£ (λ°μ΄ν°λ₯Ό λͺ¨λ λ°μ μν)
    
    - Status : λ°μ΄ν° μμ μ μ±κ³΅ μ¬λΆλ₯Ό νλ¨ν΄μ£Όλ μμ±μλλ€ κ°μ λ°λΌ μλ―Ένλ μνλ λ€μκ³Ό κ°μ΅λλ€
    - 0 : λ‘μ»¬λ‘ μ κ·Ό μ±κ³΅μ μλ―Έν©λλ€.
    200 : ν΄λΉ urlλ‘ μ κ·Ό μ±κ³΅μ μλ―Έν©λλ€.
    403 : μ κ·Όμ΄ κ±°λΆλμμμ μλ―Έν©λλ€.
    404 : ν΄λΉ urlμ΄ μμμ μλ―Έν©λλ€.
    500 : μλ²μ€λ₯λ₯Ό μλ―Έν©λλ€.
3. μμ²­ μ λ³΄ ( open() )
4. μμ²­ λ³΄λ΄κΈ° (send() )
5. μλ΅ μ²λ¦¬ (Text(JSON), xml)

# κ³Όμ  μ€λͺ)

WebServlet_4_Emp_mvc_ajax

μ£Όμμ½λ

## 1. index.jsp

```java
let httpReq=null;
		   
		   function getInstance(){
		        if(window.XMLHttpRequest){
		           httpReq = new XMLHttpRequest(); //νμ¬ λΈλΌμ°μ Έ XMLHttpRequest λ΄μ₯
//λΉλκΈ° ajax μ€ν
		        }else if(window.ActiveXObject){ //IE6 μ΄ν   //μ§κΈ νμμμ΄μ
		           httpReq = new ActiveXObject("Msxml2.XMLHTTP");
		        }else{
		          throw new Error("AJAX μ§μνμ§ μμ΅λλ€"); 
		        }
		      return httpReq;  
		      
		   }
		   function handlerStateChange(){
		       if(httpReq.readyState == 4){ 
//1. 1~4κΉμ§ μλ²½νκ² μ λ°μμλ€λ©΄
		          if(httpReq.status >= 200 && httpReq.status < 300){
//2. 404 500λ² μ²λΌ μ€λ₯κ° μλ κ²½μ° μ€ν
		             document.getElementById("change").innerHTML = httpReq.responseText;
//3. changeλΌλ IDμ innerHTML μμ±κ°μ httpReq.responseTextμΌλ‘ λ?μ΄μ°κΈ°
// httpReq.responseTextμ μ§μ ν νμ΄μ§μ textνμΌμ κ°μ Έμ΄
		          }else{
		             alert("status Text : " + httpReq.status);
		          }
		       }
		   }
		   
		   function sendData(empno){
				httpReq = getInstance();
				httpReq.onreadystatechange = handlerStateChange;  // x >> ()
				httpReq.open("POST","EmpServlet?empno="+ empno); //form νκ·Έ κ΅¬μ±
//EmpServlet? μΌλ‘ μ΄λνλ©΄μ empno κ°μ λκ²¨μ€ 
				httpReq.send(); // form submit λ²νΌ ν΄λ¦­
//κ° λκ²¨μ£ΌκΈ°!
		   }
```

```jsx
<script type="text/javascript">
	document.getElementById("button").addEventListener("click", function() {
// ID κ°μ΄ 'button'μΈ μμ±μ λΆλ¬μ λλ₯Όκ²½μ° μ΄λ²€νΈ μ€ν
		   console.log(document.getElementById("empno_txt").value);
// κ° μ λλ‘ λ€μ΄μ€λμ§ νμΈμ© console.log
		   sendData(document.getElementById("empno_txt").value);
// ajaxμ μ μν sendDataν¨μλ₯Ό μ΄μ©ν΄ κ°μ λκ²¨μ£ΌκΈ°
	   })
	</script>
```

## 2. EmpServlet.java

```java
private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	EmpDao dao = new EmpDao();
    	System.out.println(request.getParameter("empno"));
    	
	  	request.setCharacterEncoding("UTF-8");
//κ° λ£μ΄μ£Όκ³ 
  	response.setContentType("text/html;charset=UTF-8"); 
//ν΄λΌμΈνΈμκ² μ λ¬ν νμ΄μ§μ μ λ³΄ κ΅¬μ±
  	PrintWriter out = response.getWriter();
//out.print() λ₯Ό μ μκ²½μ° νμ
	  	
	  	
	  	try {
	  		int empno = Integer.parseInt(request.getParameter("empno"));
//index.jspμμ λΉλκΈ°λ‘ λμ΄μ¨ κ°μ λ°μμ£Όλ request.getParameter("empno")
//empnoκ°μ intκ°μ΄μ΄μ Integer.parseIntλ₯Ό μ¨μ€
		  	Emp emp = dao.getEmpListByEmpno(empno);
//EmpDaoμ μ‘°κ±΄ν¨μ λΆλ¬μ€κΈ°

		  	
	    	
	    	request.setAttribute("emp", emp);
//λ€λ₯Έμͺ½μ κ°μ λκ²¨μ£ΌκΈ°μν setAttribute
				//5. view νμ΄μ§ μ€μ 
				RequestDispatcher dis = request.getRequestDispatcher("/Excel.jsp");
// /Excel.jspλ‘ νμ΄μ§ λμ΄κ°λ€λκ±Έ dis λΌκ³  μ§μ 
				//6. view λ°μ΄ν° μ λ¬(forward)
				dis.forward(request, response);
// /Excel.jspλ‘ κ°μ λκ²¨μ€κ³Ό λμμ λμ΄κ°
		} catch (Exception e) {
			RequestDispatcher diss = request.getRequestDispatcher("/commonyo.jsp");
			//6. view λ°μ΄ν° μ λ¬(forward)
				diss.forward(request, response);
//λ§μ½ μλ¬΄κ°μ΄ μλμ΄μ€κ±°λ ν°μ§κ²½μ° μ΄κΈ°νλ©΄ μ€μ 
		}
	  	
	}
```
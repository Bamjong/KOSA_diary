# 📚 Day88_221222

Author: 고범종
Created Time: 2022년 12월 22일 오전 9:16
Status: 🖨 Published
Updated Time: 2022년 12월 22일 오후 9:21

# 1. REST

### REST의 정의
“Representational State Transfer” 의 약자

- 자원을 이름(자원의 표현)으로 구분하여 해당 자원의 상태(정보)를 주고 받는 모든 것을 의미한다.
- 즉, 자원(resource)의 표현(representation) 에 의한 상태 전달
    - 자원(resource)의 표현(representation)
        - 자원: 해당 소프트웨어가 관리하는 모든 것
        - -> Ex) 문서, 그림, 데이터, 해당 소프트웨어 자체 등
        - 자원의 표현: 그 자원을 표현하기 위한 이름
        - -> Ex) DB의 학생 정보가 자원일 때, ‘students’를 자원의 표현으로 정한다.
    - 상태(정보) 전달
        - 데이터가 요청되어지는 시점에서 자원의 상태(정보)를 전달한다.
        - JSON 혹은 XML를 통해 데이터를 주고 받는 것이 일반적이다.
- 월드 와이드 웹(www)과 같은 분산 하이퍼미디어 시스템을 위한 소프트웨어 개발 아키텍처의 한 형식
    - REST는 기본적으로 웹의 기존 기술과 HTTP 프로토콜을 그대로 활용하기 때문에 **웹의 장점을 최대한 활용할 수 있는 아키텍처 스타일이다.**
    - REST는 네트워크 상에서 Client와 Server 사이의 통신 방식 중 하나이다.
    [https://gmlwjd9405.github.io/2018/09/21/rest-and-restful.html](https://gmlwjd9405.github.io/2018/09/21/rest-and-restful.html)
    

### REST의 구체적인 개념

- HTTP URI(Uniform Resource Identifier)를 통해 자원(Resource)을 명시하고, HTTP Method(POST, GET, PUT, DELETE)를 통해 해당 자원에 대한 CRUD Operation을 적용하는 것을 의미한다.
- 즉, REST는 자원 기반의 구조(ROA, Resource Oriented Architecture) 설계의 중심에 Resource가 있고 HTTP Method를 통해 Resource를 처리하도록 설계된 아키텍쳐를 의미한다.
- 웹 사이트의 이미지, 텍스트, DB 내용 등의 모든 자원에 고유한 ID인 HTTP URI를 부여한다.
    - CRUD Operation
    Create : 생성(POST)
    Read : 조회(GET)
    Update : 수정(PUT)
    Delete : 삭제(DELETE)
    HEAD: header 정보 조회(HEAD)
    [https://gmlwjd9405.github.io/2018/09/21/rest-and-restful.html](https://gmlwjd9405.github.io/2018/09/21/rest-and-restful.html)
    

### @PathVariable 사용 방법

```java
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class User {
    String userId;
}
```

```java
    @GetMapping(path="/users/{userId}")
    public User userBean(@PathVariable String userId){
        return new User(userId);
    }
```

1. @GetMapping path의 {변수} 괄호안에 괄호 그레이스를 열어 URI에 사용될 변수 명을 입력한다.

GetMapping 뿐만 아니라 당연히 다른 Method도 가능하다.  ( PostMapping, DeleteMapping, PutMapping......)

2. @PathVariable 어노테이션을 이용해서 {템플릿 변수} 와 동일한 이름을 갖는 파라미터를 추가하면 된다.

# 2. **조별 Today 과제 (Restful UI 제작하기) - 비동기**

Team3_1222_GO

```
SpringMVC_Basic19_Restful
프로젝에 UI 제작 하시고
비동기 Ajax 
전체조회
조건조회
수정
삭제
삽입
처리 하시면 됩니다
```

Controller

```java
//전체 보기
	   @GetMapping("")
	   public ResponseEntity<List<Emp>> emp() {
	      List<Emp> list = new ArrayList<Emp>();
	      try {
	         list = empservice.allList();
	         System.out.println("정상싱행");
	         return new ResponseEntity<List<Emp>>(list,HttpStatus.OK);
	      } catch (Exception e) {
	         System.out.println("실행 실패");
	         return new ResponseEntity<List<Emp>>(list,HttpStatus.BAD_REQUEST);      
	         }
	   }
	   
	 //조건조회
		 @GetMapping("{empno}")
	     public ResponseEntity<List<Emp>> search(@PathVariable("empno") int empno) {
			 System.out.println(empno);
	        return new  ResponseEntity<List<Emp>>(empservice.searchList(empno),HttpStatus.OK);
	     }

	   
	   
	//삽입
	  @PostMapping("")
      public ResponseEntity<List<Emp>> insert(@RequestBody Emp emp) {
		  List<Emp> list = new ArrayList<Emp>() ; 
         try {
            System.out.println("insert 실행");
            System.out.println(emp);
            empservice.insert(emp);
            list = empservice.allList();
            return new ResponseEntity<List<Emp>>(list,HttpStatus.OK);
         } catch (Exception e) {
        	return new ResponseEntity<List<Emp>>(list,HttpStatus.BAD_REQUEST);
         }
      }

	  //수정
	  @GetMapping("update/{empno}")
      public ResponseEntity<Emp> update(@PathVariable("empno") int empno) {
		  Emp data = empservice.empDetail(empno);
         try {
            return new ResponseEntity<Emp>(data,HttpStatus.OK);
         } catch (Exception e) {
            return new ResponseEntity<Emp>(data,HttpStatus.BAD_REQUEST);
         }
      }
	  
	  //수정OK
	  @PutMapping("")
	  public ResponseEntity<List<Emp>> update(@RequestBody Emp myemp){
		  empservice.empEdit(myemp);
		  List<Emp> list = new ArrayList<Emp>();
		  try {
	            System.out.println("update 실행");
	            list = empservice.allList();
	            return new ResponseEntity<List<Emp>>(list,HttpStatus.OK);
	         } catch (Exception e) {
	            return new ResponseEntity<List<Emp>>(list,HttpStatus.BAD_REQUEST);
	         }
		  
	  }

	 //삭제
	 @DeleteMapping("{empno}")
     public ResponseEntity<List<Emp>> delete(@PathVariable("empno") int empno) {
		 empservice.empDel(empno);
		  List<Emp> data = empservice.allList();
        try {
           return new ResponseEntity<List<Emp>>(data,HttpStatus.OK);
        } catch (Exception e) {
           return new ResponseEntity<List<Emp>>(data,HttpStatus.BAD_REQUEST);
        }
     }
```

index.jsp

```java
//@restcontroller방식 ajax
          $('#restconBtn').click(function(){
              $.ajax(
                    {  
                      type : "get",
                      url  : "emp",
                      success : function(list){ 
                         console.log(list);
                         $('#exp').empty();
                         createTable(list, "");
                      } 
                    } 
                    )    
          });
         
        
         
 		// 검색
 		$('#keyword').keyup(function(){
 			console.log($('#keyword').val());
 			const number = $('#keyword').val();
              $.ajax(
                    {  
                      type : "get",
                      url  : "emp/" + number,
                      success : function(data){ 
                         console.log(data);
                         $('#exp').empty();
                         createTable(data, "");
                      } 
                    })    
          });		 
 		 
        //삭제
        $(document).on("click",".delete",function(){
           $.ajax({
              type : "delete",
              url  : "emp/" + $(this).attr("value2"),
              contentType: 'application/json',
              success : function(data){ 
            	  $('#exp').empty();
					createTable(data, "");
              } 
           })
        });
 		 
 		 
     })
 		
    	//수정 폼
		function empupdate(me){
				var tr = $(me).closest('tr')  							// me에서 가장가까운 곳에 있는 tr을 찾고 
				var datas = {empno:tr.children().html()};  	// 그 tr의 자식 요소(td) 를 html형태로 datas에 담는다
				let empno = datas.empno;
				
				tr.empty();
				
				$.ajax({
					type : "get",
					url:"emp/update/" + empno,					
					success : function(data) {
						console.log(data);
					 	var td = "<td><input type='text' value='"+data.empno +"' readonly></td>";
							td +="<td><input type='text' value='"+data.ename +"'></td>";
							td +="<td><input type='text' value='"+data.job +"'></td>";
							td +="<td><input type='text' value='"+data.mgr +"'></td>";
							td +="<td><input type='text' value='"+data.hiredate.substring(0,10) +"' readonly></td>";
							td +="<td><input type='text' value='"+data.sal +"'></td>";
							td +="<td><input type='text' value='"+data.comm +"'></td>";
							td +="<td><input type='text' value='"+data.deptno +"'></td>";
							td +="<td colspan='2'><input type='button'onclick='empupdateconfirm(this)' value='완료' value2="+data.empno+" /></td>";
							$(tr).append(td); 																							//value2의 값을 쿼리문 돌리기 위해 서비스나 컨트롤러로 보낸다
					}
				})
			}
		
		//수정버튼 눌렀을때 함수
		function empupdateconfirm(me){			
			empupdateok(me);
		}
		
		//수정 처리OK
		function empupdateok(me){
			var tr = $(me).closest('tr');
			var data1 = {empno:tr.find("td:eq(0)").children().val(),
						ename:tr.find("td:eq(1)").children().val(),
						job:tr.find("td:eq(2)").children().val(),
						mgr:tr.find("td:eq(3)").children().val(),
						hiredate:tr.find("td:eq(4)").children().val(),
						sal:tr.find("td:eq(5)").children().val(),
						comm:tr.find("td:eq(6)").children().val(),
						deptno:tr.find("td:eq(7)").children().val(),
					   };
			let data = JSON.stringify(data1);
			$.ajax({
				type : "put",
				url:"emp",
				data:data,
				contentType: 'application/json',
				success : function(data){  
					$('#exp').empty();
					createTable(data, "");
				} 
			})
		}
		
		//Json 전용 table 생성
		function createTable(data, way){
			$('#menuView').empty();
			var opr="<table id='fresh-table' class='table'><tr>"+way+"</tr><thead><tr>"+
			    "<th>EMPNO</th>"+
            	"<th>ENAME</th>"+
            	"<th>JOB</th>"+
            	"<th>MGR</th>"+
            	"<th>HIREDATE</th>"+
            	"<th>SAL</th>"+
            	"<th>COMM</th>"+
            	"<th>DEPTNO</th>"+
            	"<th>EDIT</th><th>DELETE</th></tr></thead><tbody>";
            	
			$.each(data,function(index,emp){
				opr += "<tr><td>"+emp.empno+
				"</td><td>"+emp.ename+
				"</td><td>"+emp.job+
				"</td><td>"+emp.mgr+
				"</td><td>"+emp.hiredate.substring(0,10)+
				"</td><td>"+emp.sal+
				"</td><td>"+emp.comm+
				"</td><td>"+emp.deptno+
				"</td><td><input type='button' onclick='empupdate(this)' value='수정' class ='update'  value2="+emp.empno+
				"></td><td><input type='button' value='삭제' class ='delete' value2="+emp.empno+"></td></tr>";
			});
			opr+="<tr><td colspan='10'><input type='button' onclick='createinput(this)' value='추가'></td></tr></tbody></table>";
			$('#menuView').append(opr);
	
		}
		
		
		
		//등록 폼
		function createinput(me){
			var tr = $(me).closest('tr');
			tr.empty();
			var td = "<td><input type='text'></td>";
			td +="<td><input type='text'></td>";
			td +="<td><input type='text'></td>";
			td +="<td><input type='text'></td>";
			td +="<td>-</td>";
			td +="<td><input type='text'></td>";
			td +="<td><input type='text'></td>";
			td +="<td><input type='text'></td>";
			td +="<td><input type='button'onclick='empinsert(this)' value='완료'/></td>";
			td +="<td><input type='button'onclick='cancel(this)' value='취소'/></td>";
			$(tr).append(td); 
		
		}
		
		//취소버튼
		function cancel(me){
			var tr = $(me).closest('tr');
			tr.empty();
			tr.append("<td colspan='10'><input type='button' onclick='createinput(this)' value='추가'></td>");
			
		}
		
		//등록 처리
		function empinsert(me){
			var tr = $(me).closest('tr');
			var data1 = 
						{empno:tr.find("td:eq(0)").children().val(),
						ename:tr.find("td:eq(1)").children().val(),
						job:tr.find("td:eq(2)").children().val(),
						mgr:tr.find("td:eq(3)").children().val(),
						sal:tr.find("td:eq(5)").children().val(),
						comm:tr.find("td:eq(6)").children().val(),
						deptno:tr.find("td:eq(7)").children().val(),
					   };
			let data = JSON.stringify(data1);
			$.ajax({
				type : "post",
				url:"emp",
				data:data,
				contentType: 'application/json',
				success : function(data){  
					$('#exp').empty();
					createTable(data, "");
				} 
			})
		}
```

## 여기서 내가 생각하는 TIP!

예를들면 아래코드에서

```java
//등록 처리
		function empinsert(me){
			var tr = $(me).closest('tr');
			var data1 = 
						{empno:tr.find("td:eq(0)").children().val(),
						ename:tr.find("td:eq(1)").children().val(),
						job:tr.find("td:eq(2)").children().val(),
						mgr:tr.find("td:eq(3)").children().val(),
						sal:tr.find("td:eq(5)").children().val(),
						comm:tr.find("td:eq(6)").children().val(),
						deptno:tr.find("td:eq(7)").children().val(),
					   };
			let data = JSON.stringify(data1);
			$.ajax({
				type : "post",
				url:"emp",
				data:data,
				contentType: 'application/json',
				success : function(data){  
					$('#exp').empty();
					createTable(data, "");
				} 
			})
		}
```

- let data = JSON.stringify(data1);
    - JSON.stringify를 통해 JSON으로 넘긴다
- contentType: 'application/json',
    - 이거 안써주면 맵핑 안댐,,, 무조건 적어야함
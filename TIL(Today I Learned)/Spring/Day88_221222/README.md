# ๐ Day88_221222

Author: ๊ณ ๋ฒ์ข
Created Time: 2022๋ 12์ 22์ผ ์ค์  9:16
Status: ๐จ Published
Updated Time: 2022๋ 12์ 22์ผ ์คํ 9:21

# 1. REST

### REST์ ์ ์
โRepresentational State Transferโ ์ ์ฝ์

- ์์์ ์ด๋ฆ(์์์ ํํ)์ผ๋ก ๊ตฌ๋ถํ์ฌ ํด๋น ์์์ ์ํ(์ ๋ณด)๋ฅผ ์ฃผ๊ณ  ๋ฐ๋ ๋ชจ๋  ๊ฒ์ ์๋ฏธํ๋ค.
- ์ฆ, ์์(resource)์ ํํ(representation) ์ ์ํ ์ํ ์ ๋ฌ
    - ์์(resource)์ ํํ(representation)
        - ์์: ํด๋น ์ํํธ์จ์ด๊ฐ ๊ด๋ฆฌํ๋ ๋ชจ๋  ๊ฒ
        - -> Ex) ๋ฌธ์, ๊ทธ๋ฆผ, ๋ฐ์ดํฐ, ํด๋น ์ํํธ์จ์ด ์์ฒด ๋ฑ
        - ์์์ ํํ: ๊ทธ ์์์ ํํํ๊ธฐ ์ํ ์ด๋ฆ
        - -> Ex) DB์ ํ์ ์ ๋ณด๊ฐ ์์์ผ ๋, โstudentsโ๋ฅผ ์์์ ํํ์ผ๋ก ์ ํ๋ค.
    - ์ํ(์ ๋ณด) ์ ๋ฌ
        - ๋ฐ์ดํฐ๊ฐ ์์ฒญ๋์ด์ง๋ ์์ ์์ ์์์ ์ํ(์ ๋ณด)๋ฅผ ์ ๋ฌํ๋ค.
        - JSON ํน์ XML๋ฅผ ํตํด ๋ฐ์ดํฐ๋ฅผ ์ฃผ๊ณ  ๋ฐ๋ ๊ฒ์ด ์ผ๋ฐ์ ์ด๋ค.
- ์๋ ์์ด๋ ์น(www)๊ณผ ๊ฐ์ ๋ถ์ฐ ํ์ดํผ๋ฏธ๋์ด ์์คํ์ ์ํ ์ํํธ์จ์ด ๊ฐ๋ฐ ์ํคํ์ฒ์ ํ ํ์
    - REST๋ ๊ธฐ๋ณธ์ ์ผ๋ก ์น์ ๊ธฐ์กด ๊ธฐ์ ๊ณผ HTTP ํ๋กํ ์ฝ์ ๊ทธ๋๋ก ํ์ฉํ๊ธฐ ๋๋ฌธ์ **์น์ ์ฅ์ ์ ์ต๋ํ ํ์ฉํ  ์ ์๋ ์ํคํ์ฒ ์คํ์ผ์ด๋ค.**
    - REST๋ ๋คํธ์ํฌ ์์์ Client์ Server ์ฌ์ด์ ํต์  ๋ฐฉ์ ์ค ํ๋์ด๋ค.
    [https://gmlwjd9405.github.io/2018/09/21/rest-and-restful.html](https://gmlwjd9405.github.io/2018/09/21/rest-and-restful.html)
    

### REST์ ๊ตฌ์ฒด์ ์ธ ๊ฐ๋

- HTTP URI(Uniform Resource Identifier)๋ฅผ ํตํด ์์(Resource)์ ๋ช์ํ๊ณ , HTTP Method(POST, GET, PUT, DELETE)๋ฅผ ํตํด ํด๋น ์์์ ๋ํ CRUD Operation์ ์ ์ฉํ๋ ๊ฒ์ ์๋ฏธํ๋ค.
- ์ฆ, REST๋ ์์ ๊ธฐ๋ฐ์ ๊ตฌ์กฐ(ROA, Resource Oriented Architecture) ์ค๊ณ์ ์ค์ฌ์ Resource๊ฐ ์๊ณ  HTTP Method๋ฅผ ํตํด Resource๋ฅผ ์ฒ๋ฆฌํ๋๋ก ์ค๊ณ๋ ์ํคํ์ณ๋ฅผ ์๋ฏธํ๋ค.
- ์น ์ฌ์ดํธ์ ์ด๋ฏธ์ง, ํ์คํธ, DB ๋ด์ฉ ๋ฑ์ ๋ชจ๋  ์์์ ๊ณ ์ ํ ID์ธ HTTP URI๋ฅผ ๋ถ์ฌํ๋ค.
    - CRUD Operation
    Create : ์์ฑ(POST)
    Read : ์กฐํ(GET)
    Update : ์์ (PUT)
    Delete : ์ญ์ (DELETE)
    HEAD: header ์ ๋ณด ์กฐํ(HEAD)
    [https://gmlwjd9405.github.io/2018/09/21/rest-and-restful.html](https://gmlwjd9405.github.io/2018/09/21/rest-and-restful.html)
    

### @PathVariable ์ฌ์ฉ ๋ฐฉ๋ฒ

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

1. @GetMapping path์ {๋ณ์} ๊ดํธ์์ ๊ดํธ ๊ทธ๋ ์ด์ค๋ฅผ ์ด์ด URI์ ์ฌ์ฉ๋  ๋ณ์ ๋ช์ ์๋ ฅํ๋ค.

GetMapping ๋ฟ๋ง ์๋๋ผ ๋น์ฐํ ๋ค๋ฅธ Method๋ ๊ฐ๋ฅํ๋ค.ย  ( PostMapping, DeleteMapping, PutMapping......)

2. @PathVariable ์ด๋ธํ์ด์์ ์ด์ฉํด์ {ํํ๋ฆฟ ๋ณ์} ์ ๋์ผํ ์ด๋ฆ์ ๊ฐ๋ ํ๋ผ๋ฏธํฐ๋ฅผ ์ถ๊ฐํ๋ฉด ๋๋ค.

# 2. **์กฐ๋ณ Today ๊ณผ์  (Restful UI ์ ์ํ๊ธฐ) - ๋น๋๊ธฐ**

Team3_1222_GO

```
SpringMVC_Basic19_Restful
ํ๋ก์ ์ UI ์ ์ ํ์๊ณ 
๋น๋๊ธฐ Ajax 
์ ์ฒด์กฐํ
์กฐ๊ฑด์กฐํ
์์ 
์ญ์ 
์ฝ์
์ฒ๋ฆฌ ํ์๋ฉด ๋ฉ๋๋ค
```

Controller

```java
//์ ์ฒด ๋ณด๊ธฐ
	   @GetMapping("")
	   public ResponseEntity<List<Emp>> emp() {
	      List<Emp> list = new ArrayList<Emp>();
	      try {
	         list = empservice.allList();
	         System.out.println("์ ์์ฑํ");
	         return new ResponseEntity<List<Emp>>(list,HttpStatus.OK);
	      } catch (Exception e) {
	         System.out.println("์คํ ์คํจ");
	         return new ResponseEntity<List<Emp>>(list,HttpStatus.BAD_REQUEST);      
	         }
	   }
	   
	 //์กฐ๊ฑด์กฐํ
		 @GetMapping("{empno}")
	     public ResponseEntity<List<Emp>> search(@PathVariable("empno") int empno) {
			 System.out.println(empno);
	        return new  ResponseEntity<List<Emp>>(empservice.searchList(empno),HttpStatus.OK);
	     }

	   
	   
	//์ฝ์
	  @PostMapping("")
      public ResponseEntity<List<Emp>> insert(@RequestBody Emp emp) {
		  List<Emp> list = new ArrayList<Emp>() ; 
         try {
            System.out.println("insert ์คํ");
            System.out.println(emp);
            empservice.insert(emp);
            list = empservice.allList();
            return new ResponseEntity<List<Emp>>(list,HttpStatus.OK);
         } catch (Exception e) {
        	return new ResponseEntity<List<Emp>>(list,HttpStatus.BAD_REQUEST);
         }
      }

	  //์์ 
	  @GetMapping("update/{empno}")
      public ResponseEntity<Emp> update(@PathVariable("empno") int empno) {
		  Emp data = empservice.empDetail(empno);
         try {
            return new ResponseEntity<Emp>(data,HttpStatus.OK);
         } catch (Exception e) {
            return new ResponseEntity<Emp>(data,HttpStatus.BAD_REQUEST);
         }
      }
	  
	  //์์ OK
	  @PutMapping("")
	  public ResponseEntity<List<Emp>> update(@RequestBody Emp myemp){
		  empservice.empEdit(myemp);
		  List<Emp> list = new ArrayList<Emp>();
		  try {
	            System.out.println("update ์คํ");
	            list = empservice.allList();
	            return new ResponseEntity<List<Emp>>(list,HttpStatus.OK);
	         } catch (Exception e) {
	            return new ResponseEntity<List<Emp>>(list,HttpStatus.BAD_REQUEST);
	         }
		  
	  }

	 //์ญ์ 
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
//@restcontroller๋ฐฉ์ ajax
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
         
        
         
 		// ๊ฒ์
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
 		 
        //์ญ์ 
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
 		
    	//์์  ํผ
		function empupdate(me){
				var tr = $(me).closest('tr')  							// me์์ ๊ฐ์ฅ๊ฐ๊น์ด ๊ณณ์ ์๋ tr์ ์ฐพ๊ณ  
				var datas = {empno:tr.children().html()};  	// ๊ทธ tr์ ์์ ์์(td) ๋ฅผ htmlํํ๋ก datas์ ๋ด๋๋ค
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
							td +="<td colspan='2'><input type='button'onclick='empupdateconfirm(this)' value='์๋ฃ' value2="+data.empno+" /></td>";
							$(tr).append(td); 																							//value2์ ๊ฐ์ ์ฟผ๋ฆฌ๋ฌธ ๋๋ฆฌ๊ธฐ ์ํด ์๋น์ค๋ ์ปจํธ๋กค๋ฌ๋ก ๋ณด๋ธ๋ค
					}
				})
			}
		
		//์์ ๋ฒํผ ๋๋ ์๋ ํจ์
		function empupdateconfirm(me){			
			empupdateok(me);
		}
		
		//์์  ์ฒ๋ฆฌOK
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
		
		//Json ์ ์ฉ table ์์ฑ
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
				"</td><td><input type='button' onclick='empupdate(this)' value='์์ ' class ='update'  value2="+emp.empno+
				"></td><td><input type='button' value='์ญ์ ' class ='delete' value2="+emp.empno+"></td></tr>";
			});
			opr+="<tr><td colspan='10'><input type='button' onclick='createinput(this)' value='์ถ๊ฐ'></td></tr></tbody></table>";
			$('#menuView').append(opr);
	
		}
		
		
		
		//๋ฑ๋ก ํผ
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
			td +="<td><input type='button'onclick='empinsert(this)' value='์๋ฃ'/></td>";
			td +="<td><input type='button'onclick='cancel(this)' value='์ทจ์'/></td>";
			$(tr).append(td); 
		
		}
		
		//์ทจ์๋ฒํผ
		function cancel(me){
			var tr = $(me).closest('tr');
			tr.empty();
			tr.append("<td colspan='10'><input type='button' onclick='createinput(this)' value='์ถ๊ฐ'></td>");
			
		}
		
		//๋ฑ๋ก ์ฒ๋ฆฌ
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

## ์ฌ๊ธฐ์ ๋ด๊ฐ ์๊ฐํ๋ TIP!

์๋ฅผ๋ค๋ฉด ์๋์ฝ๋์์

```java
//๋ฑ๋ก ์ฒ๋ฆฌ
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
    - JSON.stringify๋ฅผ ํตํด JSON์ผ๋ก ๋๊ธด๋ค
- contentType: 'application/json',
    - ์ด๊ฑฐ ์์จ์ฃผ๋ฉด ๋งตํ ์๋,,, ๋ฌด์กฐ๊ฑด ์ ์ด์ผํจ
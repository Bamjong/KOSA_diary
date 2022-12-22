package kosa.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kosa.service.EmpService;
import kosa.vo.Emp;

// @Controller + 함수 (@ResponseBody)
@RestController
@RequestMapping("/emp")
public class AjaxController {

	private EmpService empservice;

	@Autowired
	public void setEmpService(EmpService empservice) {
		this.empservice = empservice;
	}

	// 전체 보기
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
	   
	// 삽입
	    // 데이터 (empno=3000, ename=아무개, sal=10) 서버로 전달
	    // http://localhost:8090/kosa/emp/ >> data (empno=3000, ename=아무개, sal=10)
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


	  
	  @GetMapping("update/{empno}")
      public ResponseEntity<Emp> update(@PathVariable("empno") int empno) {
		  Emp data = empservice.empDetail(empno);
         try {
            return new ResponseEntity<Emp>(data,HttpStatus.OK);
         } catch (Exception e) {
            return new ResponseEntity<Emp>(data,HttpStatus.BAD_REQUEST);
         }
      }
	  
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
	


	
	 @GetMapping("{empno}")
     public ResponseEntity<List<Emp>> search(@PathVariable("empno") int empno) {
		 System.out.println(empno);
        return new  ResponseEntity<List<Emp>>(empservice.searchList(empno),HttpStatus.OK);
     }

}
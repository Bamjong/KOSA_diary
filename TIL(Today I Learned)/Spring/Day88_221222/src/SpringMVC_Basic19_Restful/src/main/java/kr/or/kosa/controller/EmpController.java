package kr.or.kosa.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.Emp;
import kr.or.kosa.service.EmpService;

@RestController
@RequestMapping("/emp")
public class EmpController {
   
   //controller는 service 의존합니다
   private EmpService empservice;

   @Autowired
   public void setEmpservice(EmpService empservice) {
      this.empservice = empservice;
   }

   //controller는 service 의존합니다
   /*
   Restful 방식의 annotation도 존재합니다
   @GetMapping
   @PostMapping
   @DeleteMapping
   @PutMapping
   @PatchMapping
    */
   
   /*
    * @RequestMapping(value="",method=RequestMethod.GET) public List<Emp>
    * emplist(){ return empservice.selectAllEmpList(); }
    */
   
   // 전체 조회 (Restful)
      @RequestMapping(value="",method=RequestMethod.GET)
      public ResponseEntity<List<Emp>> empList() {
         List<Emp> list = new ArrayList<Emp>();
         try {
            System.out.println("정상실행");
            list = empservice.selectAllEmpList();
            return new ResponseEntity<List<Emp>>(list,HttpStatus.NOT_FOUND);
         } catch (Exception e) {
            return new ResponseEntity<List<Emp>>(list,HttpStatus.BAD_REQUEST);
         }
      }
      
    // 조건조회
    // http://localhost:8090/kosa/emp/7788 >> {}
      @RequestMapping(value="{empno}", method=RequestMethod.GET)
      public Emp emplistByempno(@PathVariable("empno") int empno) {
         return empservice.selectEmpByEmpno(empno);
      }
      
    // 삽입
    // 데이터 (empno=3000, ename=아무개, sal=10) 서버로 전달
    // http://localhost:8090/kosa/emp/ >> data (empno=3000, ename=아무개, sal=10)
      @RequestMapping(value="",method= RequestMethod.POST)
      public ResponseEntity<String> insert(@RequestBody Emp emp) {
         try {
            System.out.println("insert 실행");
            System.out.println(emp);
            empservice.insert(emp);
            
            return new ResponseEntity<String>("insert success",HttpStatus.OK);
         } catch (Exception e) {
            return new ResponseEntity<String>("insert fail",HttpStatus.BAD_REQUEST);
         }
      }
      
    // 수정(Put or Patch)
      @RequestMapping(value="",method= RequestMethod.PUT)
      public ResponseEntity<String> update(@RequestBody Emp emp) {
         try {
            System.out.println("update 실행");
            empservice.update(emp);
            return new ResponseEntity<String>("update success",HttpStatus.OK);
         } catch (Exception e) {
            return new ResponseEntity<String>("update fail",HttpStatus.BAD_REQUEST);
         }
      }
           
    // 삭제
    //delete (DELETE)
      @RequestMapping(value="{empno}",method= RequestMethod.DELETE)
      public ResponseEntity<String> delete(@PathVariable("empno") int empno) {
         try {
            System.out.println("delete 실행");
            empservice.delete(empno);
            return new ResponseEntity<String>("delete success",HttpStatus.OK);
         } catch (Exception e) {
            return new ResponseEntity<String>("delete fail",HttpStatus.BAD_REQUEST);
         }
      }

}
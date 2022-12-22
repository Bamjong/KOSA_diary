package kosa.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kosa.service.EmpService;
import kosa.vo.Emp;

// @Controller + 함수 (@ResponseBody)
@RestController
public class AjaxController {

	private EmpService empservice;

	@Autowired
	public void setEmpService(EmpService empservice) {
		this.empservice = empservice;
	}

	// 전체 보기
	@RequestMapping("emp.ajax")
	public List<Emp> emp() {

		List<Emp> list = empservice.allList();
		return list;
	}

	// 검색 보기
	@RequestMapping("empSearch.ajax")
	public String search(int keyword, Model model) {

		List<Emp> list = empservice.searchList(keyword);
		model.addAttribute("list", list);
		return "empSearch";
	}

	// 상세 보기
	@RequestMapping("empDetail.ajax")
	public String empDetail(int empno, Model model) {

		Emp emp = empservice.empDetail(empno);
		model.addAttribute("emp", emp);
		return "empDetail";
	}

	// 사원 삽입 처리
	@PostMapping(value = "insert.ajax")						//수정 처리 부분과 마찬가지로 
	public List<Emp> insert(Emp emp, HttpServletRequest request) {
		List<Emp> list = new ArrayList<Emp>();
		try {
			empservice.insert(emp);
			list = empservice.allList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//수정
	   @GetMapping("update.ajax")
	   public Emp updateEmp(Emp emp) {   //수정부분이 두개 인 이유는 수정버튼을 눌렀을 떄 해당 empno에 (넘어온 DATA)
		   															//맞는 사원데이터를 뽑아서 수정 input 란에 적어놓아야 하기 때문
	      Emp data = empservice.empDetail(emp.getEmpno());
	      return data;
	   }

	   // 수정 처리
	   @PostMapping("update.ajax")
	   public List<Emp> updateEmpok(Emp myemp) {
		   empservice.empEdit(myemp);						//수정은 별도의 결과 값이 필요한 함수가 아니기 때문에 void로 처리하여 수정을 처리하고
	      List<Emp> list = new ArrayList<Emp>();   // Emp객체 타입의 List를 선언하여 사원리스트를 담아온 뒤 그 리스트를 리턴하여 수정이 완료된
	      list = empservice.allList();							//사원 목록을 비동기로 즉각적으로 나타내 준다
	      return list;
	   }


	// 삭제
	@RequestMapping("delete.ajax")
	public List<Emp> noticeDel(int empno) {  //수정 처리와 마찬가지로 삭제처리가 완료 된 이후 다시 완료된 이후의 리스트를 뽑아준다
		List<Emp> list = new ArrayList<Emp>();
		try {
			empservice.empDel(empno);
			list = empservice.allList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 검색 보기
	@RequestMapping("search.ajax")
	public List<Emp> search(@RequestParam("keyword") String keyword, Model model) {  //스프링에서 Ajax로 보낸 파라미터를 받는 형식
		System.out.println("keyword : " + keyword);																 //브라우저에서 받아온 모든 형식은 문자이기에 형변환 필수
		
		int searchword = Integer.parseInt(keyword);
		List<Emp> list = empservice.searchList(searchword);
		model.addAttribute("list", list);  //모델에 담아버리고
		return list;									//list를 return 해준다
	}

}
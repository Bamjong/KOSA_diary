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
	@PostMapping(value = "insert.ajax")
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
	   public Emp updateEmp(Emp emp) {
	   
	      Emp data = empservice.empDetail(emp.getEmpno());
	      return data;
	   }

	   // 수정 처리
	   @PostMapping("update.ajax")
	   public List<Emp> updateEmpok(Emp myemp) {
		   empservice.empEdit(myemp);
	      List<Emp> list = new ArrayList<Emp>();
	      list = empservice.allList();
	      return list;
	   }


	// 삭제
	@RequestMapping("delete.ajax")
	public List<Emp> noticeDel(int empno) {
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
	public List<Emp> search(@RequestParam("keyword") String keyword, Model model) {
		System.out.println("keyword : " + keyword);
		
		int searchword = Integer.parseInt(keyword);
		List<Emp> list = empservice.searchList(searchword);
		model.addAttribute("list", list);
		return list;
	}

}
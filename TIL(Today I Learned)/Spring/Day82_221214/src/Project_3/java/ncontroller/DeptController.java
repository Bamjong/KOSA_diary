package ncontroller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import service.DeptService;
import vo.Dept;

@Controller
public class DeptController {
	
	private DeptService deptservice;

	@Autowired
	public void setDeptservice(DeptService deptservice) {
		this.deptservice = deptservice;
	}
	
	
	//전체조회
	@RequestMapping("Dept.htm")  
	public String Depts(Model model) {
		
		List<Dept> list = deptservice.depts();		
		model.addAttribute("list", list);
		
		System.out.println(list + "여기타용");
		return "list";

	}
	
	//글쓰기
	@GetMapping("WriteForm.htm")
	public String insert() {
		
		return "WriteForm";
	}
	
	@PostMapping("WriteForm.htm")
	public String insert(Dept n) {
		System.out.println(n + "왜안댐");
		deptservice.setWrite(n);
		
		return "redirect:/list.htm";
	}
}

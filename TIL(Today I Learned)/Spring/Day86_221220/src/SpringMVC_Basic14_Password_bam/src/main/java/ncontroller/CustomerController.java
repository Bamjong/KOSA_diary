package ncontroller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.Member;
import dto.Notice;
import service.CustomerService;
import service.MemberService;

@Controller
@RequestMapping("/customer/")
public class CustomerController {
	
	@Autowired
	private CustomerService customerservice;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MemberService memberservice;
	
	/*
	 * public void setCustomerservice(CustomerService customerservice) {
	 * this.customerservice = customerservice; }
	 */

	@RequestMapping("notice.htm")  
	public String notices(String pg , String f , String q , Model model) {
		
		List<Notice> list = customerservice.notices(pg, f, q);		
		model.addAttribute("list", list);  
		return "customer/notice";

	}
	
	
	@RequestMapping("noticeDetail.htm")
	public String noticesDetail(String seq  , Model model) {
	    
		Notice notice = customerservice.noticesDetail(seq);
		model.addAttribute("notice", notice);
		return "customer/noticeDetail";
	}

	@GetMapping(value="noticeReg.htm")
	public String noticeReg() {
		return "customer/noticeReg";
	}
	
	
	@PostMapping(value="noticeReg.htm")
	public String noticeReg(Notice n , HttpServletRequest request, Principal principal) {
		  String url = null;
		  try {
			    url = customerservice.noticeReg(n, request, principal);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}
	
	
	@GetMapping(value="noticeEdit.htm")
	public String noticeEdit(String seq , Model model) {
		Notice notice=null;
		try {
		      notice =  customerservice.noticeEdit(seq);
		} catch( Exception e) {
				e.printStackTrace();
		} 
		
		model.addAttribute("notice", notice);
		return "customer/noticeEdit";
	}
	
		
	@PostMapping(value="noticeEdit.htm")
	public String noticeEdit(Notice n , HttpServletRequest request) {
		 return customerservice.noticeEdit(n, request);
		
	}
	
	
	@RequestMapping("noticeDel.htm")
	public String noticeDel(String seq) {
		return customerservice.noticeDel(seq);
	}
	
	
	
	@GetMapping("memberconfirm.htm")
	public String memberConfirm(Principal principal){
		return "joinus/memberConfirm";
	}
	
	@PostMapping("memberconfirm.htm")
	public String memberConfirm( @RequestParam("password") String rawPassword,Principal principal, Model model){
		Member member = memberservice.getMember(principal.getName());
		String encodedPassword = member.getPwd();
		String url = "";
		
		
		boolean result = bCryptPasswordEncoder.matches(rawPassword, encodedPassword);
		
		
		if (result) {
			url = "redirect:memberUpdate.htm";
		} else {
			url = "redirect:memberconfirm.htm";
		}
		return url;
	}

	@GetMapping("memberUpdate.htm")
	public String memberUpdate(Model model, Principal principal){
		Member member = memberservice.getMember(principal.getName());
		model.addAttribute("member", member);
		return "joinus/memberUpdate";
	}
	
	@PostMapping("memberUpdate.htm")
	public String memberUpdate(Model model, Member member, Principal principal){
		
		Member updatemember = memberservice.getMember(principal.getName());
		
		updatemember.setName(member.getName());
		updatemember.setCphone(member.getCphone());
		updatemember.setEmail(member.getEmail());
		updatemember.setPwd(bCryptPasswordEncoder.encode(member.getPwd()));
		memberservice.updateMember(updatemember);
		return "redirect:/index.htm";
	}
	
	
	//파일 다운로드
	@RequestMapping("download.htm")
	public void download(String p , String f , HttpServletRequest request , HttpServletResponse response) throws IOException {
		  customerservice.download(p, f, request, response);
	}
}






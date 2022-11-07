package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.koreaMemberDto;

public class LoginOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd"); System.out.println(id);
		
		RegisterDao dao = new RegisterDao();
		koreaMemberDto member = dao.getMemberById(id);
		
		HttpSession session = request.getSession();
		String url="";
		
		if (member == null) {
			url = "/WEB-INF/views/Ex02_JDBC_JoinForm.jsp";
		} else {
			if (member.getPwd().equals(pwd)) {
				session.setAttribute("member", member);
				url = "/WEB-INF/views/Ex02_JDBC_Main.jsp";
			}else {
				url = "/WEB-INF/views/Ex02_JDBC_Login.jsp";
			}
		}
		
		ActionForward forward = new ActionForward();
	  	forward.setRedirect(false);
	  	forward.setPath(url);
		
		return forward;
	}

}

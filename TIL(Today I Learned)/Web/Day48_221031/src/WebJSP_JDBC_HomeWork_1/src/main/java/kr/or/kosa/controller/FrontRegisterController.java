package kr.or.kosa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.koreaMemberDto;

@WebServlet("*.do")
public class FrontRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontRegisterController() {
		super();
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String urlcommand = requestURI.substring(contextPath.length());

		System.out.println("requestURI : " + requestURI);
		System.out.println("contextPath : " + contextPath);
		System.out.println("urlcommand : " + urlcommand);

		HttpSession session = request.getSession();

		String viewpage = "";
		if (urlcommand.equals("/Ex02_JDBC_Login.do")) { // 로그인

			viewpage = "/WEB-INF/views/Ex02_JDBC_Login.jsp";

		} else if (urlcommand.equals("/Ex02_JDBC_loginok.do")) { // 로그인

			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");

			RegisterDao dao = new RegisterDao();
			koreaMemberDto member = dao.getMemberById(id);

			if (member == null) { // 해당하는 아이디를 가진 유저가 없음
				viewpage = "/WEB-INF/views/Ex02_JDBC_JoinForm.jsp";
			} else {
				if (member.getPwd().equals(pwd)) { // 아이디 종재, pwd(o)
					session.setAttribute("member", member);
					viewpage = "Ex02_JDBC_Main.jsp";
				} else {// 아이디 존재, pwd(x)
					viewpage = "/WEB-INF/views/Ex02_JDBC_Login.jsp";
				}
			}
		} else if (urlcommand.equals("/Ex02_JDBC_Logout.do")) { // 로그아웃

			session.invalidate();
			viewpage = "/WEB-INF/views/Ex02_JDBC_Login.jsp";

		} else if (urlcommand.equals("/Ex02_JDBC_JoinForm.do")) { // 회원가입 view

			viewpage = "/WEB-INF/views/Ex02_JDBC_JoinForm.jsp";

		} else if (urlcommand.equals("/Ex02_JDBC_JoinOK.do")) { // 회원가입 로직

			// 회원가입 처리 (DB 작업)
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			String gender = request.getParameter("gender");
			String email = request.getParameter("email");
			String ip = request.getRemoteAddr();

			RegisterDao dao = new RegisterDao();
			koreaMemberDto dto = new koreaMemberDto();

			dto.setId(id);
			dto.setPwd(pwd);
			dto.setName(name);
			dto.setAge(age);
			dto.setGender(gender);
			dto.setEmail(email);
			dto.setIp(ip);

			int result = dao.insertMember(dto);

			if (result > 0) { // 회원가입 성공
				viewpage = "/WEB-INF/views/Ex02_JDBC_Login.jsp";
			} else { // 회원가입 실패
				viewpage = "/WEB-INF/views/Ex02_JDBC_JoinForm.jsp";
			}

		} else if (urlcommand.equals("/Ex03_Memberlist.do")) { // 유저 목록
		
			koreaMemberDto member = (koreaMemberDto) session.getAttribute("member");

			if (member == null) {
				viewpage = "/WEB-INF/views/Ex02_JDBC_Login.jsp";
			} else {
				String id = member.getId();

				if (!id.equals("admin")) { // 관리자가 아님
					viewpage = "/WEB-INF/views/Ex02_JDBC_Login.jsp";
				} else {
					RegisterDao dao = new RegisterDao();

					List<koreaMemberDto> memberlist = dao.getMemberListAll();
					request.setAttribute("memberlist", memberlist);


					viewpage = "/WEB-INF/views/Ex03_Memberlist.jsp";
				}
			}
		} else if (urlcommand.toLowerCase().equals("/memberinfo.do")) {// 멤버 세부정보
			RegisterDao dao = new RegisterDao();
			koreaMemberDto dto = dao.getMemberById(request.getParameter("id"));
			viewpage = "/WEB-INF/views/Ex03_MemberDetail.jsp";
			request.setAttribute(viewpage, dto);
			if (request.getAttribute("id") == null || !request.getAttribute("id").equals("admin")) {
				// 강제로 페이지 이동
				viewpage = "/WEB-INF/views/Ex02_JDBC_Login.jsp";
			}

		} else if (urlcommand.toLowerCase().equals("/memberinfoupdate.do")) {// 멤버 세부정보 수정
			RegisterDao dao = new RegisterDao();
			koreaMemberDto dto = dao.getMemberById(request.getParameter("id"));
			viewpage = "/WEB-INF/views/Ex03_MemberEdit.jsp";
			request.setAttribute(viewpage, dto);
			if (request.getAttribute("id") == null || !request.getAttribute("id").equals("admin")) {
				// 강제로 페이지 이동
				viewpage = "/WEB-INF/views/Ex02_JDBC_Login.jsp";
			}

		} else if (urlcommand.toLowerCase().equals("/memberinfoupdateok.do")) {// 수정 확인

			request.setCharacterEncoding("UTF-8");

			String id = request.getParameter("id");
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			String email = request.getParameter("email");
			String gender = request.getParameter("gender");

			RegisterDao dao = new RegisterDao();
			koreaMemberDto dto = new koreaMemberDto();
			dto.setId(id);
			dto.setName(name);
			dto.setAge(age);
			dto.setEmail(email);
			dto.setGender(gender);

			int result = dao.updateOk(dto);

			String resultdata = "";
			if (result > 0) {
				resultdata = "Update Success";
			} else {
				resultdata = "Update Fail...";
			}
			request.setAttribute("updateinfo", resultdata);
			viewpage = "/WEB-INF/views/Ex03_Memberlist.jsp";

		} else if (urlcommand.toLowerCase().equals("/membersearch.do")) {// 멤버 검색
			RegisterDao dao = new RegisterDao();

			List<koreaMemberDto> membersearch = dao.getMemberListBySearch(request.getParameter("name"));
			request.setAttribute("memberserch", membersearch);

			viewpage = "/WEB-INF/Ex03_MemberSearch.jsp";
		} else if (urlcommand.equals("/Ex03_MemberDelete.do")) {

			RegisterDao dao = new RegisterDao();

			int result = dao.deleteOk(request.getParameter("id"));

			String resultdata = "";
			if (result > 0) {
				resultdata = "Delete Success";
			} else {
				resultdata = "Delete Fail...";
			}
			request.setAttribute("delete", resultdata);
			viewpage = "/WEB-INF/Ex03_Memberlist.jsp";
		}

		// 5. view 지정하기
		RequestDispatcher dis = request.getRequestDispatcher(viewpage);

		// 6. view forward
		dis.forward(request, response);

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}

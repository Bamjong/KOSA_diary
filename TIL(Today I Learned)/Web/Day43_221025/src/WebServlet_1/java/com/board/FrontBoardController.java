package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(description = "게시판 컨트롤러 입니다",
			urlPatterns = { "/Board" })
public class FrontBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public FrontBoardController() {
  
    }


    protected void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
		//GET 요청이나 POST 요청을 doProcess 함수가 처리
    	//method parameter 요청 방식 파악
    	System.out.println("클라이언트 요청 방식: " + method);
    	
    	//1.한글처리
    	//2.요청받기 (데이터) request
    	//3.요청판단 (판단의 기준: cmd=value >> command 방식)
    	//3.1 http://192.168.0.26:8090/WebServley_1/Board?cmd=login&id=kglim&pwd=1004 요청..
    	//3.2 cmd 값을 가지고 판단 업무 > 로그인 처리 > id,pwd 값을 받아서 ....
    	
    	//4. 결과저장 (request, session, application)
    	
    	//5. view 지정
    	
    	//6. view 데이터 전달
    	
    	request.setCharacterEncoding("UTF-8");
    	
    	String cmd = request.getParameter("cmd");
    	
    	String viewpage=null;
    	//cmd > null > error.jsp
    	//cmd > boardlist > list.jsp
    	//cmd > boardwrite > write.jsp 서비스 ....
    	
    	if (cmd == null) {
			viewpage = "/error/error.jsp";
		}else if(cmd.equals("boardlist")) {
			//실제코드
			/*
				DB연결 > select > 객체 담기 ....
				boardDao dao = new boardDad();
				List<board> boardlist = dao.selectBoardList();
				request.setAttribute("list", boardlist);
				forward > view > JSP > request.getAttribute("list");
				화면의 출력
			*/
			viewpage = "/board/boardlist.jsp";
		}else if(cmd.equals("boardwrite")) {
			viewpage = "/board/boardwrite.jsp";
		}else if(cmd.equals("boarddelete")) {
			viewpage = "/board/boarddelete.jsp";
		}else if(cmd.equals("boardlogin")) {
			viewpage = "/WEB-INF/views/login/login.jsp";
		}else {
			viewpage = "/error/error.jsp";
		}
    	
    	//결과저장
    	//List<Emp> boardlist = new ArrayList<>();
    	//request.setAttribute("list", boardlist);
    	
    	//view지정
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	
    	//view에게 데이터 전달 (forward)
    	dis.forward(request, response); // request 객체를 view 에게 통으로 전달
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//같은 로직
		doProcess(request, response, "GET");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "POST");
	}

}

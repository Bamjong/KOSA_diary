package kr.or.kosa.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.dao.MemoDao;


@WebServlet("/MemoId")
public class MemoId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemoId() {
        super();
      
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println(request.getParameter("id"));
		//비동기 요청을 받아서....
    	//전달한 id 값을 받아서 request
    	
    	//DB연결
    	//select id from memo where id=?
    	//isCheckById(String id)
    	
    	//isCheckById 호출해서 return 값 
    	
    	//view 페이지 만들지말고
    	
    	request.setCharacterEncoding("UTF-8");
	  	response.setContentType("text/html;charset=UTF-8"); //클라언트에게 전달한 페이지의 정보 구성
	  	PrintWriter out = response.getWriter();
	  	
    	String id = request.getParameter("id");
    	
    	MemoDao dao = new MemoDao();
    	try {
    		 String Checkid = dao.isCheckById(id);
    		 
    		 if(Checkid == "false") {
     	     	out.print("존재합니다...!");
    		 } else {
      	     	out.print("사용가능합니다.");
    		 }
			 
//			 //데이터 저장
//			 request.setAttribute("Checkid", Checkid);
//			 //view 지정
//			 RequestDispatcher dis = request.getRequestDispatcher("/memolist.jsp");
//			 //forward
//			 dis.forward(request, response);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

package kr.or.kosa.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.dao.EmpDao;
import kr.or.kosa.dto.Emp;

/**
 * Servlet implementation class EmpServlet
 */
@WebServlet(
		description = "empno의 값을 받아올거에용", 
		urlPatterns = { 
				"/EmpServlet", 
				"/Emp"
		})
public class EmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EmpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	EmpDao dao = new EmpDao();
    	System.out.println(request.getParameter("empno"));
    	
    	request.setCharacterEncoding("UTF-8");
	  	response.setContentType("text/html;charset=UTF-8"); //클라언트에게 전달한 페이지의 정보 구성
	  	PrintWriter out = response.getWriter();
	  	
	  	
	  	try {
	  		int empno = Integer.parseInt(request.getParameter("empno"));
		  	Emp emp = dao.getEmpListByEmpno(empno);
		  	
	    	
	    	request.setAttribute("emp", emp);
			//5. view 페이지 설정
				RequestDispatcher dis = request.getRequestDispatcher("/Excel.jsp");
			//6. view 데이터 전달(forward)
				dis.forward(request, response);
		} catch (Exception e) {
			RequestDispatcher diss = request.getRequestDispatcher("/commonyo.jsp");
			//6. view 데이터 전달(forward)
				diss.forward(request, response);
		}
	  	
	}
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

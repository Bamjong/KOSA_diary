# 📚 Day62_221118

Author: 고범종
Created Time: 2022년 11월 20일 오후 2:22
Status: 🖨 Published
Updated Time: 2022년 11월 21일 오전 3:22

# 1. View단 제작

범종 : 자유 (리스트/글읽기) 등급관리 등급안내(후순위) 등급설정 팝업 / 회원활동내역
혜진 : 자료 (리스트/글읽기) / 신고현황 회원조회 / 게시판 글쓰기(통합기능) 에디터 tiny(노션)
예슬 : 사진 (리스트/글읽기) / 일정(리스트,글읽기,글쓰기)
종민 : 거래 (리스트/글읽기) / 댓글(읽기/쓰기/답글) / 관리자용탑메뉴
태호 : 출석 (리스트/글쓰기) / 쪽지 (리스트,글쓰기/글읽기) / 로그인 회원가입 회원정보수정 관리자정보변경

---

- 자유게시판 리스트 제작

![Untitled](https://user-images.githubusercontent.com/92353613/202919830-58aa21db-a220-42af-9278-81bc103903d7.png)

# 2. ajax 비동기 처리 공부

```jsx
package kr.or.kosa.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.dao.BoardDao;
import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.Reply;

@WebServlet("/ReplyList")
public class ReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ReplyList() {
        super();
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
    	System.out.println("도착");
    	
    	try {
    		
    		String ps = request.getParameter("ps");
			String cp = request.getParameter("cp");
			String idx= request.getParameter("idx");
    		
    		int pagesize = Integer.parseInt(ps);
			int cpage = Integer.parseInt(cp);
    		
    		BoardDao dao = new BoardDao();
    		List<Reply> replylist = dao.replylist(idx);
    		
    		for(Reply reply : replylist) {
    			out.print("<tr align='left'>");
        			out.print("<td width='80%'>[" + reply.getWriter() + "] : " + reply.getContent());
        				out.print("<br> 작성일:" + reply.getWritedate());
        			out.print("</td>");
        			out.print("<td width='20%'>");
        			out.print("<div>");
        				out.print("<input type='hidden' class='no' name='no' value='" + reply.getNo() + "'>");
        				out.print("<input type='hidden' class='idx' name='idx' value='" + reply.getIdx_fk() + "'>");
        				out.print("password :<input type='password' class='delPwd' name='delPwd' size='4'> ");
        				out.print("<input type='button' class='btn2' value='삭제'>");
        			out.print("</div>");
        			out.print("</td>");
        		out.print("</tr>");
    		}
    	
    		
    	} catch(Exception e) {
    		System.out.println(e.getMessage());
    	}
    	
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
```
# ๐ Day62_221118

Author: ๊ณ ๋ฒ์ข
Created Time: 2022๋ 11์ 20์ผ ์คํ 2:22
Status: ๐จ Published
Updated Time: 2022๋ 11์ 21์ผ ์ค์  3:22

# 1. View๋จ ์ ์

๋ฒ์ข : ์์  (๋ฆฌ์คํธ/๊ธ์ฝ๊ธฐ) ๋ฑ๊ธ๊ด๋ฆฌ ๋ฑ๊ธ์๋ด(ํ์์) ๋ฑ๊ธ์ค์  ํ์ / ํ์ํ๋๋ด์ญ
ํ์ง : ์๋ฃ (๋ฆฌ์คํธ/๊ธ์ฝ๊ธฐ) / ์ ๊ณ ํํฉ ํ์์กฐํ / ๊ฒ์ํ ๊ธ์ฐ๊ธฐ(ํตํฉ๊ธฐ๋ฅ) ์๋ํฐ tiny(๋ธ์)
์์ฌ : ์ฌ์ง (๋ฆฌ์คํธ/๊ธ์ฝ๊ธฐ) / ์ผ์ (๋ฆฌ์คํธ,๊ธ์ฝ๊ธฐ,๊ธ์ฐ๊ธฐ)
์ข๋ฏผ : ๊ฑฐ๋ (๋ฆฌ์คํธ/๊ธ์ฝ๊ธฐ) / ๋๊ธ(์ฝ๊ธฐ/์ฐ๊ธฐ/๋ต๊ธ) / ๊ด๋ฆฌ์์ฉํ๋ฉ๋ด
ํํธ : ์ถ์ (๋ฆฌ์คํธ/๊ธ์ฐ๊ธฐ) / ์ชฝ์ง (๋ฆฌ์คํธ,๊ธ์ฐ๊ธฐ/๊ธ์ฝ๊ธฐ) / ๋ก๊ทธ์ธ ํ์๊ฐ์ ํ์์ ๋ณด์์  ๊ด๋ฆฌ์์ ๋ณด๋ณ๊ฒฝ

---

- ์์ ๊ฒ์ํ ๋ฆฌ์คํธ ์ ์

![Untitled](https://user-images.githubusercontent.com/92353613/202919830-58aa21db-a220-42af-9278-81bc103903d7.png)

# 2. ajax ๋น๋๊ธฐ ์ฒ๋ฆฌ ๊ณต๋ถ

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
    	
    	System.out.println("๋์ฐฉ");
    	
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
        				out.print("<br> ์์ฑ์ผ:" + reply.getWritedate());
        			out.print("</td>");
        			out.print("<td width='20%'>");
        			out.print("<div>");
        				out.print("<input type='hidden' class='no' name='no' value='" + reply.getNo() + "'>");
        				out.print("<input type='hidden' class='idx' name='idx' value='" + reply.getIdx_fk() + "'>");
        				out.print("password :<input type='password' class='delPwd' name='delPwd' size='4'> ");
        				out.print("<input type='button' class='btn2' value='์ญ์ '>");
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
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.boardDAO;
import model.setBoardDTO;


@WebServlet("/setBoardService")
public class setBoardService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = "test4";
		String title = request.getParameter("title");
		String text_content = request.getParameter("text_content");
		String anonymous = request.getParameter("anonymous");
		setBoardDTO vo = new setBoardDTO(id, title, text_content, anonymous);
		
		int cnt = new boardDAO().setBoard(vo);
		if(cnt>0) {
			System.out.println("게시판 추가 완료");
		}else {
			System.out.println("게시판 추가 실패");
		}
		response.sendRedirect("./board_list.jsp");
	}

}

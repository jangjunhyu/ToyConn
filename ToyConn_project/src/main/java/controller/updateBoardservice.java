package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.boardDAO;
import model.updateBoardDTO;


@WebServlet("/updateBoardservice")
public class updateBoardservice extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String title = request.getParameter("title");
		String text_content = request.getParameter("text_content");
		
		updateBoardDTO vo = new updateBoardDTO(board_num, title, text_content);
		int cnt = new boardDAO().updateBoard(vo);
		
		if(cnt>0) {
			System.out.println("게시판 update 완료");
		}else {
			System.out.println("게시판 update 실패");
		}
		response.sendRedirect("./board_view.jsp?board_num="+board_num);
	}

}

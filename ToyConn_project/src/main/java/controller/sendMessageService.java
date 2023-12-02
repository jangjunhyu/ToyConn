package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.chattingDAO;
import model.chattingDTO;
import model.chattingOneDTO;


@WebServlet("/sendMessageService")
public class sendMessageService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String recipient = request.getParameter("recipient");
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		String sender = (String)session.getAttribute("id");
		String text_content = request.getParameter("textContent");
		
		chattingOneDTO vo = new chattingOneDTO(sender, recipient, text_content, p_num);
		
		int cnt = new chattingDAO().setChatting(vo);
		if(cnt>0) {
			System.out.println("메시지 전송 성공");
		}else {
			System.out.println("메시지 전송 실패");
		}
		response.sendRedirect("./message.jsp?p_num="+p_num);
	}

}

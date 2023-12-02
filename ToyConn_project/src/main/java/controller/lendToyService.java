package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ToyDAO;


@WebServlet("/lendToyService")
public class lendToyService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		int cnt = new ToyDAO().updateGiveState(p_num);
		if(cnt>0) {
			System.out.println("장난감 대여중 성공");
			
		}else {
			System.out.println("장난감 대여중 실패");
			
		}
		response.sendRedirect("./trade_list.jsp");
	}

}

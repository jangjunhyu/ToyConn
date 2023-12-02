package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ToyDAO;


@WebServlet("/takeService")
public class takeService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("대여가능 update 페이지");
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		int PC_num = Integer.parseInt(request.getParameter("PC_num"));
		System.out.println(p_num);
		int cnt = new ToyDAO().updateTakeState(p_num);
		if(cnt>0) {
			System.out.println("대여가능 성공");
		}else {
			System.out.println("대여가능 실패");

		}
		response.sendRedirect("updatePCService?p_num="+p_num+"&PC_num="+PC_num);
	}

}

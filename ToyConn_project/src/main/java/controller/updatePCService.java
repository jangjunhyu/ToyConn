package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.payCheckDAO;


@WebServlet("/updatePCService")
public class updatePCService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pc_num = Integer.parseInt(request.getParameter("PC_num"));
		
		int cnt = new payCheckDAO().updatePC(pc_num);
		if(cnt > 0) {
			System.out.println("업데이트 완료!!");
		}else {
			System.out.println("업데이트 실패!!");
		}
		
		response.sendRedirect("./trade_list.jsp");
	}

}

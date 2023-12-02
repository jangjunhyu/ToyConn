package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ToyDAO;
import model.ToyDTO;
import model.payCheckDAO;
import model.payCheckDTO;


@WebServlet("/payService")
public class payService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lender_id= request.getParameter("lender_id");
		String user_id= request.getParameter("user_id");
		int p_num= Integer.parseInt(request.getParameter("p_num"));
		String p_name= request.getParameter("p_name");
		int price = Integer.parseInt(request.getParameter("price"));
		int result = Integer.parseInt(request.getParameter("result"));
		String pay_choice = request.getParameter("pay_choice");
		payCheckDTO vo = new payCheckDTO(lender_id, user_id, p_num, p_name, price, pay_choice);
		String isPre = request.getParameter("isPre");
		int cnt = new payCheckDAO().setPayCheck(vo);
		if(cnt>0) {
			System.out.println("paycheck input완료");
			
		}else {
			System.out.println("paycheck input실패");
			
		}
		ToyDTO toy = new ToyDAO().getToyInfo(p_num);
		if(isPre==null) {
		RequestDispatcher rd = request.getRequestDispatcher("./pay_check.jsp");
		request.setAttribute("p_num", p_num);
		request.setAttribute("pay", price);
		request.setAttribute("result", result);
		rd.forward(request, response);
		}else {
			response.sendRedirect("./premium_info.jsp?pc=1&p_num="+p_num);
		}
	}

}

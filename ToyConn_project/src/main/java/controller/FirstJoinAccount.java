package controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberInfo;
import model.MemberInfoDAO;

@WebServlet("/FirstJoinAccount")
public class FirstJoinAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("FirstJoinAccount");

		request.setCharacterEncoding("UTF-8");

		String user_id = request.getParameter("user_id");
		String nick = request.getParameter("nick");
		
		String sample6_postcode = request.getParameter("sample6_postcode");
		String sample6_address = request.getParameter("sample6_address");
		String sample6_detailAddress = request.getParameter("sample6_detailAddress");
		
		if (sample6_detailAddress == null) {
			sample6_detailAddress = "  ";
		}
		
		String address = sample6_address + "/" + sample6_detailAddress + "/" + sample6_postcode;
		
		BigDecimal score = BigDecimal.ZERO; // BigDecimal타입의 0값

		MemberInfo memberInfo = new MemberInfo(user_id, nick, address, score);

		int row = new MemberInfoDAO().firstJoinAccount(memberInfo);

		if (row == 1) {
			System.out.println("FirstJoinAccount success");
			HttpSession session = request.getSession();
			session.setAttribute("memberInfo", memberInfo);
		} else {
			System.out.println("FirstJoinAccount fail");
		}

		response.sendRedirect("main.jsp");
	}

}

package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberInfo;
import model.MemberInfoDAO;

@WebServlet("/RemoveAccount")
public class RemoveAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("RemoveAccount");
		
		HttpSession session = request.getSession();
		MemberInfo memberInfo = (MemberInfo) session.getAttribute("memberInfo");
		
		System.out.println(memberInfo.toString());
		
		int row = new MemberInfoDAO().RemoveAccount(memberInfo);
		
		if (row == 1) {
			System.out.println("delete success");
			session.invalidate();
		} else {
			System.out.println("delete fail");
		}
		response.sendRedirect("Main.jsp");
	}

}

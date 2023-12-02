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

@WebServlet("/FirstLoginCheck")
public class FirstLoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("FirstLoginCheck");

		request.setCharacterEncoding("UTF-8");

		String user_id = request.getParameter("user_id");
		String nick = request.getParameter("nick");
		String url = request.getParameter("url");
		
		System.out.println(url);
		System.out.println(user_id);
		System.out.println(nick);

		MemberInfo row = new MemberInfoDAO().firstJoinCheck(user_id);

		if (row != null) {
			System.out.println("In");
			HttpSession session = request.getSession();
			session.setAttribute("memberInfo", row);
			response.sendRedirect(url);

		} else {
			System.out.println("Not in");
			HttpSession session = request.getSession();
			session.setAttribute("user_id", user_id);
			session.setAttribute("nick", nick);
			response.sendRedirect("JoinMember.jsp");
		}

	}

}

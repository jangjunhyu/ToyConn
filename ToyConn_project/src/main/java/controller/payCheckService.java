package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ToyDAO;
import model.ToyDTO;


@WebServlet("/payCheckService")
public class payCheckService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		ToyDTO toy = new ToyDAO().getToyInfo(p_num);
		int pay = toy.getRent_price();
		HashMap<String, Integer> m = new HashMap<>();
		m.put("1", 31);
		m.put("2", 30);
		m.put("3", 31);
		m.put("4", 30);
		m.put("5", 31);
		m.put("6", 30);
		m.put("7", 31);
		m.put("8", 31);
		m.put("9", 30);
		m.put("10", 31);
		m.put("11", 30);
		m.put("12", 31);
		String date1 = request.getParameter("start_date");
		String date2 = request.getParameter("end_date");
		System.out.println(date1);
		System.out.println(date2);
		String[] start_date = request.getParameter("start_date").split("-");
		String[] end_date = request.getParameter("end_date").split("-");
		int result = 1;
		if(start_date[0].equals(end_date[0])) {
			if(start_date[1].equals(end_date[1])) {
				int start = Integer.parseInt(start_date[2]);
				int end = Integer.parseInt(end_date[2]);
				result += end-start;
			}else {
				int a = 0;
				int b = 0;
				for(int i=1; i<=Integer.parseInt(start_date[1]); i++) {
					String k = String.valueOf(i);
					a+=m.get(k);
				}
				a+=Integer.parseInt(start_date[2]);
				for(int i=1; i<=Integer.parseInt(end_date[1]); i++) {
					String k = String.valueOf(i);
					b+=m.get(k);
				}
				b+=Integer.parseInt(end_date[2]);
				result += b-a;
			}
		}else {
			int a = 0;
			int b = 365;
			for(int i=1; i<=Integer.parseInt(start_date[1]); i++) {
				String k = String.valueOf(i);
				a+=m.get(k);
			}
			a+=Integer.parseInt(start_date[2]);
			for(int i=1; i<=Integer.parseInt(end_date[1]); i++) {
				String k = String.valueOf(i);
				b+=m.get(k);
			}
			b+=Integer.parseInt(end_date[2]);
			result += b-a;
		}
		RequestDispatcher rd = request.getRequestDispatcher("./pay_check.jsp");
		request.setAttribute("result", result);
		request.setAttribute("pay", pay*result);
		request.setAttribute("p_num", p_num);
		rd.forward(request, response);
	}
	

}

package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.reflection.SystemMetaObject;

import model.ToyDAO;
import model.payCheckDAO;
import model.payCheckDTO;
import model.pcUpdateDTO;


@WebServlet("/givService")
public class givService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("대여중 update 페이지");
		
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		String lender_id = request.getParameter("lender_id");
		int pc_num = Integer.parseInt(request.getParameter("pc_num"));
		System.out.println(pc_num);
		pcUpdateDTO vo = new pcUpdateDTO(p_num, lender_id, pc_num);
		int cnt_1 = new payCheckDAO().updatePayCheck(vo);
		if(cnt_1>0) {
			System.out.println("paycheck 업데이트 성공");
		}else {
			System.out.println("paycheck 업데이트 실패");
			
			System.out.println(vo.getPc_num());
		}
		response.sendRedirect("lendToyService?p_num="+p_num);
	}

}

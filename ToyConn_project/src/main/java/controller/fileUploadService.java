package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.ProductDAO;
import model.setToyDTO;


@WebServlet("/fileUploadService")
public class fileUploadService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String savepath = request.getServletContext().getRealPath("./images/crolling");
		System.out.println("save path : "+savepath);

		int maxSize = 1024*1024*10;

		String encoding = "UTF-8";

		DefaultFileRenamePolicy rename =  new DefaultFileRenamePolicy();

		
		MultipartRequest multi=null;
		try {
			multi = new MultipartRequest(request, savepath, maxSize, encoding, rename);
		} catch (IOException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String cate = multi.getParameter("cate");

		String gender = "남여아완구";
		String qual = "상";

		String filename = multi.getFilesystemName("productImage");
		String p_name = multi.getParameter("p_name");
		String p_content = multi.getParameter("p_content");
		int p_price = Integer.parseInt(multi.getParameter("p_price"));
		System.out.println(id+" "+cate+" "+gender+" "+qual+" "+filename+" "+p_name+" "+p_content+" "+p_price);
		setToyDTO vo = new setToyDTO(id,cate,p_name,p_price,qual,p_content,gender,filename);
		int cnt = new ProductDAO().registerProduct(vo);
		if(cnt>0) {
			System.out.println("장난감 insert 성공");
		}else {
			System.out.println("장난감 insert 실패");
		}
		response.sendRedirect("./toy_join.jsp");
		
	}

}

package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IRestaurantService;
import service.RestaurantServiceImpl;
import vo.RestaurantVO;


@WebServlet("/restaurantUpdate.do")
public class RestaurantUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 게시글 번호로 파라미터로 받아서 update
		String rsno = request.getParameter("rsno");
		String rsname = request.getParameter("rsname");
		String rsaddr = request.getParameter("rsaddr");
		String rstel = request.getParameter("rstel");
		double rslat = Double.parseDouble(request.getParameter("rslat"));
		double rslong = Double.parseDouble(request.getParameter("rslong"));
		String rscont = request.getParameter("rscont");
		
		RestaurantVO vo = new RestaurantVO();
		vo.setRs_no(rsno);
		vo.setRs_name(rsname);
		vo.setRs_addr(rsaddr);
		vo.setRs_tel(rstel);
		vo.setRs_lat(rslat);
		vo.setRs_long(rslong);
		vo.setRs_con(rscont);
		
		System.out.println(vo);
		
		IRestaurantService service = RestaurantServiceImpl.getInstance();
		
		int res = service.restaruantUpdate(vo);
		
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/admin/view/restaurantview/result.jsp").forward(request, response);
		
	}

}

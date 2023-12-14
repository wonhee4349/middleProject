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

/**
 * Servlet implementation class RestaurantDetail
 */
@WebServlet("/restaurantDetail.do")
public class RestaurantDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String rsNo = request.getParameter("rsNo");
		
		IRestaurantService service = RestaurantServiceImpl.getInstance();
		
		RestaurantVO vo = service.selectById(rsNo);
		
		service.updateHit(rsNo);
		
		vo.setRs_hit(vo.getRs_hit()+1);
		
		request.setAttribute("restaurantDetail", vo);
		
		request.getRequestDispatcher("/Mproject/jsp/restaurantdetail.jsp").forward(request, response);
		
	}

}

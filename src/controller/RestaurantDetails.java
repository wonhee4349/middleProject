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


@WebServlet("/restaurantDetails.do")
public class RestaurantDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String rsNo = request.getParameter("no");
		
		IRestaurantService service = RestaurantServiceImpl.getInstance();
		
		RestaurantVO vo = service.restaurantDetails(rsNo);
		
		request.setAttribute("rsNo", vo);
		
		request.getRequestDispatcher("/admin/view/restaurantview/restaurantDetails.jsp").forward(request, response);
		
		
		
	}


}

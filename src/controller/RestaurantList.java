package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IRestaurantService;
import service.RestaurantServiceImpl;
import vo.RestaurantVO;


@WebServlet("/restaurantList.do")
public class RestaurantList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IRestaurantService service = RestaurantServiceImpl.getInstance();
		
		List<RestaurantVO> list = service.getAllRestaurant();
		
		request.setAttribute("restaurantList", list);
		
		request.getRequestDispatcher("/admin/view/restaurantview/restaurantList.jsp").forward(request, response);
		
	}

}

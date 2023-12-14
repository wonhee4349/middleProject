package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IRestaurantService;
import service.RestaurantServiceImpl;


@WebServlet("/restaurantDelete.do")
public class RestaurantDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rsNo = request.getParameter("no");
		
		IRestaurantService service = RestaurantServiceImpl.getInstance();
		
		int res = service.restaruantDelete(rsNo);
		
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/admin/view/restaurantview/result.jsp").forward(request, response);
		
	}

}

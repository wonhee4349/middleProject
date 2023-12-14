package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommentRSServiceImpl;
import service.CommentServiceImpl;
import service.ICommentRSService;
import service.ICommentService;
import service.IRestaurantService;
import service.ITourismService;
import service.RestaurantServiceImpl;
import service.TourismServiceImpl;
import vo.RestaurantVO;
import vo.TourismVO;


@WebServlet("/deleteCommentRS.do")
public class DeleteCommentRS extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String cmNo = request.getParameter("cmNo");
		String rsNo = request.getParameter("ntNo");
		
		IRestaurantService trService = RestaurantServiceImpl.getInstance();
		RestaurantVO rsVo = trService.selectById(rsNo);
		
		ICommentRSService service = CommentRSServiceImpl.getInstance();
		
		service.deleteComment(cmNo);
		
		request.setAttribute("restaurantDetail", rsVo);
		
		request.getRequestDispatcher("/Mproject/jsp/restaurantdetail.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

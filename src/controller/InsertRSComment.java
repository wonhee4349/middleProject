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
import vo.CommentVO;
import vo.RestaurantVO;
import vo.TourismVO;


@WebServlet("/insertRSComment.do")
public class InsertRSComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String rsNo = request.getParameter("ntNo");
		IRestaurantService rsService = RestaurantServiceImpl.getInstance();
		RestaurantVO rsVo = rsService.selectById(rsNo);
		
		CommentVO vo = new CommentVO();
		
		vo.setCm_con(request.getParameter("content"));
		vo.setNt_no(request.getParameter("ntNo"));
		
		
		String userNo = request.getParameter("userNo");
		if(userNo.equals("MG_23_001")) {
			vo.setMg_no(userNo);
		}else {
			vo.setUsers_no(userNo);
		}

		ICommentRSService service = CommentRSServiceImpl.getInstance();
		String userName =service.getUserName(userNo);
		vo.setUsers_name(userName);
		

		service.insertComment(vo);
		
		System.out.println("---------------------------------rsNo : " + rsNo);
		System.out.println("---------------------------------rsVo : " + rsVo.toString());
		System.out.println("---------------------------------vo : " + vo.toString());
		System.out.println("---------------------------------userNo : " + userNo);
		System.out.println("---------------------------------service : " + service.toString());
		
		request.setAttribute("restaurantDetail", rsVo);
		
		request.getRequestDispatcher("/Mproject/jsp/restaurantdetail.jsp").forward(request, response);
		
		
	}

}

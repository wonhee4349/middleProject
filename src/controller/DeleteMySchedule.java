package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CouponMGServiceImpl;
import service.ICouponMGService;
import service.IScheduleService;
import service.ScheduleServiceImpl;


@WebServlet("/deleteMySchedule.do")
public class DeleteMySchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String scNo = request.getParameter("scNo");
		
		IScheduleService service = ScheduleServiceImpl.getInstance();
		
		service.deleteMySchedule(scNo);
		
		response.sendRedirect(request.getContextPath()+"/Mproject/jsp/schedule.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

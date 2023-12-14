package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommentServiceImpl;
import service.CommunityServiceImpl;
import service.ICommentService;
import service.ICommunityService;
import service.ITourismService;
import service.TourismServiceImpl;
import vo.CommunityVO;
import vo.TourismVO;


@WebServlet("/DeleteCMTComment.do")
public class DeleteCMTComment extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String cmNo = request.getParameter("cmNo");
		String no = request.getParameter("ntNo");
		
		ICommunityService cmtService = CommunityServiceImpl.getInstance();
		CommunityVO cmtNo = cmtService.listDetail(no);
		
		ICommentService service = CommentServiceImpl.getInstance();
		
		service.deleteComment(cmNo);
		
		request.setAttribute("communityDetail", cmtNo);
		
		//request.getRequestDispatcher("/Mproject/jsp/communityDetail.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath()+"/Mproject/jsp/communityDetail.jsp?no="+no);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

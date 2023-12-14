package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommunityServiceImpl;
import service.ICommunityService;




@WebServlet("/communityDelete.do")
public class CommunityDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmtNo = request.getParameter("no");
		
		ICommunityService service = CommunityServiceImpl.getInstance();
		
		int res = service.listDelete(cmtNo);
		
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/Mproject/view/result.jsp").forward(request, response);
	}
	
}

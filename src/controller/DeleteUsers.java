package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IMemberService;
import service.MemberServiceImpl;


@WebServlet("/deleteUsers.do")
public class DeleteUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String usersNo = request.getParameter("usesrNo");
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		service.deleteUsers(usersNo);
		
		response.sendRedirect(request.getContextPath() + "/admin/jsp/usersMG.jsp");
	}


}

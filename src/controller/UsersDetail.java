package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IMemberService;
import service.MemberServiceImpl;
import vo.MemberVO;


@WebServlet("/usersDetail.do")
public class UsersDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String usersNo = request.getParameter("usersNo");
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		MemberVO vo = service.selectByNo(usersNo);
		
		request.setAttribute("usersDetail", vo);
		
		request.getRequestDispatcher("/admin/jsp/usersDetailMG.jsp").forward(request, response);
		
	}



}

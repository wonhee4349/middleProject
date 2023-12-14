package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.IMypageService;
import service.MypageServiceImpl;
import vo.MypageVO;




@WebServlet("/mypageList.do")
public class MypageList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	   
		//String usersNo = request.getParameter("no");
		
		HttpSession  session = request.getSession();
		String usersNo = (String)session.getAttribute("USERNUM");				
		
		IMypageService service = MypageServiceImpl.getInstance();
		
		MypageVO vo = service.memberList(usersNo);
		
		request.setAttribute("usersNo", vo);
		
		request.getRequestDispatcher("/Mproject/view/mypageList.jsp").forward(request, response);
	}

}

package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.IMypageService;
import service.MypageServiceImpl;
import vo.MypageVO;


@WebServlet("/mypageDelete.do")
public class MypageDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession  session = request.getSession();
		String usersNo = (String)session.getAttribute("USERNUM");				
		
		IMypageService service = MypageServiceImpl.getInstance();
		
		int res = service.memberDelete(usersNo);
		
		request.setAttribute("result", res);
		
		session.invalidate();
		
		request.getRequestDispatcher("/Mproject/view/result.jsp").forward(request, response);
	}


}

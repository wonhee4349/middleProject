package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ChatMGServiceImpl;
import service.IChatMGService;
import service.ITourismService;
import service.TourismServiceImpl;
import vo.ChatVO;
import vo.TourismVO;


@WebServlet("/chatDetailMG.do")
public class ChatDetailMG extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String cbNo = request.getParameter("cbNo");
		
		IChatMGService service = ChatMGServiceImpl.getInstance();
		ChatVO vo=service.chatSelectById(cbNo);

		request.setAttribute("chatDetail", vo);
		
		request.getRequestDispatcher("/admin/jsp/chatDetailMG.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

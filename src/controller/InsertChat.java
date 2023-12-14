package controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import service.ChatMGServiceImpl;
import service.IChatMGService;
import service.IRestaurantService;
import service.RestaurantServiceImpl;
import vo.ChatVO;
import vo.RestaurantVO;

/**
 * Servlet implementation class InsertChat
 */
@WebServlet("/insertChat.do")
public class InsertChat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/admin/jsp/insertChat.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ChatVO vo = new ChatVO();
		
		vo.setCb_no(request.getParameter("cbNo"));
		vo.setCb_con(request.getParameter("cbCon"));
		vo.setCb_rp(request.getParameter("cbRp"));
		//vo.setMg_no(request.getParameter("mgNum"));
		
		
		IChatMGService service = ChatMGServiceImpl.getInstance();
		int cnt = service.chatInsert(vo);
		
		response.sendRedirect(request.getContextPath()+"/admin/jsp/chatbotMG.jsp");
		
	}
	
	

}

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


@WebServlet("/deleteChat.do")
public class DeleteChat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
		
		String cbNo = request.getParameter("cbNo");
		
		IChatMGService service = ChatMGServiceImpl.getInstance();
		
		service.chatDelete(cbNo);
		
		response.sendRedirect(request.getContextPath()+"/admin/jsp/chatbotMG.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ChatServiceImpl;
import service.IChatService;
import vo.ChatVO;




@WebServlet("/chatbot.do")
public class Chatbot extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IChatService service = ChatServiceImpl.getInstance();
		List<ChatVO> chatList = service.selectByCHAT();
		
		request.setAttribute("chatbot", chatList);
		
		request.getRequestDispatcher("/Mproject/jsp/ChatBot.jsp")
		.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

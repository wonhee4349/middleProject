package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.INoticeService;
import service.NoticeServiceImpl;
import vo.NoticeVO;




@WebServlet("/noticeList.do")
public class NoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		
		NoticeVO vo = new NoticeVO();
		INoticeService service = NoticeServiceImpl.getInstance();
		
		List<NoticeVO>list = service.noticeAll();
		
		
		
		
		request.setAttribute("LIST", list);
		
		request.getRequestDispatcher("Mproject/view/noticeList.jsp").forward(request, response);
		
		
		
	}

}

package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.INoticeService;
import service.NoticeServiceImpl;
import vo.NoticeVO;




@WebServlet("/updatenotice.do")
public class Updatenotice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		NoticeVO vo = new NoticeVO();
		
		vo.setNot_title(request.getParameter("title"));
		vo.setNot_con(request.getParameter("con"));
		vo.setNot_no(request.getParameter("no"));
		
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		int updatenotice = service.updateNot(vo);
		

		//request.setAttribute("RES", vo);
		request.setAttribute("RES", vo);
		System.out.println("res=="+vo.getNot_no());
		
		request.getRequestDispatcher("/admin/view/m_result.jsp").forward(request, response);
		
		
	}

}

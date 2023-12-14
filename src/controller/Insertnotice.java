package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.INoticeService;
import service.NoticeServiceImpl;
import vo.NoticeVO;



@WebServlet("/insertnotice.do")
public class Insertnotice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		NoticeVO vo = new NoticeVO();
		
		vo.setNot_title(request.getParameter("title"));
		vo.setNot_con(request.getParameter("con"));
		vo.setMg_no(request.getParameter("mnum"));
		
		System.out.println("제목"+vo.getNot_title());
		System.out.println("관리자 번호 서블릿"+vo.getNot_no());
		INoticeService service = NoticeServiceImpl.getInstance();
		
		int insertnotice = service.insertNot(vo);
		

		request.setAttribute("RES", vo);
		
		request.getRequestDispatcher("/admin/view/m_result.jsp").forward(request, response);
		
		
	
	}

}

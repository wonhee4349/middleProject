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




@WebServlet("/deletenotice.do")
public class Deletenotice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String num = request.getParameter("no");
		NoticeVO vo = new NoticeVO();
		vo.setNot_no(num);
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		int deletenotice = service.deleteNot(num);
		
		request.setAttribute("RES", vo);
		
		
		//삭제완료!
		request.getRequestDispatcher("/admin/view/m_result.jsp").forward(request, response);
	//	request.getRequestDispatcher("/admin/jsp/m_noticelist.jsp").forward(request, response);
		//response.sendRedirect(request.getContextPath()+"/admin/jsp/m_noticelist.jsp");
		
		
	}

}

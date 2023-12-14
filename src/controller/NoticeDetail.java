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




@WebServlet(asyncSupported = true, urlPatterns = { "/noticeDetail.do" })
public class NoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		NoticeVO vo = new NoticeVO();
		String num = request.getParameter("no"); //noticelist.jsp 에서 가져온 파라미터!!!!!!!!!!!!
		
		
	
		vo.setNot_no(num);
		
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		NoticeVO res = service.noticeDetail(num);
		
		System.out.println("res!!!"+res);
	
		request.setAttribute("RES", res);
		
		request.getRequestDispatcher("Mproject/view/noticedetailjson.jsp").forward(request, response);
		
	
    	
		/*
		 * String no = request.getParameter("no"); String title =
		 * request.getParameter("title"); String con = request.getParameter("con");
		 * 
		 * response.setContentType("application/json; charset=utf-8");
		 * 
		 * JSONObject jsonData= new JSONObject(); jsonData.put("no", no);
		 * jsonData.put("title", title); jsonData.put("con", con);
		 * 
		 * request.getRequestDispatcher("admin/jsp/m_noticedetail.jsp").forward(request,
		 * response);
		 */
       
       
     
   	
  
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}

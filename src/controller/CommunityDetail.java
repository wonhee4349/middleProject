package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommunityServiceImpl;
import service.ICommunityService;
import vo.CommunityVO;




@WebServlet("/communityDetail.do")
public class CommunityDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String cmtNo = request.getParameter("no");
		
		ICommunityService service = CommunityServiceImpl.getInstance();
		
		CommunityVO vo = service.listDetail(cmtNo);
		
		service.updateHit(cmtNo);
		
		//vo.setCmt_hit(vo.getCmt_hit()+1);
		
		//System.out.println(vo);
		
		request.setAttribute("cmtNo", vo);
		
		request.getRequestDispatcher("/Mproject/view/communityDetail.jsp").forward(request, response);
		
		
	}

}

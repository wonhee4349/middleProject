package controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import service.CommunityServiceImpl;
import service.ICommunityService;
import vo.CommunityVO;



/**
 * Servlet implementation class CommunityUpdate
 */
@WebServlet("/communityUpdate.do")
public class CommunityUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		System.out.println("``````````````````````");
		
		String cmtNo = request.getParameter("cmtNo");
		String cmtTitle = request.getParameter("cmtTitle");
		String cmtCon = request.getParameter("cmtCon");
//		String cmtDate = request.getParameter("cmtDate");
//		int cmtHit = Integer.parseInt(request.getParameter("cmtHit"));
//		String usersName = request.getParameter("usersName");
//		
		CommunityVO vo = new CommunityVO();
		
		vo.setCmt_no(cmtNo);
		vo.setCmt_title(cmtTitle);
		vo.setCmt_con(cmtCon);
//		vo.setCmt_date(cmtDate);
//		vo.setCmt_hit(cmtHit);
//		vo.setUsers_name(usersName);
		
		System.out.println(vo);
		
		ICommunityService service = CommunityServiceImpl.getInstance();
		
		int res = service.listUpdate(vo);
		
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/Mproject/view/result.jsp").forward(request, response);
	}

}

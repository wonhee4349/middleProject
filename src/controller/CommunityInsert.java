package controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import service.CommunityServiceImpl;
import service.ICommunityService;
import vo.CommunityVO;




@WebServlet("/communityInsert.do")
	public class CommunityInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/Mproject/view/communityInsert.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
	    String userNo = (String)session.getAttribute("USERNUM");
		
		CommunityVO vo = new CommunityVO();
		
		//insert into community(cmt_no, cmt_title, cmt_con, cmt_date, cmt_hit, users_no)
		//values('CM_23_' || LPAD(SEQ_CMT.NEXTVAL),3,'0'), #{cmt_title}, #{cmt_con}, sysdate, 0, '2')
		vo.setCmt_title(request.getParameter("cmtTitle"));
		vo.setCmt_con(request.getParameter("cmtCon"));
		vo.setUsers_no(userNo);
		
		
		ICommunityService service = CommunityServiceImpl.getInstance();
		
		int res = service.listInsert(vo);
		
		response.sendRedirect(request.getContextPath()+"/Mproject/jsp/communityList.jsp");
	
		
		
	}

}

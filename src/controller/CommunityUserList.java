package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CommunityServiceImpl;
import service.ICommunityService;
import sun.print.resources.serviceui;
import vo.ComPageVO;
import vo.CommunityVO;


@WebServlet("/communityUserList.do")
public class CommunityUserList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");				   
		
		int page = Integer.parseInt(request.getParameter("page"));
		
		String stype = request.getParameter("stype");
		String sword = request.getParameter("sword");
		String no = request.getParameter("no");
		
		ICommunityService service = CommunityServiceImpl.getInstance();
		
		ComPageVO pvo = service.pageInfo(page, stype, sword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", pvo.getStart());
		map.put("end", pvo.getEnd());
		map.put("stype", stype);
		map.put("sword", sword);
		map.put("users_no", no);
		
		List<CommunityVO> list = service.selectByUserPage(map);
		
		request.setAttribute("listvalue", list);
		request.setAttribute("startpage", pvo.getStartPage());
		request.setAttribute("endpage", pvo.getEndPage());
		request.setAttribute("totalpage", pvo.getTotalPage());
		
		request.getRequestDispatcher("/Mproject/view/communityUserList.jsp").forward(request, response);
	}

	
}



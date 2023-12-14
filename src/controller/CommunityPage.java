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

import service.CommunityServiceImpl;
import service.ICommunityService;




@WebServlet("/communityPage.do")
public class CommunityPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text.html; charset=utf-8");
		
		String sword = request.getParameter("sword");
		String cpage = request.getParameter("cpage");
		
		sword = sword==null ? "" : sword;
		
		int currentPage = 1;
		if(cpage != null) {
			currentPage = Integer.parseInt(cpage);
		}
		
//		PageVO_bak pvo = PageInfoCM.pageInfo(currentPage, sword);
		
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("startIndex", String.valueOf(pvo.getStartIndex()));
//		map.put("endIndex", String.valueOf(pvo.getEndIndex()));
//		map.put("sword", sword);
//		
		ICommunityService service = CommunityServiceImpl.getInstance();
		
		//List<CommunityVO> list = service.selectByPage(map);
		
//		request.setAttribute("listvalue", list);
//		request.setAttribute("sp", pvo.getStartPage());
//		request.setAttribute("ep", pvo.getEndPage());
//		request.setAttribute("tp", pvo.getTotalPage());
//		request.setAttribute("size", pvo.getBlockSize());
		
		request.getRequestDispatcher("/Mproject/view/communityPage.jsp").forward(request, response);
	}
	

}

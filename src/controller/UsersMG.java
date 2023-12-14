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

import service.IMemberService;
import service.MemberServiceImpl;
import util.PageInfoUsersCM;
import vo.MemberVO;
import vo.PageVO;


@WebServlet("/usersMG.do")
public class UsersMG extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String sword = request.getParameter("sword");
		String cpage = request.getParameter("cpage");
		
		sword = sword==null ? "" : sword;
		
		int currentPage = 1;
		if(cpage!=null) {
			currentPage = Integer.parseInt(cpage);			
		}
		
		PageVO pvo = PageInfoUsersCM.pageInfo(currentPage, sword);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startIndex", String.valueOf(pvo.getStartIndex()));
		map.put("endIndex", String.valueOf(pvo.getEndIndex()));
		map.put("sword", sword);	
		
		System.out.println("--------------------------------" + map.toString());
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		List<MemberVO> list = service.selectByPage(map);
		
		System.out.println("--------------------------------" + list.size());
		
		request.setAttribute("usersList", list);
		request.setAttribute("sp", pvo.getStartPage());
		request.setAttribute("ep", pvo.getEndPage());
		request.setAttribute("tp", pvo.getTotalPage());
		request.setAttribute("size", pvo.getBlockSize());
		
		request.getRequestDispatcher("/Mproject/view/usersview.jsp").forward(request, response);
		
		
		
	}

	

}

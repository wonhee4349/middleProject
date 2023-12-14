package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IMypageService;
import service.MypageServiceImpl;
import vo.MypageVO;




@WebServlet("/mypageUpdate.do")
public class MypageUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
	    String usersId = request.getParameter("usersId");
	    String usersName = request.getParameter("usersName");
	    String usersPw = request.getParameter("usersPw");
	    String usersMail = request.getParameter("usersMail");
	    String usersTel = request.getParameter("usersTel");
	    String usersZip = request.getParameter("usersZip");
	    String usersAddr1 = request.getParameter("usersAddr1");
	    String usersAddr2 = request.getParameter("usersAddr2");
	    String usersNo = request.getParameter("usersNo");
	    
	    MypageVO vo = new MypageVO();
	    
	    vo.setUsers_id(usersId);      
	    vo.setUsers_name(usersName);
	    vo.setUsers_pw(usersPw);
	    vo.setUsers_mail(usersMail);
	    vo.setUsers_tel(usersTel);
	    vo.setUsers_zip(usersZip);
	    vo.setUsers_addr1(usersAddr1);
	    vo.setUsers_addr2(usersAddr2);
	    vo.setUsers_no(usersNo);
	    
	    IMypageService service = MypageServiceImpl.getInstance();
	    
	    int res = service.memberUpdate(vo);
	    
	    request.setAttribute("result", res);
	    
	    request.getRequestDispatcher("/Mproject/view/result.jsp").forward(request, response);
	}

}

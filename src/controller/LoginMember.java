package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.IMemberService;
import service.MemberServiceImpl;
import vo.MemberVO;



@WebServlet("/loginMember.do")
public class LoginMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		String userId = request.getParameter("id");
		String userPw = request.getParameter("pw");

		MemberVO vo = new MemberVO();
		vo.setUsers_id(userId);
		vo.setUsers_pw(userPw);

		// service객체 얻기
		IMemberService service = MemberServiceImpl.getInstance();

		// service메소드 호출- 결과값 받기 
		MemberVO loginres = service.loginMem(vo);
		
		HttpSession session = request.getSession();

		System.out.println("loginres="+loginres);
		
		if (loginres != null) {// 로그인 성공

			
				session.setAttribute("LOGINID", loginres.getUsers_id());//세션 아이디 저장
				session.setAttribute("USERNUM", loginres.getUsers_no());
				session.setAttribute("USERNAME", loginres.getUsers_name());
				
		} 

		request.getRequestDispatcher("/Mproject/jsp/resultlogin.jsp").forward(request, response);

	}
}

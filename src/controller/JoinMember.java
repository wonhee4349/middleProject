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




@WebServlet("/joinMember.do")
public class JoinMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    public JoinMember() {
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		MemberVO vo = new MemberVO();
		vo.setUsers_id(request.getParameter("users_id"));
		vo.setUsers_pw(request.getParameter("users_pw"));
		vo.setUsers_name(request.getParameter("users_name"));
		vo.setUsers_bir(request.getParameter("users_bir"));
		
		if(request.getParameter("email2")==null) {
			vo.setUsers_mail(request.getParameter("email1")+request.getParameter("tmp_mail"));
		}else {
			//직접입력
			vo.setUsers_mail(request.getParameter("email1")+"@"+request.getParameter("email2"));
		}
	
		//vo.setUsers_mail(request.getParameter("users_email"));
		vo.setUsers_gen(request.getParameter("users_gender"));
		vo.setUsers_tel(request.getParameter("users_tel"));
		vo.setUsers_zip(request.getParameter("users_zip"));
		vo.setUsers_addr1(request.getParameter("users_addr1"));
		vo.setUsers_addr2(request.getParameter("users_addr2"));
	
		
		
		IMemberService service =MemberServiceImpl.getInstance();
		
		int signup = service.insertMember(vo);
		
		HttpSession session = request.getSession();
		
		
		
		
		//프로젝트-메인화면으로 돌아가기   //회원가입 <form action>는 바로 전송
		//response.sendRedirect(request.getContextPath()+"/Mproject/jsp/join.jsp");
		
		//resultjoin으로 보내기
		
		session.setAttribute("SIGNUP",signup );
		
		request.getRequestDispatcher("/Mproject/jsp/resultljoin.jsp").forward(request, response);
		
		//request.getRequestDispatcher(request.getContextPath()+"/Mproject/join.jsp").forward(request, response);
		
		
		
		
		
		
		
		
		
	}

}

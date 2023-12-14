package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IMemberService;
import service.MemberServiceImpl;
import vo.MemberVO;




@WebServlet("/selectIById.do")
public class SelectIById extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청시 전송 데이터 받기 - 입력아이디(name으로 쓰기)
		request.setCharacterEncoding("utf-8");

		String userId= request.getParameter("id");
		
		MemberVO vo = new MemberVO();
		vo.setUsers_id(userId);
		 
		
		//service객체 얻기 
		 IMemberService service = MemberServiceImpl.getInstance();
		
		//service메소드 호출- 결과값 받기 -String
		String res = service.selectById(userId);

		//결과값 request에 저장 
		request.setAttribute("USERID", res);
		
		
		
		//페이지로 이동 forward일때는 request.getContextPath() 쓰지 않기 
		
		request.getRequestDispatcher("/Mproject/jsp/resultId.jsp").forward(request, response);
		//response.sendRedirect(request.getContextPath()+"/Mproject/html/resultId.jsp");
		//RequestDispatcher dispatcher = request.getRequestDispatcher("/Mproject/html/resultId.jsp");
        //dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

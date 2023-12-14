package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/logoutMember.do")
public class LogoutMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession(false); // 새 세션을 생성하지 않도록 false로 설정
        
        if (session != null) {
            // 세션 무효화 (세션 제거)
            session.invalidate();
        }
        
        // 로그아웃 후 리디렉션
       response.sendRedirect(request.getContextPath() + "/admin/jsp/main_mg.jsp");
		
		
	}

}

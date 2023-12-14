package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.Email;
import org.apache.commons.mail.SimpleEmail;
import org.apache.log4j.chainsaw.Main;

import service.IMemberService;
import service.MemberServiceImpl;
import vo.MemberVO;





@WebServlet("/idFindMember.do")
public class IdFindMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		// 이름, 이메일 맞으면 이메일로 보내기
		String userName = request.getParameter("name");
		String userMail = request.getParameter("mail");
		
		System.out.println("name="+userName);
		System.out.println("mail="+userMail);

		MemberVO vo = new MemberVO();
		vo.setUsers_name(userName);
		vo.setUsers_mail(userMail);
		
		//아이디 찾기
		IMemberService service = MemberServiceImpl.getInstance();

		MemberVO res = service.findIdMem(vo);
		
		System.out.println("res="+res);
		
		
		HttpSession session = request.getSession();

		if (res != null) {
		
			// 성공
			// 이메일
			
			String sid =res.getUsers_id();
			System.out.println("sid==>"+sid);

			// 발신자의 실제 아이디와 비밀번호를 입력한다.
			String id = "ddit2305@naver.com";
			String passwd = "roqkfdnjs2305!!";

			// email 객체 생성
			Email email = new SimpleEmail();

			// SMTP 서버 연결설정
			email.setHostName("smtp.naver.com");
			email.setSmtpPort(587); // 네이버는 587
			email.setCharset("euc-kr");
			email.setAuthentication(id, passwd);

			// SMTP SSL, TLS 설정
			email.setSSLOnConnect(true);
			email.setStartTLSEnabled(true);

			try {
				// 발신자 ID
				email.setFrom(id);

				// 수신자 ID(여러명 가능)
				email.addTo(userMail);
				// email.addTo("id@naver.com");

				// 메일 제목 설정
				email.setSubject("※NORI Daejeon 아이디 찾기※");

				// 메일 본문 설정
				email.setMsg("아이디는 "+sid+" 입니다");

				// 메일 전송
				email.send();
				System.out.println("메일 발송에 성공하였습니다.");
				
				
				
				//session.setAttribute("FINDID", res.getUsers_mail());//세션 저장
				
				request.setAttribute("FIND", res.getUsers_mail());;
				System.out.println(res.getUsers_mail());
				
				
				
				request.getRequestDispatcher("/Mproject/view/resultfind.jsp").forward(request, response);
				
				
			} catch (Exception e) {
				System.out.println("메일 발송에 실패하였습니다." + e.getMessage());
			}
			
		}else {
			request.getRequestDispatcher("/Mproject/view/resultfind.jsp").forward(request, response);
		}
			
			
		
		
		
		

	}

}

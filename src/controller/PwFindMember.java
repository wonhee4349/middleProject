package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.Email;
import org.apache.commons.mail.SimpleEmail;

import service.IMemberService;
import service.MemberServiceImpl;
import vo.MemberVO;



@WebServlet("/pwFindMember.do")
public class PwFindMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String userId = request.getParameter("id");
		String userMail = request.getParameter("mail");

		MemberVO vo = new MemberVO();
		vo.setUsers_id(userId);
		vo.setUsers_mail(userMail);
	

		IMemberService service = MemberServiceImpl.getInstance();

		// 아이디랑 메일이 일치하는지
		MemberVO res = service.findPwMem(vo);


		if (res != null) {
			
			//비밀번호: 100000부터 999999 사이 숫자 랜덤숫자
			int min = 100000; 
			int max = 999999;
			int randomNum = min + (int) (Math.random() * ((max - min) + 1));
			String userPw = String.valueOf(randomNum);
			
			
			// 랜덤 비밀번호 변경 업데이트
			vo.setUsers_id(userId);
			vo.setUsers_pw(userPw);
			
			int randres = service.randomPw(vo);
		
			HttpSession session = request.getSession();
			if (randres > 0) {
				// 성공
				// 이메일 보내기

				// 발신자의 실제 아이디와 비밀번호를 입력
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
					email.setSubject("※NORI Daejeon 임시 비밀번호※");

					// 메일 본문 설정
					email.setMsg("임시비밀번호는 "+userPw + " 입니다!! 임시비밀번호를 사용하여 NORI Daejeon에 로그인 후 새로운 비밀번호로 변경하시기 바랍니다.");

					// 메일 전송
					email.send();
					System.out.println("메일 발송에 성공하였습니다.");

					// 이메일 성공시 로그인 페이지로 돌아가기
					//response.sendRedirect(request.getContextPath() + "/Mproject/html/login.jsp");
						
					request.setAttribute("FIND", res.getUsers_mail());
					request.getRequestDispatcher("/Mproject/view/resultfind.jsp").forward(request, response);

				} catch (Exception e) {
					System.out.println("메일 발송에 실패하였습니다." + e.getMessage());
				}

			}else {
				// 업데이트 실패
				
				request.getRequestDispatcher("/Mproject/view/resultfind.jsp").forward(request, response);
			}

		} else {
			// 아이디, 메일 일치 실패
			//response.sendRedirect(request.getContextPath() + "/Mproject/html/resultfindid.jsp");
			request.getRequestDispatcher("/Mproject/view/resultfind.jsp").forward(request, response);
		}

	}


}

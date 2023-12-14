package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;


import service.IManagerService;
import service.ManagerServiceImpl;
import vo.ManagerVO;


@WebServlet("/loginMg.do")
public class LoginMg extends HttpServlet {
   private static final long serialVersionUID = 1L;

   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      //response.setCharacterEncoding("utf-8");
      //response.setContentType("application/json");
      
      String mgId = request.getParameter("id");
      String mgPw = request.getParameter("pw");
      
      ManagerVO vo = new ManagerVO();
      
      vo.setMg_id(mgId);
      vo.setMg_pw(mgPw);

      IManagerService service = ManagerServiceImpl.getInstance();
      
      ManagerVO loginres = service.loginMg(vo);
      
      HttpSession session = request.getSession(); 
      
      System.out.println("loginres="+loginres);
      
      if(loginres!= null) {
         //로그인 성공
         session.setAttribute("LOGINID", loginres.getMg_id());//세션 아이디 저장
         session.setAttribute("LOGINUM", loginres.getMg_no());
      }

      //request.getRequestDispatcher("/admin/view/m_loginresult.jsp").forward(request, response);

      request.getRequestDispatcher("/Mproject/jsp/resultlogin.jsp").forward(request, response);

      
      
      
      
   }

}
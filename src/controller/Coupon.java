package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CouponServiceImpl;
import service.ICouponService;
import vo.CouponUseVO;
import vo.MemberVO;


@WebServlet("/coupon.do")
public class Coupon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 클라이언트로부터 받은 쿠폰 정보를 추출
    	String cpNo = request.getParameter("cpNo"); // 수정: 클라이언트에서 전달한 쿠폰 번호
 
        HttpSession session = request.getSession();
        String userId = (String)session.getAttribute("LOGINID");// 세션에 저장된 사용자 아이디
     
        
        
        
        // 서비스를 통해 쿠폰 사용 처리
        ICouponService service = CouponServiceImpl.getService();
        
        MemberVO vo = service.getUserInfo(userId);
       
        // CouponUseVO 객체 생성 및 정보 설정
        CouponUseVO couponUseVO = new CouponUseVO();
        
        couponUseVO.setCp_no(cpNo);
        couponUseVO.setUsers_no(vo.getUsers_no());
        
        System.out.println(vo.getUsers_no());
        
        int result = service.insertCouponUse(couponUseVO);
        
        // 처리 결과 메시지를 클라이언트로 응답
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        
        String message;
        if (result > 0) {
            message = "쿠폰이 성공적으로 지급되었습니다.";
        } else {
            message = "쿠폰 지급에 실패하였습니다.";
        }
        response.getWriter().write(message);
/*        
        request.getRequestDispatcher("/Mproject/jsp/coupon.jsp").forward(request, response);
       */ 
    }
}

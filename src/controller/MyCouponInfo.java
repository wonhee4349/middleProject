package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CouponServiceImpl;
import vo.CouponVO;

@WebServlet("/mycouponInfo.do")
public class MyCouponInfo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("LOGINID");// 세션에 저장된 사용자 아이디
        /*if(userId==null) {
        	userId = "a001";
        }*/
      //  String users_no = (String) session.getAttribute("users_no"); 
        
        
        CouponServiceImpl service = CouponServiceImpl.getService();

        
      /*  List<CouponVO> userCoupons = (List<CouponVO>) service.getCouponByUserId(users_no);*/
        List<CouponVO> userCoupons = service.getCouponsByUserId(userId);
        // 원하는 내용만 포함된 쿠폰 리스트 생성
        List<CouponVO> filteredList = new ArrayList<>();

        for (CouponVO vo : userCoupons) {
            CouponVO filteredCoupon = new CouponVO();
            filteredCoupon.setCp_no(vo.getCp_no());
            filteredCoupon.setCp_name(vo.getCp_name());
            filteredCoupon.setCp_con(vo.getCp_con());
            filteredCoupon.setCp_edate(vo.getCp_edate());
            // 필요한 다른 정보도 필터링해서 추가하면 됩니다.

            filteredList.add(filteredCoupon);
        }
        
        System.out.println(filteredList);

        request.setAttribute("userCoupons", filteredList);

        request.getRequestDispatcher("/Mproject/jsp/Mycoupon.jsp").forward(request, response);
    }
}

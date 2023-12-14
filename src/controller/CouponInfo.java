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

import org.apache.ibatis.session.SqlSession;

import service.CouponServiceImpl;
import util.MybatisUtil;
import vo.CouponVO;

@WebServlet("/couponInfo.do")
public class CouponInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");

	    CouponServiceImpl service = CouponServiceImpl.getService();
	    List<CouponVO> list = service.getAllCoupon();

	    // 원하는 내용만 포함된 쿠폰 리스트 생성
	    List<CouponVO> filteredList = new ArrayList<>();
	   
	      for (CouponVO vo : list) {
	        CouponVO filteredCoupon = new CouponVO();
	        filteredCoupon.setCp_no(vo.getCp_no());
	        filteredCoupon.setCp_name(vo.getCp_name());
	        filteredCoupon.setCp_con(vo.getCp_con());
	        filteredCoupon.setCp_edate(vo.getCp_edate());
	        // 필요한 다른 정보도 필터링해서 추가하면 됩니다.
	        
	        filteredList.add(filteredCoupon);
	    }
	      

	    request.setAttribute("cplist", filteredList);

	    request.getRequestDispatcher("/Mproject/jsp/coupon.jsp").forward(request, response);
	}


	

}
package dao;

import java.util.List;

import vo.CouponUseVO;
import vo.CouponVO;
import vo.MemberVO;

public interface ICouponDao {


    public List<CouponVO> getAllCoupon();		//모든 쿠폰 보여줌
    
    public int insertCoupon(CouponVO vo);		// 쿠폰 등록

    public List<CouponVO> getCouponsByUserId(String users_id);
      
    public int insertCouponUse(CouponUseVO vo);
    
    public MemberVO getUserInfo(String users_id);
}

package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MybatisUtil;
import vo.CouponUseVO;
import vo.CouponVO;
import vo.MemberVO;

public class CouponDaoImpl implements ICouponDao {

    private static CouponDaoImpl dao;

    private CouponDaoImpl() {
    }

    public static CouponDaoImpl getDao() {
        if (dao == null)
            dao = new CouponDaoImpl();
        return dao;
    }


    @Override
    public List<CouponVO> getAllCoupon() {
        SqlSession session = null;
        List<CouponVO> list = null;

        try {
            session = MybatisUtil.getSqlSession();
            list = session.selectList("coupon.getAllCoupon");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null)
                session.close();
        }

        return list;
    }

    
    
    
	@Override
	public int insertCoupon(CouponVO vo) {
	    SqlSession session = null;
	    int result = 0;

	    try {
	        session = MybatisUtil.getSqlSession();
	        result = session.insert("coupon.insertCoupon", vo);
	        session.commit();
	    } catch (Exception e) {
	        e.printStackTrace();
	        if (session != null) {
	            session.rollback();
	        }
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }

	    return result;
	}
	
	
	
	



	@Override
	public int insertCouponUse(CouponUseVO vo) {
		
		 SqlSession session = null;
		    int result = 0;

		    try {
		        session = MybatisUtil.getSqlSession();
		        result = session.insert("coupon.insertCouponUse", vo);
		        session.commit();
		    } catch (Exception e) {
		        e.printStackTrace();
		        if (session != null) {
		            session.rollback();
		        }
		    } finally {
		        if (session != null) {
		            session.close();
		        }
		    }

		    return result;
	}

	
	
	@Override
	public List<CouponVO> getCouponsByUserId(String users_id) {
	    SqlSession session = null;
	    List<CouponVO> coupons = new ArrayList<>();

	    try {
	        session = MybatisUtil.getSqlSession();
	        coupons = session.selectList("coupon.getCouponByUserId", users_id);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }

	    return coupons;
	}

	@Override
	public MemberVO getUserInfo(String users_id) {
		SqlSession session = null;
	    MemberVO vo = new MemberVO();

	    try {
	        session = MybatisUtil.getSqlSession();
	        vo = session.selectOne("coupon.getUserInfo", users_id);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }

	    return vo;
	}

	
	
	
	
//    @Override
//    public List<CouponVO> getCouponbyId(String cpNo) {
//        SqlSession session = null;
//        List<CouponVO> couponList = null;
//
//        try {
//            session = MybatisUtil.getSqlSession();
//            couponList = session.selectList("coupon.getCouponbyall", cpNo);
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (session != null)
//                session.close();
//        }
//
//        return couponList;
//    }
//


//    @Override
//    public int insertCoupon(CouponVO couponVO) {
//        SqlSession session = null;
//        int result = 0;
//
//        try {
//            session = MybatisUtil.getSqlSession();
//            result = session.insert("coupon.insertCoupon", couponVO);
//            session.commit();
//        } catch (Exception e) {
//            e.printStackTrace();
//            if (session != null) {
//                session.rollback();
//            }
//        } finally {
//            if (session != null) {
//                session.close();
//            }
//        }
//
//        return result;
//    }


 

}

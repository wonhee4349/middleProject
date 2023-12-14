package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.CouponDaoImpl;
import dao.ICouponDao;
import util.MybatisUtil;
import vo.CouponUseVO;
import vo.CouponVO;
import vo.MemberVO;

public class CouponServiceImpl implements ICouponService {

	private ICouponDao dao;
	
	private CouponServiceImpl() {
		dao = CouponDaoImpl.getDao();
	}
	
	private static CouponServiceImpl service;
	
	public static CouponServiceImpl getService() {
		if(service == null) service = new CouponServiceImpl();
		return service;
	}

	@Override
	public List<CouponVO> getAllCoupon() {
	    return dao.getAllCoupon(); 
	}

	@Override
	public int insertCoupon(CouponVO vo) {
	    return dao.insertCoupon(vo); 
	}


	@Override
	public int insertCouponUse(CouponUseVO vo) {
		
		return dao.insertCouponUse(vo);
	}

	@Override
	public List<CouponVO> getCouponsByUserId(String users_id) {
		// TODO Auto-generated method stub
		return dao.getCouponsByUserId(users_id);
	}

	@Override
	public MemberVO getUserInfo(String users_id) {
		return dao.getUserInfo(users_id);
	}

	
	



	
	
}

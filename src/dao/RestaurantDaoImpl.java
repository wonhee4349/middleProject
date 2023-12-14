package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisUtil;
import vo.RestaurantVO;
import vo.TourismVO;

public class RestaurantDaoImpl implements IRestaurantDao{
	
	private static IRestaurantDao dao;
	
	private RestaurantDaoImpl() {}
	
	public static IRestaurantDao getInstance() {
		if(dao==null) dao = new RestaurantDaoImpl();
		return dao;
	}

	@Override
	public List<RestaurantVO> getAllRestaurant() {

		SqlSession session = null;
		List<RestaurantVO> list = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("restaurant.getAllRestaurant");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return list;
	}

	@Override
	public RestaurantVO restaurantDetails(String no) {
		
		SqlSession session = null;
		RestaurantVO vo = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			vo = session.selectOne("restaurant.restaurantDetails", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return vo;
	}

	@Override
	public int restaruantDelete(String no) {
		
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("restaurant.restaruantDelete", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session!=null) session.close();
		}
		
		return cnt;
	}


	@Override
	public int getListCount(Map<String, String> map) {
		
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.selectOne("restaurant.getListCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return cnt;
	}

	@Override
	public List<RestaurantVO> selectByPage(Map<String, String> map) {

		SqlSession session = null;
		List<RestaurantVO> list = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("restaurant.selectByPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int restaruantUpdate(RestaurantVO vo) {

		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("restaurant.restaruantUpdate", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session!=null) session.close();
		}
		
		return cnt;
	}

	@Override
	public RestaurantVO selectById(String rsNo) {

		SqlSession session = null;
		RestaurantVO vo = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			vo = session.selectOne("restaurant.selectById", rsNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return vo;
	}

	@Override
	public int insertRestaurant(RestaurantVO vo) {

		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("restaurant.insertRestaurant", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session!=null) session.close();
		}
		
		return cnt;
	}

	@Override
	public int updateHit(String rsNo) {

		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("restaurant.updateHit", rsNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session!=null) session.close();
		}
		
		return cnt;
	}

	@Override
	public int updateGood(String rsNo) {
		
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("restaurant.updateGood", rsNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session!=null) session.close();
		}
		
		return cnt;
	}

	@Override
	public int updateBad(String rsNo) {

		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("restaurant.updateBad", rsNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session!=null) session.close();
		}
		
		return cnt;
	}


}

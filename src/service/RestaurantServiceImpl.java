package service;

import java.util.List;
import java.util.Map;

import dao.IRestaurantDao;
import dao.RestaurantDaoImpl;
import vo.RestaurantVO;

public class RestaurantServiceImpl implements IRestaurantService{
	
	private IRestaurantDao dao;
	
	private RestaurantServiceImpl() {
		dao = RestaurantDaoImpl.getInstance();
	}
	
	private static IRestaurantService service;
	
	public static IRestaurantService getInstance() {
		if(service==null) service = new RestaurantServiceImpl();
		return service;
	}

	@Override
	public List<RestaurantVO> getAllRestaurant() {
		return dao.getAllRestaurant();
	}	

	@Override
	public RestaurantVO restaurantDetails(String no) {
		return dao.restaurantDetails(no);
	}

	@Override
	public int restaruantDelete(String no) {
		return dao.restaruantDelete(no);
	}

	@Override
	public int getListCount(Map<String, String> map) {
		return dao.getListCount(map);
	}

	@Override
	public List<RestaurantVO> selectByPage(Map<String, String> map) {
		return dao.selectByPage(map);
	}

	@Override
	public int restaruantUpdate(RestaurantVO vo) {		
		return dao.restaruantUpdate(vo);
	}

	@Override
	public RestaurantVO selectById(String rsNo) {
		return dao.selectById(rsNo);
	}

	@Override
	public int insertRestaurant(RestaurantVO vo) {
		return dao.insertRestaurant(vo);
	}

	@Override
	public int updateHit(String rsNo) {
		return dao.updateHit(rsNo);
	}

	@Override
	public int updateGood(String rsNo) {
		return dao.updateGood(rsNo);
	}

	@Override
	public int updateBad(String rsNo) {
		return dao.updateBad(rsNo);
	}


}

package service;

import java.util.List;
import java.util.Map;

import vo.RestaurantVO;
import vo.TourismVO;

public interface IRestaurantService {
	
	public List<RestaurantVO> getAllRestaurant();
	
	public RestaurantVO restaurantDetails(String no);
	
	public int restaruantDelete(String no);
	
	public int restaruantUpdate(RestaurantVO vo);
	
	public int getListCount(Map<String, String> map);
	
	public List<RestaurantVO> selectByPage(Map<String, String> map);
	
	public RestaurantVO selectById(String rsNo);
	
	public int insertRestaurant(RestaurantVO vo);
	
	public int updateHit(String rsNo);
	
	public int updateGood(String rsNo);
	
	public int updateBad(String rsNo);

}

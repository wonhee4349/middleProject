package dao;

import java.util.List;
import java.util.Map;

import vo.CommunityVO;
import vo.TourismVO;



public interface ICommunityDAO {

	public List<CommunityVO> getAllCommunity();
	
	public int totalCount(Map<String, Object> map);
	
	public List<CommunityVO> selectByPage(Map<String, Object> map);
	
	public CommunityVO listDetail(String no);
	
	public int listDelete(String no);
	
	public int listUpdate(CommunityVO vo);
	
	public int listInsert(CommunityVO vo);
	
	public int updateHit(String cmtNo);
	
	public List<CommunityVO> selectByUserPage(Map<String, Object> map);
	
	public int getListCount(Map<String, String> map);

	
}

package service;

import java.util.List;
import java.util.Map;


import vo.ComPageVO;
import vo.CommunityVO;

public interface ICommunityService {

	public List<CommunityVO> getAllCommunity();
	
	public int totalCount(Map<String, Object> map);
	
	public List<CommunityVO> selectByPage(Map<String, Object> map);
	
	public CommunityVO listDetail(String no);
	
	public int listDelete(String no);
	
	public int listUpdate(CommunityVO vo);
	
	public int listInsert(CommunityVO vo);
	
	//페이지별 정보구하기 - 페이지 처리 
	public ComPageVO  pageInfo(int page, String stype, String sword);
	
	public int updateHit(String cmtNo);
	
	public List<CommunityVO> selectByUserPage(Map<String, Object> map);
	
	public int getListCount(Map<String, String> map);
		
}

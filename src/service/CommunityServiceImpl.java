package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.CommunityDaoImpl;
import dao.ICommunityDAO;
import vo.ComPageVO;
import vo.CommunityVO;

public class CommunityServiceImpl implements ICommunityService {
	
	private static CommunityServiceImpl service;
	private CommunityServiceImpl() {}
	
	public static CommunityServiceImpl getInstance() {
		if(service == null) service = new CommunityServiceImpl();
		return service;
	}
	
	ICommunityDAO dao = CommunityDaoImpl.getInstance();
	
	@Override
	public List<CommunityVO> getAllCommunity() {
		// TODO Auto-generated method stub
		return dao.getAllCommunity();
	}

	

	@Override
	public List<CommunityVO> selectByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectByPage(map);
	}

	@Override
	public CommunityVO listDetail(String no) {
		// TODO Auto-generated method stub
		return dao.listDetail(no);
	}

	@Override
	public int listDelete(String no) {
		// TODO Auto-generated method stub
		return dao.listDelete(no);
	}

	@Override
	public int listUpdate(CommunityVO vo) {
		// TODO Auto-generated method stub
		return dao.listUpdate(vo);
	}

	@Override
	public int listInsert(CommunityVO vo) {
		// TODO Auto-generated method stub
		return dao.listInsert(vo);
	}

	@Override
	public ComPageVO pageInfo(int page, String stype, String sword) {
		//전체글갯수 구하기 
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("stype", stype);
				map.put("sword", sword);
				
				int count = this.totalCount(map);
				
				
				//전체페이지수 구하기
				int perList = ComPageVO.getPerList();
				int totalPage = (int) Math.ceil(count / (double)perList); 
				
				//start, end 구하기   19 21
				int start = (page -1) * perList + 1;
				int end = start + perList -1;
				if(end > count) end = count;
				
				//시작페이지끝페이지 
				int perPage = ComPageVO.getPerPage();
				int startPage = ((page-1) / perPage * perPage) + 1;
				int endPage = startPage + perPage -1;
				
				ComPageVO  vo = new ComPageVO();
				vo.setStart(start);
				vo.setEnd(end);
				vo.setStartPage(startPage);
				vo.setEndPage(endPage);
				vo.setTotalPage(totalPage);
				
				
				return vo;
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.totalCount(map);
	}

	@Override
	public int updateHit(String cmtNo) {
		// TODO Auto-generated method stub
		return dao.updateHit(cmtNo);
	}

	@Override
	public List<CommunityVO> selectByUserPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectByUserPage(map);
	}

	@Override
	public int getListCount(Map<String, String> map) {
		return dao.getListCount(map);
	}


}

package util;

import java.util.HashMap;
import java.util.Map;

import dao.IRestaurantDao;
import dao.RestaurantDaoImpl;
import service.IRestaurantService;
import vo.PageVO;

public class PageInfoRS {
	public static PageVO pageInfo(int currentPage, String sword) {
		
		IRestaurantDao dao = RestaurantDaoImpl.getInstance();
		Map<String, String> map = new HashMap<String, String>();
		map.put("sword", sword);
		
		int totalList = dao.getListCount(map);
		int perList = 6;
		PageVO pvo = new PageVO(totalList, perList);
		
		pvo.setBlockSize(5);
		
		pvo.setCurrentBlock((int)(Math.ceil(currentPage*1.0/pvo.getBlockSize())));
		
		pvo.setStartPage((pvo.getCurrentBlock()-1)*pvo.getBlockSize()+1);
		pvo.setEndPage(pvo.getStartPage()+pvo.getBlockSize()-1);
		if(pvo.getEndPage()>pvo.getTotalPage()) pvo.setEndPage(pvo.getTotalPage());
		
		pvo.setStartIndex((currentPage-1)*pvo.getPerList()+1);
		pvo.setEndIndex(pvo.getStartIndex()+pvo.getPerList()-1);
		if(pvo.getEndIndex()>pvo.getTotalList()) pvo.setEndIndex(pvo.getTotalList());
		
		return pvo;
	}

}

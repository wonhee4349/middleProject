package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.NoticeDaoImpl;
import vo.NoticeVO;



public class NoticeServiceImpl implements INoticeService {
	
	//싱글톤 
	private static NoticeServiceImpl service;
	private NoticeDaoImpl dao;
	
	private NoticeServiceImpl() {
		dao= NoticeDaoImpl.getInstance();
	}
	
	public static NoticeServiceImpl getInstance() {
		if(service==null)service = new NoticeServiceImpl();
		return service;
	}

	@Override
	public List<NoticeVO> noticeAll() {
		
		return dao.noticeAll();
	}

	@Override
	public NoticeVO noticeDetail(String num) {
		
		return dao.noticeDetail(num);
	}

	@Override
	public int insertNot(NoticeVO vo) {
		
		return dao.insertNot(vo);
	}

	@Override
	public int updateNot(NoticeVO vo) {
		
		return dao.updateNot(vo);
	}

	@Override
	public int deleteNot(String num) {
		
		return dao.deleteNot(num);
	}

	

	

	




}

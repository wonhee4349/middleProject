package service;

import java.util.List;

import dao.ChatDaoImpl;
import dao.IChatDao;
import vo.ChatVO;



public class ChatServiceImpl implements IChatService{
	
	private static ChatServiceImpl service;
	
	private IChatDao dao;
	
	private ChatServiceImpl() {
		dao = ChatDaoImpl.getInstance();
	}
	public static ChatServiceImpl getInstance() {
		if(service==null) service = new ChatServiceImpl();
		
		return service;
	}
	
	
	@Override
	public List<ChatVO> selectByCHAT() {

		return dao.selectByCHAT();
	}
	
}

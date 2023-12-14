package service;

import java.util.List;
import java.util.Map;

import dao.ChatMGDaoImpl;
import dao.IChatMGDao;
import vo.ChatVO;

public class ChatMGServiceImpl implements IChatMGService{

	private static ChatMGServiceImpl service;
	private ChatMGServiceImpl() {}
	public static ChatMGServiceImpl getInstance() {
		if(service==null) service=new ChatMGServiceImpl();
		return service;
	}
	
	IChatMGDao dao = ChatMGDaoImpl.getInstance();
	
	
	@Override
	public List<ChatVO> chatAllList(String sword) {
		// TODO Auto-generated method stub
		return dao.chatAllList(sword);
	}

	@Override
	public int chatListCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.chatListCount(map);
	}

	@Override
	public List<ChatVO> chatSelectByPage(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.chatSelectByPage(map);
	}

	@Override
	public ChatVO chatSelectById(String cbNo) {
		// TODO Auto-generated method stub
		return dao.chatSelectById(cbNo);
	}

	@Override
	public int chatDelete(String cbNo) {
		// TODO Auto-generated method stub
		return dao.chatDelete(cbNo);
	}

	@Override
	public int chatInsert(ChatVO vo) {
		// TODO Auto-generated method stub
		return dao.chatInsert(vo);
	}

}

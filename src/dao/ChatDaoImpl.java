package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MybatisUtil;
import vo.ChatVO;


public class ChatDaoImpl implements IChatDao {

	private static ChatDaoImpl dao;
	
	private ChatDaoImpl() {}
	
	public static ChatDaoImpl getInstance() {
		if(dao==null) dao = new ChatDaoImpl();
		
		return dao;
	}
	
	@Override
	public List<ChatVO> selectByCHAT() {
		SqlSession session = null;
		
		List<ChatVO> chat = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			chat = session.selectList("chat.selectByCHAT");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!= null) session.close();
		}
		return chat;
	}
	
	
}

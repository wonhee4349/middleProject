package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisUtil;
import vo.ChatVO;

public class ChatMGDaoImpl implements IChatMGDao{
	private static ChatMGDaoImpl dao;
	private ChatMGDaoImpl() {}
	
	public static ChatMGDaoImpl getInstance() {
		if(dao==null) dao=new ChatMGDaoImpl();
		return dao;
	}

	@Override
	public List<ChatVO> chatAllList(String sword) {
		SqlSession session = null;
		List<ChatVO> list= null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("chat.chatAllList",sword);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int chatListCount(Map<String, String> map) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.selectOne("chat.chatListCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<ChatVO> chatSelectByPage(Map<String, String> map) {
		SqlSession session = null;
		List<ChatVO> list = null;
		
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("chat.chatSelectByPage",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public ChatVO chatSelectById(String cbNo) {
		ChatVO vo = new ChatVO();
		SqlSession session = null;
		
		
		try {
			session = MybatisUtil.getSqlSession();
			vo = session.selectOne("chat.chatSelectById",cbNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return vo;
	}

	@Override
	public int chatDelete(String cbNo) {
		int cnt = 0;
		SqlSession session = null;
		
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("chat.chatDelete",cbNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int chatInsert(ChatVO vo) {
		int cnt = 0;
		SqlSession session = null;
		
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("chat.chatInsert",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}
}

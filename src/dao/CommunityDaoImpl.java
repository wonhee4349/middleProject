package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisUtil;
import vo.CommunityVO;



public class CommunityDaoImpl implements ICommunityDAO {
	
	private static ICommunityDAO dao;
	
	private CommunityDaoImpl() {}
	
	public static ICommunityDAO getInstance() {
		if(dao == null) dao = new CommunityDaoImpl();
		return dao;
	}

	@Override
	public List<CommunityVO> getAllCommunity() {
		SqlSession session = null;
		List<CommunityVO> list = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("community.getAllCommunity");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.selectOne("community.totalCount", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return cnt;
	}

	@Override
	public List<CommunityVO> selectByPage(Map<String, Object> map) {
		SqlSession session = null;
		List<CommunityVO> list = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("community.selectByPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	@Override
	public CommunityVO listDetail(String no) {
		SqlSession session = null;
		CommunityVO vo = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			vo = session.selectOne("community.listDetail", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return vo;
	}

	@Override
	public int listDelete(String no) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("community.listDelete", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session != null) session.close();
		}
		return cnt;
	}

	@Override
	public int listUpdate(CommunityVO vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("community.listUpdate", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session != null) session.close();
		}
		return cnt;
	}

	@Override
	public int listInsert(CommunityVO vo) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			res = session.insert("community.listInsert", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session != null) session.close();
		}	
		return res;
	}

	@Override
	public int updateHit(String cmtNo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("community.updateHit", cmtNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session != null) session.close();
		}
		return cnt;
	}

	@Override
	public List<CommunityVO> selectByUserPage(Map<String, Object> map) {
		SqlSession session = null;
		List<CommunityVO> list = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("community.selectByUserPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	@Override
	public int getListCount(Map<String, String> map) {
		SqlSession session = null;
		int cnt=0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.selectOne("community.getListCount",map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return cnt;
	}

	

	

}

package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisUtil;
import vo.CommunityVO;
import vo.MypageVO;



public class MypageDaoImpl implements IMypageDAO {
	
	private static IMypageDAO dao;
	
	private MypageDaoImpl() {}
	
	public static IMypageDAO getInstance() {
		if(dao == null) dao = new MypageDaoImpl();
		return dao;
	}


	@Override
	public MypageVO memberList(String no) {
		SqlSession session = null;
		MypageVO vo = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			vo = session.selectOne("mypage.memberList", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return vo;
	}

	@Override
	public int memberUpdate(MypageVO vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("mypage.memberUpdate", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session != null) session.close();
		}
		return cnt;
	}

	@Override
	public int memberDelete(String no) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("mypage.memberDelete", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session != null) session.close();
		}
		return cnt;
	}

}

package dao;

import org.apache.ibatis.session.SqlSession;

import util.MybatisUtil;
import vo.ManagerVO;
import vo.MemberVO;

public class ManagerDaoImpl implements IManagerDao{
	
	//싱글톤 
	private static ManagerDaoImpl dao;
	private ManagerDaoImpl() {}
	public static ManagerDaoImpl getInstance() {
		if(dao==null)dao= new ManagerDaoImpl();
		return dao;
	}

	//로그인
	@Override
	public ManagerVO loginMg(ManagerVO vo) {
		SqlSession session =null;
		ManagerVO login= null;
		
		try {
			session= MybatisUtil.getSqlSession();
			login=session.selectOne("manager.loginMg",vo);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return login;
	}

	//아이디 찾기
	@Override
	public ManagerVO findIdMg(ManagerVO vo) {
		SqlSession session = null;
		ManagerVO findId = null;
		
		try {
			session= MybatisUtil.getSqlSession();
			findId = session.selectOne("manager.findIdMg",vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return findId;
	}

	//비밀번호 찾기
	@Override
	public ManagerVO findPwMg(ManagerVO vo) {
		SqlSession session =null;
		ManagerVO findPw=null;
		
		try {
			session = MybatisUtil.getSqlSession();
			findPw=session.selectOne("manager.findPwMg",vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return findPw;
	}

	//비밀번호 랜덤 업데이트 
	@Override
	public int randomPw(ManagerVO vo) {
		SqlSession session = null;
		int randPw= 0;
		
		try {
			session =MybatisUtil.getSqlSession();
			randPw= session.update("manager.findPwMg",vo);
			if(randPw>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return randPw;
	}
	

}

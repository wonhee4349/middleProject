package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisUtil;
import vo.MemberVO;



public class MemberDaoImpl implements IMemberDao{
	//싱글톤
	private static MemberDaoImpl dao;
	
	private MemberDaoImpl() {}
	
	public static MemberDaoImpl getInstance() {
		if(dao==null) dao = new MemberDaoImpl();
		return dao;
	}
	

	@Override
	public int insertMember(MemberVO vo) {
		SqlSession session=null;
		int cnt = 0;
		
		try {
			session= MybatisUtil.getSqlSession();
			cnt =session.insert("member.insertMember",vo);
			
			if(cnt>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}		
		return cnt;
	}

	@Override
	public String selectById(String mid) {
		SqlSession session = null;
		String id = null;
		try {
			session= MybatisUtil.getSqlSession();
			id=session.selectOne("member.selectById",mid);
			
		} catch (Exception e) {
			
		}finally {
			if(session!=null) session.close();
		}
			
		return id;
	}

	//로그인
	@Override
	public MemberVO loginMem(MemberVO vo) {
		SqlSession session =null;
		MemberVO login= null;
		
		try {
			session= MybatisUtil.getSqlSession();
			login=session.selectOne("member.loginMem",vo);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return login;
	}
	
	//아이디 찾기
	@Override
	public MemberVO findIdMem(MemberVO vo) {
		SqlSession session = null;
		MemberVO findId = null;
		
		try {
			session= MybatisUtil.getSqlSession();
			findId = session.selectOne("member.findIdMem",vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return findId;
	}

	//비밀번호 찾기
	@Override
	public MemberVO findPwMem(MemberVO vo) {
		SqlSession session =null;
		MemberVO findPw=null;
		
		try {
			session = MybatisUtil.getSqlSession();
			findPw=session.selectOne("member.findPwMem",vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return findPw;
	}

	//비밀번호 랜덤 업데이트
	@Override
	public int randomPw(MemberVO vo) {
		SqlSession session = null;
		int randPw= 0;
		
		try {
			session =MybatisUtil.getSqlSession();
			randPw= session.update("member.randomPw",vo);
			if(randPw>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return randPw;
	}

	@Override
	public int getListCount(Map<String, String> map) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.selectOne("member.getListCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return cnt;
	}

	@Override
	public List<MemberVO> selectByPage(Map<String, String> map) {
		
		SqlSession session = null;
		List<MemberVO> list = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("member.selectByPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return list;
	}

	@Override
	public MemberVO selectByNo(String usersNo) {
		
		SqlSession session = null;
		MemberVO vo = new MemberVO();
		
		try {
			session = MybatisUtil.getSqlSession();
			vo = session.selectOne("member.selectByNo", usersNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return vo;
	}

	@Override
	public int deleteUsers(String usersNo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("member.deleteUsers", usersNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session!=null) session.close();
		}
		
		return cnt;
	}
	
	

}

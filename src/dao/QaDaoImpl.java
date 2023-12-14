package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MybatisUtil;
import vo.MemberVO;
import vo.NoticeVO;
import vo.QaVO;

public class QaDaoImpl implements IQaDao {

	private static IQaDao dao;
	private  QaDaoImpl() {}
	
	public static IQaDao getDao() {
		if (dao == null) dao = new QaDaoImpl();
		return dao;
	}
	 
	
	@Override
	public List<QaVO> getAllQa() {
		SqlSession session = null;
		List<QaVO> list = null;
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("qa.getAllQa");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	@Override
	public int listDelete(String no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int listUpdate(QaVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int listInsert(QaVO vo) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			res = session.insert("qa.insertQA", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session != null) session.close();
		}	
		return res;
	}

	
	@Override
	public QaVO qaDetail(String num) {
		SqlSession session =null;
		QaVO vo = null;
		
		try {
			session =MybatisUtil.getSqlSession();
			vo =session.selectOne("qa.qaDetail",num);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			if(session!=null) {
				session.close();
			}
		}
		return vo;
	}

	@Override
	public MemberVO getUserInfo(String users_id) {
		SqlSession session = null;
	    MemberVO vo = new MemberVO();

	    try {
	        session = MybatisUtil.getSqlSession();
	        vo = session.selectOne("qa.getUserInfo", users_id);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }

	    return vo;
	}
}




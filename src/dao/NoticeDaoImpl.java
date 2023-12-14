package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisUtil;
import vo.NoticeVO;





public class NoticeDaoImpl implements INoticeDao {
	//싱글톤 
	private static NoticeDaoImpl dao;
	
	private NoticeDaoImpl () {}
	
	public static NoticeDaoImpl getInstance() {
		if(dao==null) dao = new NoticeDaoImpl();
		return dao;
	}

	
	//공지사항 첫페이지 리스트
	@Override
	public List<NoticeVO> noticeAll() {
		SqlSession session = null;
		List<NoticeVO>list = null;
		try {
			session= MybatisUtil.getSqlSession();
			list = session.selectList("notice.noticeAll");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return list;
	}

	
	//공지사항 클릭시 상제정보
	@Override
	public NoticeVO noticeDetail(String notNum) {
		SqlSession session =null;
		NoticeVO vo= null;
		
		try {
			session =MybatisUtil.getSqlSession();
			vo =session.selectOne("notice.noticeDetail",notNum);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			if(session!=null) {
				session.close();
			}
		}
		return vo;
	}

	
	//공지사항 등록
	@Override
	public int insertNot(NoticeVO vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session=MybatisUtil.getSqlSession();
			cnt= session.insert("notice.insertNot",vo);
			
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
	public int updateNot(NoticeVO vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session=MybatisUtil.getSqlSession();
			cnt= session.update("notice.updateNot",vo);
			
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
	public int deleteNot(String num) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session=MybatisUtil.getSqlSession();
			cnt= session.update("notice.deleteNot",num);
			
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

	

	

}

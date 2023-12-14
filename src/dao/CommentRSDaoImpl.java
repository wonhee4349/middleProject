package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import service.CommentServiceImpl;
import util.MybatisUtil;
import vo.CommentVO;


public class CommentRSDaoImpl implements ICommentRSDao{

	private static CommentRSDaoImpl dao;
	
	private CommentRSDaoImpl() {}
	
	public static CommentRSDaoImpl getInstance() {
		if(dao==null) dao = new CommentRSDaoImpl();
		return dao;
	}

	@Override
	public List<CommentVO> getCommentList(String nt_no) {
		
		SqlSession session = null;
		List<CommentVO> list = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("commentRS.getCommentList", nt_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int insertComment(CommentVO vo) {

		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("commentRS.insertComment",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	@Override
	public String getUserName(String users_no) {

		SqlSession session = null;
		String userName = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			userName = session.selectOne("commentRS.getUserName",users_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return userName;
	}

	@Override
	public int deleteComment(String cm_no) {

		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("commentRS.deleteComment",cm_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}
	
}

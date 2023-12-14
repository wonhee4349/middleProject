package service;

import java.util.List;

import dao.CommentCMTDaoImpl;
import dao.ICommentCMTDao;
import vo.CommentVO;

public class CommentCMTServiceImpl implements ICommentCMTService {
	
	private CommentCMTDaoImpl dao;
	
	private CommentCMTServiceImpl() {
		dao = CommentCMTDaoImpl.getInstance();
	}
	
	private static ICommentCMTService service;
	
	public static ICommentCMTService getInstance() {
		if (service == null) service = new CommentCMTServiceImpl();
		return service;
	}

	@Override
	public List<CommentVO> getCommentList(String nt_no) {
		return dao.getCommentList(nt_no);
	}

	@Override
	public int insertComment(CommentVO vo) {
		return dao.insertComment(vo);
	}

	@Override
	public String getUserName(String users_no) {
		return dao.getUserName(users_no);
	}

	@Override
	public int deleteComment(String cm_no) {
		return dao.deleteComment(cm_no);
	}
	
	

}

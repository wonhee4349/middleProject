package service;

import java.util.List;

import dao.CommentRSDaoImpl;
import dao.ICommentRSDao;
import vo.CommentVO;

public class CommentRSServiceImpl implements ICommentRSService {
	
	private ICommentRSDao dao;
	
	private CommentRSServiceImpl() {
		dao = CommentRSDaoImpl.getInstance();
	}
	
	private static ICommentRSService service;
	
	public static ICommentRSService getInstance() {
		if(service==null) service = new CommentRSServiceImpl();
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

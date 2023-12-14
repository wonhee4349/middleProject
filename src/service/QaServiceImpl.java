package service;

import java.util.List;

import dao.IQaDao;
import dao.QaDaoImpl;
import vo.MemberVO;
import vo.QaVO;

public class QaServiceImpl implements IQaService {


	private IQaDao dao;
	private QaServiceImpl() {
		dao= QaDaoImpl.getDao();
	}
	
	private static QaServiceImpl service;
	
	public static QaServiceImpl getService() {
		if(service == null) service = new QaServiceImpl();
		return service;
	}
	
	
	
	
	@Override
	public List<QaVO> getAllQa() {
		
		return dao.getAllQa();
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
		
		return dao.listInsert(vo);
	}




	@Override
	public QaVO qaDetail(String num) {
		return dao.qaDetail(num);
	}




	@Override
	public MemberVO getUserInfo(String users_id) {
		// TODO Auto-generated method stub
		return dao.getUserInfo(users_id);
	}

}

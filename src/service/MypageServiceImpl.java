package service;

import java.util.List;
import java.util.Map;

import dao.IMypageDAO;
import dao.MypageDaoImpl;
import vo.CommunityVO;
import vo.MypageVO;



public class MypageServiceImpl implements IMypageService {
	
	private static MypageServiceImpl service;
	private MypageServiceImpl() {}
	
	public static MypageServiceImpl getInstance() {
		if(service == null) service = new MypageServiceImpl();
		return service;
	}
	
	IMypageDAO dao = MypageDaoImpl.getInstance();

	

	@Override
	public MypageVO memberList(String no) {
		// TODO Auto-generated method stub
		return dao.memberList(no);
	}

	@Override
	public int memberUpdate(MypageVO vo) {
		// TODO Auto-generated method stub
		return dao.memberUpdate(vo);
	}

	@Override
	public int memberDelete(String no) {
		// TODO Auto-generated method stub
		return dao.memberDelete(no);
	}

}

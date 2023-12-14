package service;

import java.util.List;
import java.util.Map;

import dao.MemberDaoImpl;
import vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	//싱글톤
	private static MemberServiceImpl service;
	private MemberDaoImpl dao;
	
	private  MemberServiceImpl() {
		dao=MemberDaoImpl.getInstance();
		
	}
	
public static MemberServiceImpl getInstance() {
		
		if(service== null) service= new  MemberServiceImpl();
		return service;
	}

	@Override
	public int insertMember(MemberVO vo) {
		
		return dao.insertMember(vo);
	}

	@Override
	public String selectById(String id) {
		
		return dao.selectById(id);
	}

	@Override
	public MemberVO loginMem(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.loginMem(vo);
	}

	@Override
	public MemberVO findIdMem(MemberVO vo) {
		
		return dao.findIdMem(vo);
	}

	@Override
	public MemberVO findPwMem(MemberVO vo) {
		
		return dao.findPwMem(vo);
	}

	@Override
	public int randomPw(MemberVO vo) {
		
		return dao.randomPw(vo);
	}

	@Override
	public int getListCount(Map<String, String> map) {
		return dao.getListCount(map);
	}

	@Override
	public List<MemberVO> selectByPage(Map<String, String> map) {
		return dao.selectByPage(map);
	}

	@Override
	public MemberVO selectByNo(String usersNo) {
		return dao.selectByNo(usersNo);
	}

	@Override
	public int deleteUsers(String usersNo) {
		return dao.deleteUsers(usersNo);
	}

}

package service;

import vo.ManagerVO;

public interface IManagerService {
	// 로그인
	public ManagerVO loginMg(ManagerVO vo);

	// 로그아웃

	// 아이디 찾기
	public ManagerVO findIdMg(ManagerVO vo);

	// 비밀번호 찾기
	public ManagerVO findPwMg(ManagerVO vo);

	// 비밀번호 랜덤 업데이트
	public int randomPw(ManagerVO vo);

}

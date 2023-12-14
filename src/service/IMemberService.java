package service;

import java.util.List;
import java.util.Map;

import vo.MemberVO;

public interface IMemberService {
		//회원가입
		public int insertMember(MemberVO vo);
		//중복검사?
		public String selectById(String id);
		
		//로그인
		public MemberVO loginMem(MemberVO vo);
		//로그아웃
		
		//아이디 찾기
		public MemberVO findIdMem(MemberVO vo);
		
		//비밀번호 찾기
		public MemberVO findPwMem(MemberVO vo);
		
		//비밀번호 랜덤 업데이트
		public int randomPw(MemberVO vo);
		
		//회원 리스트 출력
		public int getListCount(Map<String, String> map);
		
		//페이지별로 출력
		public List<MemberVO> selectByPage(Map<String, String> map);
		
		//회원 상세페이지
		public MemberVO selectByNo(String usersNo);
		
		//회원탈퇴
		public int deleteUsers(String usersNo);

}

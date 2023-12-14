package service;

import java.util.List;
import java.util.Map;

import vo.CommunityVO;
import vo.MypageVO;



public interface IMypageService {
	public MypageVO memberList(String no);
	
	public int memberUpdate(MypageVO vo);
	
	public int memberDelete(String no);
	
}

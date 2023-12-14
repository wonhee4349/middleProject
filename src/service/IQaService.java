package service;

import java.util.List;

import vo.MemberVO;
import vo.QaVO;

public interface IQaService {
	public List<QaVO> getAllQa();
	
	public int listDelete(String no);
	
	public int listUpdate(QaVO vo);
	
	public int listInsert(QaVO vo);
	
	public QaVO qaDetail(String num);
	
	 public MemberVO getUserInfo(String users_id);
}

package dao;

import java.util.List;

import vo.ChatVO;



public interface IChatDao {
	/**
	 * 
	 * DB의 전체 질문과 답변을 가져와서 List에 담아서 반환하는 메서드
	 * 
	 * @return ChatVO객체가 저장된 List객체
	 */
	
	public List<ChatVO> selectByCHAT();
}

package dao;

import java.util.List;
import java.util.Map;

import vo.ChatVO;

public interface IChatMGDao {
	
	public List<ChatVO> chatAllList(String sword);
	
	public int chatListCount(Map<String, String> map);
	
	public List<ChatVO> chatSelectByPage(Map<String, String> map);
	
	public ChatVO chatSelectById(String cbNo);
	
	public int chatDelete(String cbNo);
	
	public int chatInsert(ChatVO vo);
	
	
}

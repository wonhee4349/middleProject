package service;

import java.util.List;

import vo.NoticeVO;



public interface INoticeService {

	// 공지사항 첫페이지 리스트
	public List<NoticeVO> noticeAll();

	// 공지사항 클릭시 상세정보
	public NoticeVO noticeDetail(String num);

	// 공지사항 등록
	public int insertNot(NoticeVO vo);

	// 공지사항 수정
	public int updateNot(NoticeVO vo);

	// 공지사항 삭제
	public int deleteNot(String num);
	
	

}

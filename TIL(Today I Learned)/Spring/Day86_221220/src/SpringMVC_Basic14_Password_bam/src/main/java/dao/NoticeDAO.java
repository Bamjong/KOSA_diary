package dao;

import java.util.List;

import dto.Notice;

public interface NoticeDAO {
	public List<Notice> getNoticeList(int page, String field, String query);
	
	public Notice getNotice(String seq);
	
	public int insertNotice(Notice notice);
	
	public int insertMemberPoint(String userid);

	public int delete(String seq);
	
	public int update(Notice notice);
}

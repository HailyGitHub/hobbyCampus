package com.hobbycam.notice.model;

import java.util.List;

public interface NoticeDAO {

	
	public List getNoticeList(int cp, int listSize);
	public List getTeacherNoticeList(int cp, int listSize);
	public List getAllNoticeList(int cp, int listSize);
	public List noticeExposeList(int cp, int listSize); // Expose
	public int setNotice(NoticeDTO dto);
	public NoticeDTO getNoticeInfo(int idx);
	public int updateNotice(NoticeDTO dto);
	public int deleteNotice(NoticeDTO dto);
	public int getTotalCntA();	
	public int getTotalCntT();	
	public int getTotalCntS();	
	public int getTotalCntEx();	
	public NoticeDTO getNoticeExpose();
	
}
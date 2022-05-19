package com.hobbycam.teacher.model;

public interface TeacherDAO {
	
	public TeacherDTO teacherInfoForm(int t_idx);
	public boolean nameCheck(String t_name);
	public int teacherInfoUpdate(TeacherDTO dto);
	public int pointSelect(int t_idx);
	public boolean exchageUPoint(int t_idx, int exPoint);
	public boolean exchageCash(int t_idx, int exPoint);
	public void lessonExStateUpdate(int t_idx);
}

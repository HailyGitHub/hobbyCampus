package com.hobbycam.teacher.model;

public interface TeacherDAO {
	
	public TeacherDTO teacherInfoForm(int t_idx);
	public boolean nameCheck(String t_name);
	public int teacherInfoUpdate(TeacherDTO dto);
	public int pointSelect(int t_idx);
	public boolean updatePoint(int t_idx, int exPoint);
	public int payListInsert(int t_idx, int exPoint);
}

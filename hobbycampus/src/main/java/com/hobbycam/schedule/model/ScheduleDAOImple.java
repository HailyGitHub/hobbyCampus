package com.hobbycam.schedule.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ScheduleDAOImple implements ScheduleDAO {

	private SqlSessionTemplate sqlMap;

	public ScheduleDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List getscheduleList(int lesson_idx) {
		List list = sqlMap.selectList("selectScheduleInfoList", lesson_idx);
		return list;
	}
	
	@Override
	public int scheduleSubmit(ScheduleDTO dto) {
		int count = sqlMap.insert("insertScheduleList", dto);
		return count;
	}
	
	@Override
	public int scheduleDelete(int lesson_schedule_idx) {
		int count = sqlMap.delete("deleteScheduleInfo", lesson_schedule_idx);
		return count;
	}
	
	
}

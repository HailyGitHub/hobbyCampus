package com.hobbycam.schedule.model;

import java.util.List;

public interface ScheduleDAO {
	
	public List getscheduleList(int lesson_idx);
	public int scheduleSubmit(ScheduleDTO dto);
	public int scheduleDelete(int lesson_schedule_idx);
}

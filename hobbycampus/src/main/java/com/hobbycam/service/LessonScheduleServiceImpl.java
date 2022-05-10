package com.hobbycam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbycam.DAO.LessonScheduleDAO;
import com.hobbycam.VO.LessonScheduleVO;

@Service
public class LessonScheduleServiceImpl implements LessonScheduleService {

	@Autowired
	private LessonScheduleDAO lessonScheduleDAO;

	@Override
	public LessonScheduleVO getLessonSchedule(int lessonIdx) {
		return lessonScheduleDAO.getLessonSchedule(lessonIdx);
	}

}

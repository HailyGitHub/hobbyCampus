package com.hobbycam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbycam.DAO.LessonDAO;
import com.hobbycam.VO.LessonVO;

@Service
public class LessonServiceImpl implements LessonService {

	@Autowired
	private LessonDAO lessonDAO;

	@Override
	public LessonVO getLesson(int lessonIdx) {
		return lessonDAO.getLesson(lessonIdx);
	}

}

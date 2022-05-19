package com.hobbycam.teacher.model;

import java.util.Hashtable;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;

public class TeacherDAOImple implements TeacherDAO {
	
	SqlSessionTemplate sqlMap;

	public TeacherDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	/**Get teacher information by t_idx*/
	@Override
	public TeacherDTO teacherInfoForm(int t_idx) {
		TeacherDTO dto = sqlMap.selectOne("teacherSelect", t_idx);
		return dto;
	}

	/**Check for duplicate names*/
	@Override
	public boolean nameCheck(String t_name) {
		int result = sqlMap.selectOne("nameCheck", t_name);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}
	
	/**Update teacher information*/
	@Override
	public int teacherInfoUpdate(TeacherDTO dto) {
		int result = sqlMap.update("updateTeacher", dto);
		return result;
	}
	
	/**Select point by t_idx*/
	@Override
	public int pointSelect(int t_idx) {
		int result = sqlMap.selectOne("selectPoint",t_idx);
		return result;
	}
	
	/**insert payList */
	@Override
	public boolean exchageUPoint(int t_idx, int exPoint) {
		//update u_point
			Map map = new HashedMap();
		
			map.put("t_idx", t_idx);
			map.put("exPoint", exPoint);
			int tResult = sqlMap.update("plusUPoint", map);
			
		//update t_point
			int uResult = sqlMap.update("minusTPoint", map);
			
		//insert pay_list
			int pResult = sqlMap.insert("insertToPoint", map);
		if(tResult==1&&uResult==1&&pResult==1) {
			return true;
		}else {
			return false;
		}	
	}
	
	//
	@Override
	public void lessonExStateUpdate(int t_idx) {
		//update lesson exchange if more than 7 days have passed since class time 
		
		
		//and get the lesson_schedule_idx list updated 
		
		
		
		//sum lesson_price from the updated list(^)
		
		
		//plus point if lesson exchange state exchanged
		
	}
	
	//exchange t_point to cash
		@Override
		public boolean exchageCash(int t_idx, int exPoint) {
			Map map = new HashedMap();
			
			map.put("t_idx", t_idx);
			map.put("exPoint", exPoint);
			
			//update t_point
			int uResult = sqlMap.update("minusTPoint", map);
			
			//insert pay_list
			int pResult = sqlMap.update("insertToCash", map);
			
			if(uResult==1&&pResult==1) {
				return true;
			}else {
				return false;
			}	
		}

}

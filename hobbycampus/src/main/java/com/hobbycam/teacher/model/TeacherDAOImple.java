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
	public boolean updatePoint(int t_idx, int exPoint) {
		//update u_point
			//Map map = new HashedMap();
			Map map = new HashedMap();
		
			map.put("t_idx", t_idx);
			map.put("exPoint", exPoint);
			int tResult = sqlMap.update("updateUPoint", map);
			
		//update t_point
			int uResult = sqlMap.update("updateTPoint", map);
			
		//insert pay_list
			int pResult = sqlMap.insert("insertToPoint", t_idx);
		if(tResult==1&&uResult==1&&pResult==1) {
			return true;
		}else {
			return false;
		}	
	}

	@Override
	public int payListInsert(int t_idx, int exPoint) {
		// TODO Auto-generated method stub
		return 0;
	}
}

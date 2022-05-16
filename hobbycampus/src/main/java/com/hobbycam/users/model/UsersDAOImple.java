package com.hobbycam.users.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hobbycam.VO.UserVO;

public class UsersDAOImple implements UsersDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;

	public static final int NOT_ID=1;
	public static final int NOT_PWD=2;
	public static final int LOGIN_OK=3;
	public static final int ERROR=-1;
	public static final int DEL=-2;

	public UsersDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	

	/**email Join*/
	//email Check
	@Override
	public int usersEmailCheck(String email) {
		int result=sqlMap.selectOne("usersEmailCheck",email);
		
		return result;
	}

	//name Check
	@Override
	public int usersNameCheck(String name) {
		int result=sqlMap.selectOne("usersNameCheck",name);
		
		return result;
	}
	
	
	/**email Join*/
	@Override
	public int usersEmailJoin(UsersDTO dto) {
		int emailCheck=usersEmailCheck(dto.getU_email());
		int nameCheck=usersNameCheck(dto.getU_name());

		if(emailCheck==0&&nameCheck==0) {
			int count=sqlMap.insert("usersEmailJoin",dto);
			return count;
		} else {
			return -1;
		}
	}


	
	/**Login*/
	@Override
	public int usersLogin(String email, String pwd) {

		UsersDTO dto=sqlMap.selectOne("usersLogin",email);
		
		String u_pwd=dto.getU_pwd();
		String u_state=dto.getU_state();
		System.out.println("u_pwd="+u_pwd);
		System.out.println("u_state="+u_state);
		
		if(u_state.equals("탈퇴")) {
			return DEL;
		}
	
		if(u_pwd==null||u_pwd.equals("")){
			return NOT_ID;
		} else if(!u_pwd.equals(pwd)) {
			return NOT_PWD;
		} else if(u_pwd.equals(pwd)) {
			return LOGIN_OK;
		} else {
			return ERROR;
		}
	}
	
	
	public UsersDTO usersname(String email) {
		UsersDTO dto =sqlMap.selectOne("usersname",email);
		
		return dto;
	}
	
	//getusername
	@Override
	public Integer usersTidx(int idx){
		Integer u_tidx=sqlMap.selectOne("userTidx",idx); 
		
		return u_tidx;
	}
	
	@Override
	public UsersDTO userUpForm(int idx) {
		UsersDTO dto=sqlMap.selectOne("userUpForm",idx);
		return dto;
	}
	
	@Override
	public int userUp(UsersDTO dto) {
		int count=sqlMap.update("userUp",dto);
		return count;
	}
	
	@Override
	public int userDel(int idx) {
		int count=sqlMap.update("usersDel",idx);
		return count;
	}
	
	@Override
	public UserVO getUser(int uIdx) {
		return sqlMap.selectOne("getUser", uIdx);
	}

	@Override
	public int updateUPoint(int uIdx, int newUPoint) {
		Map<String, Object> map = new HashMap<>();
		map.put("uIdx", uIdx);
		map.put("newUPoint", newUPoint);
		return sqlMap.update("updateUPoint", map);
	}


	@Override
	public int addUPoint(int uIdx, int point) {
		Map<String, Object> map = new HashMap<>();
		map.put("uIdx", uIdx);
		map.put("point", point);
		return sqlMap.update("addUPoint", map);
	}
	}

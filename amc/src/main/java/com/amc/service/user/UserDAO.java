package com.amc.service.user;

import java.util.List;

import com.amc.common.Search;
import com.amc.service.domain.User;

public interface UserDAO {

	// 회원가입 INSERT
	public void addUser(User user) throws Exception;
	
	// 내정보확인 / 로그인 SELECT ONE
	public User getUser(String userId) throws Exception;
	
	// 회원정보리스트  SELECT LIST
	public List<User> getUserList(Search search) throws Exception;
	
	// 회원정보수정 UPDATE
	public void updateUser(User user) throws Exception;
	
	// 회원 id 찾기
	public User getId(User user) throws Exception;
	
	// phone 중복 찾기
	public String getPhone(User user) throws Exception;
			
	// 회원 탈퇴
	public void deleteUser(User user) throws Exception;
	
	// 게시판 Page 처리를 위한 전체Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;
	
	// 회원탈퇴 유저 확인
	public User deleteCheck(User user) throws Exception;
	
	public int updateUuid(User user);
		
}
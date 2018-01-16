package com.amc.service.user;

import java.io.IOException;
import java.util.Map;

import com.amc.common.Search;
import com.amc.service.domain.User;

public interface UserService {
	
	// 회원가입
	public void addUser(User user) throws Exception;
	
	// 내정보확인 / 로그인
	public User getUser(String userId) throws Exception;
	
	// 회원정보리스트 
	public Map<String, Object> getUserList(Search search) throws Exception;
	
	// 회원정보수정
	public void updateUser(User user) throws Exception;
	
	// 회원 탈퇴
	public void deleteUser(User user) throws Exception;

	// 회원 ID 찾기
	public User getId(User user) throws Exception;
	
	// phone 중복 찾기
	public String getPhone(User user) throws Exception;
	
	// 회원 ID 중복 확인	
	public boolean checkDuplication(String userId) throws Exception;
	
	public User checkUserId(String userId) throws Exception;	
	public boolean checkId(String userId) throws Exception;
	
	// 회원탈퇴 유저 확인
	public User deleteCheck(User user) throws Exception;
	
	//==> 회원관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
	public boolean send(String subject, String text, String from, String to, String filePath);
		 
	    /** 메일 전송
	     *  @param subject 제목
	     *  @param text 내용
	     *  @param from 보내는 메일 주소
	     *  @param to 받는 메일 주소
	     *  @param filePath 첨부 파일 경로: 첨부파일 없을시 null **/
	
	public String addUuid(String token, String userId) throws Exception;
}

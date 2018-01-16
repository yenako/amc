package com.amc.service.user;

import java.io.IOException;
import java.util.Map;

import com.amc.common.Search;
import com.amc.service.domain.User;

public interface UserService {
	
	// ȸ������
	public void addUser(User user) throws Exception;
	
	// ������Ȯ�� / �α���
	public User getUser(String userId) throws Exception;
	
	// ȸ����������Ʈ 
	public Map<String, Object> getUserList(Search search) throws Exception;
	
	// ȸ����������
	public void updateUser(User user) throws Exception;
	
	// ȸ�� Ż��
	public void deleteUser(User user) throws Exception;

	// ȸ�� ID ã��
	public User getId(User user) throws Exception;
	
	// phone �ߺ� ã��
	public String getPhone(User user) throws Exception;
	
	// ȸ�� ID �ߺ� Ȯ��	
	public boolean checkDuplication(String userId) throws Exception;
	
	public User checkUserId(String userId) throws Exception;	
	public boolean checkId(String userId) throws Exception;
	
	// ȸ��Ż�� ���� Ȯ��
	public User deleteCheck(User user) throws Exception;
	
	//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
	public boolean send(String subject, String text, String from, String to, String filePath);
		 
	    /** ���� ����
	     *  @param subject ����
	     *  @param text ����
	     *  @param from ������ ���� �ּ�
	     *  @param to �޴� ���� �ּ�
	     *  @param filePath ÷�� ���� ���: ÷������ ������ null **/
	
	public String addUuid(String token, String userId) throws Exception;
}

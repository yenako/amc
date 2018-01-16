package com.amc.service.user.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.amc.common.Search;
import com.amc.common.util.RestApiUtil;
import com.amc.service.domain.User;
import com.amc.service.user.UserService;



import com.amc.service.user.UserDAO;

//==> 회원관리 서비스 구현
@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	///Field
	@Autowired
	@Qualifier("userDAOImpl")
	private UserDAO userDAO;
	
	// org.springframework.mail.javamail.JavaMailSender
    private JavaMailSender javaMailSender;
    
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	
    public void setJavaMailSender(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

	@Override
	public void addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		userDAO.addUser(user);
	}

	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.getUser(userId);
	}

	@Override
	public Map<String , Object > getUserList(Search search) throws Exception {
		List<User> list= userDAO.getUserList(search);
		int totalCount = userDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		userDAO.updateUser(user);
	}

	@Override
	public boolean checkDuplication(String userId) throws Exception {
		// TODO Auto-generated method stub
		boolean result=true;
		System.out.println("+++++++++11userservuceImpl : " + userId);
		User user=userDAO.getUser(userId);
		System.out.println("+++++++++22userservuceImpl : " + user);
		if(user != null) {
			result=false;
			System.out.println("아이디가 디비에 존재합니다.");
		}
			
		return result;
	}
	
	@Override
	public User checkUserId(String userId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkId(String userId) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User getId(User user) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("여기는 serviceImpl : "+userDAO.getId(user));
		return userDAO.getId(user);
	}

	@Override
	public String getPhone(User user) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("여기는 userServiceImpl의 getPhone 메서도 : "+userDAO.getPhone(user));
		return userDAO.getPhone(user);
	}
	
	@Override
	public void deleteUser(User user) throws Exception {
		// TODO Auto-generated method stub
		userDAO.deleteUser(user);
	}

    @Override
    public boolean send(String subject, String text, String from, String to, String filePath) {
        // javax.mail.internet.MimeMessage    	
    	System.out.println("메일 보내기 서비스 임플");
    	MimeMessage message = javaMailSender.createMimeMessage();
 
        try {
            // org.springframework.mail.javamail.MimeMessageHelper
        	// 멀티파트 메시지가 필요하다는 의미로 true 플래그를 사용한다
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject(subject);
            
            // 포함된 텍스트가 HTML이라는 의미로 true 플래그를 사용한다
            
            helper.setText(text, true);
            helper.setFrom(from);
            helper.setTo(to);

            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }

	@Override
	public User deleteCheck(User user) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.deleteCheck(user);
	}

	@Override
	public String addUuid(String token, String userId) throws Exception {
		RestApiUtil restApiUtil = new RestApiUtil("https://kapi.kakao.com/v1/push/register", "POST");
		Map<String, String> header = new HashMap<String,String>();
		Map<String, Object> body = new HashMap<String, Object>();
		
		header.put("Host", "kapi.kakao.com");
		header.put("Authorization", "KakaoAK a02318166885b3124da4962257436383");
		
		User user = userDAO.getUser(userId);
		int userNo = user.getUserNo(); 
		body.put("uuid", userNo);
		body.put("device_id", userId);
		body.put("push_type", "gcm");
		body.put("push_token",token);
		
		String result = (restApiUtil.restApiResponse(header, body));
		
		if(result.length()<=5){
			user.setUserNo(userNo);
			if(userDAO.updateUuid(user) == 1){
				System.out.println("uuid 업데이트 성공");
				return "success";
			}else{
				System.out.println("uuid 업데이트 실패");
				return "fail";
			}
		}else{
			return "fail";
		}
	}
}

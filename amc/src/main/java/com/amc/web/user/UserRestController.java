package com.amc.web.user;

import java.net.URLEncoder;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jettison.json.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.amc.service.user.UserService;
import com.amc.service.SNSLogin.InstaService;
import com.amc.service.SNSLogin.KakaoService;
import com.amc.service.SNSLogin.NaverService;
import com.amc.service.domain.User;

//==> ȸ������ RestController
@RestController
@RequestMapping("/user/json/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@RequestMapping( value="getPhone", method=RequestMethod.POST)
	public String getPhone(  @RequestBody User user,
							 HttpSession session) throws Exception {

	  System.out.println("::::::::::::::::"+user);
	  
	  /*userService.getId(user);*/
	  
      /*return "forward:/user/main.jsp";*/
	  System.out.println("����� controller : "+userService.getPhone(user));
	  
	  return userService.getPhone(user);
	}
	
	@RequestMapping( value="getId", method=RequestMethod.POST)
	public User getId(  @RequestBody User user,
							 HttpSession session) throws Exception {

	  System.out.println(user);
	  
	  /*userService.getId(user);*/
	  
      /*return "forward:/user/main.jsp";*/
	  System.out.println("����� controller : "+userService.getId(user));
	  
	  return userService.getId(user);
	}
	
	@RequestMapping( value="getUser/{tempId}", method={RequestMethod.GET,RequestMethod.POST} )
	public User getUser( @PathVariable String tempId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		String userId = tempId.replace(",", ".");
		
		//Business Logic
		return userService.getUser(userId);
	}
	
	@RequestMapping( value="deleteCheck", method={RequestMethod.GET,RequestMethod.POST} )
	public User deleteCheck( @RequestBody User user, Model model,
										HttpSession session  ) throws Exception{
		System.out.println("/user/json/deleteCheck : POST");
		return userService.deleteCheck(user);
	}
	
	@RequestMapping( value="loginUser", method=RequestMethod.POST )
	public User loginUser(	@RequestBody User user, Model model,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/loginUser : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		/*System.out.println("dbUser.roll :" + dbUser.getRole());*/
		/*if(dbUser==null || dbUser.getRole() == "not"){*/
		if(dbUser==null || dbUser.getRole().equals("not")){
			System.out.println("�� ���̴�");
			System.out.println(dbUser);
			model.addAttribute("user", dbUser);
			return dbUser;
		}else if(!user.getPassword().equals(dbUser.getPassword())){
			return null;
		}else{
			if(user.getPassword().equals(dbUser.getPassword())){
				session.setAttribute("user", dbUser);
			}
		}
		
		System.out.println("dbUser : " + dbUser);
		
		return dbUser;
	}
	
/*	@RequestMapping( value="checkDuplication/{userId:.+}", method=RequestMethod.GET )*/
	@RequestMapping( value="checkDuplication/{tempId}", produces="application/json;charset=UTF-8", method=RequestMethod.GET )
	public boolean checkDuplication( @PathVariable String tempId ) throws Exception{
		System.out.println("�ߺ�Ȯ�� üũ"+tempId);
		String userId = tempId.replace(",", ".");
		return userService.checkDuplication(userId);
	}
	
	@RequestMapping( value="kakaoLogin", method=RequestMethod.POST )
	public User kakaoJsLogin(	@RequestBody User user, Model model,
									HttpSession session ) throws Exception{
		System.out.println("/user/json/kakaoLogin : POST");
			System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if(dbUser==null || dbUser.getRole().equals("not")){
			System.out.println(":::dbUser ::" + dbUser);
			model.addAttribute("user", dbUser);
			return dbUser;
		}else{
			System.out.println("UserRestController�� kakaoLogin�޼ҵ忡�� User�� ������");
			session.setAttribute("user", dbUser);
			return dbUser;
		}
	}
	
/*	@RequestMapping( value="kakaoLogin", method=RequestMethod.POST )
	public User kakaoJsLogin(	@RequestBody User user,
									HttpSession session ) throws Exception{
		System.out.println("/user/json/kakaoLogin : POST");
			System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if(dbUser==null){
			System.out.println("�� ���̴�");
		}else{
			session.setAttribute("user", dbUser);
		}
		System.out.println("dbUser : " + dbUser);
		return dbUser;
	}*/


	@RequestMapping(value="/androidGetUser")
	public String androidGetUser(@RequestParam("email")String userId, 
									@RequestParam(value="password", defaultValue="")String password,
									@RequestParam(value="kakaoLogin", defaultValue="false")String kakaoLogin) throws Exception{
		
		if(kakaoLogin.equals("true")){
			System.out.println("�ȵ���̵� īī���α��� : userId : "+userId);
		}else{
			System.out.println("�ȵ���̵� : userId : "+userId+" password :"+password);
		}
		
		String jsonString = "";
		
		User dbUser=userService.getUser(userId);
		
		if(dbUser==null){ //�´� ������ ����
			return jsonString;
		}else{ //�´� ������ ����(īī�� �α����̸� �׳����, �ƴ϶�� �н����嵵 Ȯ��)
			if(kakaoLogin.equals("false")){
				if(dbUser.getPassword().equals(password)){
					System.out.println("�ȵ���̵� ���� id,pw ����");
				}else{
					return jsonString;
				}
			}else{
				System.out.println("�ȵ���̵� ���� id ����(īī���α���)");
			}
		}
		
		System.out.println("dbUser : " + dbUser);
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		String temp = objectMapper.writeValueAsString(dbUser);
		
		jsonString = URLEncoder.encode(temp,"UTF-8");
		
		return jsonString;

	}
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////�ȵ���̵�� ����//////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	@RequestMapping(value="/addUuid")
	public String addUuid(@RequestParam("token")String token, 
									@RequestParam("userId")String userId) throws Exception{
				
		System.out.println("�ȵ���̵忡�� �� ��ū token : "+token+" userId :"+userId);
		
		return userService.addUuid(token, userId);
	}
	
    
	@RequestMapping( value="/updateAndroidUser")
	public String updateUser( @ModelAttribute("user") User user , Model model,
								@RequestBody String jsonString) throws Exception{
		
		System.out.println("/updateAndroidUser : POST");
		org.json.simple.JSONObject jsonObject = (org.json.simple.JSONObject)JSONValue.parse(jsonString);
		System.out.println(jsonObject.toJSONString());
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		user = objectMapper.readValue(jsonObject.get("user").toString(), User.class);
		
		User tempUser = userService.getUser(user.getUserId());
		
		user.setUserNo(tempUser.getUserNo());
		user.setPassword(tempUser.getPassword());
		user.setRole(tempUser.getRole());
		user.setUserRegDate(tempUser.getUserRegDate());
		user.setBirth(tempUser.getBirth());
		user.setCalendarType(tempUser.getCalendarType());
		user.setGender(tempUser.getGender());
		user.setDeleteUserFlag(tempUser.getDeleteUserFlag());
		user.setUuId(tempUser.getUuId());
		
		System.out.println("update�� user"+user);
		
		userService.updateUser(user);
		
		return "1"; 
	}
}

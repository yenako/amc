package com.amc.web.user;

import java.util.Date;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.amc.service.domain.User;
import com.amc.service.user.UserService;
import com.amc.common.Page;
import com.amc.common.Search;

//==> ȸ������ Controller
@Controller
@RequestMapping("/user/*")
public class UserController {

	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public UserController(){
		System.out.println(this.getClass());
	}

	@RequestMapping( value="addUser", method=RequestMethod.GET )
	public String addUser(@RequestParam(value="email", required=false) String email , 
						  @RequestParam(value="snslogin", required=false) String snslogin , Model model ) throws Exception{
		System.out.println("/user/addUser : GET");
		System.out.println("@@@@@@@@@@@222"+email+"snslogin"+snslogin);
		
		model.addAttribute("email", email);
		model.addAttribute("snslogin", snslogin);
		
		return "forward:/user/addUser.jsp";
	}
	
	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser( @ModelAttribute("user") User user ) throws Exception {
		System.out.println(" :::: /user/addUser : POST User ="+user);
		
		String phone1 = user.getPhone1();
		String phone2 = user.getPhone2();
		String phone3 = user.getPhone3();
		user.setPhone1(phone1.replace(",", ""));
		user.setPhone2(phone2.replace(",", ""));
		user.setPhone3(phone3.replace(",", ""));
		
		String birth2 = user.getBirth();
		user.setBirth(birth2.replaceAll("-",""));	
		System.out.println("UserController �� addUser POST �޼ҵ�"+user);
		userService.addUser(user);
		return "redirect:/index.jsp";
	}
	
	@RequestMapping( value="loginUser", method=RequestMethod.GET )
	public String loginUser() throws Exception{
		
		System.out.println("/user/logonUser : GET");
		return "redirect:/user/loginUser.jsp";
	}
	
	@RequestMapping( value="loginUser", method=RequestMethod.POST )
	public String loginUser(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/user/loginUser : POST");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		
		System.out.println("*******************************************************");
		System.out.println("dbUser.roll :" + dbUser.getRole());
		
		if(dbUser==null || dbUser.getRole() == "not"){
			System.out.println("�� ���̴�");			
		}else{
			if(user.getPassword().equals(dbUser.getPassword())){
				session.setAttribute("user", dbUser);
			}
		}
		return "redirect:/index.jsp";
	}
	
	@RequestMapping( value="logoutUser", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		session.invalidate();
		/*if(session != null){
			if(session.getAttribute("user")==null){
				System.out.println("session �� user �� null");
			}else{
				System.out.println("session �� user �� �� �����񳪻糪null");
			}
		}*/
		return "redirect:/index.jsp";
	}

	@RequestMapping( value="/getUser", method={RequestMethod.GET, RequestMethod.POST} )
	public String getUser( @RequestParam(value="userId", required=false) String userId , Model model, HttpSession session ) throws Exception {
		
		System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"+userId);
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}

	
	@RequestMapping( value="getUserList" )
	public String getUserList( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listUser : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=userService.getUserList(search);
		
		System.out.println(search.getCurrentPage());
		System.out.println(((Integer)map.get("totalCount")).intValue());
		System.out.println(pageUnit);
		System.out.println(pageSize);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/user/listUser.jsp";
	}
	
	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("userId") String userId , Model model,HttpSession session ) throws Exception{
		System.out.println("/user/updateUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}
	
	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user, 
								/*@RequestParam(value="snslogin", required=false) String snslogin ,*/ 
									Model model , HttpSession session) throws Exception{

		System.out.println("/user/updateUser : POST");
		//Business Logic
		userService.updateUser(user);
		System.out.println(":::::session ����"+(User)session.getAttribute("user"));
		String sessionRole = ((User)session.getAttribute("user")).getRole();
		if(sessionRole.equals(user.getRole())){
			User updateUser = userService.getUser(user.getUserId());
			session.setAttribute("user", updateUser);
		}
		return "redirect:/user/getUser?userId="+user.getUserId();
	}
	
	@RequestMapping( value="deleteUser", method=RequestMethod.GET )
	public String deleteUser(/*@ModelAttribute("user")User user,*/  Model model, HttpSession session ) throws Exception{
		System.out.println("/user/deleteUser : GET");
		/*model.addAttribute(user);*/
		
		return "redirect:/user/deleteUser.jsp";
	}
	
	@RequestMapping( value="deleteUser", method=RequestMethod.POST )
	public String deleteUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

		System.out.println("/user/deleteUser : POST");
		
		userService.deleteUser(user);
	
		session.invalidate();
		return "redirect:/index.jsp";
	}

	
	// �̸��� ���� ����
    @RequestMapping(value = "auth", method = RequestMethod.POST, produces = "application/json")
    public String sendMailAuth(HttpSession session, @RequestParam String email) throws Exception  {
    	
    	String subject = "ȸ������ ���� �߱� �ȳ� �Դϴ�. ";
    	
    	System.out.println(subject);
        
    	StringBuilder sb = new StringBuilder();        
        String img = "http://127.0.0.1:8080/images/LOGO.png";
        
        System.out.println(img);
        sb.append("�ؿ� �̹����� Ŭ�� �Ͻø� ȸ������ ȭ������ �̵��մϴ�. <br/>" );
        sb.append("<a href=http://127.0.0.1:8080/user/addUser?email="+email+">");
        sb.append("<img src='"+img+"'/></a>");
        
        System.out.println(sb);
        
        userService.send(subject, sb.toString(), "bitcampamc@gmail.com", email, null);
        
        System.out.println("���� ������ ����");
        
        return "redirect:/user/authForm.jsp";
    }
    
    // ��й�ȣ ã��    
    @RequestMapping(value = "sendPassword", method = RequestMethod.POST)
    public String sendPassword(HttpSession session, 
    									RedirectAttributes ra,
    									@RequestParam String userId, 		
    									@RequestParam String userName ) throws Exception {
    	
    	System.out.println("sendPassword Controller : POST ");
    	User user = userService.getUser(userId);
        if (user != null) {
            if (!user.getUserId().equals(userId)) {
                ra.addFlashAttribute("resultMsg", "�Է��Ͻ� �̸����� ȸ�������� ���Ե� ���̵� ��ġ���� �ʽ��ϴ�.");
                return "redirect:/find/password";
            }
            int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
            String password = String.valueOf(ran);            
            user.setPassword(password);
            userService.updateUser(user);
            String subject = "�ӽ� ��й�ȣ �߱� �ȳ� �Դϴ�.";
            StringBuilder sb = new StringBuilder();
            sb.append("������ �ӽ� ��й�ȣ�� " + password + " �Դϴ�.");
            userService.send(subject, sb.toString(), "bitcampamc@gmail.com", userId, null);
            ra.addFlashAttribute("resultMsg", "������ �̸��� �ּҷ� ���ο� �ӽ� ��й�ȣ�� �߼� �Ͽ����ϴ�.");
            
        } else {
            ra.addFlashAttribute("resultMsg", "������ �̸��Ϸ� ���Ե� ���̵� �������� �ʽ��ϴ�.");
        }
        return "redirect:/index.jsp";
    }
    
}

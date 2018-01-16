package com.amc.web.alarm;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.codehaus.jettison.json.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amc.common.Page;
import com.amc.common.Search;
import com.amc.service.alarm.AlarmService;
import com.amc.service.domain.Alarm;
import com.amc.service.domain.ScreenContent;
import com.amc.service.domain.User;
import com.amc.service.user.UserService;
import com.amc.web.booking.BookingRestController;


@RestController
@RequestMapping("/alarm/*")
public class AlarmRestController {
	
	@Autowired
	@Qualifier("alarmServiceImpl")
	AlarmService alarmService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	UserService userService;
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	public AlarmRestController() {
		System.out.println("PurchaseController() default Constructor");
		
	}
	
	@RequestMapping("/json/addCancelAlarm")
	public String addCancelAlarm(@ModelAttribute("alarm")Alarm alarm){
		return alarmService.addCancelAlarm(alarm);
	}
	
	@RequestMapping("/json/switchOpenAlarm")
	public String switchOpenAlarm(@ModelAttribute("alarm")Alarm alarm){
		return alarmService.switchOpenAlarm(alarm);
	}
	
	@RequestMapping("/json/deleteCancelAlarm")
	public int deleteCancelAlarm(@ModelAttribute("alarm")Alarm alarm){
		return alarmService.deleteCancelAlarm(alarm);
	}
	
	@RequestMapping("/json/deleteOpenAlarm")
	public int deleteOpenAlarm(@ModelAttribute("alarm")Alarm alarm){
		return alarmService.deleteOpenAlarm(alarm);
	}
	
	@RequestMapping("/json/push/{type}")
	public String push(@PathVariable("type")String type,
						@RequestParam(value="serialNo",defaultValue="")String serialNo,
						@RequestParam(value="userId",defaultValue="")String userId,
						@RequestParam(value="alarmSeatNo",defaultValue="")String alarmSeatNo
						) throws Exception{
			
		System.out.println("AlarmRestController.java 의 push 메소드"); 
		if(!type.equals("") || type !=null){
			
			System.out.println("AlarmRestController :: " +type+","+serialNo+","+userId+","+alarmSeatNo);
			
			String smsResult = alarmService.smsPush(type,serialNo,userId,alarmSeatNo);
			
			if(!type.equals("userCertification") && !type.equals("booking")){
				String pushResult = alarmService.appPush(type, serialNo, userId, alarmSeatNo);
			}
		}
		
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/json/getInfiCancelAlarmList/{userId:.+}")
	public Map<String,Object> getInfiCancelAlarmList(@ModelAttribute("Search")Search search,
											@PathVariable("userId") String userId,
											@RequestBody String jsonString,
											HttpSession session,Model model) throws Exception{
		
		Map<String,Object> tempMap = new HashMap<String,Object>();
		
		JSONObject jo = (JSONObject)JSONValue.parse(jsonString);
		System.out.println((Long)(jo.get("currentPage")));
		System.out.println((String)(jo.get("alarmFlag")));
		search.setCurrentPage(Math.toIntExact((Long)jo.get("currentPage")));
		String alarmFlag = (String)(jo.get("alarmFlag"));
		
		if(search.getCurrentPage()==0){
			search.setCurrentPage(1);
		}
		
		int pageSize = 12;
		
		search.setPageSize(pageSize);
		User user = (User)session.getAttribute("user");
		
		tempMap.put("search", search);
		tempMap.put("user", user);
		tempMap.put("alarmFlag", alarmFlag);
		
		Map<String, Object> map = alarmService.getCancelAlarmList(tempMap);
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
						pageUnit, pageSize);
		
		BookingRestController brc = new BookingRestController();
		
		List<Alarm> seatChangeList = (List<Alarm>)(map.get("list"));
		
		JSONObject jsonObject = new JSONObject();
		
		for(int i = 0; i < seatChangeList.size(); i++){
			jsonObject = (JSONObject)JSONValue.parse(brc.getSeatNo(seatChangeList.get(i).getAlarmSeatNo(), 10, model));
			seatChangeList.get(i).setAlarmSeatNo((String)jsonObject.get("seatNo"));
		}
		
		System.out.println("■■■무스 취소알람확인■■■ : "+map.get("list"));
		
	    return map;
	}
	
	@RequestMapping( value="/json/getInfiOpenAlarmList/{userId:.+}")
	public Map<String,Object> getInfiOpenAlarmList(@ModelAttribute("Search")Search search, 
										   @PathVariable("userId") String userId,
										   @RequestBody String jsonString,
										   HttpSession session,Model model) throws Exception {

		Map<String,Object> tempMap = new HashMap<String,Object>();
		
		JSONObject jo = (JSONObject)JSONValue.parse(jsonString);
		System.out.println((Long)(jo.get("currentPage")));
		System.out.println((String)(jo.get("alarmFlag")));
		search.setCurrentPage(Math.toIntExact((Long)jo.get("currentPage")));
		String alarmFlag = (String)(jo.get("alarmFlag"));
		
		if(search.getCurrentPage()==0){
			search.setCurrentPage(1);
		}
		
		
		int pageSize = 12;
		
		search.setPageSize(pageSize);
		User user = (User)session.getAttribute("user");
		
		tempMap.put("search", search);
		tempMap.put("user", user);
		tempMap.put("alarmFlag", alarmFlag);
		
		Map<String, Object> map = alarmService.getOpenAlarmList(tempMap);
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
						pageUnit, pageSize);
		
		System.out.println("■■■무스 오픈알람확인■■■ : "+map.get("list"));
		
	
	    return map;
	}
	
	@RequestMapping( value="/json/deleteAlarm/{alarmNo}")
	public int deleteAlarm(@ModelAttribute("User")User user,
								@ModelAttribute("Alarm")Alarm alarm,
										   @PathVariable("alarmNo") String alarmNo,
										   HttpSession session,Model model) throws Exception {
				
		alarm.setAlarmNo(Integer.parseInt(alarmNo));
		alarm.setUser(user);
		
		return alarmService.deleteAlarm(alarm);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/json/getAndroidCancelAlarmList/{userId:.+}")
	public String getAndroidCancelAlarmList(
											@PathVariable("userId") String userId,
											@RequestParam("alarmFlag")String alarmFlag,
											HttpSession session,Model model) throws Exception{
		
		Map<String,Object> tempMap = new HashMap<String,Object>();
		
		Search search = new Search();
		
		if(search.getCurrentPage()==0){
			search.setCurrentPage(1);
		}
		
		int pageSize = 10000000;
		
		search.setPageSize(pageSize);
		User user = userService.getUser(userId);
		
		tempMap.put("search", search);
		tempMap.put("user", user);
		tempMap.put("alarmFlag", alarmFlag);
		
		Map<String, Object> map = alarmService.getCancelAlarmList(tempMap);
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
						pageUnit, pageSize);
		
		BookingRestController brc = new BookingRestController();
		
		List<Alarm> seatChangeList = (List<Alarm>)(map.get("list"));
		
		JSONObject jsonObject = new JSONObject();
		
		for(int i = 0; i < seatChangeList.size(); i++){
			jsonObject = (JSONObject)JSONValue.parse(brc.getSeatNo(seatChangeList.get(i).getAlarmSeatNo(), 10, model));
			seatChangeList.get(i).setAlarmSeatNo((String)jsonObject.get("seatNo"));
		}
		
		System.out.println("■■■안드 취소알람확인■■■ : "+map.get("list"));
		
		org.json.simple.JSONArray jsonArray = new org.json.simple.JSONArray();
		JSONObject response = new JSONObject();
		ObjectMapper objectMapper = new ObjectMapper();
		
		for(int i = 0; i< seatChangeList.size(); i++){

			 objectMapper = new ObjectMapper();
			 
			 jsonArray.add(objectMapper.writeValueAsString(seatChangeList.get(i)));
		}
		
		response.put("list", jsonArray);
		
		String jsonString = URLEncoder.encode(response.toJSONString(),"UTF-8");
		
	    return jsonString;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping( value="/json/getAndroidOpenAlarmList/{userId:.+}")
	public String getAndroidOpenAlarmList(@ModelAttribute("Search")Search search, 
										   @PathVariable("userId") String userId,
										   @RequestParam("alarmFlag")String alarmFlag,
										   HttpSession session,Model model) throws Exception {

		Map<String,Object> tempMap = new HashMap<String,Object>();
		
		if(search.getCurrentPage()==0){
			search.setCurrentPage(1);
		}
		
		
		int pageSize = 1000000;
		
		search.setPageSize(pageSize);
		User user = userService.getUser(userId);
		
		tempMap.put("search", search);
		tempMap.put("user", user);
		tempMap.put("alarmFlag", alarmFlag);
		
		Map<String, Object> map = alarmService.getOpenAlarmList(tempMap);
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
						pageUnit, pageSize);
		
		System.out.println("■■■안드 오픈알람확인■■■ : "+map.get("list"));
		
		List<Alarm> alarmList = (List<Alarm>)map.get("list");	
		
		org.json.simple.JSONArray jsonArray = new org.json.simple.JSONArray();
		JSONObject response = new JSONObject();
		ObjectMapper objectMapper = new ObjectMapper();
		
		for(int i = 0; i< alarmList.size(); i++){

			 objectMapper = new ObjectMapper();
			 
			 jsonArray.add(objectMapper.writeValueAsString(alarmList.get(i)));
		}
		
		
		
		response.put("list", jsonArray);
		
		String jsonString = URLEncoder.encode(response.toJSONString(),"UTF-8");
		
		
		return jsonString;
		
	}
	
	@RequestMapping( value="/json/deleteAndroidAlarm/{alarmNo}")
	public int deleteAndroidAlarm(@ModelAttribute("User")User user,
									@ModelAttribute("Alarm")Alarm alarm,
										   @PathVariable("alarmNo") String alarmNo,
										   HttpSession session,Model model) throws Exception {
				
		alarm.setAlarmNo(Integer.parseInt(alarmNo));
		alarm.setUser(user);
		
		return alarmService.deleteAlarm(alarm);
	}
	
	@RequestMapping(value="/json/getCancelAlarmOfScreenContentNo")
	public String getCancelAlarmOfScreenContentNo(@RequestParam("screenContentNo") String screenContentNo,
								     HttpSession session, Model model) throws Exception{
		Map<String,Object> tempMap = new HashMap<String,Object>();
		
		User user = (User)session.getAttribute("user");
		ScreenContent screenContent = new ScreenContent();
		screenContent.setScreenContentNo(Integer.parseInt(screenContentNo));
		
		tempMap.put("user", user);
		tempMap.put("screenContent", screenContent);
		
		List<Alarm> alarmList = alarmService.getCancelAlarmOfScreenContentNo(tempMap);
		System.out.println("유저의 해당 상영의 취소표알림 리스트"+alarmList);
		BookingRestController brc = new BookingRestController();
		JSONObject jsonObject = new JSONObject();
		String restSeats = "";
		
		for(int i = 0; i < alarmList.size(); i++){
			if(i-1 == alarmList.size()){
				restSeats += alarmList.get(i).getAlarmSeatNo();
			}else{
				restSeats += alarmList.get(i).getAlarmSeatNo()+",";
			}
		}
		jsonObject = (JSONObject)JSONValue.parse(brc.getSeatNo(restSeats, 1000, null));
		
		restSeats = (String)jsonObject.get("seatNo");
		
		System.out.println("Seats::::::::::::::"+restSeats);

		return restSeats;	
	}
	
}

package com.amc.web.alarm;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;

import com.amc.common.Search;
import com.amc.common.util.RestApiUtil;
import com.amc.service.domain.ScreenContent;
import com.amc.service.screen.ScreenService;

@Controller
public class AlarmPush implements ApplicationContextAware{

	@Autowired
	@Qualifier("screenServiceImpl")
	ScreenService screenService;
	SimpleDateFormat dateFormat;
	Calendar calendar;
	private static ApplicationContext applicationContext;
	
	RestApiUtil restApiUtil;
	Map<String,String> header = new HashMap<String,String>();
	Map<String,Object> body = new HashMap<String,Object>();
	

	public AlarmPush() {
		this.dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	}

	public void run() throws IOException {

		calendar = Calendar.getInstance();

		System.out.println("서브 태스크(티켓오픈알림) 시작시간 :: " + dateFormat.format(calendar.getTime()));

		Search search = new Search();
		search.setSearchKeyword(dateFormat.format(calendar.getTime()));

		List<ScreenContent> list = screenService.getTodayTicketOpenList(search);
		for (ScreenContent screenContent : list) {
			
			restApiUtil = new RestApiUtil("http://127.0.0.1:8080/alarm/json/push/openAlarm?serialNo="
											+screenContent.getScreenContentNo(), "GET");
			
			header.put("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			restApiUtil.restApiResponse(header, body);
			
		}
		restApiUtil.disConnection();
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		AlarmPush.applicationContext = applicationContext;
	}

	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}

}

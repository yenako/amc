package com.amc.service.alarm;

import java.util.List;
import java.util.Map;

import com.amc.service.domain.Alarm;

public interface AlarmService {
	
	public String addCancelAlarm(Alarm alarm);
	
	public int addOpenAlarm(Alarm alarm);
	
	public Map<String,Object> getCancelAlarmList(Map<String,Object> map);
	
	public Map<String,Object> getOpenAlarmList(Map<String,Object> map);
	
	public int deleteCancelAlarm(Alarm alarm);
	
	public int deleteOpenAlarm(Alarm alarm);
	
	public String checkOpenAlarm(Alarm alarm);
	
	public String switchOpenAlarm(Alarm alarm);
	
	public String smsPush(String type, String serialNo, String userId, String alarmSeatNo) throws Exception;
	
	public String appPush(String type, String serialNo, String userId, String alarmSeatNo) throws Exception;
	
	public int deleteAlarm(Alarm alarm);
	
	public List<Alarm> getCancelAlarmOfScreenContentNo(Map<String,Object> map);
}

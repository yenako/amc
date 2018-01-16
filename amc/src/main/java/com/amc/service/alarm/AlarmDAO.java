package com.amc.service.alarm;

import java.util.List;
import java.util.Map;

import com.amc.service.domain.Alarm;

public interface AlarmDAO {

	public int addCancelAlarm(Alarm alarm);

	public int addOpenAlarm(Alarm alarm);
	
	public Map<String,Object> getCancelAlarmList(Map<String,Object> map);
	
	public Map<String,Object> getOpenAlarmList(Map<String,Object> map);
	
	public List<Alarm> getPushCancelAlarmList(Map<String,Object> map);
	
	public List<Alarm> getPushOpenAlarmList(Map<String,Object> map);
	
	public int deleteCancelAlarm(Alarm alarm);
	
	public int deleteOpenAlarm(Alarm alarm);
	
	public String checkOpenAlarm(Alarm alarm);
	
	public String checkCancelAlarm(Alarm alarm);
	
	public String checkDuplicationSeat(Alarm alarm);
	
	public int deleteAlarm(Alarm alarm);
	
	public int deleteAfterPush(Alarm alarm);
	
	public List<Alarm> getCancelAlarmOfScreenContentNo(Map<String,Object> map);
	
}

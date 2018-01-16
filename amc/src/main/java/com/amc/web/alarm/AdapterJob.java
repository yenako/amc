package com.amc.web.alarm;

import java.io.IOException;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.BeansException;

//Job 실행시 AlarmPush 를 실행해주는 Adapter
public class AdapterJob implements Job{

	public AdapterJob() {
		
	}

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		
		try {
			AlarmPush.getApplicationContext().getBean(AlarmPush.class).run();
		} catch (BeansException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

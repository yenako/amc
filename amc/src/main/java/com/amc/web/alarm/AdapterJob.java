package com.amc.web.alarm;

import java.io.IOException;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.BeansException;

//Job ����� AlarmPush �� �������ִ� Adapter
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

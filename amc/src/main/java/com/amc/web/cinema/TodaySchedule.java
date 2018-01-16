package com.amc.web.cinema;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.amc.common.Search;
import com.amc.service.domain.ScreenContent;
import com.amc.service.screen.ScreenService;
import com.amc.web.alarm.AdapterJob;

@Controller
public class TodaySchedule implements ServletContextListener {

	@Autowired
	@Qualifier("screenServiceImpl")
	ScreenService screenService;
	SimpleDateFormat dateFormat;
	Calendar calendar;

	static Scheduler scheduler;

	public TodaySchedule() {
		this.dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	}

	@Scheduled(cron = "50 * * * * *")
	public void mainTask() throws Exception {

		calendar =  Calendar.getInstance();

		System.out.println("���ν����� �۵��ð� : " + dateFormat.format(calendar.getTime()));
		
		//�����ٷ� ���� �۵��� �Ʒ� �ּ��� Ǯ�� ��.
		if (scheduler == null) {
			System.out.println("�����ٷ� is Null");
			scheduler = new StdSchedulerFactory().getScheduler();
			scheduler.start();
		}else{
			System.out.println("�����ٷ� is Not Null");
			scheduler.shutdown();
			Thread.sleep(1000); //�������Ḧ ����
			System.out.println("=>> shutdown complete");
			scheduler = new StdSchedulerFactory().getScheduler();
			
			scheduler.start();
		}
		this.subTaskSetting();

	}

	public void subTaskSetting() {
		
		//���� �ּ��� Ǯ���ִ� �ڵ�� ������ ���ؼ� ����� �� �ڵ��̸�
		//�� �ؿ� �ڵ尡 ���������� ������ �ڵ���
		
		String year;
		String month;
		String day;
		String hour;
		String minute;
		String cron;
		
		Search search = new Search();
		search.setSearchKeyword("todayRealAlarmTime");
		
		List<ScreenContent> todayRealAlarmTimeList = screenService.getTodayTicketOpenList(search);
		//String[] cron = new String[todayRealAlarmTimeList.size()];
		for (int i = 0; i < todayRealAlarmTimeList.size(); i++) {
			System.out.println("������ �˶� �����ؾ� �ϴ� �ð� ����Ʈ["+i+"] : " + todayRealAlarmTimeList.get(i).getTicketOpenDate());
			
			year = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[0].split("/")[0]; //��
			month = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[0].split("/")[1]; //��
			day = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[0].split("/")[2]; //��
			
			hour = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[1].split(":")[0]; //��
			minute = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[1].split(":")[1]; //��

			//cron ǥ���� x x x x x x = ��/��/��/��/����/��
			cron = "0 " + minute + " " + hour + " " + day + " " + month + " " + "? " + year;
			
/*			if(i == 0){
				cron[0] = "0 56 09 25 10 ? 2017";
			}else if(i == 1){
				cron[1] = "0 29 19 23 10 ? 2017";
			}else if(i > 1){
				cron[i] ="22 29 19 24 10 ? 2017";
			}*/
			
			System.out.println("date :: " + year+"/"+month+"/"+day );
			System.out.println("hour :: " + hour);
			System.out.println("minute :: " + minute);
			System.out.println("cron :: " + cron);
			
			try{
				scheduler.scheduleJob( 
						 				new JobDetail("job"+i,"openAlarmJobGroup", AdapterJob.class),
						 				/*new CronTrigger("trigger"+i,"openAlarmTriggerGroup",cron[i])*/
						 				new CronTrigger("trigger"+i,"openAlarmTriggerGroup",cron)
									 );
				System.out.println("TriggerInfo :: "+scheduler.getTrigger("trigger"+i,"openAlarmTriggerGroup"));
			}catch(SchedulerException se) {
				System.out.println("SchedulerException �߻�");
				System.out.println("Ʈ���ſ� ��ϵ� �ð��� ����ð����� ��");
				se.printStackTrace();
			}catch(ParseException pe){
				pe.printStackTrace();
			}
		}
		
		/*List<ScreenContent> todayRealAlarmTimeList = screenService.getTodayTicketOpenList(search);
		for (int i = 0; i < todayRealAlarmTimeList.size(); i++) {
			System.out.println("������ �˶� �����ؾ� �ϴ� �ð� ����Ʈ["+i+"] : " + todayRealAlarmTimeList.get(i).getTicketOpenDate());
			
			year = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[0].split("/")[0]; //��
			month = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[0].split("/")[1]; //��
			day = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[0].split("/")[2]; //��
			
			hour = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[1].split(":")[0]; //��
			minute = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[1].split(":")[1]; //��

			//cron ǥ���� x x x x x x = ��/��/��/��/����/��
			cron = "0 " + minute + " " + hour + " " + day + " " + month + " " + "? " + year;  
			
			System.out.println("date :: " + year+"/"+month+"/"+day );
			System.out.println("hour :: " + hour);
			System.out.println("minute :: " + minute);
			System.out.println("cron :: " + cron);
			
			try{
				scheduler.scheduleJob(
						 				new JobDetail("job"+i,"openAlarmJobGroup", AlarmPush.class),
						 				new CronTrigger("trigger"+i,"openAlarmTriggerGroup",cron)
									 );
				System.out.println("TriggerInfo :: "+scheduler.getTrigger("trigger"+i,"openAlarmTriggerGroup"));
			}catch(SchedulerException se) {
				System.out.println("SchedulerException �߻�");
				System.out.println("Ʈ���ſ� ��ϵ� �ð��� ����ð����� ��");
				se.printStackTrace();
			}catch(ParseException pe){
				pe.printStackTrace();
			}
		}*/
	}

	
	//WAS shutdown �� �� scheduler ������ ���� �޼���
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		try {
			if (sce != null && sce.getServletContext() != null) {
				if(scheduler != null){
					scheduler.shutdown();
					System.out.println("���� ����� ������ shutdown");
					Thread.sleep(1000); // sleep for a bit so that we don't get any
										// errors
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}
}

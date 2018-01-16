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

		System.out.println("메인스케줄 작동시간 : " + dateFormat.format(calendar.getTime()));
		
		//스케줄러 세부 작동은 아래 주석은 풀면 됨.
		if (scheduler == null) {
			System.out.println("스케줄러 is Null");
			scheduler = new StdSchedulerFactory().getScheduler();
			scheduler.start();
		}else{
			System.out.println("스케줄러 is Not Null");
			scheduler.shutdown();
			Thread.sleep(1000); //정상종료를 위한
			System.out.println("=>> shutdown complete");
			scheduler = new StdSchedulerFactory().getScheduler();
			
			scheduler.start();
		}
		this.subTaskSetting();

	}

	public void subTaskSetting() {
		
		//현재 주석이 풀려있는 코드는 실험을 위해서 만들어 둔 코드이며
		//그 밑에 코드가 실질적으로 적용할 코드임
		
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
			System.out.println("오늘의 알람 실행해야 하는 시간 리스트["+i+"] : " + todayRealAlarmTimeList.get(i).getTicketOpenDate());
			
			year = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[0].split("/")[0]; //년
			month = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[0].split("/")[1]; //월
			day = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[0].split("/")[2]; //일
			
			hour = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[1].split(":")[0]; //시
			minute = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[1].split(":")[1]; //분

			//cron 표현식 x x x x x x = 초/분/시/월/요일/년
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
				System.out.println("SchedulerException 발생");
				System.out.println("트리거에 등록된 시간이 현재시간보다 전");
				se.printStackTrace();
			}catch(ParseException pe){
				pe.printStackTrace();
			}
		}
		
		/*List<ScreenContent> todayRealAlarmTimeList = screenService.getTodayTicketOpenList(search);
		for (int i = 0; i < todayRealAlarmTimeList.size(); i++) {
			System.out.println("오늘의 알람 실행해야 하는 시간 리스트["+i+"] : " + todayRealAlarmTimeList.get(i).getTicketOpenDate());
			
			year = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[0].split("/")[0]; //년
			month = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[0].split("/")[1]; //월
			day = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[0].split("/")[2]; //일
			
			hour = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[1].split(":")[0]; //시
			minute = (todayRealAlarmTimeList.get(i).getTicketOpenDate().split(" "))[1].split(":")[1]; //분

			//cron 표현식 x x x x x x = 초/분/시/월/요일/년
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
				System.out.println("SchedulerException 발생");
				System.out.println("트리거에 등록된 시간이 현재시간보다 전");
				se.printStackTrace();
			}catch(ParseException pe){
				pe.printStackTrace();
			}
		}*/
	}

	
	//WAS shutdown 될 떄 scheduler 관리를 위한 메서드
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		try {
			if (sce != null && sce.getServletContext() != null) {
				if(scheduler != null){
					scheduler.shutdown();
					System.out.println("강제 종료시 스케줄 shutdown");
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

package com.amc.service.booking.impl;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.amc.common.Search;
import com.amc.service.booking.BookingDAO;
import com.amc.service.booking.BookingService;
import com.amc.service.domain.Booking;
import com.amc.service.domain.Movie;
import com.amc.service.domain.ScreenContent;
import com.amc.service.domain.User;
import com.amc.service.movie.MovieDAO;
import com.amc.service.screen.ScreenDAO;
import com.amc.web.cinema.HttpRequestToNode;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashSet;

@Service("bookingServiceImpl")
public class BookingServiceImpl implements BookingService {
	
	@Autowired
	@Qualifier("bookingDAOImpl")
	private BookingDAO bookingDAO;
	
	@Autowired
	@Qualifier("movieDAOImpl")
	private MovieDAO movieDAO;
	
	@Autowired
	@Qualifier("screenDAOImpl")
	private ScreenDAO screenDAO;
	
	public void setBookingDAO(BookingDAO bookingDAO) {
		this.bookingDAO = bookingDAO;
	}
	public void setMovieDAO(MovieDAO movieDAO) {
		this.movieDAO = movieDAO;
	}

	@Value("#{commonProperties['nodeServerIP']}")
	String nodeServerIP;
	
	@Override
	public List<Movie> getScreenMovieList() {
		
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy/MM/dd");
        Calendar calendar = Calendar.getInstance();

        String today = simpleDateFormat.format(calendar.getTime());
        System.out.println("Today : " + today);
        Search search = new Search();
        search.setSearchCondition("3"); //���� �ʿ����
        search.setSearchKeyword(today);
        
	    List<Movie> todayMovieList = movieDAO.screenMovieList(search);
	    System.out.println("todayMovieList : "+todayMovieList);

		return todayMovieList;
	}
	

	@Override
	public List<ScreenContent> getPreviewList() {
		
		Search search = new Search();
		search.setSearchCondition("2");
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy/MM/dd");
        Calendar calendar = Calendar.getInstance();

        String today = simpleDateFormat.format(calendar.getTime());
        search.setSearchKeyword(today);

		return screenDAO.getScreenContentList2(search, 0);
	}

	@Override
	public void addBooking(Booking booking) {
		bookingDAO.addBooking(booking);
	}

	@Override
	public Booking getBookingByInfo(Booking booking) {		
		return bookingDAO.getBookingByInfo(booking);
	}

	@Override
	public void updateStatistic(User user, Booking booking) {
		/*searchKeyword(1:����, 2:����), serachKeyword2(���ɴ�)
		searchCondition(��ȭ��ȣ), currentPage(�ο���)*/
		Search search = new Search();
		
		search.setSearchCondition(booking.getMovie().getMovieNo()+"");
		search.setCurrentPage(booking.getHeadCount());
		if(user.getGender().equals("M")){
			search.setSearchKeyword("1");
		}else{
			search.setSearchKeyword("2");
		}
		Calendar calendar = Calendar.getInstance(); 
		int yearToday = calendar.get(Calendar.YEAR);
		int birthYear= Integer.parseInt(user.getBirth().substring(0, 4));
		int ages = (yearToday - birthYear)/10;
		
		search.setSearchKeyword2(ages+"");
		if(ages>7){ 
			search.setSearchKeyword2("7"); 
		}
		bookingDAO.updateStatistic(search);

	}

	@Override
	public int deleteBooking(String bookingNo) throws IOException, JSONException {
		
		System.out.println("��deleteBooking Service");
		
		//1) �¼����� ������Ʈ�ϱ�
		Booking booking = bookingDAO.getBooking(bookingNo);

		String urlStr = "http://"+nodeServerIP+":52273/deleteResv";
		String body = "screenNo="+booking.getScreenContentNo()+"&seat="+booking.getBookingNo();
		try {
			int responseCode = HttpRequestToNode.httpRequest(urlStr, body);
			if(responseCode ==200){
				System.out.println("����DB���� ���� ��Ҹ� �����Ͽ����ϴ�.");
				//2) ���ų��� �����ϱ�
				bookingDAO.deleteBooking(bookingNo);
				System.out.println("����Ŭ DB���� ���� ��Ҹ� �����Ͽ����ϴ�.");
				return 1;
			}else{
				System.out.println("����DB���� ���� ��Ҹ� �����Ͽ����ϴ�.");
				return -1;
			}				
		} catch (Exception e) {
			System.out.println("����DB�� �����ֳ����ϴ�!");
			return -1;
		}

	}

	@Override
	public List<String> getScreenDateList(List<ScreenContent> list, HttpSession session) {
		
		session.setAttribute("screenContentList", list);
        List<String> dayList = new ArrayList<String>();
        for(int k = 0; k<list.size(); k++){
        	
        	String screenDate = list.get(k).getScreenDate();
        	String screenDay = screenDate.substring(8,10);
        	//�ʿ�� substring�����ؼ� �� �ϱ��� �������� �� �� �ִ�.
        	dayList.add(screenDay);
        }
        
        //LinkedHashSet�� ����Ͽ� ������ �״�������ϰ� �ߺ��Ǵ� ���� �����Ѵ�.
        dayList = new ArrayList<String>(new LinkedHashSet<String>(dayList));
        
        return dayList;
	}
	
	@Override //����
	public List<ScreenContent> getScreenTimeList(String screenDate, HttpSession session) {
		
		List<ScreenContent> timeList = new ArrayList<ScreenContent>();				
		List<ScreenContent> screenContentList = (List<ScreenContent>) session.getAttribute("screenContentList");		
		
		for(int i = 0; i<screenContentList.size(); i++){
        	 
        	if(screenDate.equals( screenContentList.get(i).getScreenDate().substring(8, 10) )){
        		ScreenContent tempContent = new ScreenContent();//������ �־�� �� LIST ADD������
        		tempContent.setScreenContentNo(screenContentList.get(i).getScreenContentNo());
        		tempContent.setScreenOpenTime(screenContentList.get(i).getScreenOpenTime());
        		tempContent.setTicketOpenDate((screenContentList.get(i).getTicketOpenDate()));
        		timeList.add(tempContent);
        		System.out.println("tempContent�� ���� : "+tempContent.toString());
        	}
        }
		return timeList;
	}
	
	@Override //�ȵ���̵��
	public List<ScreenContent> androidScreenTimeList(String screenDate, HttpSession session, List<ScreenContent> list) {
		
		List<ScreenContent> timeList = new ArrayList<ScreenContent>();				
		List<ScreenContent> screenContentList = list;		
		
		for(int i = 0; i<screenContentList.size(); i++){
        	 
        	if(screenDate.equals( screenContentList.get(i).getScreenDate().substring(8, 10) )){
        		ScreenContent tempContent = new ScreenContent();//������ �־�� �� LIST ADD������
        		tempContent.setScreenContentNo(screenContentList.get(i).getScreenContentNo());
        		tempContent.setScreenOpenTime(screenContentList.get(i).getScreenOpenTime());
        		tempContent.setTicketOpenDate((screenContentList.get(i).getTicketOpenDate()));
        		timeList.add(tempContent);
        		System.out.println("tempContent�� ���� : "+tempContent.toString());
        	}
        }
		return timeList;
	}
	
	@Override
	public Booking getBooking(String bookingNo) {
		System.out.println("BookingServicempl ��, bookingNo : "+bookingNo);
		
		return bookingDAO.getBooking(bookingNo);
	}


	@Override
	public Map<String,Object> getBookingList(Search search) {
		return bookingDAO.getBookingList(search);
	}
	
	@Override
	public Map<String,Object> getUserBookingList(Map<String, Object> map) {
		return bookingDAO.getUserBookingList(map);
	}
	
	@Override
	public void selectCancelAlarm(int screenContentNo) {
	}
	
	
	@Override
	public void sendPhoneQR(String bookingNo, String phone) {
	}


	
}

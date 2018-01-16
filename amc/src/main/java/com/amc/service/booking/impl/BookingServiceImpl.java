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
        search.setSearchCondition("3"); //이제 필요없음
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
		/*searchKeyword(1:남자, 2:여자), serachKeyword2(연령대)
		searchCondition(영화번호), currentPage(인원수)*/
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
		
		System.out.println("▶deleteBooking Service");
		
		//1) 좌석정보 업데이트하기
		Booking booking = bookingDAO.getBooking(bookingNo);

		String urlStr = "http://"+nodeServerIP+":52273/deleteResv";
		String body = "screenNo="+booking.getScreenContentNo()+"&seat="+booking.getBookingNo();
		try {
			int responseCode = HttpRequestToNode.httpRequest(urlStr, body);
			if(responseCode ==200){
				System.out.println("몽고DB에서 예매 취소를 성공하였습니다.");
				//2) 예매내역 삭제하기
				bookingDAO.deleteBooking(bookingNo);
				System.out.println("오라클 DB에서 예매 취소를 성공하였습니다.");
				return 1;
			}else{
				System.out.println("몽고DB에서 예매 취소를 실패하였습니다.");
				return -1;
			}				
		} catch (Exception e) {
			System.out.println("몽고DB가 꺼져있나봅니다!");
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
        	//필요시 substring조정해서 월 일까지 나오도록 할 수 있다.
        	dayList.add(screenDay);
        }
        
        //LinkedHashSet을 사용하여 순서는 그대로유지하고 중복되는 값은 제거한다.
        dayList = new ArrayList<String>(new LinkedHashSet<String>(dayList));
        
        return dayList;
	}
	
	@Override //웹용
	public List<ScreenContent> getScreenTimeList(String screenDate, HttpSession session) {
		
		List<ScreenContent> timeList = new ArrayList<ScreenContent>();				
		List<ScreenContent> screenContentList = (List<ScreenContent>) session.getAttribute("screenContentList");		
		
		for(int i = 0; i<screenContentList.size(); i++){
        	 
        	if(screenDate.equals( screenContentList.get(i).getScreenDate().substring(8, 10) )){
        		ScreenContent tempContent = new ScreenContent();//안으로 넣어야 함 LIST ADD때무네
        		tempContent.setScreenContentNo(screenContentList.get(i).getScreenContentNo());
        		tempContent.setScreenOpenTime(screenContentList.get(i).getScreenOpenTime());
        		tempContent.setTicketOpenDate((screenContentList.get(i).getTicketOpenDate()));
        		timeList.add(tempContent);
        		System.out.println("tempContent에 들어간다 : "+tempContent.toString());
        	}
        }
		return timeList;
	}
	
	@Override //안드로이드용
	public List<ScreenContent> androidScreenTimeList(String screenDate, HttpSession session, List<ScreenContent> list) {
		
		List<ScreenContent> timeList = new ArrayList<ScreenContent>();				
		List<ScreenContent> screenContentList = list;		
		
		for(int i = 0; i<screenContentList.size(); i++){
        	 
        	if(screenDate.equals( screenContentList.get(i).getScreenDate().substring(8, 10) )){
        		ScreenContent tempContent = new ScreenContent();//안으로 넣어야 함 LIST ADD때무네
        		tempContent.setScreenContentNo(screenContentList.get(i).getScreenContentNo());
        		tempContent.setScreenOpenTime(screenContentList.get(i).getScreenOpenTime());
        		tempContent.setTicketOpenDate((screenContentList.get(i).getTicketOpenDate()));
        		timeList.add(tempContent);
        		System.out.println("tempContent에 들어간다 : "+tempContent.toString());
        	}
        }
		return timeList;
	}
	
	@Override
	public Booking getBooking(String bookingNo) {
		System.out.println("BookingServicempl 안, bookingNo : "+bookingNo);
		
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

package com.amc.service.booking;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONException;

import com.amc.common.Search;
import com.amc.service.domain.Booking;
import com.amc.service.domain.Movie;
import com.amc.service.domain.ScreenContent;
import com.amc.service.domain.User;

public interface BookingService {
	
	public List<Movie> getScreenMovieList(); 
	
	public List<ScreenContent> getPreviewList();   
	
	public List<String> getScreenDateList(List<ScreenContent> list, HttpSession session);
	
	public List<ScreenContent> getScreenTimeList(String screenDate, HttpSession session);
	
	public List<ScreenContent> androidScreenTimeList(String screenDate, HttpSession session, List<ScreenContent> list); 
	
	public void addBooking(Booking booking);
	
	public Booking getBookingByInfo(Booking booking);
		
	public void updateStatistic(User user, Booking booking);
	
	public int deleteBooking(String bookingNo) throws IOException, JSONException;
	
	public Booking getBooking(String bookingNo);
	
	public Map<String,Object> getBookingList(Search search);
		
	public void selectCancelAlarm(int screenContentNo);
	
	public void sendPhoneQR(String bookingNo, String phone);
	
	public Map<String,Object> getUserBookingList(Map<String,Object> map);


}

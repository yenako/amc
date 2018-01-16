package com.amc.service.booking;


import java.util.Map;

import com.amc.common.Search;
import com.amc.service.domain.Booking;


public interface BookingDAO {
	
	public void addBooking(Booking booking);
	
	public Booking getBookingByInfo(Booking booking);
	
	public void deleteBooking(String bookingNo);
	
	public Booking getBooking(String bookingNo);
	
	public Map<String,Object> getBookingList(Search search);
	
	public Map<String,Object> getUserBookingList(Map<String,Object> map);

	public void updateStatistic(Search search);
}

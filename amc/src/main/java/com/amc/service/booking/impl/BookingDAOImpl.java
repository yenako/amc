package com.amc.service.booking.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.amc.common.Search;
import com.amc.service.booking.BookingDAO;
import com.amc.service.domain.Booking;


@Repository("bookingDAOImpl")
public class BookingDAOImpl implements BookingDAO {
		
	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
		
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("::" + getClass() +" .setSqlsession Call....");
		this.sqlSession = sqlSession;
	}


	@Override
	public void addBooking(Booking booking) {
		sqlSession.insert("BookingMapper.addBooking", booking);		
	}

	
	@Override
	public Booking getBookingByInfo(Booking booking) {
		return sqlSession.selectOne("BookingMapper.getBookingByInfo", booking);
	}

	@Override
	public void deleteBooking(String bookingNo) {
		sqlSession.delete("BookingMapper.deleteBooking", bookingNo);
	}

	@Override
	public Booking getBooking(String bookingNo) {
		System.out.println("BookingDAOImpl ¾È, bookingNo : "+bookingNo);
		
		return sqlSession.selectOne("BookingMapper.getBooking", bookingNo);
	}

	@Override
	public Map<String,Object> getBookingList(Search search) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list" ,sqlSession.selectList("BookingMapper.getBookingList", search));
		map.put("totalCount" ,sqlSession.selectOne("BookingMapper.getAdminTotalCount", search));
		return map;
	}
	
	@Override
	public Map<String,Object> getUserBookingList(Map<String, Object> map) {
		Map<String,Object> tempMap = new HashMap<String,Object>();
		tempMap.put("totalCount", sqlSession.selectOne("BookingMapper.getTotalCount",map));
		tempMap.put("list", sqlSession.selectList("BookingMapper.getUserBookingList",map));
		return tempMap;
	}


	@Override
	public void updateStatistic(Search search) {
		sqlSession.update("MovieMapper.updateStatistic", search);		
	}




}

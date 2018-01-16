package com.amc.service.cinema;

import java.util.Map;

public interface CinemaService {

		public Map<String, Object> unifiedSearch(String searchKeyword);
		
		public Map<String, Object> index() throws Exception;
		
		public String checkPay(String impUid) throws Exception;
		
		public String cancelPay(String impUid) throws Exception;
		
		public Map<String,Object> getTransportListAtStation(double x, double y, int radius) throws Exception;
}

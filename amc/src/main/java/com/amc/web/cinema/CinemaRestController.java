package com.amc.web.cinema;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amc.common.util.RestApiUtil;
import com.amc.service.cinema.CinemaService;

@RestController
@RequestMapping("/cinema/*")
public class CinemaRestController {
	
	@Autowired
	@Qualifier("cinemaServiceImpl")
	CinemaService cinemaService;
	

	public CinemaRestController() {
		System.out.println("cinemaRestController() default Constructor");
	}
	
	@RequestMapping(value="/json/checkPay/{impUid}", method=RequestMethod.GET)
	public String checkPay(@PathVariable("impUid")String impUid) throws Exception{
		
		return cinemaService.checkPay(impUid);
	}
	
	@RequestMapping(value="/json/cancelPay/{impUid}", method=RequestMethod.GET)
	public String cancelPay(@PathVariable("impUid")String impUid) throws Exception{
		
		return cinemaService.cancelPay(impUid);
	}
	
	@RequestMapping(value="/json/getTransportListAtStation/{x:.+}/{y:.+}/{radius}")
	public Map<String,Object> getTransportListAtStation(@PathVariable("x") double x,@PathVariable("y") double y,
															@PathVariable("radius") int radius
														) throws Exception{
		System.out.println("rest¿« xyradius"+x+"::"+y+"::"+radius);
		return cinemaService.getTransportListAtStation(x, y, radius);
	}
	
}
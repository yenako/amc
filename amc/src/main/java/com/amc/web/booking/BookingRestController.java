package com.amc.web.booking;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jettison.json.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amc.common.Page;
import com.amc.common.Search;
import com.amc.service.alarm.AlarmService;
import com.amc.service.booking.BookingService;
import com.amc.service.cinema.CinemaService;
import com.amc.service.domain.Booking;
import com.amc.service.domain.Movie;
import com.amc.service.domain.ScreenContent;
import com.amc.service.domain.User;
import com.amc.service.movie.MovieService;
import com.amc.service.screen.ScreenService;
import com.amc.service.user.UserService;
import com.amc.web.cinema.HttpRequestToNode;

@RestController
@RequestMapping("/booking/*")
public class BookingRestController {
	
		///Field
		@Autowired
		@Qualifier("bookingServiceImpl")
		private BookingService bookingService;
		@Autowired
		@Qualifier("screenServiceImpl")
		private ScreenService screenService;
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;
		@Autowired
		@Qualifier("cinemaServiceImpl")
		private CinemaService cinemaService;
		@Autowired
		@Qualifier("movieServiceImpl")
		private MovieService movieService;
		@Autowired
		@Qualifier("alarmServiceImpl")
		private AlarmService alarmService;
		//setter Method ���� ����
		
		@Value("#{commonProperties['pageUnit']}")
		// @Value("#{commonProperties['pageUnit'] ?: 3}")
		int pageUnit;

		@Value("#{commonProperties['pageSize']}")
		// @Value("#{commonProperties['pageSize'] ?: 2}")
		int pageSize;
		
		@Value("#{commonProperties['nodeServerIP']}")
		String nodeServerIp;
		
		ObjectMapper objMapper = new ObjectMapper();		
		List<ScreenContent> list;
		
		public BookingRestController() {
			System.out.println(this.getClass());
		}
		
		//�ȵ���̵忡 ���� JSONData�� ������ִ� method
		public String toJSONString(Object obj) throws Exception{
									
			String jsonList = objMapper.writeValueAsString(obj);						
			return new String(jsonList.getBytes("UTF-8"), "UTF-8");
		}
		
		//�ȵ���̵� �׽�Ʈ��
		@RequestMapping( value="json/testAndroid",  method=RequestMethod.GET)
		public String testAndroid() throws Exception{
			
			System.out.println("json/booking/testAndroid : GET");
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("name", "yena");
			jsonObj.put("subject", "computer");
			String sendJson = jsonObj.toString();			
			
			return sendJson;
		}
		
		//[Android] ����1�ܰ� : ��ȭ����
		@RequestMapping( value="json/getScreenMovieList", method=RequestMethod.GET)
		public String getScreenMovieList(Model model) throws Exception{
			
			System.out.println("json/booking/getScreenMovieList : GET");
			
			List<Movie> movieList = bookingService.getScreenMovieList();			
			
			return this.toJSONString(movieList);
		}
		
		//[Android] ����1�ܰ� : ��¥����
		@RequestMapping(value="json/getScreenDateJSON/{movieNo}/{flag}", method=RequestMethod.GET)
		public String getScreenDateJSON(@PathVariable("movieNo") int movieNo, HttpSession session,
											@PathVariable("flag") String flag, 
													Model model) throws Exception{

	        Calendar calendar = Calendar.getInstance();
	        String today =  new SimpleDateFormat("yy/MM/dd").format(calendar.getTime());
	  
	        Search search = new Search();
	        search.setSearchCondition(flag);
	        search.setSearchKeyword(today);
	        System.out.println(":::::::movieNo : "+movieNo);
	        list = screenService.getScreenContentList2(search, movieNo);
			
	        return this.toJSONString(bookingService.getScreenDateList(list, session));
		}
		
		//[Android] ����1�ܰ� : �ð� ����
		@RequestMapping(value="json/getScreenTimeJSON/{screenDate}", method=RequestMethod.GET)
		public String ScreenTimeJSON(@PathVariable("screenDate") String screenDate, HttpSession session,
													Model model) throws Exception{			
			//����ٽ��ؾ������� �ð������ �ӽù�����.
			return this.toJSONString(bookingService.androidScreenTimeList(screenDate, session, list));
		}
		
		//[Android] ���� 2�ܰ� : ������û �� ���ó��� Ȯ���ϱ�
		@RequestMapping(value="json/getBookingInfo/{screenContentNo}/{selectedSeats}", method=RequestMethod.GET)
		public String getBookingInfo(@PathVariable("screenContentNo") int screenContentNo,
									 @PathVariable("selectedSeats") String selectedSeats,
													Model model) throws Exception{	
			Booking booking = new Booking();
			ScreenContent screenContent = screenService.getScreenContent(screenContentNo);
			booking.setScreenContentNo(screenContentNo);
			booking.setScreenContent(screenContent);// ScreeContent class has Movie.
			booking.setMovie(movieService.getMovie(screenContent.getMovie().getMovieNo()));
			
			String seatsNo = selectedSeats.substring(1);
			booking.setBookingSeatNo(seatsNo);
			booking.setHeadCount((seatsNo.split(",").length)/2);
			booking.setTotalTicketPrice(screenContent.getTicketPrice()*(seatsNo.split(",").length)/2);			
			
			return this.toJSONString(booking);
		}
		
		//[Android]����3�ܰ� : �����Ϸ� �� ���ų�������
		@RequestMapping(value="json/addBookingConfirm/{userId}/{screenContentNo}/{bookingSeatNo}/{impId}", method=RequestMethod.GET) 
		public String addBooking(@PathVariable("userId") String userId,
				 				 @PathVariable("screenContentNo") int screenContentNo,
				 				 @PathVariable("bookingSeatNo") String bookingSeatNo,
						 		 @PathVariable("impId") String impUid,
								 HttpSession session, Model model) throws Exception{	
			System.out.println("/booking/requestPay : POST");
			ScreenContent screenContent = screenService.getScreenContent(screenContentNo);
			
			Booking booking = new Booking();
			booking.setImpId(impUid);
			booking.setBookingSeatNo(bookingSeatNo);
			booking.setScreenContentNo(screenContentNo);
			booking.setUserId(userId);
			booking.setHeadCount((bookingSeatNo.split(",").length)/2);
			booking.setTotalTicketPrice(screenContent.getTicketPrice()*booking.getHeadCount());
			String qrUrl = "https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=http://"+nodeServerIp+":8000/booking/getBooking?bookingNo="+impUid;
			booking.setQrUrl(qrUrl);
			
			//1. ADD booking SPRING + ORACLE DB
			System.out.println("�� (1.1) addBooking start :: insert�Ϸ��� booking : "+booking);
			bookingService.addBooking(booking);
			
			//1.2 ADD booking NODE + MONGO DB
			System.out.println("�� (1.2) addBooking node.js start ::");
			String urlStr = "http://"+nodeServerIp+":52273/android_addBooking";
			String body = "seatsNo="+bookingSeatNo+"&screenNo="+screenContentNo;
			
			try {
				int responseCode = HttpRequestToNode.httpRequest(urlStr, body);
				if(responseCode ==200){
					System.out.println("����DB���� ����Ȯ���� �����Ͽ����ϴ�.");
					//return 1;
				}else{
					
					System.out.println("����DB���� ����Ȯ���� �����Ͽ����ϴ�.");
					//return -1;
				}				
			} catch (Exception e) {
				//node.js���� response�ڵ带 ������ ������ ���ؼ� ����� ������ ��찡 �ִ�. Refactoring�ʿ�.
				System.out.println("����DB���� ������ ������ ���� ����");
				//return -1;
			}
			
			//2. GET booking
			booking = bookingService.getBookingByInfo(booking);
			System.out.println("�� (2) getBooking start :: add �� no���� ���Ե� booking : " + booking);
			
			//3. ADD statistic
			System.out.println("�� (3) addStatictic start");
			User user = userService.getUser(userId);
			bookingService.updateStatistic(user, booking);
			
			// DisplaySeat�����
			String[] strArray = booking.getBookingSeatNo().split(",");
			String displaySeat = "";
			int k=0;
	        for(int i=0;i<(strArray.length/2);i++){	        	
	            // �ƽ�Ű �ڵ带 ���������� ��ȯ
	        	int no = Integer.parseInt(strArray[k])+65;	        	
	            String displaySeatNo = Character.toString ((char) no);
	            displaySeat += displaySeatNo + strArray[k+1]+" ";
	            System.out.println("k : "+k+", displaySeat : "+displaySeat);
	            k+=2;
	        }
	        booking.setBookingSeatNo(displaySeat);
			
			return this.toJSONString(booking);
		}
		
		//����1�ܰ� ��¥����
		@RequestMapping(value="json/getScreenDate/{movieNo}/{flag}", method=RequestMethod.GET)
		public List<String> getScreenDate(@PathVariable("movieNo") int movieNo,  HttpSession session,
											@PathVariable("flag") String flag, 
													Model model) throws Exception{

	        Calendar calendar = Calendar.getInstance();
	        String today =  new SimpleDateFormat("yy/MM/dd").format(calendar.getTime());
	  
	        Search search = new Search();
	        search.setSearchCondition(flag);
	        search.setSearchKeyword(today);
	        System.out.println(":::::::movieNo : "+movieNo);
	        List<ScreenContent> list = screenService.getScreenContentList2(search, movieNo);

			return bookingService.getScreenDateList(list, session);
		}
		
		//����1�ܰ� �ð�����
		@RequestMapping(value="json/getScreenTime/{screenDate}", method=RequestMethod.GET)
		public List<ScreenContent> getScreenTime(@PathVariable("screenDate") String screenDate,  HttpSession session,
													Model model) throws Exception{			
			return bookingService.getScreenTimeList(screenDate, session);
		}
		
		//booking content�� �����Ͽ� ȸ������ ������ ���ڷ� �ٲ۴�.
		@RequestMapping(value="json/getDisplaySeatNo/{seatNo}/{ticketPrice}", method=RequestMethod.GET)
		public String getSeatNo(@PathVariable("seatNo") String seatNo, 
								@PathVariable("ticketPrice") int ticketPrice, Model model) throws Exception{		
			String[] strArray = seatNo.split(",");
			String displaySeat = "";
			int k=0;
	        for(int i=0;i<(strArray.length/2);i++){	        	
	            // �ƽ�Ű �ڵ带 ���������� ��ȯ
	        	int no = Integer.parseInt(strArray[k])+65;	        	
	            String displaySeatNo = Character.toString ((char) no);
	            displaySeat += displaySeatNo + strArray[k+1]+" ";
	            System.out.println("k : "+k+", displaySeat : "+displaySeat);
	            k+=2;
	        }
	        int headCount = (StringUtils.countOccurrencesOf(seatNo, ",")+1)/2;
	        
	        JSONObject jsonObj = new JSONObject();
	        jsonObj.put("seatNo", displaySeat);
	        jsonObj.put("headCount", headCount);
	        jsonObj.put("totalPrice",ticketPrice*headCount);
	        
			return (jsonObj.toString());
		}

		@RequestMapping(value="/json/confirmSeat/{clientId}", method=RequestMethod.GET)
		public int confirmSeat(@PathVariable("clientId") String clientId, Model model) throws Exception{
			
	
			String urlStr = "http://"+nodeServerIp+":52273/confirmSeat";
			String body = "clientId="+clientId;
			
			try {
				int responseCode = HttpRequestToNode.httpRequest(urlStr, body);
				if(responseCode ==200){
					System.out.println("����DB���� ����Ȯ���� �����Ͽ����ϴ�.");
					return 1;
				}else{
					System.out.println("����DB���� ����Ȯ���� �����Ͽ����ϴ�.");
					return -1;
				}				
			} catch (Exception e) {
				System.out.println("����DB�� �����ֳ����ϴ�!");
				return -1;
			}
		}
		
		@RequestMapping(value="json/rollbackSeat/{screenContentNo}/{seatNo}/{clientId}", method=RequestMethod.GET)
		public int rollbackSeat(@PathVariable("screenContentNo") int screenContentNo, 
								@PathVariable("seatNo") String seatNo, 
								@PathVariable("clientId") String clientId, Model model) throws Exception{
			
	
			String urlStr = "http://localhost:52273/deleteResv";
			String body = "screenNo="+screenContentNo+"&seat="+seatNo+"&clientId="+clientId;
			
			try {
				int responseCode = HttpRequestToNode.httpRequest(urlStr, body);
				if(responseCode ==200){
					System.out.println("����DB���� ���� ��Ҹ� �����Ͽ����ϴ�.");
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
		
		@RequestMapping(value="/json/refundBooking/{bookingNo}", method=RequestMethod.GET)
		public String refundBooking(@PathVariable("bookingNo") String bookingNo, Model model) throws Exception{
			
			Booking booking = bookingService.getBooking(bookingNo);
			String status = cinemaService.cancelPay(booking.getImpId());

			if(status.equals("cancelled")){			
				System.out.println("1. ȯ�� �Ϸ�");
				return "refunded";
			}else{
				return "failRefund";
			}

		}
		
		//ȸ���� ���Ÿ����ȸ
		@SuppressWarnings("unchecked")
		@RequestMapping(value="/json/getBookingList")
		public Map<String,Object> getBookingList(@ModelAttribute("Search")Search search,HttpSession session,
										@RequestBody String jsonString, Model model) throws Exception {
			
			Map<String,Object> tempMap = new HashMap<String,Object>();
			
			org.json.simple.JSONObject jo = (org.json.simple.JSONObject)JSONValue.parse(jsonString);
			System.out.println((Long)(jo.get("currentPage")));
			System.out.println((String)(jo.get("searchCondition")));
			String searchCondition = (String)(jo.get("searchCondition"));
			search.setCurrentPage(Math.toIntExact((Long)jo.get("currentPage")));
			search.setSearchCondition(searchCondition);
			
			if(search.getCurrentPage()==0){
				search.setCurrentPage(1);
			}
			
			int pageSize = 12;
			
			search.setPageSize(pageSize);
			User user = (User)session.getAttribute("user");
			
			tempMap.put("search", search);
			tempMap.put("user", user);
			
			Map<String, Object> map = bookingService.getUserBookingList(tempMap);
			
			Page resultPage	= 
					new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
							pageUnit, pageSize);
			
			BookingRestController brc = new BookingRestController();
			
			List<Booking> seatChangeList = (List<Booking>)(map.get("list"));
			
			org.json.simple.JSONObject jsonObject = new org.json.simple.JSONObject();
			
			for(int i = 0; i < seatChangeList.size(); i++){
				jsonObject = (org.json.simple.JSONObject)JSONValue.parse(brc.getSeatNo(seatChangeList.get(i).getBookingSeatNo(), 10, model));
				seatChangeList.get(i).setBookingSeatNo((String)jsonObject.get("seatNo"));
			}
			
		    return map;
		}
		
		//�̸��Ϸ� QR�ڵ� ������
		@RequestMapping(value="json/sendEmailQR", method=RequestMethod.GET)
		public void sendEmailQR(@RequestParam("bookingNo") String bookingNo, 
							@RequestParam("userEmailAddr") String userEmailAddr, Model model) throws Exception{			
			
			Booking booking = bookingService.getBooking(bookingNo);

	    	String subject = "AMC���� �����Ͻ� �����Դϴ�.";	
	    	StringBuilder sb = new StringBuilder();  
	    	sb.append("���Ź�ȣ : "+booking.getBookingNo()+"<br>");
	    	if(booking.getScreenContent().getPreviewFlag().equals("Y")){
	    		sb.append(booking.getScreenContent().getPreviewTitle());
	    	}	    	
	    	sb.append("  ["+booking.getMovie().getMovieNm()+"]<br>");
	    	sb.append("���Ͻ� : "+booking.getScreenContent().getScreenOpenTime());
	        sb.append("<br>QR�ڵ带 Ŭ���Ͻø� ���������� Ȯ���Ͻ� �� �ֽ��ϴ�.<br/>" );
	        sb.append("<a href=http://"+nodeServerIp+":8000/booking/getBooking?bookingNo="+booking.getBookingNo()+">");
	        sb.append("<img src='https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=http://"+nodeServerIp+":8000/booking/getBooking?bookingNo="+booking.getBookingNo()+"'/></a>");        
	        
	        userService.send(subject, sb.toString(), "bitcampamc@gmail.com", userEmailAddr, null);
			
			return;
		}
		
		//�̸��Ϸ� QR�ڵ� ������
		@RequestMapping(value="json/sendSMSQR", method=RequestMethod.GET)
		public String sendSMSQR(@RequestParam("bookingNo") String bookingNo, 
							@RequestParam("phone") String phone, 
							HttpSession session, Model model) throws Exception{	
			System.out.println("�� booking/json/sendSMSQR (in restController)");
			
			User user = (User)session.getAttribute("user");
			alarmService.smsPush("booking", bookingNo, user.getUserId(), "");
			return "/alarm/json/push/Booking?"+bookingNo+"&phone="+phone;
		}
		
		
}





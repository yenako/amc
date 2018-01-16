package com.amc.web.screen;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.amc.common.Search;
import com.amc.service.domain.Movie;
import com.amc.service.domain.ScreenContent;
import com.amc.service.screen.ScreenService;
import com.amc.web.cinema.HttpRequestToNode;

@RestController
@RequestMapping("/screen/*")
public class ScreenRestController {

	@Autowired
	@Qualifier("screenServiceImpl")
	private ScreenService screenService;

	public ScreenRestController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "json/getScreenContentList/{movieNo}", method = RequestMethod.GET)
	public List<ScreenContent> getScreenContentList(@ModelAttribute("search") Search search, @PathVariable int movieNo)
			throws Exception {
		System.out.println("json/screen/getScreenContentList :: GET");

		// System.out.println("movieNo ===>" + movieNo);
		// if (search.getCurrentPage() == 0) {
		// search.setCurrentPage(1);
		// }
		//
		// search.setPageSize(pageSize);
		// System.out.println("search값 확인" + search);
		//
		// Page resultPage = new Page(search.getCurrentPage(), ((Integer)
		// map.get("totalCount")).intValue(), pageUnit,
		// pageSize);

		Map<String, Object> map = screenService.getScreenContentList(search, movieNo);

		List<ScreenContent> list = (List<ScreenContent>) map.get("list");

		System.out.println("List값이 뭘까" + list);
		// Page resultPage = new Page(search.getCurrentPage(),
		// ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);

		// System.out.println(resultPage);

		// model.addAttribute("list",map.get("list"));
		// model.addAttribute("resultPage", resultPage);
		// model.addAttribute("search", search);
		System.out.println("json/screen/getScreenContentList :: GET 끝이니");
		return list;
	}

	@RequestMapping(value = "json/addScreenContent", method = RequestMethod.POST)
	public int addScreenContent(@RequestBody ScreenContent screenContent) {

		System.out.println("screen/json/addScreenContent :: POST");

		System.out.println("screenContent값 확인해볼까" + screenContent);

		int addResult = screenService.addScreenContent(screenContent);

		System.out.println("addResult --> " + addResult);
		System.out.println("screen/json/addScreenContent :: POST 끝.....");

		if (addResult == -1 || addResult == -2) {
			return addResult;
		} else { // 상영등록이 성공되었을때
			System.out.println(screenService.getScreenNo(screenContent));
			String screenTheater = screenContent.getScreenTheater();
			int screenContentNo = screenService.getScreenNo(screenContent);

			// mongodb에 좌석현황 추가 부분
			String urlStr = "http://192.168.0.32:52273/addSeats";
			String body = "screenNo=" + screenContentNo + "&theater=" + screenTheater;
			try {
				int responseCode = HttpRequestToNode.httpRequest(urlStr, body);
				if (responseCode == 200) {
					System.out.println("몽고DB에 좌석현황 추가하기를 성공하였습니다.");
					return addResult;
				} else {
					System.out.println("몽고DB에 좌석현황 넣기에 실패하였습니다.");
					screenService.deleteScreenContent(screenContentNo);
					return -3;
				}
			} catch (Exception e) {
				System.out.println("몽고DB가 꺼져있나봅니다!");
				screenService.deleteScreenContent(screenContentNo);
				e.printStackTrace();
				return -3;
			}

		}
	};

	// 상영 내용 수정
	@RequestMapping(value = "json/updateScreenContent/{screenContentNo}", method = RequestMethod.GET)
	public ScreenContent updateScreenContent(@PathVariable int screenContentNo) {
		System.out.println("screen/json/updateScreenContent :: GET 시작...");
		ScreenContent screenContent = screenService.getScreenContent(screenContentNo);

		System.out.println("screenContent 잘 가져오나 볼까" + screenContent);
		System.out.println("screen/json/updateScreenContent :: GET 끝...");

		return screenContent;
	};

	@RequestMapping(value = "json/updateScreenContent/", method = RequestMethod.POST)
	public int updateScreenContent(@RequestBody ScreenContent screenContent ){
		System.out.println("screen/json/updateScreenContent :: POST");

	
		System.out.println("sCreenContent 잘들어오는지 확인 ......... --> " + screenContent);

		return screenService.updateScreenContent(screenContent);
	};

	// 상영 내용 삭제
	@RequestMapping(value = "json/deleteScreenContent/{screenContentNo}", method = RequestMethod.GET)
	public int deleteScreenContent(@PathVariable int screenContentNo) {
		System.out.println("screen/json/deleteScreenContent :: GET");

		return screenService.deleteScreenContent(screenContentNo);
	};


	@RequestMapping(value = "json/checkScreenDupTime", method = RequestMethod.POST)
	public boolean checkScreenDupTime(@RequestBody ScreenContent screenContent) {
		System.out.println("screen/json/checkScreenDupTime :: POST");
		boolean checkScreenDupTime = screenService.checkScreenDupTime(screenContent);
		System.out.println("checkScreenDupTime++++"+checkScreenDupTime);
		return checkScreenDupTime;
	};
	
	
	
	@RequestMapping(value = "json/checkScreenDupPreview", method = RequestMethod.POST)
	public int checkScreenDupPreview(@RequestBody ScreenContent screenContent) {
		System.out.println("screen/json/checkScreenDupPreview :: GET");
		System.out.println("screenContent+++" + screenContent);
		int checkScreenDupPreview = screenService.checkScreenDupPreview(screenContent);
		System.out.println("checkScreenDupTime++++"+checkScreenDupPreview);
		return checkScreenDupPreview;
	};
	
	
	
	

}

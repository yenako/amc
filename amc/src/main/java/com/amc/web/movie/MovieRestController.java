package com.amc.web.movie;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.amc.common.Page;
import com.amc.common.Search;
import com.amc.service.domain.Movie;
import com.amc.service.domain.MovieComment;
import com.amc.service.domain.ScreenContent;
import com.amc.service.domain.User;
import com.amc.service.domain.WishList;
import com.amc.service.domain.onetime.MovieJson;
import com.amc.service.domain.onetime.MovieList;
import com.amc.service.movie.MovieService;
import com.amc.service.screen.ScreenService;
import com.amc.service.user.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

//==> MovieAPI RestController
@RestController

@RequestMapping("/movie/*")
public class MovieRestController {

	/// Field
	@Autowired
	@Qualifier("movieServiceImpl")
	private MovieService movieService;

	// �ظ��߰�
	/// Field
	@Autowired
	@Qualifier("trailerSearchAPIServiceImpl")
	private MovieService movieService2;

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Autowired
	@Qualifier("screenServiceImpl")
	private ScreenService screenService;

	private String dbFileNames;

	// setter Method ���� ����

	public MovieRestController() {
		System.out.println("MovieRestController default constructor call");
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	@RequestMapping(value = "json/getAPIMoiveList", method = RequestMethod.POST)
	public void getAPIMoiveList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<MovieList> list = movieService.getAPIMoiveList();

		MovieJson movieJson = new MovieJson();

		movieJson.setPage(1);
		movieJson.setTotal(12);
		movieJson.setRecords(10);
		movieJson.setRows(list);

		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(movieJson);

		System.out.println("json ====>>>>>  " + json);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();
		out.close();

	}

	//JQGrid���� Operation�� ���� ���� �����ؼ� Add (��ȭ���)�� �ϴ� ���� 
	@RequestMapping(value = "json/addMovie", method = RequestMethod.POST)
	public int addMovie(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Enumeration<?> em = request.getParameterNames();
		List<String> prodList = new ArrayList<String>();
		String oper = "";
		int rtn = 0;

		while (em.hasMoreElements()) {
			String parameterName = (String) em.nextElement();
			String parameterValue = request.getParameter(parameterName);

			System.out.println("parameterName ::" + parameterName);
			System.out.println("parameterValue ::" + parameterValue);

			String[] parameterValues = request.getParameterValues(parameterName);

			if (parameterValues != null) {
				for (int i = 0; i < parameterValues.length; i++) {
					System.out.println("array_" + parameterName + "=" + parameterValues[i]);

					System.out.println(parameterValues.length);

					// Operation del delete from ProductList
					if (parameterValues[i].equals("del")) {
						oper = parameterValues[i];
					} else if (parameterValues[i].equals("add")) {
						oper = parameterValues[i];
					} else if (parameterValues[i].equals("edit")) {
						oper = parameterValues[i];
					} else {

						String[] var = parameterValues[i].split(",");
						for (int j = 0; j < var.length; j++) {
							System.out.println("var :: " + var[j]);

							prodList.add((var[j]));
						}

						System.out.println("proList ===>" + prodList);
					}

				}

			} else {
				System.out.println(parameterName + "=" + parameterValue);
			}
		}

		System.out.println("prodList ::" + prodList);
		String prodList2 = prodList.toString();

		String itemList[] = prodList2.split(",");// Variables declare
		String movieCd = "";
		String delimeter = ",";
		String movieContry = "";
		String directorNms = "";
		String directorNm = "";
		String watchGradeNm = "";
		String movieName = "";
		String genreNms = "";
		String openDate = "";
		String postUrl = "";
		// String movieEndDate = "";
		String syonpsis = "";
		String trailer = "";

		for (int i = 0; i < itemList.length; i++) {
			System.out.println("itemList[" + i + "] : " + itemList[i]);
			movieName = itemList[0];
			movieCd = itemList[1].substring(1, 9);
			// movieName = itemList[1];
			movieContry = itemList[2];
			// movieEndDate = itemList[3];
			openDate = itemList[3];
			syonpsis = itemList[4];
			trailer = itemList[5];
		}
		System.out.println("movieName : " + movieName);
		System.out.println("movieCd : " + movieCd);
		// System.out.println("movieName : " + movieName);
		System.out.println("movieContry : " + movieContry);

		System.out.println("openDate : " + openDate);
		System.out.println("syonpsis : " + syonpsis);
		System.out.println("trailer : " + trailer);

		// movieListResult.setMovieList((List<MovieList>) movieList);

		Movie movie = new Movie();
		movie.setMovieCd(movieCd);
		movie.setOpenDt(openDate);
		movie.setSynopsis(syonpsis);
		movie.setTrailer(trailer);

		if (oper.equals("del")) {
			System.out.println("/movie/json/delMovie : POST");
			// return productService.deleteProductBatch(prodList);
			return 0;

		} else if (oper.equals("add")) {
			System.out.println("/movie/json/addMovie : POST");
			return 0;
		} else

			rtn = movieService.addMovie(movie);

		System.out.println("movieService.addMovie(movie) return code  :: " + rtn);

		if (rtn == 1) {
			System.out.println("New record added successfully! ");
			response.setContentType("text/xml");
			response.setCharacterEncoding("UTF-8");

			// response.sendError(200, "success");
			response.setStatus(200, "OK");

		} else {
			System.out.println("Failed to add Record! : ");
			response.setContentType("text/xml");
			response.setCharacterEncoding("UTF-8");

			// response.sendError(399, "not Inserted successfully");
			response.setStatus(404, "Error while inserting");
		}

		return rtn;

	}

	private final String PATH = "C:/amcPoster/";

	@Autowired
	MappingJackson2JsonView jsonView;

	@RequestMapping(value = "json/upload", method = RequestMethod.POST, produces = "text/plain")
	public ModelAndView upload(MultipartHttpServletRequest request, final HttpServletRequest req) throws Exception {

		System.out.println("json/upload called RestControl ");

		ModelAndView model = new ModelAndView();
		model.setView(jsonView);

		Iterator<String> itr = request.getFileNames();
		String movieNo = req.getParameter("movieNo");

		System.out.println("request.getFileNames() :" + request.getFileNames().toString());

		if (itr.hasNext()) {
			List<MultipartFile> mpf = request.getFiles(itr.next());

			for (int i = 0; i < mpf.size(); i++) {

				System.out.println("mpf.size()" + mpf.size());

				String fileNames = mpf.get(i).getOriginalFilename();
				String delimeter = ",";

				fileNames = new String(fileNames.getBytes("8859_1"), "utf-8");

				dbFileNames += fileNames + delimeter;

				// File file = new File(PATH +
				// mpf.get(i).getOriginalFilename());

				// �ѱۃ��� ����
				File file = new File(PATH + fileNames);

				if (file.exists()) {
					System.out.println("file delete execute...");
					file.delete();

				} else {

					// logger.info(file.getAbsolutePath());
					mpf.get(i).transferTo(file);

					System.out.println("fileName :: " + fileNames);
				}
			}

			JSONObject json = new JSONObject();
			json.put("code", "true");
			model.addObject("result", json);

			System.out.println("dbFileNames testing....  " + dbFileNames);

			System.out.println("json value true ::" + json);
			return model;

		} else {

			JSONObject json = new JSONObject();
			json.put("code", "false");
			model.addObject("result", json);

			System.out.println("json value false ::" + json);
			return model;

		}
	}

	// �� ���� ��ȭ ������ �����ϴ� ����
	@RequestMapping(value = "json/movieOnSchedule", method = RequestMethod.POST)
	public void movieOnSchedule(HttpServletRequest request, HttpServletResponse response, Model model, @ModelAttribute("search") Search search) throws Exception {

		System.out.println("json/movieOnSchedule called RestControl ");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		//search.setPageSize(pageSize);
		search.setPageSize(20);

		search.setSearchKeyword2("5");

		System.out.println("�� ���� ��ȭ �� !!!!");

		if (search.getSearchKeyword() != null) {
			search.setSearchCondition("1");
		}

		System.out.println("pagesize " + search.getPageSize());
		System.out.println("search " + search);

		// Business logic ����
		Map<String, Object> map = movieService.getMovieList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);

		System.out.println(resultPage);

		System.out.println("list show ::" + map.get("list"));

		String str = "";

		List<Movie> list2 = (List<Movie>) map.get("list");

		System.out.println("MoiveCommingSoon list size  ::" + list2.size());

		// Movie JsonObject ����(����)
		JSONObject movieObject = new JSONObject();
		// movie event�� JSON������ ���� Array ����
		JSONArray movieArray = new JSONArray();
		// monthly ������ �� JSONObject ����
		JSONObject monthlynfo = new JSONObject();

		for (int i = 0; i < list2.size(); i++) {
			movieObject.put("id", list2.get(i).getMovieNo());
			movieObject.put("name", list2.get(i).getMovieNm());
			movieObject.put("startdate", list2.get(i).getOpenDt());

			switch (i) {
			case 0:
				movieObject.put("color", "red");
				break;
			case 1:
				movieObject.put("color", "orange");
				break;
			case 2:
				movieObject.put("color", "green");
				break;
			case 3:
				movieObject.put("color", "blue");
				break;
			case 4:
				movieObject.put("color", "purple");
				break;
			case 5:
				movieObject.put("color", "skyblue");
				break;
			case 6:
				movieObject.put("color", "brown");
				break;
			case 7:
				movieObject.put("color", "darkred");
				break;
			case 8:
				movieObject.put("color", "#F1948A");
				break;
			case 9:
				movieObject.put("color", "#82E0AA");
				break;
			case 10:
				movieObject.put("color", "#D2B4DE");
				break;
			case 11:
				movieObject.put("color", "#BB8FCE");
				break;
			case 12:
				movieObject.put("color", "#D1F2EB");
				break;
			case 13:
				movieObject.put("color", "#CB4335");
				break;
			case 14:
				movieObject.put("color", "#76D7C4");
				break;
			case 15:
				movieObject.put("color", "#34495E");
				break;
			default:
				movieObject.put("color", "ivory");
				break;
			}

			movieObject.put("url", "getMovie?movieNo=" + list2.get(i).getMovieNo() + "&menu=movie");

			movieArray.add(i, movieObject);
			movieObject = new JSONObject();
		}

		// *
		// * Domain ��ü���� �޾Ƽ� Json���� �ִ� ���
		// *
		/*
		 * List <MovieOnScheule> movieOnSchedule =
		 * movieService.getScreenCalendar(search);
		 * 
		 * //Movie JsonObject ����(����) JSONObject movieObject = new JSONObject();
		 * //movie event�� JSON������ ���� Array ���� JSONArray movieArray = new
		 * JSONArray(); //monthly ������ �� JSONObject ���� JSONObject monthlynfo =
		 * new JSONObject();
		 * 
		 * 
		 * for (int i = 0; i < movieOnSchedule.size(); i++) {
		 * 
		 * movieObject.put("id", movieOnSchedule.get(i).getId());
		 * movieObject.put("name", movieOnSchedule.get(i).getName());
		 * movieObject.put("startdate", movieOnSchedule.get(i).getStartdate());
		 * 
		 * switch (i) { case 0: movieObject.put("color", "red"); break; case 1:
		 * movieObject.put("color", "orange"); break; case 2:
		 * movieObject.put("color", "green"); break; case 3:
		 * movieObject.put("color", "blue"); break; case 4:
		 * movieObject.put("color", "purple"); break; case 5:
		 * movieObject.put("color", "skyblue"); break; case 6:
		 * movieObject.put("color", "brown"); break; case 7:
		 * movieObject.put("color", "darkred"); break; default:
		 * movieObject.put("color", "ivory"); break; }
		 * 
		 * movieObject.put("url",
		 * "getMovie?movieNo="+movieOnSchedule.get(i).getId()+
		 * "&menu=commingsoon");
		 * 
		 * movieArray.add(i, movieObject);
		 * 
		 * movieObject = new JSONObject(); }
		 */

		System.out.println("movieArray values : " + movieArray.toString());

		// *
		// * Domain ��ü���� �޾Ƽ� Json���� �ִ� ���
		// *
		/*
		 * List <MovieOnScheule> movieOnSchedule =
		 * movieService.getScreenCalendar(search);
		 * 
		 * //Movie JsonObject ����(����) JSONObject movieObject = new JSONObject();
		 * //movie event�� JSON������ ���� Array ���� JSONArray movieArray = new
		 * JSONArray(); //monthly ������ �� JSONObject ���� JSONObject monthlynfo =
		 * new JSONObject();
		 * 
		 * 
		 * for (int i = 0; i < movieOnSchedule.size(); i++) {
		 * 
		 * movieObject.put("id", movieOnSchedule.get(i).getId());
		 * movieObject.put("name", movieOnSchedule.get(i).getName());
		 * movieObject.put("startdate", movieOnSchedule.get(i).getStartdate());
		 * 
		 * switch (i) { case 0: movieObject.put("color", "red"); break; case 1:
		 * movieObject.put("color", "orange"); break; case 2:
		 * movieObject.put("color", "green"); break; case 3:
		 * movieObject.put("color", "blue"); break; case 4:
		 * movieObject.put("color", "purple"); break; case 5:
		 * movieObject.put("color", "skyblue"); break; case 6:
		 * movieObject.put("color", "brown"); break; case 7:
		 * movieObject.put("color", "darkred"); break; default:
		 * movieObject.put("color", "ivory"); break; }
		 * 
		 * movieObject.put("url",
		 * "getMovie?movieNo="+movieOnSchedule.get(i).getId()+
		 * "&menu=commingsoon");
		 * 
		 * movieArray.add(i, movieObject);
		 * 
		 * movieObject = new JSONObject(); }
		 */

		System.out.println("movieArray values : " + movieArray.toString());

		// *
		// * Domain ��ü���� �޾Ƽ� Json���� �ִ� ���
		// *
		/*
		 * List <MovieOnScheule> movieOnSchedule =
		 * movieService.getScreenCalendar(search);
		 * 
		 * //Movie JsonObject ����(����) JSONObject movieObject = new JSONObject();
		 * //movie event�� JSON������ ���� Array ���� JSONArray movieArray = new
		 * JSONArray(); //monthly ������ �� JSONObject ���� JSONObject monthlynfo =
		 * new JSONObject();
		 * 
		 * 
		 * for (int i = 0; i < movieOnSchedule.size(); i++) {
		 * 
		 * movieObject.put("id", movieOnSchedule.get(i).getId());
		 * movieObject.put("name", movieOnSchedule.get(i).getName());
		 * movieObject.put("startdate", movieOnSchedule.get(i).getStartdate());
		 * 
		 * switch (i) { case 0: movieObject.put("color", "red"); break; case 1:
		 * movieObject.put("color", "orange"); break; case 2:
		 * movieObject.put("color", "green"); break; case 3:
		 * movieObject.put("color", "blue"); break; case 4:
		 * movieObject.put("color", "purple"); break; case 5:
		 * movieObject.put("color", "skyblue"); break; case 6:
		 * movieObject.put("color", "brown"); break; case 7:
		 * movieObject.put("color", "darkred"); break; default:
		 * movieObject.put("color", "ivory"); break; }
		 * 
		 * movieObject.put("url",
		 * "getMovie?movieNo="+movieOnSchedule.get(i).getId()+
		 * "&menu=commingsoon");
		 * 
		 * movieArray.add(i, movieObject);
		 * 
		 * movieObject = new JSONObject(); }
		 */

		System.out.println("movieArray values : " + movieArray.toString());

		monthlynfo.put("monthly", movieArray);

		System.out.println("monthlynfo values " + monthlynfo.toString());
		String jsonData = monthlynfo.toJSONString();

		System.out.println("json ====>>>>>  " + jsonData);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		try {
			PrintWriter out = response.getWriter();
			out.write(jsonData);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// �û�ȸ ��ȭ ������ �����ϴ� ����
	@RequestMapping(value = "json/movieOnSchedule_preview", method = RequestMethod.POST)
	public void movieOnSchedule_preview(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("search") Search search, Model model) throws Exception {

		System.out.println("json/movieOnSchedule_preview called RestControl ");

		System.out.println("�û�ȭ ��ȭ �� !!!!");

		System.out.println("/movie/getPreviewList :: ");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		System.out.println("0000000000000000000");
		search.setPageSize(pageSize);

		System.out.println("search�� Ȯ��" + search);

		Map<String, Object> map = screenService.getPreviewList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);

		model.addAttribute("search", map.get("search"));
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);

		System.out.println("search" + map.get("search"));
		System.out.println("list" + map.get("list"));
		System.out.println("totalCount" + map.get("totalCount"));
		System.out.println("resultPage" + resultPage);

		System.out.println("/movie/getPreviewList ::  ��");

		System.out.println("list show ::" + map.get("list"));

		String str = "";

		List<ScreenContent> list = (List<ScreenContent>) map.get("list");

		// Movie JsonObject ����(����)
		JSONObject movieObject = new JSONObject();
		// movie event�� JSON������ ���� Array ����
		JSONArray screenContentArray = new JSONArray();
		// monthly ������ �� JSONObject ����
		JSONObject monthlynfo = new JSONObject();

		for (int i = 0; i < list.size(); i++) {
			movieObject.put("id", list.get(i).getMovie().getMovieNo());
			movieObject.put("name", list.get(i).getMovie().getMovieNm());
			movieObject.put("startdate", list.get(i).getTicketOpenDate());

			switch (i) {
			case 0:
				movieObject.put("color", "red");
				break;
			case 1:
				movieObject.put("color", "orange");
				break;
			case 2:
				movieObject.put("color", "green");
				break;
			case 3:
				movieObject.put("color", "blue");
				break;
			case 4:
				movieObject.put("color", "purple");
				break;
			case 5:
				movieObject.put("color", "skyblue");
				break;
			case 6:
				movieObject.put("color", "brown");
				break;
			case 7:
				movieObject.put("color", "darkred");
				break;
			default:
				movieObject.put("color", "ivory");
				break;
			}

			movieObject.put("url", "getMovie?movieNo=" + list.get(i).getMovie().getMovieNo() + "&menu=preview");

			screenContentArray.add(i, movieObject);
			movieObject = new JSONObject();
		}

		System.out.println("movieArray values : " + screenContentArray.toString());

		monthlynfo.put("monthly", screenContentArray);

		System.out.println("monthlynfo values " + monthlynfo.toString());
		String jsonData = monthlynfo.toJSONString();

		System.out.println("json ====>>>>>  " + jsonData);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		try {
			PrintWriter out = response.getWriter();
			out.write(jsonData);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// �ظ� �߰�
	@RequestMapping(value = "json/addMovieComment", method = RequestMethod.POST)
	public int addMovieComment(@RequestBody MovieComment movieComment) {

		System.out.println("movieRestController�� addScreenContent���� ");

		System.out.println("1.screenContent ==> " + movieComment);

		/// screenService.addScreenContent(screenContent);
		System.out.println("screen/json/addScreenContent :: POST ��.....");

		return movieService.addMoiveComment(movieComment);

	};

	// �ظ� �߰�
	@RequestMapping(value = "json/getMovieComment/{movieCommentNo}", method = RequestMethod.GET)
	public MovieComment getMovieComment(@PathVariable int movieCommentNo) {

		System.out.println("movieRestController�� getMovieComment���� ");

		System.out.println("1.movieCommentNo ==> " + movieCommentNo);

		/// screenService.addScreenContent(screenContent);
		System.out.println("screen/json/getMovieComment :: POST ��.....");

		return movieService.getMovieComment(movieCommentNo);

	};

	// �ظ� �߰�
	@RequestMapping(value = "json/updateMovieComment", method = RequestMethod.POST)
	public int updateMovieComment(@RequestBody MovieComment movieComment) {

		System.out.println("movieRestController�� updateMovieComment���� ");

		System.out.println("1.movieComment ==> " + movieComment);

		/// screenService.addScreenContent(screenContent);
		System.out.println("screen/json/updateMovieComment :: POST ��.....");

		return movieService.updateMovieComment(movieComment);

	};

	// �ظ� �߰�
	@RequestMapping(value = "json/deleteMovieComment/{movieCommentNo}", method = RequestMethod.GET)
	public int deleteMovieComment(@PathVariable int movieCommentNo) {

		System.out.println("movieRestController�� deleteMovieComment���� ");

		System.out.println("1.movieCommentNo ==> " + movieCommentNo);

		/// screenService.addScreenContent(screenContent);
		System.out.println("screen/json/deleteMovieComment :: POST ��.....");

		return movieService.deleteMovieComment(movieCommentNo);

	};

	// �ظ� �߰�
	@RequestMapping(value = "json/blindMoiveComment", method = RequestMethod.POST)
	public int blindMoiveComment(@RequestBody MovieComment movieComment) {

		System.out.println("movieRestController�� blindMoiveComment���� ");

		System.out.println("1.movieCommentNo ==> " + movieComment);

		/// screenService.addScreenContent(screenContent);
		System.out.println("movieRestController�� blindMoiveComment :: POST ��.....");

		return movieService.blindMoiveComment(movieComment);

	};

	// �ظ� �߰�
	@RequestMapping(value = "json/getMovieCommentList/{movieNo}")
	public List<MovieComment> getMovieCommentList(@ModelAttribute("search") Search search, @PathVariable int movieNo) throws Exception {
		System.out.println("movieRestController�� getMovieCommentList���� ");
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		System.out.println("???????????????????????????????????????????????? " + search.getStartRowNum());
		if (search.getStartRowNum() == 2) {
			search.setStartRowNum(2);
		} else if (search.getStartRowNum() == 1) {
			search.setStartRowNum(2);
		} else {
			search.setStartRowNum(0);
		}

		search.setPageSize(pageSize);

		System.out.println("1. search ==> " + search);
		System.out.println("2. movieNo ==> " + movieNo);
		System.out.println("movieRestController�� getMovieCommentList :: POST ��.....");
		Map<String, Object> map = movieService.getMovieCommentList(search, movieNo);
		System.out.println("3. map ==> " + map);

		List<MovieComment> list = (List<MovieComment>) map.get("list");

		System.out.println("4. list ==> ?" + list);
		return list;
	}
	/*
	 * @RequestMapping(value = "json/getMovieCommentList", method =
	 * RequestMethod.POST) public List<MovieComment>
	 * getMovieCommentList(@RequestBody MovieComment movieComment) throws
	 * Exception {
	 * System.out.println("movieRestController�� getMovieCommentList���� "); Search
	 * search = movieComment.getSearch();
	 * 
	 * System.out.println("1. search ==> " + search);
	 * 
	 * if (search.getCurrentPage() == 0) { search.setCurrentPage(1); }
	 * 
	 * int movieNo = movieComment.getMovie().getMovieNo();
	 * 
	 * search.setPageSize(pageSize);
	 * 
	 * System.out.println("1-1. search ==> " + search); //
	 * System.out.println("2. movieNo ==> "+ movieNo); System.out.
	 * println("movieRestController�� getMovieCommentList :: POST ��.....");
	 * Map<String, Object> map = movieService.getMovieCommentList(search,
	 * movieNo);
	 * 
	 * System.out.println("3. map ==> " + map);
	 * 
	 * List<MovieComment> list = (List<MovieComment>) map.get("list");
	 * 
	 * System.out.println("4. list ==> " + list); return list; }
	 */
	// �ظ��߰�

	@RequestMapping(value = "json/getTotalCount/{movieNo}")
	public Page getFreeBoardTotalCount(@ModelAttribute("search") Search search, @PathVariable int movieNo) throws Exception {

		System.out.println("communityRestController�� getFreeBoardTotalCount ����...");
		System.out.println("1. search�� ==> " + search);
		System.out.println("2. movieNo ==> " + movieNo);
		int totalCount = movieService.getTotalCount(movieNo);
		System.out.println("3. totalCount�� �� ==> " + totalCount);

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);

		System.out.println("4. search ==> " + search);

		System.out.println("5. getFreeBoardTotalCount ==> " + totalCount);

		Page resultPage = new Page(search.getCurrentPage(), totalCount, pageUnit, pageSize);
		System.out.println("6. resultPage ==> " + resultPage);

		System.out.println("communityRestController�� freeBoardCommentList�޼ҵ� ��");

		return resultPage;

	}

	@RequestMapping(value = "/json/switchWishList")
	public String switchWishList(@ModelAttribute("wishList") WishList wishList) {
		return movieService.switchWishList(wishList);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/wishList/{userId:.+}")
	public String wishList(@PathVariable String userId) {
		Map<String, Object> tempMap = new HashMap<String, Object>();
		List<WishList> list = new ArrayList<WishList>();
		User user = new User();
		user.setUserId(userId);
		tempMap.put("user", user);

		list = ((List<WishList>) movieService.getWishList(tempMap).get("list"));

		System.out.println("list : " + list);

		JSONObject jsonObject = new JSONObject();
		JSONObject response = new JSONObject();
		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < list.size(); i++) {
			jsonObject.put("movie_title", list.get(i).getMovie().getMovieNm());
			jsonObject.put("wishNo", list.get(i).getWishNo());
			jsonObject.put("wishRegDate", list.get(i).getWishRegDate());
			jsonObject.put("poster", list.get(i).getMovie().getPostUrl());
			jsonObject.put("movieNo", list.get(i).getMovie().getMovieNo());

			jsonArray.add(jsonObject);

			jsonObject = new JSONObject();

			jsonArray.add(i, jsonObject);

		}
		response.put("wishList", jsonArray);

		System.out.println("response content" + response);

		return response.toString();
	}

	@RequestMapping(value = "/json/getInfiWishList/{userId:.+}")
	public Map<String, Object> getInfiWishList(@ModelAttribute("Search") Search search, HttpSession session, Model model, @PathVariable("userId") String userId, @RequestBody String jsonString) throws Exception {

		Map<String, Object> tempMap = new HashMap<String, Object>();

		JSONObject jo = (JSONObject) JSONValue.parse(jsonString);
		System.out.println("���������� : " + (Long) (jo.get("currentPage")));
		search.setCurrentPage(Math.toIntExact((Long) jo.get("currentPage")));

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		pageSize = 12;

		System.out.println("���ѽ�ũ�ѿ� ���ø���Ʈ �������̵� : " + userId);

		search.setPageSize(pageSize);
		User user = (User) session.getAttribute("user");

		tempMap.put("search", search);
		tempMap.put("user", user);

		Map<String, Object> map = movieService.getWishList(tempMap);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);

		System.out.println("�������ø���Ʈ Ȯ�Ρ��� : " + map.get("listWish"));

		return map;
	}

	/// checkWishList �ظ���
	@RequestMapping(value = "/json/checkWishList")
	public String checkWishList(@ModelAttribute("wishList") WishList wishList) {
		return movieService.checkWishList(wishList);

	}

	@RequestMapping(value = "/json/deleteWishList/{wishNo}")
	public int deleteWishList(HttpSession session, Model model, @PathVariable("wishNo") String wishNo) throws Exception {
		WishList wishList = new WishList();
		Movie movie = new Movie();
		User user = new User();
		movie.setMovieNo(0);
		wishList.setMovie(movie);
		wishList.setUser(user);
		wishList.setWishFlag("");
		wishList.setWishNo(Integer.parseInt(wishNo));
		return movieService.deleteWishList(wishList);
	}

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////�ȵ���̵�� ����//////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/androidGetMovieList")
	public String getMovieList(@ModelAttribute("search") Search search, Model model, HttpSession session, HttpServletRequest request) throws Exception {

		System.out.println("/getMovieList  GET ");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		pageSize = 1000000;

		search.setPageSize(pageSize);

		User user = userService.getUser(request.getParameter("userId"));

		System.out.println("pagesize " + search.getPageSize());

		System.out.println("search " + search);

		System.out.println("menu :" + request.getParameter("menu"));

		if (request.getParameter("menu").equals("manage")) {

			search.setSearchKeyword2("manage");
			search.setSearchKeyword3("manage");

			//System.out.println("search.setSearchKeyword2 [[manage]]" + search.getSearchKeyword2());
		} else {
			// ���� �� ��ȭ�� ��� ����
			if ((request.getParameter("menu").equals("movie")) || (request.getParameter("menu").equals("search"))) {

				System.out.println("���� �� ��ȭ �� !!!!");

				search.setSearchKeyword2("4");

				if (search.getSearchKeyword() != null) {
					search.setSearchCondition("1");
				}
			}

			// ���� �� ���� ��ȭ��  ��� ����
			if (request.getParameter("menu").equals("commingsoon")) {
				search.setSearchKeyword2("5");

				System.out.println("�� ���� ��ȭ �� !!!!");

				if (search.getSearchKeyword() != null) {
					search.setSearchCondition("1");
				}
			}
		}

		if (user != null) {
			System.out.println("User not null ....");

			Map<String, Object> tempMap = new HashMap<String, Object>();

			tempMap.put("search", search);
			tempMap.put("user", user);

			List<WishList> listWish = ((List<WishList>) movieService.getWishList(tempMap).get("listWish"));

			System.out.println("listWish  length::" + listWish.size() + "listWish  :: " + listWish);

			Map<String, Object> map = movieService.getMovieList(search);
			List<Movie> movieList = (List) map.get("list");
			System.out.println("listMovie length::" + movieList.size() + "listMovie :: " + movieList);

			for (int i = 0; i < movieList.size(); i++) {
				for (int j = 0; j < listWish.size(); j++) {
					if (movieList.get(i).getMovieNo() == listWish.get(j).getMovie().getMovieNo()) {
						movieList.get(i).setWishList(listWish.get(j));
						System.out.println("movieList wishList exists (WishNo) :" + movieList.get(i).getWishList().getWishNo());
					}
				}
			}

			Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
			System.out.println(resultPage);

			System.out.println("search condition :: " + search.getSearchCondition());

			// Model �� View ����
			model.addAttribute("list", map.get("list"));
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);

			System.out.println("list show ::" + map.get("list"));

			JSONObject data = null;
			JSONArray jsonArray = new JSONArray();
			JSONObject response = new JSONObject();

			for (int i = 0; i < movieList.size(); i++) {
				data = new JSONObject();
				data.put("movieNm", URLEncoder.encode(movieList.get(i).getMovieNm(), "UTF-8"));
				data.put("openDt", URLEncoder.encode(movieList.get(i).getOpenDt(), "UTF-8"));
				data.put("movieNo", movieList.get(i).getMovieNo());
				if (movieList.get(i).getTrailer() != null && !movieList.get(i).getTrailer().equals("")) {
					data.put("trailer", URLEncoder.encode(movieList.get(i).getTrailer(), "UTF-8"));
				}
				data.put("genres", URLEncoder.encode(movieList.get(i).getGenres(), "UTF-8"));
				data.put("watchGradeNm", URLEncoder.encode(movieList.get(i).getWatchGradeNm(), "UTF-8"));
				data.put("postUrl", URLEncoder.encode(movieList.get(i).getPostUrl(), "UTF-8"));
				if (movieList.get(i).getSteelCut() != null && !movieList.get(i).getSteelCut().equals("")) {
					data.put("steelCut", URLEncoder.encode(movieList.get(i).getSteelCut(), "UTF-8"));
				}
				jsonArray.add(data);
			}
			response.put("list", jsonArray);

			return response.toJSONString();

		} else {
			Map<String, Object> map = movieService.getMovieList(search);
			List<Movie> movieList = (List) map.get("list");
			System.out.println("listMovie length::" + movieList.size() + "listMovie :: " + movieList);

			Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
			System.out.println(resultPage);

			System.out.println("search condition :: " + search.getSearchCondition());

			// Model �� View ����
			model.addAttribute("list", map.get("list"));
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);

			System.out.println("list show ::" + map.get("list"));
		}

		// Business logic ����
		// ������ �˻����� �Ϲ��� �˻����� Ȯ���ϱ� ���� ���� 
		// "searchCondtion=7" �� �Ϲ��� �˻���  �ش�� 		

		if (request.getParameter("menu").equals("movie")) {
			System.out.println("listMovie.jsp called");
			//modelAndView.setViewName("/movie/listMovie.jsp"); 
			return "forward:/movie/listMovie.jsp";
			// return modelAndView;
		} else if (request.getParameter("menu").equals("manage")) {
			System.out.println("listMovieManage.jsp called");
			//modelAndView.setViewName("/movie/listMovieManage.jsp");
			return "forward:/movie/listMovieManage.jsp";
		} else if (request.getParameter("menu").equals("calendar")) {
			System.out.println("calendar.jsp called");
			//modelAndView.setViewName("/movie/calendar.jsp");
			return "forward:/movie/calendar.jsp";
		} else if (request.getParameter("menu").equals("commingsoon")) {
			//modelAndView.setViewName("/movie/listCommingSoon.jsp");
			return "forward:/movie/listCommingSoon.jsp";
		} else if (request.getParameter("menu").equals("preview")) {
			System.out.println("????????");
			//modelAndView.setViewName("/movie/listMoviePreview.jsp");
			return "forward:/movie/getPreviewList";
		} else if (request.getParameter("menu").equals("search")) {
			//modelAndView.setViewName("/movie/listMovie.jsp");
			return "forward:/movie/listMovie.jsp";
		} else if (request.getParameter("menu").equals("voiceRegniiton")) {
			//modelAndView.setViewName("/movie/listMovie.jsp");
			return "forward:/movie/speechMovie.jsp";
		}

		return "forward:/movie/listMovie.jsp";
	}

	@RequestMapping(value = "/json/androidGetMovie")
	public String getMovie(@RequestParam(value = "menu", required = true) String menu, @RequestParam(value = "movieNo", required = true) Integer movieNo) throws Exception {

		// Business Logic
		System.out.println("movieNo ::" + movieNo);

		Movie movie = movieService.getMovie(movieNo);

		ObjectMapper objectMapper = new ObjectMapper();

		String jsonString = URLEncoder.encode(objectMapper.writeValueAsString(movie), "UTF-8");

		return jsonString;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/androidGetPreviewList")
	public String getPreviewList(@ModelAttribute("search") Search search, Model model) throws Exception {

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		pageSize = 1000000;

		search.setPageSize(pageSize);

		System.out.println("search�� Ȯ��" + search);

		Map<String, Object> map = screenService.getPreviewList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);

		model.addAttribute("search", map.get("search"));
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);

		List<ScreenContent> previewList = (List<ScreenContent>) map.get("list");

		org.json.simple.JSONArray jsonArray = new org.json.simple.JSONArray();
		JSONObject response = new JSONObject();
		ObjectMapper objectMapper = new ObjectMapper();

		for (int i = 0; i < previewList.size(); i++) {

			objectMapper = new ObjectMapper();

			jsonArray.add(objectMapper.writeValueAsString(previewList.get(i)));
		}

		response.put("list", jsonArray);

		String jsonString = URLEncoder.encode(response.toJSONString(), "UTF-8");

		return jsonString;
	};

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////�ȵ���̵�� ��////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/searchTrailer/{searchTrailer}", method = RequestMethod.GET)
	public String searchTrailer(@PathVariable("searchTrailer") String searchTrailer) throws Exception {
		// searchTrailer = URLDecoder.decode(searchTrailer, "euc-kr");
		//searchTrailer = new String(searchTrailer.getBytes("8859_1"), "UTF-8");
		searchTrailer = URLDecoder.decode(searchTrailer, "UTF-8");
		System.out.println("2. searchTrailer => " + searchTrailer);

		String result = movieService2.searchTrailer(searchTrailer);
		System.out.println("3. result => " + result);

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
		// JSONObject jObject = (JSONObject)jsonParser.parse(jsonObject);
		System.out.println("4. jsonObject   -> " + jsonObject);
		// JSONObject json = (JSONObject)jsonObject.get("documents");
		JSONArray array = (JSONArray) jsonObject.get("documents");

		JSONObject data = null;
		JSONArray jsonArray = new JSONArray();
		JSONObject response = new JSONObject();

		for (int i = 0; i < array.size(); i++) {
			data = new JSONObject();
			JSONObject documents = (JSONObject) array.get(i);
			String title = documents.get("title").toString();
			String thumbnail = documents.get("thumbnail").toString();
			String url = documents.get("url").toString();
			String author = documents.get("author").toString();

			System.out.println("title   => " + title);
			System.out.println("thumbnail   => " + thumbnail);
			System.out.println("url   => " + url);
			System.out.println("author   => " + author);

			System.out.println("test " + url.indexOf("youtube"));
			if (url.indexOf("youtube") != -1) {

				url = url.replace("watch?v=", "embed/");
				System.out.println("url�� Ȯ�� " + url);
				data.put("title", title);
				data.put("thumbnail", thumbnail);
				data.put("url", url);
				jsonArray.add(data);
			}

		}

		response.put("list", jsonArray);

		System.out.println("?????" + response.toString());

		return response.toString();

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/searchPoster/{searchPoster}", method = RequestMethod.GET)
	public String searchPoster(@PathVariable("searchPoster") String searchPoster) throws Exception {
		//searchPoster = URLDecoder.decode(searchPoster.getBytes("8859_1"), "UTF-8");

		System.out.println("searchPoster ���ڵ� ��" + searchPoster);
		//searchPoster = new String(searchPoster.getBytes("8859_1"), "UTF-8");
		searchPoster = URLDecoder.decode(searchPoster, "UTF-8");
		System.out.println("2. searchPoster => " + searchPoster);

		String result = movieService2.searchPoster(searchPoster);
		System.out.println("3. result => " + result);

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
		System.out.println("4. jsonObject   -> " + jsonObject);
		JSONArray array = (JSONArray) jsonObject.get("documents");

		JSONObject data = null;
		JSONArray jsonArray = new JSONArray();
		JSONObject response = new JSONObject();

		for (int i = 0; i < array.size(); i++) {
			data = new JSONObject();
			JSONObject documents = (JSONObject) array.get(i);
			String thumbnail_url = documents.get("thumbnail_url").toString();
			String image_url = documents.get("image_url").toString();
			int width = Integer.parseInt(documents.get("width").toString());
			int height = Integer.parseInt(documents.get("height").toString());

			int count = image_url.lastIndexOf("type");

			if (count == -1) {
				if (width > 500 && width < height) {
					data.put("thumbnail_url", thumbnail_url);
					data.put("image_url", image_url);
					data.put("width", documents.get("width"));
					data.put("height", documents.get("height"));
					jsonArray.add(data);
				}
			}

		}
		System.out.println("2. searchPoster => " + searchPoster);
		response.put("list", jsonArray);

		return response.toString();

	}

}

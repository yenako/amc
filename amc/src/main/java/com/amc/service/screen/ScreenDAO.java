package com.amc.service.screen;

import java.util.List;
import java.util.Map;

import com.amc.common.Search;
import com.amc.service.domain.Movie;
import com.amc.service.domain.ScreenContent;

public interface ScreenDAO {

	// 상영관리를 위한 영화목록 가져오기
	public Map<String, Object> getMovieList(Search search);

	// 상영관리를 위한 영화 가져오기
	public Movie getMovie(int movieNo);

	// 상영 내용 리스트 불러오기
	public Map<String, Object> getScreenContentList(Search search, int movieNo);

	// [예매1단계용] 상영 내용 리스트 불러오기
	public List<ScreenContent> getScreenContentList2(Search search, int movieNo);

	// 상영 내용 등록
	public int addScreenContent(ScreenContent screenContent);

	// 상영 내용 등록 전 상영시간 중복 체크
	public int checkScreenDupTime(ScreenContent screenContent);

	// 상영 내용 수정을 위한 상영 내용 가져오기
	public ScreenContent getScreenContent(int screenContentNo);

	// 상영 내용 수정
	public int updateScreenContent(ScreenContent screenContent);

	// 상영 내용 삭제
	public int deleteScreenContent(int screenContentNo);

	public Map<String, Object> getWishList(Map<String, Object> map);

	public int getTotalCount(Search search) throws Exception;

	public int getTotalCount(int movieNo) throws Exception;

	public int checkScreenDupPreview(ScreenContent screenContent);

	// 오늘 티켓 오픈하는 리스트 불러오기
	public List<ScreenContent> getTodayTicketOpenList(Search search);

	public int getScreenNo(ScreenContent screenContent);

	public int getTotalPreviewCount(Search search) throws Exception;

	public Map<String, Object> getPreviewList(Search search);

}

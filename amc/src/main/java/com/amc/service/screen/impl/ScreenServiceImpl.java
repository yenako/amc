package com.amc.service.screen.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.amc.common.Search;
import com.amc.service.domain.Movie;
import com.amc.service.domain.ScreenContent;
import com.amc.service.screen.ScreenDAO;
import com.amc.service.screen.ScreenService;

@Repository("screenServiceImpl")
public class ScreenServiceImpl implements ScreenService {

	@Autowired
	@Qualifier("screenDAOImpl")
	private ScreenDAO screenDAO;

	public void setScreenDAO(ScreenDAO screenDAO) {
		this.screenDAO = screenDAO;
	}

	public ScreenServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Map<String, Object> getMovieList(Search search) throws Exception {

		System.out.println("ScreenServiceImpl�� getMovieList �޼ҵ� ����..");
		int totalCount = screenDAO.getTotalCount(search);
		Map<String, Object> map = screenDAO.getMovieList(search);
		map.put("totalCount", new Integer(totalCount));
		// Page resultPage = new Page(search.getCurrentPage(),)

		System.out.println("ScreenServiceImpl�� getMovieList �޼ҵ� ��..");

		return map;
	}
	

	@Override
	public Map<String, Object> getPreviewList(Search search) throws Exception {

		System.out.println("ScreenServiceImpl�� getPreviewList �޼ҵ� ����..");
		int totalCount = screenDAO.getTotalPreviewCount(search);
		System.out.println("1. totalCount�� �� :::::: " + totalCount);
		Map<String, Object> map = screenDAO.getPreviewList(search);
		System.out.println("1. map�� �� :::::: " + map);
		
		map.put("totalCount", new Integer(totalCount));
		// Page resultPage = new Page(search.getCurrentPage(),)

		System.out.println("ScreenServiceImpl�� getPreviewList �޼ҵ� ��..");

		return map;
	}
	
	@Override
	public Map<String,Object> getWishList(Map<String,Object> map) {
		
		System.out.println("777777777777777777");
		return screenDAO.getWishList(map);
	}


	@Override
	public Movie getMovie(int movieNo) {

		System.out.println("ScreenServiceImpl�� getMovie �޼ҵ� ����..");

		return screenDAO.getMovie(movieNo);
	}

	@Override
	public Map<String, Object> getScreenContentList(Search search, int movieNo) throws Exception {
		System.out.println("ScreenServiceImpl�� getScreenContentList �޼ҵ� ����..");

		System.out.println("ScreenServiceImpl�� getMovieList �޼ҵ� ����..");
		int totalCount = screenDAO.getTotalCount(movieNo);
		Map<String, Object> map = screenDAO.getScreenContentList(search, movieNo);
		map.put("totalCount", new Integer(totalCount));
		// Page resultPage = new Page(search.getCurrentPage(),)

		System.out.println("ScreenServiceImpl�� getMovieList �޼ҵ� ��..");

		return map;
	}

	// [����1�ܰ��]
	@Override
	public List<ScreenContent> getScreenContentList2(Search search, int movieNo) {
		System.out.println("ScreenServiceImpl�� getScreenContentList �޼ҵ� ����..");

		return screenDAO.getScreenContentList2(search, movieNo);
	}

	@Override
	public int addScreenContent(ScreenContent screenContent) {
		System.out.println("ScreenServiceImpl�� addScreenContent �޼ҵ� ����..");

		boolean checkScreenDupTime = checkScreenDupTime(screenContent);
		int checkScreenDupPreview = checkScreenDupPreview(screenContent);

		System.out.println("checkScreenDupPreview++++++++++++++++++++" + checkScreenDupPreview);
		System.out.println("screenContent.getPreviewFlag()++++++"+screenContent.getPreviewFlag());
		if (screenContent.getPreviewFlag().equals("Y")) {
			if (checkScreenDupPreview == 0) {
				if (checkScreenDupTime) {					
					return screenDAO.addScreenContent(screenContent);
				} else {
					System.out.println("�ߺ����ߺ�");
					return -1;
				}
			} else {
				System.out.println("�̹� �û�ȸ ��ϵǾ�����");
				return -2;
			}

		} else {
			if (checkScreenDupTime) {
				return screenDAO.addScreenContent(screenContent);
			} else {
				System.out.println("�ߺ����ߺ�");
				return -1;
			}
		}

	}

	@Override
	public boolean checkScreenDupTime(ScreenContent screenContent) {

		System.out.println("ScreenServiceImpl�� checkScreenDupTime �޼ҵ� ����..");

		System.out.println("���� �̰���" + screenDAO.checkScreenDupTime(screenContent));
		int checkScreenDupTime = screenDAO.checkScreenDupTime(screenContent);

		if (checkScreenDupTime == 0) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public int checkScreenDupPreview(ScreenContent screenContent) {

		System.out.println("ScreenServiceImpl�� checkScreenDupPreview �޼ҵ� ����..");

		System.out.println("���� �̰���" + screenDAO.checkScreenDupPreview(screenContent));
		int checkScreenDupTime = screenDAO.checkScreenDupPreview(screenContent);

		return checkScreenDupTime;
	}

	@Override
	public ScreenContent getScreenContent(int screenContentNo) {
		System.out.println("ScreenServiceImpl�� getScreenContent �޼ҵ� ����..");

		return screenDAO.getScreenContent(screenContentNo);
	}

	@Override
	public int updateScreenContent(ScreenContent screenContent) {
		System.out.println("ScreenServiceImpl�� updateScreenContent �޼ҵ� ����..");

		System.out.println("screenContent�� �������ڿ�" + screenContent);
		boolean checkScreenDupTime = checkScreenDupTime(screenContent);

		int checkScreenDupPreview = checkScreenDupPreview(screenContent);
		
		System.out.println("checkScreenDupTime+++"+checkScreenDupTime );
		System.out.println("checkScreenDupPreview+++"+checkScreenDupPreview);
		if (screenContent.getPreviewFlag().equals("Y")) {
			if (checkScreenDupPreview == 0) {
				if (checkScreenDupTime) {
					return screenDAO.updateScreenContent(screenContent);
				} else {
					System.out.println("�ߺ����ߺ�");
					return -1;
				}
			} else {
				System.out.println("�̹� �û�ȸ ��ϵǾ�����");
				return -2;
			}

		} else {
			if (checkScreenDupTime) {
				return screenDAO.updateScreenContent(screenContent);
			} else {
				System.out.println("�ߺ����ߺ�");
				return -1;
			}
		}

	}

	@Override
	public int deleteScreenContent(int screenContentNo) {
		System.out.println("ScreenServiceImpl�� deleteScreenContent �޼ҵ� ����..");

		return screenDAO.deleteScreenContent(screenContentNo);
	}

	@Override
	// ���� Ƽ�� �����ϴ� ����Ʈ �ҷ�����
	public List<ScreenContent> getTodayTicketOpenList(Search search) {
		
		return screenDAO.getTodayTicketOpenList(search);
	};
	@Override
	// ��ũ���󿵹�ȣ��������
	public int getScreenNo(ScreenContent screenContent) {
		return screenDAO.getScreenNo(screenContent);
		
	}
	
	

}

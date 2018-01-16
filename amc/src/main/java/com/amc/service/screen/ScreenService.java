package com.amc.service.screen;

import java.util.List;
import java.util.Map;

import com.amc.common.Search;
import com.amc.service.domain.Movie;
import com.amc.service.domain.ScreenContent;

public interface ScreenService {

	// �󿵰����� ���� ��ȭ��� ��������
	public Map<String, Object> getMovieList(Search search) throws Exception;
	
	// �û�ȸ WishList ��������
	public Map<String, Object> getWishList(Map<String,Object> map) throws Exception;

	// �󿵰����� ���� ��ȭ ��������
	public Movie getMovie(int movieNo);

	// �� ���� ����Ʈ �ҷ�����
	public Map<String, Object> getScreenContentList(Search search, int movieNo) throws Exception;
	
	// [����1�ܰ�] �� ���� ����Ʈ �ҷ�����
	public List<ScreenContent> getScreenContentList2(Search search, int movieNo);

	// �� ���� ���
	public int addScreenContent(ScreenContent screenContent);

	// �� ���� ��� �� �󿵽ð� �ߺ� üũ
	public boolean checkScreenDupTime(ScreenContent screenContent);

	// �� ���� ������ ���� �� ���� ��������
	public ScreenContent getScreenContent(int screenContentNo);

	// �� ���� ����
	public int updateScreenContent(ScreenContent screenContent);

	// �� ���� ����
	public int deleteScreenContent(int screenContentNo);

	// ���� Ƽ�� �����ϴ� ����Ʈ �ҷ�����
	public List<ScreenContent> getTodayTicketOpenList(Search search);

	public int checkScreenDupPreview(ScreenContent screenContent);

	public int getScreenNo(ScreenContent screenContent);

	public Map<String, Object> getPreviewList(Search search) throws Exception;

}

package com.amc.service.screen;

import java.util.List;
import java.util.Map;

import com.amc.common.Search;
import com.amc.service.domain.Movie;
import com.amc.service.domain.ScreenContent;

public interface ScreenDAO {

	// �󿵰����� ���� ��ȭ��� ��������
	public Map<String, Object> getMovieList(Search search);

	// �󿵰����� ���� ��ȭ ��������
	public Movie getMovie(int movieNo);

	// �� ���� ����Ʈ �ҷ�����
	public Map<String, Object> getScreenContentList(Search search, int movieNo);

	// [����1�ܰ��] �� ���� ����Ʈ �ҷ�����
	public List<ScreenContent> getScreenContentList2(Search search, int movieNo);

	// �� ���� ���
	public int addScreenContent(ScreenContent screenContent);

	// �� ���� ��� �� �󿵽ð� �ߺ� üũ
	public int checkScreenDupTime(ScreenContent screenContent);

	// �� ���� ������ ���� �� ���� ��������
	public ScreenContent getScreenContent(int screenContentNo);

	// �� ���� ����
	public int updateScreenContent(ScreenContent screenContent);

	// �� ���� ����
	public int deleteScreenContent(int screenContentNo);

	public Map<String, Object> getWishList(Map<String, Object> map);

	public int getTotalCount(Search search) throws Exception;

	public int getTotalCount(int movieNo) throws Exception;

	public int checkScreenDupPreview(ScreenContent screenContent);

	// ���� Ƽ�� �����ϴ� ����Ʈ �ҷ�����
	public List<ScreenContent> getTodayTicketOpenList(Search search);

	public int getScreenNo(ScreenContent screenContent);

	public int getTotalPreviewCount(Search search) throws Exception;

	public Map<String, Object> getPreviewList(Search search);

}

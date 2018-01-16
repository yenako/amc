package com.amc.service.screen.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.amc.common.Search;
import com.amc.service.domain.Movie;
import com.amc.service.domain.ScreenContent;
import com.amc.service.screen.ScreenDAO;

@Repository("screenDAOImpl")
public class ScreenDAOImpl implements ScreenDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public Map<String, Object> getWishList(Map<String, Object> map) {
		Map<String,Object> tempMap = new HashMap<String,Object>();
		
		System.out.println("getWishList ================>>>");
		
		if(map.get("search")!=null){
		tempMap.put("totalCount", sqlSession.selectOne("WishListMapper.getTotalCount",map));
		tempMap.put("listWish", sqlSession.selectList("WishListMapper.getPreviewWishList",map));
			return tempMap;
		}else{
			tempMap.put("listWish", sqlSession.selectList("WishListMapper.getAllWishList",map));
			return tempMap;
		}
	}

	@Override
	public Map<String, Object> getMovieList(Search search) {
		System.out.println("ScreenDAOImpl�� getMovieList �޼ҵ� ����...");
		
	
		List<ScreenContent> list = sqlSession.selectList("MovieMapper.getMovieList2", search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		map.put("list", list);

		System.out.println("List ���� ���� " + list);

		System.out.println("ScreenDAOImpl�� getMovieList �޼ҵ� ��...");
		
		
		
		return map;
	}

	@Override
	public Movie getMovie(int movieNo) {
		System.out.println("ScreenDAOImpl�� getMovie �޼ҵ� ����...");

		
	
		System.out.println("ScreenDAOImpl�� getMovie �޼ҵ� ��...");
		
		return sqlSession.selectOne("MovieMapper.getMovie", movieNo);
		
	}

	@Override
	public Map<String, Object> getScreenContentList(Search search, int movieNo) {
		System.out.println("ScreenDAOImpl�� getScreenContentList �޼ҵ� ����...");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("movieNo", movieNo);
		System.out.println("searchd�� movieNo" + search + "  " + movieNo);

		List<ScreenContent> list = sqlSession.selectList("ScreenContentMapper.getScreenContentList", map);
		map.put("list", list);

		System.out.println("List ���� ���� " + list);

		System.out.println("ScreenDAOImpl�� getScreenContentList �޼ҵ� ��...");
		return map;
	}
	
	// 10/31 �߰�
	@Override
	public Map<String, Object> getPreviewList(Search search) {
		System.out.println("ScreenDAOImpl�� getPreviewList �޼ҵ� ����...");
		
		System.out.println("SEARCH :::: " + search);
		
		// �˻�� ���� ��� ����
		if(search.getSearchKeyword() != null) {
			search.setSearchCondition("1");
		} 
		
		List<ScreenContent> list = sqlSession.selectList("ScreenContentMapper.getPreviewList", search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		map.put("list", list);

		System.out.println("List ���� ���� " + list);
		System.out.println("map ���� ���� " + map);
		System.out.println("ScreenDAOImpl�� getPreviewList �޼ҵ� ��...");
		
		
		
		return map;
	}

	
	
	//[����1�ܰ��]
	@Override
	public List<ScreenContent> getScreenContentList2(Search search, int movieNo) {
		System.out.println("ScreenDAOImpl�� getScreenContentList 2222222");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("movieNo", movieNo);
		
		List<ScreenContent> list = sqlSession.selectList("ScreenContentMapper.getScreenContentList2", map);

		return list;
	}

	@Override
	public int addScreenContent(ScreenContent screenContent) {
		System.out.println("ScreenDAOImpl�� addScreenContent �޼ҵ� ����...");
		// sqlSession.insert("ScreenContentMapper.addScreenContent",
		// screenContent);
		
		int test = sqlSession.insert("ScreenContentMapper.addScreenContent", screenContent);
		System.out.println(":::::::::::Ȯ�� ::::::" + screenContent.getScreenContentNo());
		System.out.println("test"+ test);
		System.out.println("ScreenDAOImpl�� addScreenContent �޼ҵ� ��...");
		return test ;
	}

	@Override
	public ScreenContent getScreenContent(int screenContentNo) {
		System.out.println("ScreenDAOImpl�� getScreenContent �޼ҵ� ����...");
		// sqlSession.insert("ScreenContentMapper.addScreenContent",
		// screenContent);
		System.out.println("ScreenDAOImpl�� getScreenContent �޼ҵ� ��...");
		return sqlSession.selectOne("ScreenContentMapper.getScreenContent", screenContentNo);
	}

	@Override
	public int checkScreenDupTime(ScreenContent screenContent) {

		System.out.println("screenDate�� screenOpenTime�� screenEndTime" + screenContent);

		// System.out.println("List ���� ���� " + list);

		System.out.println("ScreenDAOImpl�� getScreenContentList �޼ҵ� ��...");

		return sqlSession.selectOne("ScreenContentMapper.checkScreenDupTime", screenContent);
	}
	
	@Override
	public int checkScreenDupPreview(ScreenContent screenContent) {

		System.out.println("screenDate�� screenOpenTime�� screenEndTime" + screenContent);

		// System.out.println("List ���� ���� " + list);
		if (sqlSession.selectOne("ScreenContentMapper.checkScreenDupPreview", screenContent) != null) {
			System.out.println("ScreenDAOImpl�� checkScreenDupPreview �޼ҵ� ��...?");
			return sqlSession.selectOne("ScreenContentMapper.checkScreenDupPreview", screenContent);
		}else{
			System.out.println("ScreenDAOImpl�� checkScreenDupPreview �޼ҵ� ��...!");
			return 0 ;
		}

	


	}
	

	@Override
	public int updateScreenContent(ScreenContent screenContent) {
		System.out.println("ScreenDAOImpl�� updateScreenContent �޼ҵ� ����...");
		return sqlSession.update("ScreenContentMapper.updateScreenContent", screenContent);
	}

	@Override
	public int deleteScreenContent(int screenContentNo) {
		System.out.println("ScreenDAOImpl�� deleteScreenContent �޼ҵ� ����...");
		
		
		return sqlSession.delete("ScreenContentMapper.deleteScreenContent", screenContentNo);
	}


	
	@Override
	public int getTotalCount(Search search) throws Exception {		
		return sqlSession.selectOne("MovieMapper.getTotalCount2",search);
	}
	
	//10/31 �߰�
	@Override
	public int getTotalPreviewCount(Search search) throws Exception {		
		System.out.println("ScreenDAOImpl getTotalPreviewCount ����");
		System.out.println("searc�� ::::: " +search);
		int getTotalPreviewCount = sqlSession.selectOne("ScreenContentMapper.getTotalPreviewCount",search);
		System.out.println("getTotalPreviewCount :::::: " + getTotalPreviewCount);
		System.out.println("ScreenDAOImpl getTotalPreviewCount ����");
		return getTotalPreviewCount;
	}
	
	
	@Override
	public int getTotalCount(int movieNo) throws Exception {		
		return sqlSession.selectOne("ScreenContentMapper.getTotalCount",movieNo);
	}

	@Override
	// ���� Ƽ�� �����ϴ� ����Ʈ �ҷ�����
	public List<ScreenContent> getTodayTicketOpenList(Search search) {
		return sqlSession.selectList("ScreenContentMapper.todayTicketOpenList",search);
	}
	
	@Override
	// ��ũ���󿵹�ȣ��������
	public int getScreenNo(ScreenContent screenContent) {
		return sqlSession.selectOne("ScreenContentMapper.getScreenNo", screenContent);
	}
	
	

}

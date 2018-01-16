package com.amc.service.cinema.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.amc.common.Search;
import com.amc.service.cinema.CinemaDAO;
import com.amc.service.domain.Movie;
import com.amc.service.domain.Product;
import com.amc.service.domain.ScreenContent;

@Repository("cinemaDAOImpl")
public class CinemaDAOImpl implements CinemaDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	SqlSession sqlSession;

	public CinemaDAOImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Map<String, Object> unifiedSearch(String searchKeyword) {
		
		Map<String,Object> unifiedSearch = new HashMap<String,Object>();
		

		/*통합검색 시사회 리스트 부르기*/
		List<ScreenContent> uniPreviewList = sqlSession.selectList("ScreenContentMapper.uniPreviewList",searchKeyword);
		
		unifiedSearch.put("uniPreviewList", uniPreviewList);
		
		for(int i = 0; i<uniPreviewList.size(); i++){
			System.out.println("DAOImpl : "+((ScreenContent)(uniPreviewList.get(i))).getPreviewTitle());
		}
		
		
		/*통합검색 스토어 부르기*/
		List<Product> uniProductList = sqlSession.selectList("ProductMapper.uniProductList",searchKeyword);
		List<Product> uniGoodsList = new ArrayList<Product>();
		List<Product> uniSnackList = new ArrayList<Product>();
		
		for(int i = 0; i<uniProductList.size(); i++){
			System.out.println("DAOImpl : "+((Product)(uniProductList.get(i))).getProdName());
			if(((Product)(uniProductList.get(i))).getProdType().equals("G")){
				uniGoodsList.add(((Product)(uniProductList.get(i))));
			}else{
				uniSnackList.add(((Product)(uniProductList.get(i))));
			}
		}
		
		unifiedSearch.put("uniGoodsList", uniGoodsList);
		unifiedSearch.put("uniSnackList", uniSnackList);
		
		return unifiedSearch;
	}

	@Override
	public Map<String, Object> index() {
		
		Map<String,Object> indexList = new HashMap<String,Object>(); 
		
		//신상품
		List<Product> newProductList = sqlSession.selectList("ProductMapper.mainProductList",1);
		
		for (Product newProduct : newProductList) {
			System.out.println("■■newProduct■■"+newProduct.getProdName());
		}
		
		//탑3
		List<Product> bestProductList = sqlSession.selectList("ProductMapper.mainProductList",2);
		
		for (Product bestProduct : bestProductList) {
			System.out.println("☆☆bestProduct☆☆"+bestProduct.getProdName());
		}
		
		indexList.put("newProductList", newProductList);
		indexList.put("bestProductList", bestProductList);
		
		return indexList;
	}
	
}

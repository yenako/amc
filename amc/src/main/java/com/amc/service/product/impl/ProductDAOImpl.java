package com.amc.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.amc.common.Search;
import com.amc.service.domain.Product;
import com.amc.service.product.ProductDAO;

@Repository("productDAOImpl")
public class ProductDAOImpl implements ProductDAO{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public ProductDAOImpl() {
		System.out.println("::"+getClass()+".ProductDaoImpl() 생성자 콜");
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("::"+getClass()+".sqlSqlSession() 콜");
		this.sqlSession = sqlSession;
	}

	@Override
	public void addProduct(Product product) throws Exception {
		sqlSession.insert("ProductMapper.addProduct",product);
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("ProductMapper.getProduct", prodNo);
	}

	@Override
	public Map<String, Object> getGoodsList(Search search) throws Exception {
		
		Map<String , Object> map= new HashMap<String, Object>();
		map.put("totalCount", sqlSession.selectOne("ProductMapper.getTotalCount",search));
		map.put("list", sqlSession.selectList("ProductMapper.getGoodsList", search));
		return map;
	}
	
	@Override
	public Map<String, Object> getSnackList(Search search) throws Exception {
		
		Map<String , Object> map= new HashMap<String, Object>();
		map.put("totalCount", sqlSession.selectOne("ProductMapper.getTotalCount",search));
		map.put("list", sqlSession.selectList("ProductMapper.getSnackList", search));
		return map;
	}

	@Override
	public void updateProduct(Product product) throws Exception {
		sqlSession.update("ProductMapper.updateProduct",product);
	}

	@Override
	public void deleteProduct(int prodNo) throws Exception {
		sqlSession.update("ProductMapper.deleteProduct", prodNo);
	}
	
	public Map<String,Object> getIndexProductList() throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("NP", sqlSession.selectOne("ProductMapper.newestProduct"));
		map.put("HP", sqlSession.selectList("ProductMapper.hottestProduct"));
		return map;
	}

}

package com.amc.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.amc.common.Search;
import com.amc.service.domain.Product;
import com.amc.service.product.ProductService;
import com.amc.service.product.ProductDAO;


@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {

	///Field
	@Autowired
	@Qualifier("productDAOImpl")
	private ProductDAO productDAO;
	
	public ProductServiceImpl() {
		System.out.println(this.getClass()); 
	}
	
	public ProductDAO getProductDao() {
		return productDAO;
	}

	public void setProductDao(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@Override
	public void addProduct(Product product) throws Exception {
		productDAO.addProduct(product);
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		return productDAO.getProduct(prodNo);
	}

	@Override
	public Map<String, Object> getGoodsList(Search search) throws Exception {
		return productDAO.getGoodsList(search);
	}

	@Override
	public Map<String, Object> getSnackList(Search search) throws Exception {
		return productDAO.getSnackList(search);
	}

	@Override
	public void updateProduct(Product product) throws Exception {
		productDAO.updateProduct(product);
	}

	@Override
	public void deleteProduct(int prodNo) throws Exception {
		productDAO.deleteProduct(prodNo);
	}
	
	@Override
	public Map<String, Object> getIndexProductList() throws Exception {
		// TODO Auto-generated method stub
		return productDAO.getIndexProductList();
	}
	
}

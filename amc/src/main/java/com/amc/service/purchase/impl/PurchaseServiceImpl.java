package com.amc.service.purchase.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.amc.common.Search;
import com.amc.service.domain.Purchase;
import com.amc.service.product.ProductDAO;
import com.amc.service.purchase.PurchaseDAO;
import com.amc.service.purchase.PurchaseService;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService{
	
	/*Field*/
	@Autowired
	@Qualifier("purchaseDAOImpl")
	private PurchaseDAO purchaseDAO;

	@Autowired
	@Qualifier("productDAOImpl")
	private ProductDAO productDAO;

	
	public PurchaseServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	public void setPurchaseDAO(PurchaseDAO purchaseDAO) {
		this.purchaseDAO = purchaseDAO;
	}

	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		// TODO Auto-generated method stub
		purchaseDAO.addPurchase(purchase);
	}

	@Override
	public Purchase getPurchase(Purchase purchase) throws Exception {
		// TODO Auto-generated method stub
		return purchaseDAO.getPurchase(purchase);
	}

	@Override
	public Map<String, Object> getPurchaseList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return purchaseDAO.getPurchaseList(search);
	}
	
	@Override
	public void updatePurchase(Purchase purchase) throws Exception {
		// TODO Auto-generated method stub
		purchaseDAO.updatePurchase(purchase);
	}
}

package com.amc.service.purchase;

import java.util.Map;

import com.amc.common.Search;
import com.amc.service.domain.Purchase;

public interface PurchaseDAO {
	
	// item ���� �߰�
	public void addPurchase(Purchase purchase) throws Exception; 

	// ������ item ã�� by purchase
	public  Purchase getPurchase(Purchase purchase) throws Exception; 
	
	// ���� item ���
	public  Map<String, Object> getPurchaseList(Search search) throws Exception;
	
	// ������ item ���� ���� ����
	public  void updatePurchase(Purchase purchase)  throws Exception; 

}

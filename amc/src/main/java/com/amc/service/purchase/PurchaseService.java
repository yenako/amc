package com.amc.service.purchase;

import java.util.Map;

import com.amc.common.Search;
import com.amc.service.domain.Purchase;

/*
 * ���Ű����� �߻�ȭ ĸ��ȭ�� PurchaseService Interface (TTL : 7EA)
 */
///Method TTL : 7EA
public interface PurchaseService {
	
	// ���� �߰�
	public void addPurchase(Purchase purchase) throws Exception;
	
	// ������ item ����������  ã��
	public  Purchase getPurchase(Purchase purchase) throws Exception; 
	
	// ���� item ���
	public  Map<String, Object> getPurchaseList(Search search) throws Exception;

	// ������ item ���� ���� ����
	public  void updatePurchase(Purchase purchase)  throws Exception;
}

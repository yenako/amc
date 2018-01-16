package com.amc.service.purchase;

import java.util.Map;

import com.amc.common.Search;
import com.amc.service.domain.Purchase;

/*
 * 구매관리를 추상화 캡슐화한 PurchaseService Interface (TTL : 7EA)
 */
///Method TTL : 7EA
public interface PurchaseService {
	
	// 구매 추가
	public void addPurchase(Purchase purchase) throws Exception;
	
	// 구매한 item 구매정보로  찾기
	public  Purchase getPurchase(Purchase purchase) throws Exception; 
	
	// 구매 item 목록
	public  Map<String, Object> getPurchaseList(Search search) throws Exception;

	// 구매한 item 관련 정보 수정
	public  void updatePurchase(Purchase purchase)  throws Exception;
}

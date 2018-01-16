package com.amc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amc.common.Page;
import com.amc.common.Search;
import com.amc.service.domain.Product;
import com.amc.service.domain.Purchase;
import com.amc.service.domain.User;
import com.amc.service.product.ProductService;
import com.amc.service.purchase.PurchaseService;

@RestController
@RequestMapping("purchase/json/*")
public class PurchaseRestController {

	/*Field*/
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Value("#{commonProperties['pageUnit'] ?: 5}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize'] ?: 3}")
	int pageSize;
	
	/*Constructor*/
	public PurchaseRestController(){
		System.out.println(getClass());
	}
	
	/*Method*/
	@RequestMapping( value="addPurchase/{prodNo}", method=RequestMethod.GET )
	public Product addPurchase(	@PathVariable int prodNo) throws Exception{
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping( value="addPurchase", method=RequestMethod.POST )
	public Purchase addPurchase( @RequestBody Purchase purchase	) throws Exception{

		purchaseService.addPurchase(purchase);
		
		return purchase;
	}
	
	@RequestMapping( value="getPurchase/{ImpId}", method=RequestMethod.GET )
	public Purchase getPurchase( @PathVariable String ImpId	)throws Exception{
		System.out.println(":::::impId"+ImpId);
		Purchase purchase = new Purchase();
		purchase.setImpId(ImpId);
		purchase = purchaseService.getPurchase(purchase);
		
		return purchase;
	}
	
	@RequestMapping( value="updatePurchase", method=RequestMethod.POST )
	public Purchase updatePurchase(	@RequestBody Purchase purchase	) throws Exception{
		System.out.println("::::::::::::::::::::::::::::::::PurchaseController의 updatePurchase 메소드 시작");
/*		User user = (User)session.getAttribute("user");
		purchase.setBuyer(user);
		*/
		purchaseService.updatePurchase(purchase);
		
		System.out.println("+++++++++getpurchase"+purchaseService.getPurchase(purchase) );
		Purchase updatePurchase = purchaseService.getPurchase(purchase);
		return updatePurchase;
	}
	
	@RequestMapping( value="listPurchase" )
	public Map<String, Object> listPurchase(	@RequestBody Search search	) throws Exception{
		System.out.println("purchaseRestController 의 listPurchase 메소드 :"+search);
		
		System.out.println("PurchaseRestController listPurchase called");
		return this.getList(search);
	}
	
	@RequestMapping( value="updateTranCode/{menu}", method=RequestMethod.POST )
	public Map<String, Object> updateTranCode(	@PathVariable String menu,
									@RequestBody Purchase purchase	) throws Exception{
		
		Purchase updatePurchase = purchaseService.getPurchase(purchase);
		updatePurchase.setTranCode(purchase.getTranCode());
		
		purchaseService.updatePurchase(updatePurchase);
		
		Search search = new Search();
		if(menu.equals("manage")){
			search.setSearchKeyword("purchaseList");
		}else{
			search.setSearchKeyword("saleList");
		}
		return this.getList(search);
	}
	
	@RequestMapping( value="updateTranCode/{impId}/{tranCode}", method=RequestMethod.GET )
	public boolean updateTranCode(	@PathVariable String impId,
									@PathVariable int tranCode	) throws Exception{
		
		Purchase updatePurchase = new Purchase();
		updatePurchase.setImpId(impId);
		updatePurchase = purchaseService.getPurchase(updatePurchase);
		updatePurchase.setTranCode(tranCode);
		System.out.println("______________________"+tranCode);
		purchaseService.updatePurchase(updatePurchase);
		
		return true;
	}
	

		
	private Map<String, Object> getList(Search search) throws Exception{

		if(search.getCurrentPage()==0){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		System.out.println("PurchaseRestController getList called...");

		Map<String, Object> map = purchaseService.getPurchaseList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println("resultPage " + resultPage);
		System.out.println("search " + search);
		
		
		map.put("resultPage", resultPage);
		map.put("search", search);
		
		
		//map.put("serarch", search);
		System.out.println("purchaseRestController 의 getList메소드의 map : "+map);
		return map;
	}
	
}

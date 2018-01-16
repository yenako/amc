package com.amc.web.product;

import java.io.File;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.amc.common.Page;
import com.amc.common.Search;
import com.amc.service.domain.Product;
import com.amc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@Autowired
	@Qualifier("uploadFilePath")
	private FileSystemResource fsr;
	
	public ProductController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="addProduct", method=RequestMethod.GET)
	public String addProduct() throws Exception {
		return "redirect:addProduct.jsp";
	}
	
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public String addProduct( @ModelAttribute("product") Product product,
							@RequestParam(value="file", required=false) MultipartFile mFile,
							 HttpSession session, HttpServletRequest request) throws Exception {
		
		System.out.println("producController의 addProduct 메소드 : file"+mFile);
		product.setProdImage("");
		

		String rootPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println("rootPath => " + rootPath);
		String attachPath = "images/uploadFiles/";
		String fileName = mFile.getOriginalFilename();
	
		fileName = URLEncoder.encode(fileName, "EUC-KR");

		System.out.println("???>>>>>>>>" + fileName.indexOf("%"));
		long date = new Date().getTime();

		String time = String.valueOf(date);
		System.out.println("time === > " + time);

		if (fileName.indexOf("%") != -1) {
			fileName = fileName.replaceAll("%", "");
		}

		fileName = time + fileName;
		File file = new File(rootPath + attachPath + fileName);
		System.out.println("fileName===> " + fileName);

		System.out.println("file ==> " + file);

		if (!(mFile.isEmpty())) {
			mFile.transferTo(file);
			product.setProdImage(fileName);
		
		} else {
			product.setProdImage("");
		}
		
		
		
		
		
		product.setStock(product.getTotalStock());
		product.setExpiryDate(1);
		productService.addProduct(product);
		
		return "forward:addProductConfirm.jsp";
	}

	@RequestMapping( value="deleteProduct", method=RequestMethod.GET )
	public String deleteProduct( @RequestParam("prodNo") int prodNo,									
									Model model ) throws Exception{
		System.out.println("/product/deleteProduct : GET");
		productService.deleteProduct(prodNo);
		model.addAttribute("menu", "manage");
		
		
		return "forward:/product/getGoodsList";
	}
	
	@RequestMapping( value="getGoodsProduct", method=RequestMethod.GET)
	public String getGoodsProduct( @RequestParam("prodNo") int prodNo,
								@RequestParam(value="menu",defaultValue="") String menu ,
								Model model ) throws Exception {
		System.out.println("ProductController의 getGoodsProduct 메소드");
		Product product = productService.getProduct(prodNo);
		System.out.println("Goods Product :"+product);
		model.addAttribute("product", product);
				
		System.out.println( "판매 현황 좀 보고싶은데 :"+product.getSalesStock());
		
		if(menu!=""){
			if(menu.equals("manage")){
				return "forward:updateProduct?prodNo="+prodNo;
			}
		}
		return "forward:getGoodsProduct.jsp";
	}
	
	@RequestMapping( value="getSnackProduct", method=RequestMethod.GET)
	public String getSnackProduct( @RequestParam("prodNo") int prodNo,
								@RequestParam(value="menu",defaultValue="") String menu ,
								Model model ) throws Exception {
		System.out.println("ProductController의 getSnackProduct 메소드");
		Product product = productService.getProduct(prodNo);
		model.addAttribute("product", product);
				
		System.out.println( "판매 현황 좀 보고싶은데 :"+product.getSalesStock());
		
		if(menu!=""){
			if(menu.equals("manage")){
				return "forward:updateProduct?prodNo="+prodNo;
			}
		}
		return "forward:getSnackProduct.jsp";
	}

	
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{
		
		Product product = productService.getProduct(prodNo);
		model.addAttribute("product", product);
		return "forward:updateProduct.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product, 
								 @RequestParam(value="file", required=false) MultipartFile file, 
								 Model model) throws Exception{
		product.setProdImage("");
		if(file != null && !file.isEmpty()){
			product.setProdImage(file.getOriginalFilename());
		}
		
		productService.updateProduct(product);
		product=productService.getProduct(product.getProdNo());		
		model.addAttribute("product", product);
		
		if(product.getProdType()!="G"){
				return "forward:getGoodsProduct.jsp?menu=manage&prodNo="+product.getProdNo();
		}
		return "forward:getSnackProduct.jsp?menu=manage&prodNo="+product.getProdNo();
	}
			
	@RequestMapping(value="getGoodsList")
	public String getGoodsList( @ModelAttribute("search") Search search , Model model , 								
								@RequestParam("menu") String menu, @RequestParam(value="searchProdType",defaultValue="G") String searchProdType,
								HttpSession session) throws Exception{
		
		System.out.println("ProductController의 getGoodsList 메소드 시작");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		if(search.getSearchCondition() == null){
			search.setSearchCondition("1");
		}
		if(menu.equals("manage")){
			search.setStockView(true);
			search.setSearchKeyword2("manage");
		}
		if(menu.equals("search")){
			search.setSearchKeyword2("search");
		}
		pageSize = 8;
		search.setPageSize(pageSize);
		/*search.setPageUnit(pageUnit);*/		
		// Business logic 수행
		
		Map<String , Object> map=productService.getGoodsList(search);
		
		System.out.println(map.get("list"));
		System.out.println((Product)map.get("Product"));
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage :"+resultPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		System.out.println("ProductController의 getGoodsList 메소드 끝"+map.get("list"));
		
		return "forward:/product/listGoodsProduct.jsp?menu="+menu;
	}
	
	@RequestMapping(value="getSnackList")
	public String getSnackList( @ModelAttribute("search") Search search , Model model ,
								@RequestParam("menu") String menu, @RequestParam("searchProdType") String searchProdType,
								HttpSession session) throws Exception{
		
		System.out.println("ProductController의 getSnackList 메소드 시작");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		if(search.getSearchCondition() == null){
			search.setSearchCondition("1");
		}
		if(menu.equals("manage")){
			search.setStockView(true);
			search.setSearchKeyword2("manage");
		}
		if(menu.equals("search")){
			search.setSearchKeyword2("search");
		}
		pageSize = 8;
		search.setPageSize(pageSize);
		/*search.setPageUnit(pageUnit);*/
		// Business logic 수행
		Map<String , Object> map=productService.getSnackList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		System.out.println("ProductController의 getSnackList 메소드 끝");
		
		return "forward:/product/listSnackProduct.jsp?menu="+menu;
	}

}

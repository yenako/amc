package com.amc.web.product;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.amc.common.Page;
import com.amc.common.Search;
import com.amc.service.domain.Product;
import com.amc.service.product.ProductService;


//==> 회원관리 RestController
@RestController
@RequestMapping("product/json/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
			
	@Value("#{commonProperties['pageUnit'] ?: 5}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize'] ?: 3}")
	int pageSize;

	@Autowired
	@Qualifier("uploadFilePath")
	private FileSystemResource fsr;
	/*Constructor*/
	public ProductRestController(){
		System.out.println(this.getClass());
	}

	

	@RequestMapping( value="addProduct", method=RequestMethod.POST )
	public Product addProduct( @RequestParam("product") String json,
									@RequestParam("file") MultipartFile file ) throws Exception{
				
		Product product = new ObjectMapper().readValue(json.toString(), Product.class);
		
		product.setProdImage("");
		if(!file.isEmpty()){
			FileOutputStream fos = new FileOutputStream(new File(fsr.getPath(), file.getOriginalFilename()));
			fos.write(file.getBytes());
			fos.flush();
			fos.close();
			product.setProdImage(file.getOriginalFilename());
		}
		
		productService.addProduct(product);
		
		return product;
	}
		
	@RequestMapping( value="getGoodsProduct/{prodNo}", method=RequestMethod.GET )
	public Product getGoodsProduct( @PathVariable int prodNo ) throws Exception{
		return productService.getProduct(prodNo);
	}
	@RequestMapping( value="getSnackProduct/{prodNo}", method=RequestMethod.GET )
	public Product getSnackProduct( @PathVariable int prodNo ) throws Exception{
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping( value="updateProduct", method=RequestMethod.POST )
	public Product updateProduct(	@RequestBody Product product ) throws Exception{
	
		System.out.println("/product/json/updateProduct : POST");
		//Business Logic
		System.out.println("::"+product);
		
		productService.updateProduct(product);
						
		return product;
	}
	
	@RequestMapping( value="uploadFile", method=RequestMethod.POST )
	public boolean uploadFile( @RequestParam("file") MultipartFile file ) throws Exception{
		System.out.println("productRestController의 uploadfile");
		boolean result = false;
		System.out.println(":::::::productRestController 의 uploadFile 부분 fsr.getPath() :"+fsr.getPath());
		System.out.println(":::::::productRestController 의 uploadFile 부분 file.getOriginalFilename() :"+file.getOriginalFilename());
		if(!file.isEmpty()){
			try{
				
				System.out.println("file 경로와 file 이름 시작");
				System.out.println("file 경로와 file 이름 시작1"+fsr.getPath());
				System.out.println("file 경로와 file 이름 시작2"+file.getOriginalFilename());

				file.transferTo(new File(fsr.getPath(),file.getOriginalFilename()));
				result = true;
			}catch(Exception e){
				System.out.println(file.getOriginalFilename()+" upload fail;");
			}
		}
		System.out.println("@@@@@@"+result);
		return result;
	}

	@RequestMapping( value="getGoodsList/{menu}")
	public Map<String, Object> getGoodsList(@RequestBody Search search,	@PathVariable String menu) throws Exception{
		if(search.getCurrentPage()==0){
			search.setCurrentPage(1);
		}
		if(menu.equals("manage")){
			search.setStockView(true);
		}
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		if(search.getSearchCondition() != null && search.getSearchCondition().equals("2")){
			try{
				Integer.parseInt(search.getSearchKeyword());
			}catch(NumberFormatException e){
				search.setSearchKeyword("");
			}
		}
		
		Map<String, Object> map = productService.getGoodsList(search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		map.put("resultPage", resultPage);
		
		return map;
	}
	
	@RequestMapping( value="getSnackList/{menu}")
	public Map<String, Object> getSnackList(@RequestBody Search search,	@PathVariable String menu) throws Exception{
		if(search.getCurrentPage()==0){
			search.setCurrentPage(1);
		}
		if(menu.equals("manage")){
			search.setStockView(true);
		}
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		if(search.getSearchCondition() != null && search.getSearchCondition().equals("2")){
			try{
				Integer.parseInt(search.getSearchKeyword());
			}catch(NumberFormatException e){
				search.setSearchKeyword("");
			}
		}
		
		Map<String, Object> map = productService.getSnackList(search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		map.put("resultPage", resultPage);
		
		return map;
	}
	
	@RequestMapping( value="getIndexProductList", method=RequestMethod.GET )
	public Map<String, Object> getIndexProductList() throws Exception{
		return productService.getIndexProductList();
	}
	
}

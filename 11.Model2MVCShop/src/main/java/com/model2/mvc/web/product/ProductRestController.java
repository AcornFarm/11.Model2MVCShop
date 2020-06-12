package com.model2.mvc.web.product;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;



//==> ȸ������ Controller
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method ���� ����
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getProduct( @PathVariable int prodNo ) throws Exception {
		
		System.out.println("/product/json/getProduct/{prodNo} : GET");
		
		Product product = productService.getProduct(prodNo);
		
		System.out.println(":::::"+product);
		
		return product;
		
	}
	
	@RequestMapping(value="json/getProduct", method=RequestMethod.POST)
	public Product getProduct( @RequestBody Product product) throws Exception {
		
		System.out.println("/product/json/getProduct : POST");
		
		return productService.getProduct(product.getProdNo());
		
	}
	
	
	@RequestMapping(value="json/listProduct", method=RequestMethod.GET)
	public List<Product> listProduct() throws Exception {
		
		System.out.println("/product/json/listProduct : POST");
		
		Search search = new Search();
		
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String , Object> map = productService.getProductList(search);
		
		
		return (List<Product>) map.get("list");
		
	}
	
	
	
	
//	@RequestMapping(value="getProduct", method=RequestMethod.POST)
//	public String getProduct( @RequestParam("prodNo") int prodNo, Model model, HttpServletRequest request, HttpServletResponse response ) throws Exception {
//		
//		System.out.println("getProduct : POST");
//		//Business Logic
//		Product product = productService.getProduct(prodNo);
//		// Model �� View ����
//		model.addAttribute("pvo", product);
//		
//		
//		return  "forward:/product/getProduct.jsp";
//	}
//	
//	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
//	public String updateProductView( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{
//
//		System.out.println("updateProduct : GET");
//		//Business Logic
//		Product product = productService.getProduct(prodNo);
//		// Model �� View ����
//		model.addAttribute("pvo", product);
//		
//		return "forward:/product/updateProductView.jsp";
//	}
//	
//	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
//	public String updateUser( @ModelAttribute("pvo") Product product , Model model , HttpSession session) throws Exception{
//
//		System.out.println("updateProduct : POST");
//		//Business Logic
//		productService.updateProduct(product);
//		
//		return "forward:/product/getProduct.jsp";
//	}
//	
//	
	
}
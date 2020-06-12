package com.model2.mvc.web.purchase;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;



//==> ȸ������ Controller
@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	//setter Method ���� ����
		
	public PurchaseRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/getPurchase/{tranNo}", method=RequestMethod.GET)
	public Purchase getPurchase( @PathVariable int tranNo ) throws Exception {
		
		System.out.println("/product/json/getProduct/{prodNo} : GET");
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		
		return purchase;
		
	}
	
	
	
	
}
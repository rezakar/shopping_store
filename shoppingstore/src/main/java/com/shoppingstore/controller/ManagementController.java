package com.shoppingstore.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shoppingstore.model.Category;
import com.shoppingstore.model.Products;
import com.shoppingstore.service.CategoryService;
import com.shoppingstore.service.ProductsService;

@Controller
@RequestMapping(value="/manage")
public class ManagementController {
	@Autowired
	private ProductsService products;
	@Autowired
	private CategoryService categorys;
	private static final Logger logger = 
			LoggerFactory.getLogger(ManagementController.class);
	
	@RequestMapping(value="/manageProducts",method=RequestMethod.GET)
	public ModelAndView showManageProducts(@RequestParam(value="operation", 
	required=false) String operation) {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("userClickMP", true);
		mv.addObject("title", "Manage Products");
		/*mv.addObject("products",products.listProducts());
		mv.addObject("categories", categorys.listCategory());*/
		Products nProduct = new Products();
		nProduct.setQuantity(1);
		nProduct.setIs_active(true);
		mv.addObject("product", nProduct);
		if(operation!=null) {
			if(operation.equals("product")) {
				mv.addObject("message", "Recored has been successfully submited");
			}
		}
		return mv;
	}
	//Handling store data
	@RequestMapping(value="/manageProducts",method=RequestMethod.POST)
	public String handleStoreData(@ModelAttribute("product") Products mproduct) {
		logger.info(mproduct.toString());
		products.addProducts(mproduct);
		return "redirect:/manage/manageProducts?operation=product";
	}
	@ModelAttribute("categories")
	public List<Category> getAllCategory(){
		return categorys.listCategory();
	}

}

package com.shoppingstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoppingstore.model.Products;
import com.shoppingstore.service.ProductsService;

@Controller
@RequestMapping(value="/jason/data")
public class JasonDataController {
	@Autowired
	private ProductsService productsservice;
	@RequestMapping(value="/all/products")
	@ResponseBody
	public List<Products> getAllProducts(){
		return productsservice.listActiveProducts();
	}
	@RequestMapping(value="/category/{id}/products")
	@ResponseBody
	public List<Products> getProductsByCategory(@PathVariable int id){
		return productsservice.listActiveProductsByCategory(id);
	}

}

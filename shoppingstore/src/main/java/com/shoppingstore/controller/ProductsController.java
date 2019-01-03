package com.shoppingstore.controller;

import java.beans.PropertyEditorSupport;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoppingstore.model.Category;
import com.shoppingstore.model.Products;
import com.shoppingstore.model.Users;
import com.shoppingstore.service.CategoryService;
import com.shoppingstore.service.ProductsService;
import com.shoppingstore.service.UsersService;
import com.shoppingstore.util.FileUploadUtility;

@Controller
@RequestMapping("products")
public class ProductsController {
	@Autowired
	private CategoryService cservice;
	@Autowired
	private UsersService uservice;
	@Autowired
	private ProductsService pservice;

	@RequestMapping(value = "/products_form", method = RequestMethod.GET)
	public String productsAddForm(@RequestParam(value="operation",
	required=false) String operation, Model model) {
		model.addAttribute("products", new Products());
		model.addAttribute("categorylist", cservice.listCategory());
		model.addAttribute("userslist", uservice.listUsers());
		model.addAttribute("productslist", pservice.listProducts());
		model.addAttribute("action", "add");
	/*I  added*/
		model.addAttribute("userClickManageProducts", true);
		model.addAttribute("title", "Manage Products");
		if(operation!=null) {
			if(operation.equals("products")) {
				model.addAttribute("message", "Product Submitted Successfully!");
			}
		}
		return "index";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addProducts(@Valid @ModelAttribute("products")  Products p, 
			BindingResult result, Model model, HttpServletRequest request) {
		// check if there is error
		if (result.hasErrors()) {
			model.addAttribute("userClickManageProducts", true);
			model.addAttribute("title", "Manage Products");
			model.addAttribute("message", "Validtion failed for submit product");
			return "index";
		}
		pservice.addProducts(p);
		if(!p.getFile().getOriginalFilename().equals("")) {
			FileUploadUtility.uploadFile(request,p.getFile(), p.getCode());
		}
		return "redirect:/products/products_form?operation=products";
	}

	@RequestMapping(value = "/products_list", method = RequestMethod.GET)
	public String produtsList(Model model) {
		model.addAttribute("productslist", pservice.listProducts());
		return "products_list";
	}

	@RequestMapping(value = "/remove/{id}")
	public String removeProducts(@PathVariable("id") int id) {
		pservice.removeProducts(id);
		return "redirect:/products/products_list";
	}
	@RequestMapping(value = "/products_form/{id}")
	public String editProductspage(@PathVariable ("id") int id , Model model) {
		model.addAttribute("products", pservice.getProductsById(id));
		model.addAttribute("action", "edit");
		return "products_form";
	}
	@RequestMapping(value = "/products_form/edit" , method=RequestMethod.POST)
	public String editProducts(@ModelAttribute("products") Products p) {
		pservice.updateProducts(p);
		return "redirect:/products/products_list";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Category.class, "category", new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				List<Category> list = cservice.listCategory();
				for (Category c : list) {
					if (c.getCategoryid() == Integer.parseInt(text)) {
						setValue(c);
						return;
					}
				}
			}
		});
		binder.registerCustomEditor(Users.class, "users", new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				List<Users> list = uservice.listUsers();
				for (Users u : list) {
					if (u.getUserid() == Integer.parseInt(text)) {
						setValue(u);
						return;
					}
				}
			}
		});
		binder.registerCustomEditor(Products.class, "products", new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				List<Products> list = pservice.listProducts();
				for (Products p : list) {
					if (p.getProductsid() == Integer.parseInt(text)) {
						setValue(p);
						return;
					}
				}
			}
		});
	}

}

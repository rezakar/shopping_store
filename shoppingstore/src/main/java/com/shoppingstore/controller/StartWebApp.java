package com.shoppingstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.shoppingstore.model.Category;
import com.shoppingstore.service.CategoryService;

@Controller
public class StartWebApp {

	/*
	 * @RequestMapping(value= {"/","index"}) public String start() { return "index";
	 * }
	 */
	@RequestMapping(value = { "/", "/index", "/home" })
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("title", "Home");
		//passing category list here
		mv.addObject("categories",categoryservice.listCategory());
		mv.addObject("userClickHome", true);
		return mv;
	}

	@RequestMapping(value = "/about")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("title", "About Us");
		mv.addObject("userClickAbout", true);
		return mv;
	}

	@RequestMapping(value = "/contact")
	public ModelAndView contact() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("title", "contact Us");
		mv.addObject("userClickContact", true);
		return mv;
	}

	/*@RequestMapping(value = "/products")
	public ModelAndView products() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("title", "Products");
		mv.addObject("userClickProducts", true);
		return mv;
	}*/

	@RequestMapping(value = "/service")
	public ModelAndView service() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("title", "Service");
		mv.addObject("userClickService", true);
		return mv;
	}
	/**
	 * method to load all the products based on category
	 */
	@RequestMapping(value ="/products")
	public ModelAndView showAllproducts() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("title", "Products");
		//passing category list here
		mv.addObject("categories",categoryservice.listCategory());
		mv.addObject("userClickProducts", true);
		return mv;
	}
	/*@RequestMapping(value = "/category/{id}/showall")
	public ModelAndView showCategoryproducts(@PathVariable("id")int id) {
		ModelAndView mv = new ModelAndView("index");
		//categoryDAO to fetch a single category
		Category category = null; 
		category = categoryservice.getCategoryByid(id);
		
		mv.addObject("title", category.getName());
		//passing category list here
		mv.addObject("categories",categoryservice.listCategory());
		//passing single category here
		mv.addObject("category", category);
		mv.addObject("userClickCategoryProducts", true);
		return mv;
	}*/
	@RequestMapping(value = "/category/{id}/showall")
	public String showCategoryproducts(@PathVariable("id")int id,Model model) {
		model.addAttribute("category", categoryservice.getCategoryByid(id));
		//model.addAttribute("title", category.getName());
		//passing category list here
		model.addAttribute("categories",categoryservice.listCategory());
		//passing single category here
		
		model.addAttribute("userClickCategoryProducts", true);
		return "index";
	}

	/****************crud category*********************/
	private CategoryService categoryservice;
	@Autowired(required=true)
	@Qualifier(value="categoryservice")
	public void setCategoryService(CategoryService categoryservice) {
		this.categoryservice = categoryservice;
	}
	@RequestMapping(value="/category")
	public String categoryAddPage(Model model) {
		model.addAttribute("category",new Category());
		model.addAttribute("action", "add");
		return "category_manipulate_form";
	}
	@RequestMapping(value="/category/{id}")
	public String categoryEditPage(@PathVariable("id")int id,Model model) {
		model.addAttribute("category", categoryservice.getCategoryByid(id));
		model.addAttribute("action", "edit");
		return "category_manipulate_form";
	}
	@RequestMapping(value="/category_list",method= RequestMethod.GET)
	public String listCategory(Model model) {
		model.addAttribute("listCategory", categoryservice.listCategory());
		return "category_list";
	}
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String addCategory(@ModelAttribute("category")Category c) {
		categoryservice.addCategory(c);
		return "redirect:/category_list";
	}
	@RequestMapping(value="/category/edit",method=RequestMethod.POST)
	public String editCategory(@ModelAttribute("category")Category c) {
		categoryservice.updateCategory(c);
		return "redirect:/category_list";
	}
	@RequestMapping("remov/{id}")
	public String removeCategory(@PathVariable("id")int id) {
		categoryservice.removeCategory(id);
		return "redirect:/category_list";
	}

}

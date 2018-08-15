package com.shoppingstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StartWebApp {

	/*
	 * @RequestMapping(value= {"/","index"}) public String start() { return "index";
	 * }
	 */
	@RequestMapping(value = { "/", "index", "/home" })
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("title", "Home");
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

	@RequestMapping(value = "/products")
	public ModelAndView products() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("title", "Products");
		mv.addObject("userClickProducts", true);
		return mv;
	}

	@RequestMapping(value = "/service")
	public ModelAndView service() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("title", "Service");
		mv.addObject("userClickService", true);
		return mv;
	}

}

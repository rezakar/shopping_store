package com.shoppingstore.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class StartWebApp {
	
	@RequestMapping("/")
    public String start()
    {
        return "index";
    }

}

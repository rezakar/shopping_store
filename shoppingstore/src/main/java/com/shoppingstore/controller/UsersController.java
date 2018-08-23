package com.shoppingstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoppingstore.model.Users;
import com.shoppingstore.service.UsersService;

@Controller
@RequestMapping("users")
public class UsersController {
	private UsersService usersservice;
	@Autowired(required=true)
	@Qualifier(value="usersservice")
	public void setUsersService(UsersService usersservice) {
		this.usersservice = usersservice;
	}
	@RequestMapping(value="/users")
	public String  usersAddpage(Model model) {
		model.addAttribute("users", new Users());
		model.addAttribute("action", "add");
		return "users_manipulate_form";
	}
	@RequestMapping(value="/add",method = RequestMethod.POST)
	public String addUsers(@ModelAttribute("users")Users u) {
		usersservice.addUser(u);
		return "redirect:/users/users_list";
	}
	@RequestMapping(value="/users/users/{id}")
	public String usersEditPage(@PathVariable("id") int id,Model model) {
		model.addAttribute("users", usersservice.getUsersById(id));
		model.addAttribute("action", "edit");
		return "users_manipulate_form";
	}
	@RequestMapping(value="users/users/edit",method=RequestMethod.POST)
	public String editUsers(@ModelAttribute("users")Users u) {
		usersservice.updateUsers(u);
		return "redirect:/users/users_list";
	}
	@RequestMapping(value="/users_list",method=RequestMethod.GET)
	public String usersList(Model model) {
		model.addAttribute("userslist",usersservice.listUsers());
		return "users_list";
	}
	@RequestMapping(value="/remove/{id}")
	public String removeUsers(@PathVariable("id")int id) {
		usersservice.removeUsers(id);
		return "redirect:/users/users_list";
	}
	

}

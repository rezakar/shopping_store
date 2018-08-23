package com.shoppingstore.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.shoppingstore.DAO.UsersDAO;
import com.shoppingstore.model.Users;

public class UsersServiceImpl implements UsersService {
	private UsersDAO usersDAO;
	public void setUsersDAO (UsersDAO usersDAO) {
		
		this.usersDAO= usersDAO;
	}
	@Override
	@Transactional
	public void addUser (Users u) {
		usersDAO.addUsers(u);
	}
	@Override
	@Transactional
	public Users getUsersById(int id) {
		return usersDAO.getUsersById(id);
	}
	@Override
	@Transactional
	public void updateUsers (Users u) {
		usersDAO.updateUsers(u);
	}
	@Override
	@Transactional
	public List<Users> listUsers(){
		return usersDAO.listUsers();
	}
	@Override
	@Transactional
	public void removeUsers(int id) {
		usersDAO.removeUsers(id);
	}

}

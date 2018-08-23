package com.shoppingstore.service;

import java.util.List;

import com.shoppingstore.model.Users;

public interface UsersService {

	public void addUser(Users u);

	public Users getUsersById(int id);

	public void updateUsers(Users u);

	public List<Users> listUsers();

	public void removeUsers(int id);

}

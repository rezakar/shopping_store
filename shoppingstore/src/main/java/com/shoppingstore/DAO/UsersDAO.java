package com.shoppingstore.DAO;

import java.util.List;

import com.shoppingstore.model.Users;

public interface UsersDAO {

	public void addUsers(Users u);

	public void updateUsers(Users u);

	public Users getUsersById(int id);

	public List<Users> listUsers();

	public void removeUsers(int id);

}

package com.shoppingstore.DAO;

import java.util.List;

import com.shoppingstore.model.Category;

public interface CategoryDAO {

	public void addCategory(Category c);

	public void updateCategory(Category c);

	public Category getCategoryById(int id);

	public List<Category> listCategory();

	public void removeCategory(int id);

}

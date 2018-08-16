package com.shoppingstore.service;

import java.util.List;

import com.shoppingstore.model.Category;

public interface CategoryService {

	public void addCategory(Category c);

	public void uodateCategory(Category c);

	public List<Category> listCategory();

	public Category getCategoryByid(int id);

	public void removeCategory(int id);

}

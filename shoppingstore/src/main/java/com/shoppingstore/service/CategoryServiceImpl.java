package com.shoppingstore.service;

import java.util.List;

import javax.transaction.Transactional;

import com.shoppingstore.DAO.CategoryDAO;
import com.shoppingstore.model.Category;

public class CategoryServiceImpl implements CategoryService{
	private CategoryDAO categoryDAO;
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}
	@Override
	@Transactional
	public void addCategory(Category c) {
		categoryDAO.addCategory(c);
	}
	@Override
	@Transactional
	public void uodateCategory(Category c) {
		categoryDAO.updateCategory(c);
	}
	@Override
	@Transactional
	public List<Category> listCategory() {
		return categoryDAO.listCategory();
	}
	@Override
	@Transactional
	public Category getCategoryByid(int id) {
		return categoryDAO.getCategoryById(id);
	}
	@Override
	@Transactional
	public void removeCategory(int id) {
		categoryDAO.removeCategory(id);
	}

}

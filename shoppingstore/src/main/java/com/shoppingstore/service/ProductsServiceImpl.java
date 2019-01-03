package com.shoppingstore.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.shoppingstore.DAO.ProductsDAO;
import com.shoppingstore.model.Products;

public class ProductsServiceImpl implements ProductsService {
	private ProductsDAO productsDAO;
	public void setProductsDAO (ProductsDAO productsDAO) {
		this.productsDAO = productsDAO;
	}
	@Override
	@Transactional
	public void addProducts(Products p) {
		productsDAO.addProducts(p);
	}
	@Override
	@Transactional
	public Products getProductsById(int id) {
		return productsDAO.getProductsById(id);
	}
	@Override
	@Transactional
	public void updateProducts(Products p) {
		productsDAO.updateProducts(p);
	}
	@Override
	@Transactional
	public List<Products> listProducts(){
		return productsDAO.listProducts();
	}
	@Override
	@Transactional
	public void removeProducts(int id) {
		productsDAO.removeProducts(id);
	}
	@Override
	@Transactional
	public List<Products> listActiveProducts(){
		return productsDAO.listActiveProducts();
	}
	@Override
	@Transactional
	public List<Products> listActiveProductsByCategory(int id) {
		return productsDAO.listActiveProductsByCategory(id);
	}
}

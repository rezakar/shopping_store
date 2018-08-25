package com.shoppingstore.DAO;

import java.util.List;

import com.shoppingstore.model.Products;

public interface ProductsDAO {

	public void addProducts(Products p);

	public Products getProductsById(int id);

	public void updateProducts(Products p);

	public List<Products> listProducts();

	public void removeProducts(int id);

}

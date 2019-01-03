package com.shoppingstore.DAO;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.shoppingstore.model.Products;

@Repository
public class ProductsDAOImpl implements ProductsDAO {
	private SessionFactory sessionfactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionfactory = sf;
	}

	@Override
	public void addProducts(Products p) {
		Session session = this.sessionfactory.getCurrentSession();
		session.persist(p);
	}

	@Override
	public Products getProductsById(int id) {
		Session session = this.sessionfactory.getCurrentSession();
		Products p = (Products) session.load(Products.class, new Integer(id));
		Hibernate.initialize(p);
		return p;
	}

	@Override
	public void updateProducts(Products p) {
		Session session = this.sessionfactory.getCurrentSession();
		Products pr = getProductsById(p.getProductsid());
		pr.setBrand(p.getBrand());
		pr.setCategory(p.getCategory());
		pr.setCode(p.getCode());
		pr.setIs_active(p.isIs_active());
		pr.setName(p.getName());
		pr.setQuantity(p.getQuantity());
		pr.setUnit_price(p.getUnit_price());
		session.saveOrUpdate(pr);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Products> listProducts() {
		Session session = this.sessionfactory.getCurrentSession();
		List<Products> listProducts = session.createQuery("from Products").list();
		return listProducts;
	}

	@Override
	public void removeProducts(int id) {
		Session session = this.sessionfactory.getCurrentSession();
		Products p = (Products) session.load(Products.class, new Integer(id));
		if (null != p) {
			session.delete(p);
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Products> listActiveProducts() {
		Session session = this.sessionfactory.getCurrentSession();
		List<Products> listactive = session.createQuery("from Products where is_active = true").list();
		return listactive;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Products> listActiveProductsByCategory(int id){
		Session session = this.sessionfactory.getCurrentSession();
		List<Products> listactivebycategory= 
				session.createQuery("from Products where category.categoryid = id ").list();
		return listactivebycategory;
		
	}

}

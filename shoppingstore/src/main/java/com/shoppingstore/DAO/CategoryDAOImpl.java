package com.shoppingstore.DAO;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.shoppingstore.model.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO{
	private SessionFactory sessionfactory;
	public void setSessionFactory(SessionFactory sf) {
		this.sessionfactory = sf;
	}
	@Override
	public void addCategory(Category c) {
		Session session = this.sessionfactory.getCurrentSession();
		session.persist(c);
	}
	@Override
	public void updateCategory (Category c) {
		Session session = sessionfactory.getCurrentSession();
		Category ca = getCategoryById(c.getCategoryid());
		ca.setName(c.getName());
		ca.setImageURL(c.getImageURL());
		ca.setActive(c.getActive());
		session.saveOrUpdate(ca);
	}
	@Override
	public Category getCategoryById(int id) {
		Session session = this.sessionfactory.getCurrentSession();
		Category c = (Category) session.load(Category.class, new Integer(id));
		Hibernate.initialize(c);
		return c;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Category> listCategory() {
		Session session = this.sessionfactory.getCurrentSession();
		List<Category> categorylist = session.createQuery("from Category").list();
		return categorylist;
	}
	@Override
	public void removeCategory(int id) {
		Session session = this.sessionfactory.getCurrentSession();
		Category c = (Category) session.load(Category.class, new Integer(id));
		if(null !=c) {
			session.delete(c);
		}
		
	}

}

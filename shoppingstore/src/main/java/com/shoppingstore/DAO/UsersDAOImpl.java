package com.shoppingstore.DAO;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.shoppingstore.model.Users;

@Repository
public class UsersDAOImpl implements UsersDAO {
	private SessionFactory sessionfactory;
	public void setSessionFactory(SessionFactory sf) {
		this.sessionfactory = sf;
	}
	@Override
	public void addUsers(Users u) {
		Session session = this.sessionfactory.getCurrentSession();
		session.persist(u);
	}
	@Override
	public void updateUsers(Users u) {
		Session session = this.sessionfactory.getCurrentSession();
		Users us = getUsersById(u.getUserid());
		us.setFname(u.getFname());
		us.setLname(u.getLname());
		us.setRole(u.getRole());
		us.setEmail(u.getEmail());
		us.setPassword(u.getPassword());
		us.setContact(u.getContact());
		session.saveOrUpdate(us);
	}
	@Override
	public Users getUsersById(int id) {
		Session session = this.sessionfactory.getCurrentSession();
		Users u = (Users) session.load(Users.class , new Integer(id));
		Hibernate.initialize(u);
		return u;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Users> listUsers(){
		Session session = this.sessionfactory.getCurrentSession();
		List<Users> userslist = session.createQuery("from Users").list();
		return userslist;
	}
	@Override
	public void removeUsers(int id) {
		Session session = this.sessionfactory.getCurrentSession();
		Users u = (Users) session.load(Users.class, new Integer(id));
		if (null != u ) {
			session.delete(u);
		}
	}

}

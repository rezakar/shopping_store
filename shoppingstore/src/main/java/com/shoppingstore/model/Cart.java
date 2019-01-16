package com.shoppingstore.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private int userId;
	private double grandTotal;
	private int cartLines;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public double getGrandTotal() {
		return grandTotal;
	}
	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}
	public int getCartLines() {
		return cartLines;
	}
	public void setCartLines(int cartLines) {
		this.cartLines = cartLines;
	}
	@Override
	public String toString() {
		return "Cart [id=" + id + ", userId=" + userId + ", grandTotal=" + grandTotal + ", cartLines=" + cartLines
				+ "]";
	}
	
}

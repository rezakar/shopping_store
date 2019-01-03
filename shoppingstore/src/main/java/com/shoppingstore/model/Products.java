package com.shoppingstore.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;


@SuppressWarnings("serial")
@Entity
@Table(name="products")
public class Products implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int productsid;
	private String code;
	@NotBlank(message = "Please enter the Product Name!")
	private String name;
	@NotBlank(message = "Please enter the brand Name!")
	private String brand;
	@Min(value=1, message="The price cannot be less than 1!!")
	private double unit_price;
	private int quantity;
	private boolean is_active;
	@ManyToOne(fetch=FetchType.EAGER)
	@JsonIgnore
	private Category category;
	@ManyToOne(fetch=FetchType.EAGER)
	@JsonIgnore
	private Users users;
	@Transient
	private MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getProductsid() {
		return productsid;
	}
	public void setProductsid(int productsid) {
		this.productsid = productsid;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public double getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public boolean isIs_active() {
		return is_active;
	}
	public void setIs_active(boolean is_active) {
		this.is_active = is_active;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	@Override
	public String toString() {
		return "Products [productsid=" + productsid + ", code=" + code + ", name=" + name + ", brand=" + brand
				+ ", unit_price=" + unit_price + ", quantity=" + quantity + ", is_active=" + is_active + ", category="
				+ category + ", users=" + users + "]";
	}
	
	

}

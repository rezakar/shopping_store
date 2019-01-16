package com.shoppingstore.validation;

import java.io.File;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.shoppingstore.model.Products;

public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Products.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		Products product = (Products) target;
		
		if (product.getName() == null ) {
			errors.rejectValue("name", null, "Please enter the name of product!");
			return;
		}else if (product.getBrand() == null) {
			errors.rejectValue("brand", null, "Please enter the brand of product!");
			return;
		}
		if (product.getFile() == null || product.getFile().getOriginalFilename().equals("")){
			errors.rejectValue("file", null, "Please select un image file to upload");
			return;
		}
		if(!(
			product.getFile().getContentType().equals("image/jpeg") ||
			product.getFile().getContentType().equals("image/gif") ||
			product.getFile().getContentType().equals("image/png")
			))
			 {
			errors.rejectValue("file", null, "Please select only image file for upload!");
			return;
		}
		
		if (product.getUnit_price() <= 0) {
			errors.rejectValue("unit_price", null, "Please enter the price of product!");
			return;
		}
	}

}

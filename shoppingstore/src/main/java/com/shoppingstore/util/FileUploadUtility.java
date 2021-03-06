package com.shoppingstore.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtility {
	private static final String ABS_PATH="C:\\Users\\Reza\\springlearning2\\shopping_store\\shoppingstore\\src\\main\\webapp\\resources\\";
	private static String REAL_PATH="";
	private static final Logger logger = LoggerFactory.getLogger(FileUploadUtility.class);
	public static void uploadFile(HttpServletRequest request, MultipartFile file, String code) {
		// TODO Auto-generated method stub
		REAL_PATH = request.getSession().getServletContext().getRealPath("/resources");
		logger.info(REAL_PATH);
		//to make sure all directories exist if not crete new one
		if (new File(ABS_PATH).exists()) {
			new File(ABS_PATH).mkdirs();
		}
		if (new File(REAL_PATH).exists()) {
			new File(REAL_PATH).mkdirs();
		}
		try {
			//server upload
			file.transferTo(new File(REAL_PATH + code + ".jpg"));
			//project directory upload
			file.transferTo(new File(ABS_PATH + code + ".jpg"));
		}catch(IOException ex) {
			
		}
	}
}

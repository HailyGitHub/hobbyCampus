package com.hobbycam.upload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class ImgUplod {
	
	public String copyInto(MultipartFile resumeImg, String fileName, String savePathFile, String fileExtension) {
		
		String savePathImg=savePathFile+""+fileName+fileExtension;
		try {
			byte bytes[] = resumeImg.getBytes();
			File f = new File(savePathImg);
			FileOutputStream fos = new FileOutputStream(f);
			fos.write(bytes);
			fos.close();
			return savePathImg;
		} catch (IOException e) {
			e.printStackTrace();
			return "";
		}
	}
}

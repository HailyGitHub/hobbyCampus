package com.hobbycam.upload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class UploadModuleImg implements UploadModule {

	@Override
	public boolean copyInto(MultipartFile upload, String fileName, String savePath, String extension) {
		
		String saveFilePath = savePath + "" + fileName + extension;
		try {
			byte bytes[] = upload.getBytes();
			File f = new File(saveFilePath);
			FileOutputStream fos = new FileOutputStream(f);
			fos.write(bytes);
			fos.close();
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}

}

package com.hobbycam.upload;

import org.springframework.web.multipart.MultipartFile;

public interface UploadModule {
	
	public boolean copyInto(MultipartFile upload, String fileName, String savePath, String extension);
	
}

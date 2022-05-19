package com.hobbycam.upload;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

public class getLessonImg {
	
	
	/**get lesson Video by lesson_idx*/
	public List getImages(String thumbnail, ServletContext servletContext) {
		
		List lists = new ArrayList();
		
		//get save path
		String savePathFolder = servletContext.getRealPath("/hobbyImg/lesson/"+thumbnail+"/img/");
		
		//get files from save path Folder
		File f = new File(savePathFolder);
		File imges[] = f.listFiles();
		for(int i=0; i<imges.length; i++) {
			String lessonImgName = imges[i].getName();
			lists.add(lessonImgName);
		}
		
		return lists;
	}
	
}

package com.project.util;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {

	public int fileListUpload(List<MultipartFile> fileList, String folderPath, int boardNum) {
		
		folderPath += ("\\" + boardNum);
		
		File boardFolder = new File(folderPath);
		boardFolder.mkdir(); //^^
		try {
			for(int i = 0; i < fileList.size(); i++) {
				MultipartFile file = fileList.get(i);
				fileUpload(file, folderPath);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		
		return 1;
	}
	
	public void fileUpload (MultipartFile file, String folderPath) throws IOException {
		
			String fileRealName = file.getOriginalFilename();
			
			File saveFile = new File(folderPath + "\\" + fileRealName);
			file.transferTo(saveFile);
	}
	
}

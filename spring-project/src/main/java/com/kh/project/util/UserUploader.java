package com.kh.project.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class UserUploader {
	public static String uploadFile(
			String uploadPath,
			String originalFilename,
			byte[] fileData) {
		UUID uuid = UUID.randomUUID();
		String saveFilename = uploadPath + "/"
				+ uuid + "_" + originalFilename;
		System.out.println("saveFilename:" + saveFilename);
		File target = new File(saveFilename);
		try {
			FileCopyUtils.copy(fileData, target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return saveFilename;
	}
}

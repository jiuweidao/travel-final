package com.travel.utils;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.httpclient.util.DateUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

public class FileUtils {


	public static String uploadPicture(MultipartFile file,HttpServletRequest request) {

		File targetFile = null;
		String msg = "";// 返回存储路径
		String fileName = file.getOriginalFilename();// 获取文件名加后缀
		if (fileName != null && fileName != "") {
			String returnUrl = /*request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() +*/ "/upload/imgs/";// 存储路径
			String path = request.getSession().getServletContext()
					.getRealPath("upload/imgs"); // 文件存储位置
			String fileF = fileName.substring(fileName.lastIndexOf("."),
					fileName.length());// 文件后缀
			fileName = new Date().getTime() + "_" + new Random().nextInt(1000)
					+ fileF;// 新的文件名

			// 先判断文件是否存在
			String fileAdd = DateUtil.formatDate(new Date(), "yyyyMMdd");
			File file1 = new File(path + "/" + fileAdd);
			// 如果文件夹不存在则创建
			if (!file1.exists() && !file1.isDirectory()) {
				file1.mkdirs();
			}
			targetFile = new File(file1, fileName);
			// targetFile = new File(path, fileName);
			try {
				file.transferTo(targetFile);
				// msg=returnUrl+fileName;
				msg = returnUrl + fileAdd + "/" + fileName;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return msg;
	}

}

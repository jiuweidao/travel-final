package com.travel.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.httpclient.util.DateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {


	@RequestMapping(value = "/uploadImg.html", method = RequestMethod.POST)
	@ResponseBody
	public String uploadPicture(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request) {

		Map<String, String> result = new HashMap<String, String>();
		File targetFile = null;
		String msg = "";// 返回存储路径
		int code = 1;
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
				code = 0;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		result.put("success", "true");
		result.put("path", msg);
		// return JSON.toJSONString(ResponseResult.result(code, msg));
		return JSONObject.fromObject(result).toString();
	}

}
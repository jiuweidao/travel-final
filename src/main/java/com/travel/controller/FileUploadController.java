package com.travel.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Controller
public class FileUploadController {


	@RequestMapping(value = "/uploadImg.html", method = RequestMethod.POST)
	@ResponseBody
	public String uploadPicture(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request) {

		Map<String, String> result = new HashMap<String, String>();
		String path=uploadPicture(file,request);
		result.put("success", "true");
		result.put("path", path);
		return JSONObject.fromObject(result).toString();
	}

	@RequestMapping("springUpload")
	public String springUpload(HttpServletRequest request)
			throws IllegalStateException, IOException {
		long startTime = System.currentTimeMillis();
		// 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());

		MultipartHttpServletRequest multiRequest1 = (MultipartHttpServletRequest) request;
		// 获取multiRequest 中所有的文件名
		Iterator iter1 = multiRequest1.getFileNames();
		// 检查form中是否有enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {
			// 将request变成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 获取multiRequest 中所有的文件名
			Iterator iter = multiRequest.getFileNames();

			while (iter.hasNext()) {
				// 一次遍历所有文件
				MultipartFile file = multiRequest.getFile(iter.next()
						.toString());
				if (file != null) {
					String path = "E:/springUpload"
							+ file.getOriginalFilename();
					// 上传
					file.transferTo(new File(path));
				}

			}

		}
		long endTime = System.currentTimeMillis();
		System.out.println("方法三的运行时间：" + String.valueOf(endTime - startTime)
				+ "ms");
		return "/success";
	}

}
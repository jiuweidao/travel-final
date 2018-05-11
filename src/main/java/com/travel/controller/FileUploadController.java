package com.travel.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public @ResponseBody
	String provideUploadInfo() {
		return "You can upload a file by posting to this same URL.";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public @ResponseBody
	String handleFileUpload(@RequestParam("name") String name,
			@RequestParam("file") MultipartFile file) {
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				name = "D:/apache-tomcat-7.0.77/webapps/mytravel/upload/"
						+ name;
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(new File(name)));
				stream.write(bytes);
				stream.close();

				return "You successfully uploaded " + name + " into " + name
						+ "-uploaded !";
			} catch (Exception e) {
				return "You failed to upload " + name + " => " + e.getMessage();
			}
		} else {
			return "You failed to upload " + name
					+ " because the file was empty.";
		}
	}

	@RequestMapping("/up")
	// 目录http://localhost:8080/shiroTset/index
	public String getIndex(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		return "upload";
	}

}
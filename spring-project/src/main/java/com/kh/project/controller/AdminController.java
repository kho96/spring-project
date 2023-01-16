package com.kh.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/movie/admin/*")
public class AdminController {
	
	@RequestMapping(value = "/movie", method = RequestMethod.GET)
	public String showMovie() {
		return "admin_movie";
	}
	
	@RequestMapping(value = "/article", method = RequestMethod.GET)
	public String showArticle() {
		return "admin_article";
	}
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String showMember() {
		return "admin_member";
	}
}

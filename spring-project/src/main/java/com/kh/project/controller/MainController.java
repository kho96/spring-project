package com.kh.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/movie/*")
public class MainController {
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String showMain() {
		return "main";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String showMovieList() {
		return "movie_list";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String showMovieDetail() {
		return "movie_detail";
	}

	
	@RequestMapping(value = "/booking", method = RequestMethod.GET)
	public String booking() {
		return "movie_booking";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLoginForm() {
		return "login";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String showRegistForm() {
		return "user_register_form";
	}
	
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String showEventList() {
		return "event_list";
	}
	
	@RequestMapping(value = "/event_detail", method = RequestMethod.GET)
	public String showEventDetail() {
		return "event_detail";
	}
	
	@RequestMapping(value = "/support", method = RequestMethod.GET)
	public String goSupportPage() {
		return "support";
	}
}

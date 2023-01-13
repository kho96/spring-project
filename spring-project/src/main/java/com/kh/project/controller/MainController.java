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
	public String goSupportPage(String page) {
		if(page != null) {
			if (page.equals("frequentlyQ")) {
				return "frequentlyQA";
			} else if (page.equals("notice")) {
				return "notice";
			} else if (page.equals("qa-board")) {
				return "qa-board";
			}
		}
		return "support";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String showAdmin() {
		return "admin";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String showMypage() {
		return "mypage";
	}
	
	@RequestMapping(value = "/store", method = RequestMethod.GET)
	public String storeDetail() {
		return "store_detail";
	}
	
	@RequestMapping(value = "/storecart", method = RequestMethod.GET)
	public String storeBasket() {
		return "store_cart";
	}
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String showQna() {
		return "qna";
	}
	@RequestMapping(value = "/qna_board", method = RequestMethod.GET)
	public String showQna_board() {
		return "qna_board";
	}
	@RequestMapping(value = "/ann", method = RequestMethod.GET)
	public String showAnn() {
		return "ann";
	}
	@RequestMapping(value = "/ann_board", method = RequestMethod.GET)
	public String showAnn_board() {
		return "ann_board";
	}
	@RequestMapping(value = "/fre_qna", method = RequestMethod.GET)
	public String showFre_qna() {
		return "fre_qna";
	}
}

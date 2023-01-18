package com.kh.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.service.AdminMovieService;
import com.kh.project.vo.MovieVo;

@Controller
@RequestMapping(value = "/movie/admin/*")
public class AdminController {
	
	@Autowired
	private AdminMovieService service;
	
	@RequestMapping(value = "/movie_management", method = RequestMethod.GET)
	public String showMovie(Model model) {
		List<MovieVo> list = service.getMovieList();
		model.addAttribute("list", list);
		return "admin_movie";
	}
	
	@RequestMapping(value = "/theater_management", method = RequestMethod.GET)
	public String showTheater(Model model) {
		List<String> cinema_list = service.getCinemaList();
		List<String> title_list = service.getTitleList();
		model.addAttribute("cinema_list", cinema_list);
		model.addAttribute("title_list", title_list);
		return "admin_theater";
	}
	
	@RequestMapping(value = "/article", method = RequestMethod.GET)
	public String showArticle() {
		return "admin_article";
	}
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String showMember() {
		return "admin_member";
	}
	
	@RequestMapping(value = "movie_management/insert_run", method = RequestMethod.POST)
	public String insertMovie(MovieVo movieVo) {
		System.out.println("[insertMovie] movieVo : " + movieVo);
		service.insertMovie(movieVo);
		return "redirect:/movie/admin/movie_management";
	}
	
	@RequestMapping(value = "movie_management/update_run", method = RequestMethod.POST)
	public String updateMovie(MovieVo movieVo) {
		System.out.println("[updateMovie] movieVo : " + movieVo);
		service.updateMovie(movieVo);
		return "redirect:/movie/admin/movie_management";
	}
	
	@ResponseBody
	@RequestMapping(value = "movie_management/get_detail", method = RequestMethod.POST)
	public MovieVo insertMovie(String movie_no) {
		int mno = Integer.parseInt(movie_no);
		MovieVo movieVo = service.getMovieDetail(mno);
		return movieVo;
	}
	
	@RequestMapping(value = "movie_management/delete_movie", method = RequestMethod.GET)
	public String deleteMovie(String movie_no) {
		int mno = Integer.parseInt(movie_no);
		service.deleteMovie(mno);
		return "redirect:/movie/admin/movie_management";
	}
}

package com.kh.project.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.service.AdminMovieService;
import com.kh.project.service.AnnService;
import com.kh.project.service.QnaCommentService;
import com.kh.project.service.QnaService;
import com.kh.project.vo.AnnVo;
import com.kh.project.vo.MovieVo;
import com.kh.project.vo.PagingDto;
import com.kh.project.vo.QnaCommentVo;
import com.kh.project.vo.QnaVo;
 
@Controller
@RequestMapping(value = "/movie/admin/*")
public class AdminController {

	@Autowired private AdminMovieService service;
	@Autowired private AnnService annService;
	@Autowired private QnaService qnaService;
	@Autowired private QnaCommentService qnaCommentService;
	
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
	
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public String showQnaList(Model model, PagingDto pagingDto) {
		pagingDto.setPagingInfo(pagingDto.getPage(), qnaService.getCount(pagingDto));
		System.out.println("pagingDto:" + pagingDto);
		List<QnaVo> list = qnaService.showQnaList(pagingDto);
		model.addAttribute("list", list);
		model.addAttribute("pagindDto", pagingDto);
		return "admin_qna";
	}
	
	@RequestMapping(value = "/qna_detail", method = RequestMethod.GET)
	public String showQnaDetail(int qna_no, Model model, int page) {
		QnaVo qnaVo = qnaService.showQnaDetail(qna_no);
		QnaCommentVo qnaCommentVo = qnaCommentService.showQnaComment(qna_no);
		model.addAttribute("qnaVo", qnaVo);
		model.addAttribute("qnaCommentVo", qnaCommentVo);
		model.addAttribute("page", page);
		return "admin_qna_board";
	}
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String showMember() {
		return "admin_member";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertQnaComment", method = RequestMethod.POST)
	public String insertQnaComment(QnaCommentVo qnaCommentVo) {
		//System.out.println("AC_QCVO: " + qnaCommentVo);
		boolean result = qnaCommentService.insertQna(qnaCommentVo);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "modifyQnaComment", method = RequestMethod.POST)
	public String modifyQnaComment(QnaCommentVo qnaCommentVo) {
		//System.out.println("AC_QCVO: " + qnaCommentVo);
		boolean result = qnaCommentService.modifyQnaComment(qnaCommentVo);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "deleteQnaComment", method = RequestMethod.POST)
	public String deleteQnaComment(int qna_no) {
		System.out.println("qna_no" + qna_no);
		boolean result = qnaCommentService.deleteQnaComment(qna_no);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/annList", method = RequestMethod.GET)
	public String showAnnList(Model model, PagingDto pagingDto) {
		pagingDto.setPagingInfo(pagingDto.getPage(), annService.getCount(pagingDto));
		System.out.println("pagingDto:" + pagingDto);
		List<AnnVo> list = annService.getList(pagingDto);
		model.addAttribute("list", list);
		model.addAttribute("pagindDto", pagingDto);
		return "admin_ann";
	}
	
	@ResponseBody
	@RequestMapping(value = "/showAnnDetail", method = RequestMethod.GET)
	public AnnVo showDetail(int ann_no) {
		//System.out.println("ann_no:" + ann_no);
		AnnVo annVo = annService.getDetail(ann_no);
		//System.out.println("Controller_"+ annVo);
		return annVo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertAnn", method = RequestMethod.POST)
	public String insertArticle(AnnVo annVo) {
		boolean result = annService.insertArticle(annVo);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/modifyAnn", method = RequestMethod.POST)
	public String modifyAnn(AnnVo annVo) {
		System.out.println("Modify_Controller: " + annVo);
		boolean result = annService.updateAnn(annVo);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/deleteAnn", method = RequestMethod.POST)
	public String deleteAnn(int ann_no) {
		System.out.println("Delete_ann_no:" + ann_no);
		boolean result = annService.deleteAnn(ann_no);
		System.out.println("result: " + result);
		return String.valueOf(result);
	}

	@RequestMapping(value = "movie_management/insert_run", method = RequestMethod.POST)
	public String insertMovie(MovieVo movieVo) {
		String score = movieVo.getScore();
		if (score == null || score.equals("")) movieVo.setScore("집계중");
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

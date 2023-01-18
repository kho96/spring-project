package com.kh.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.service.AnnLikeService;
import com.kh.project.service.AnnService;
import com.kh.project.service.QnaCommentService;
import com.kh.project.service.QnaService;
import com.kh.project.service.SampleService;
import com.kh.project.vo.AnnLikeVo;
import com.kh.project.vo.AnnVo;
import com.kh.project.vo.PagingDto;
import com.kh.project.vo.QnaCommentVo;
import com.kh.project.vo.QnaVo;
import com.kh.project.vo.SampleVo;

@Controller
@RequestMapping(value = "/movie/*")
public class MainController {

	@Autowired
	private SampleService service;
	
	@Autowired private AnnService annService;
	@Autowired private QnaService qnaService;
	@Autowired private QnaCommentService qnaCommentService;
	@Autowired private AnnLikeService annLikeService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String showMain(Model model) {
		List<SampleVo> list = service.getSampleList();
		model.addAttribute("list", list);
		System.out.println(list);
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
		if (page != null) {
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
	
	@ResponseBody
	@RequestMapping(value = "/insertQna", method = RequestMethod.POST)
	public String insertQna(QnaVo qnaVo) {
		//System.out.println("MC_qnaVo: " + qnaVo);
		boolean result = qnaService.insertQna(qnaVo);
		//System.out.println("MC_result:" + result);
		return String.valueOf(result);
	}

	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String showQnaList(Model model, PagingDto pagingDto, QnaVo qnaVo) {
		pagingDto.setPagingInfo(pagingDto.getPage(), qnaService.getCount(pagingDto));
		List<QnaVo> list = qnaService.showQnaList(pagingDto);
		//System.out.println("list:" + list);
		model.addAttribute("list", list);
		model.addAttribute("pagindDto", pagingDto);
		return "qna";
	}
	@RequestMapping(value = "/qna_board", method = RequestMethod.GET)
	public String showQna_board(String writer, int qna_no, Model model, int page) {
		QnaVo qnaVo = qnaService.showQnaDetail(qna_no);
		// 로그인 아이디랑 비교해야함
		qnaVo.setUserid("bbbb");
		System.out.println("qnaVo: " + qnaVo);
		QnaCommentVo qnaCommentVo = qnaCommentService.showQnaComment(qna_no);
		model.addAttribute("qnaVo", qnaVo);
		model.addAttribute("qnaCommentVo", qnaCommentVo);
		model.addAttribute("page", page);
		model.addAttribute("writer", writer);
		return "qna_board";
	}
	
	@ResponseBody
	@RequestMapping(value = "/modifyQnaContent", method = RequestMethod.POST)
	public String modifyQnaContent(QnaVo qnaVo) {
		// 로그인 아이디랑 비교
		qnaVo.setUserid("bbbb");
		System.out.println("Md_qnaVo: " + qnaVo);
		boolean result = qnaService.modifyQnaContent(qnaVo);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteQna", method = RequestMethod.POST)
	public String deleteQna(QnaVo qnaVo) {
		qnaVo.setUserid("bbbb");
		System.out.println("delete:" + qnaVo);
		boolean result = qnaService.deleteQna(qnaVo);
		return String.valueOf(result);
	}

	@RequestMapping(value = "/ann", method = RequestMethod.GET)
	public String showAnn(Model model, PagingDto pagingDto) {
		pagingDto.setPagingInfo(pagingDto.getPage(), annService.getCount(pagingDto));
		List<AnnVo> list = annService.getList(pagingDto);
		model.addAttribute("list", list);
		model.addAttribute("pagindDto", pagingDto);
		return "ann";
	}

	@RequestMapping(value = "/ann_board", method = RequestMethod.GET)
	public String showAnn_board(int ann_no, Model model, int page, AnnLikeVo annLikeVo) {
		AnnVo annVo = annService.getDetail(ann_no);
		int likeCount = annLikeService.getLikeCount(ann_no);
		// 아이디
		annLikeVo.setUserid("bbbb");
		boolean likeResult = annLikeService.checkLike(annLikeVo);
		Map<String, Object> likeMap = new HashMap<>();
		likeMap.put("likeCount", likeCount);
		likeMap.put("likeResult", likeResult);
		model.addAttribute("annVo", annVo);
		model.addAttribute("page", page);
		model.addAttribute("likeMap", likeMap);
		return "ann_board";
	}
	
	@ResponseBody
	@RequestMapping(value = "/sendLike", method = RequestMethod.POST)
	public String sendLike(AnnLikeVo annLikeVo) {
		// 아이디
		annLikeVo.setUserid("bbbb");
		System.out.println("sendLikeVo:" + annLikeVo);
		boolean result = annLikeService.insertHeart(annLikeVo);
		return String.valueOf(result);
	}
	@ResponseBody
	@RequestMapping(value = "/likeCancle", method = RequestMethod.POST)
	public String likeCancle(AnnLikeVo annLikeVo) {
		// 아이디
		annLikeVo.setUserid("bbbb");
		System.out.println("likeCancle:" + annLikeVo);
		boolean result = annLikeService.cancleLike(annLikeVo);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getLikeCount", method = RequestMethod.GET)
	public String getLikeCount(int ann_no) {
		int likeCount = annLikeService.getLikeCount(ann_no);
		return String.valueOf(likeCount);
	}
	
	@RequestMapping(value = "/fre_qna", method = RequestMethod.GET)
	public String showFre_qna() {
		return "fre_qna";
	}
	
}

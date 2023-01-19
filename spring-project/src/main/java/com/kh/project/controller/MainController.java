package com.kh.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.kh.project.service.UserService;
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
import com.kh.project.vo.UserVo;

@Controller
@RequestMapping(value = "/movie/*")
public class MainController {
	 
	@Autowired
	private UserService userService;
	
	@Autowired private AnnService annService;
	@Autowired private QnaService qnaService;
	@Autowired private QnaCommentService qnaCommentService;
	@Autowired private AnnLikeService annLikeService;
	
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
  
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String LoginForm(HttpSession session, HttpServletRequest request) {
		String loginid= request.getParameter("loginid");
		String loginpw= request.getParameter("loginpw");
		UserVo vo = userService.getUserById(loginid);
		System.out.println("userVo:" + vo);
		System.out.println("�븘�뵒"+loginid);
		System.out.println("鍮꾨쾲"+loginpw);
		System.out.println(vo);
		String page= "";
		if(loginid.equals(vo.getUserid()) && loginpw.equals(vo.getUserpw())) {
			System.out.println(vo.getMaster());
			if (vo.getMaster().equals("T")) {
				session.setAttribute("loginResult", "admin");
				page = "redirect:/movie/admin";
				System.out.println("愿�由ъ옄");
			} else {
				session.setAttribute("loginResult","member");
				System.out.println("硫ㅻ쾭");
			page = "redirect:/movie/main";
			System.out.println("�꽦怨�");
			System.out.println(session.getAttribute("loginResult"));
			}
		} else {
			session.setAttribute("loginResult","guest");
			page = "redirect:/movie/login";
			System.out.println("�떎�뙣");
		}
		session.setAttribute("userVo", vo);
		return page;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm() {
		return "user_register_form";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerRun(UserVo vo, RedirectAttributes rttr, HttpServletRequest request) {

		String year = request.getParameter("year");
		String month = request.getParameter("month");
		if(0<Integer.parseInt(month) && Integer.parseInt(month)<10) {
			month = "0"+month;
		}
		String day = request.getParameter("day");
		if(0<Integer.parseInt(day) && Integer.parseInt(day)<10) {
			day = "0"+day;
		}
		String userBirth = year+"-"+month+"-"+day;
		vo.setUserbirth(userBirth);
//		System.out.println("year"+year);
//		System.out.println("month"+month);
//		System.out.println("day"+day);
//		System.out.println(vo);
		boolean result = userService.insertUser(vo);
		System.out.println("result:" + result);
		String page = "";
		if (result) {
			rttr.addFlashAttribute("register_result", "success");
			page = "redirect:/movie/login"; // 濡쒓렇�씤�뤌
		} else {
			rttr.addFlashAttribute("register_result", "fail");
			page = "redirect:/movie/register"; // �쉶�썝媛��엯�뤌
		}
		
		return page;
	}
	
	@RequestMapping(value = "/checkDupId", method = RequestMethod.POST)
	@ResponseBody
	public String checkDupId(String userid) {
		System.out.println("userid:" + userid);
		int count = userService.checkDupId(userid);
		System.out.println(count);
		return String.valueOf(count);
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
	public String showQna_board(String writer, int qna_no, Model model, int page, HttpSession session) {
		QnaVo qnaVo = qnaService.showQnaDetail(qna_no);
		// 로그인 아이디랑 비교해야함
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		if(userVo == null) {
			System.out.println("로그인 필요함");
			return "login";
		}
		String userid = userVo.getUserid();
		System.out.println("userId: " + userid);
		qnaVo.setUserid(userid);
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
	public String modifyQnaContent(QnaVo qnaVo, HttpSession session) {
		// 로그인 아이디랑 비교해야함
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		String userid = userVo.getUserid();
		System.out.println("userId: " + userid);
		qnaVo.setUserid(userid);
		System.out.println("Md_qnaVo: " + qnaVo);
		boolean result = qnaService.modifyQnaContent(qnaVo);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteQna", method = RequestMethod.POST)
	public String deleteQna(QnaVo qnaVo, HttpSession session) {
		// 로그인 아이디랑 비교해야함
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		String userid = userVo.getUserid();
		System.out.println("userId: " + userid);
		qnaVo.setUserid(userid);
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
	public String showAnn_board(int ann_no, Model model, int page, AnnLikeVo annLikeVo, HttpSession session) {
		AnnVo annVo = annService.getDetail(ann_no);
		model.addAttribute("annVo", annVo);
		model.addAttribute("page", page);
		Map<String, Object> likeMap = new HashMap<>();
		int likeCount = annLikeService.getLikeCount(ann_no);
		System.out.println("likeCount:" + likeCount);
		model.addAttribute("likeCount", likeCount);
		// 로그인 아이디랑 비교해야함
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		if(userVo == null) {
			return "ann_board";
		}
		String userid = userVo.getUserid();
		System.out.println("userId: " + userid);
		annLikeVo.setUserid(userid);
		boolean likeResult = annLikeService.checkLike(annLikeVo);
		likeMap.put("likeVo", annLikeVo);
		likeMap.put("likeResult", likeResult);
		model.addAttribute("likeMap", likeMap);
		return "ann_board";	
	}
	
	@ResponseBody
	@RequestMapping(value = "/sendLike", method = RequestMethod.POST)
	public String sendLike(AnnLikeVo annLikeVo, HttpSession session) {
		// 아이디
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		String userid = userVo.getUserid();
		System.out.println("userId: " + userid);
		annLikeVo.setUserid(userid);
		boolean result = annLikeService.insertHeart(annLikeVo);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/likeCancle", method = RequestMethod.POST)
	public String likeCancle(AnnLikeVo annLikeVo, HttpSession session) {
		// 아이디
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		String userid = userVo.getUserid();
		System.out.println("userId: " + userid);
		annLikeVo.setUserid(userid);
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

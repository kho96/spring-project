package com.kh.project.controller;

import java.util.List;

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
import com.kh.project.vo.SampleVo;
import com.kh.project.vo.UserVo;

@Controller
@RequestMapping(value = "/movie/*")
public class MainController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String showMain() {
		return "main";
	}
	
	@RequestMapping(value = "/kakao", method = RequestMethod.GET)
	public String showKakao() {
		return "kakao";
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
	public String LoginForm(HttpSession session, HttpServletRequest request , RedirectAttributes rttr) {
		String loginid= request.getParameter("loginid");
		String loginpw= request.getParameter("loginpw");
		UserVo vo = userService.getUserById(loginid);
		List<UserVo> list = userService.getUserList();
		System.out.println("아디"+loginid);
		System.out.println("비번"+loginpw);
		System.out.println(vo);
		String page= "";
		
		if (vo == null) {
			rttr.addFlashAttribute("loginResult", "fail");
			page = "redirect:/movie/login";
		} else if(loginid.equals(vo.getUserid()) && loginpw.equals(vo.getUserpw())) {
			System.out.println(vo.getMaster());
			if (vo.getMaster().equals("T")) {
				session.setAttribute("loginResult", "admin");
				page = "redirect:/movie/admin";
				System.out.println("관리자");
			} else {
				session.setAttribute("vo", vo);
				session.setAttribute("loginResult","member");
				System.out.println("멤버");
			page = "redirect:/movie/main";
			
			System.out.println("성공");
			System.out.println(session.getAttribute("loginResult"));
			}
		} else {
			session.setAttribute("loginResult","guest");
			page = "redirect:/movie/login";
		}
		return page;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm() {
		return "user_register_form";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerRun(HttpSession Session,Model model, UserVo vo, RedirectAttributes rttr, HttpServletRequest request) {

		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String gender = request.getParameter("gender");
		String pic = "";
		if(0<Integer.parseInt(month) && Integer.parseInt(month)<10) {
			month = "0"+month;
		}
		String day = request.getParameter("day");
		if(0<Integer.parseInt(day) && Integer.parseInt(day)<10) {
			day = "0"+day;
		}
		if(gender.equals("M")) {
			pic = "/assets/images/man.png";
		} else if (gender.equals("F")) {
			pic = "/assets/images/Female.png";
		}
		
		String userBirth = year+"-"+month+"-"+day;
		vo.setUserbirth(userBirth);
		vo.setUserpic(pic);
//		System.out.println("year"+year);
//		System.out.println("month"+month);
//		System.out.println("day"+day);
//		System.out.println(vo);
		boolean result = userService.insertUser(vo);
		System.out.println("result:" + result);
		String page = "";
		if (result) {
			rttr.addFlashAttribute("register_result", "success");
			page = "redirect:/movie/login"; // 로그인폼
		} else {
			rttr.addFlashAttribute("register_result", "fail");
			page = "redirect:/movie/register"; // 회원가입폼
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
	
	@RequestMapping(value = "/mypage_detail", method = RequestMethod.GET)
	public String showMypageDetail() {
		return "mypage_detail";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String runModify(UserVo vo, HttpServletRequest request, HttpSession Session) {
		System.out.println("수정 시작 ," + vo.toString());
		String userpic = request.getParameter("userpic");
		String usergrade = request.getParameter("usergrade");
		String userno = request.getParameter("userno");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		if(0<Integer.parseInt(month) && Integer.parseInt(month)<10) {
			month = "0"+month;
		}
		if(0<Integer.parseInt(day) && Integer.parseInt(day)<10) {
			day = "0"+day;
		}
		String userBirth = year+"-"+month+"-"+day;
		vo.setUserbirth(userBirth);
		vo.setUserpic(userpic);
		vo.setUsergrade(usergrade);
		vo.setUser_no(userno);
		boolean result = userService.userModify(vo);
		Session.setAttribute("vo", vo);
		System.out.println("modify,vo"+ vo);
		return "redirect:/movie/mypage";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String runDelete(HttpServletRequest request) {
		String userid = request.getParameter("userid");
		boolean result = userService.userDelete(userid);
		System.out.println("delresult"+result);
		return "redirect:/movie/main";
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
	public String showMypage(Model model,HttpSession Session) {
		
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

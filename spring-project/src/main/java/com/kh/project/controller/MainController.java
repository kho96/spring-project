package com.kh.project.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.project.service.CinemaService;
import com.kh.project.service.ReservationService;
import com.kh.project.service.SampleService;
import com.kh.project.vo.CinemaVo;
import com.kh.project.vo.ReservationVo;
import com.kh.project.vo.SampleVo;

@Controller
@RequestMapping(value = "/movie/*")
public class MainController {

	@Autowired
	private SampleService service;
	
	@Autowired
	private CinemaService cinemaService;
	
	@Autowired
	private ReservationService reservationService;
	
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
	public String booking(Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("movie", cinemaService.getMovieList()); // 영화
		map.put("cinema", cinemaService.getCinemaList()); // 극장
		map.put("date", cinemaService.getDateList()); // 날짜
		map.put("time", cinemaService.getTimeList()); // 시간
		model.addAttribute("map", map);
		return "movie_booking";
	}
	
	// 비동기 요청(극장 보이기)
	@RequestMapping(value = "/checkCinema", method = RequestMethod.POST)
	@ResponseBody
	public List<String> checkCinema(String cinema_movie) {
		List<String> cinema_list_byMovie = cinemaService.getCinemaList(cinema_movie);
		return cinema_list_byMovie;
	}
	
	// 비동기 요청(날짜 보이기)
	@RequestMapping(value = "/checkDate", method = RequestMethod.POST)
	@ResponseBody
	public List<Date> checkDate(String cinema_name, String cinema_movie) {
		List<Date> date_list_byCinema = cinemaService.getDateList(cinema_name, cinema_movie);
		return date_list_byCinema;
	}
	
	// 비동기 요청(시간 보이기)
	@RequestMapping(value = "/checkTime", method = RequestMethod.POST)
	@ResponseBody
	public List<Date> checkTime(String cinema_name, String cinema_movie, String day) {
		List<Date> time_list_byCinema = cinemaService.getTimeList(cinema_name, cinema_movie, day);
		return time_list_byCinema;
	}

	// 비동기 요청(좌석보이기)
	@RequestMapping(value = "/checkSeat", method = RequestMethod.POST)
	public String checkSeat(String cinema_name, String cinema_movie, String cinema_time, Model model) {
		List<CinemaVo> allList = cinemaService.getSeatAll(cinema_name, cinema_movie, cinema_time); // 좌석 정보
		int maxCol = cinemaService.getSeatCol(cinema_name, cinema_movie, cinema_time); // 최대 열 수(col 수)
		int seatsLeft = cinemaService.getSeatsLeft(cinema_name, cinema_movie, cinema_time); // 남은 좌석 수
		model.addAttribute("maxCol", maxCol);
		model.addAttribute("allList", allList);
		model.addAttribute("seatsLeft", seatsLeft);
		return "choice_seat";
	}
	
	// 영화 예매처리
	@RequestMapping(value = "/reservation.run", method = RequestMethod.POST)
	public String reservationRun(ReservationVo vo, RedirectAttributes rttr) {
		boolean result = reservationService.reservation(vo);
		if (result) {
			rttr.addFlashAttribute("reservation_result", "success");
			return "redirect:/main";
		}
		rttr.addFlashAttribute("reservation_result", "fail");
		return "redirect:/booking";
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

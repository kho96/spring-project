<%@page import="com.kh.project.util.MovieShuffle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jspf" %>
<script>
$(function() {
	var reservation_result = "${reservation_result}"; // 예매처리 세션값 확인
	if (reservation_result == "fail") alert("예매 실패, 다시 예매해주세요."); // 예매 실패 메세지
	
	var check_personnel = 0; // 체크된 인원 수(좌석 선택된 수)
	var pay = 0; //요금
	// 예매 정보
	var select_movie = "";
	var select_theater = "";
	var select_day = "";
	var select_time = "";
	
	var seats = []; // 선택 좌석(열,번)
	
	// 영화선택
	$(".td-movie").click(function() {
		// 영화 바뀔 경우 세팅값 변경
		$("#div-theater").find("td").css("color", "gray")
									.css("background-color", "#fff");
		$("#div-day").find("td").css("background-color", "#fff")
								.css("color", "gray");
		$("#div-day").css("opacity", 0.5);	
		$("#div-time").find("td").css("background-color", "#fff");
		$("#div-time").css("opacity", 0.5);	
		$("#div-seat").slideUp(1000);
		$(".td-time").hide(); // td-time 숨기기
		$("#tr-time-ment").show(); // tr-time-ment 보이기
		
		// 선택할 경우 배경색 변경, 다음 항목 선택 가능하게 오픈, 예매정보에 선택된 정보 넣기
		$(".td-movie").css("background-color", "#fff")
		$(this).css("background-color", "#e75e8d");
		
		select_movie = $(this).text().trim();
		
		// 비동기 요청
		var url = "/movie/checkCinema";
		var sData = {"cinema_movie" : select_movie};
		$.post(url, sData, function(rData) { 
			var cinema_names = rData; //rData 값 저장
			var tds = $("#div-theater").find("td");
			for(i = 0; i < cinema_names.length; i++) {
				for(j = 0; j < tds.length; j++) {
					if(tds[j].innerText == cinema_names[i]) {
						$("#div-theater").find("td").eq(j).css("color", "black");
					}
				}
			}
			// 다음 선택요소 선택가능으로 변경
			$("#div-theater").css("opacity", 1)
			 				 .attr("data-op", 1);
		}); //$.post
	});
	
	
	// 상영관 선택
	$(".td-theater").click(function() {
		var op = $("#div-theater").attr("data-op"); // 저장된 op값 확인
		var fontColor = $(this).css("color"); // 글자 색상 얻기
		
		// op값이 0.5인 경우, 폰트 색상이 회색인 경우(이전 항목이 선택되 않음) - 이벤트 작동 막기
		if(op == 0.5 || fontColor == "rgb(128, 128, 128)") { 
			return;
		}
		// 극장 바뀔 경우 세팅값 변경
		$("#div-day").find("td").css("background-color", "#fff")
								.css("color", "gray");
		$("#div-day").css("opacity", 0.5);	
		$("#div-time").find("td").css("background-color", "#fff");
		$("#div-time").css("opacity", 0.5);	
		$("#div-seat").slideUp(1000);
		
		$("#div-day").find("td").css("color", "gray"); // 글자 색 초기화(요일)
		$(".td-theater").css("background-color", "#fff")
		$(this).css("background-color", "#e75e8d");
		$(".td-time").hide(); // td-time 숨기기
		$("#tr-time-ment").show(); // tr-time-ment 보이기
		
		select_theater = $(this).text().trim();
		
		// 비동기 요청
		var url = "/movie/checkDate";
		var sData = {
				"cinema_name" : select_theater,
				"cinema_movie" : select_movie,
				};
		$.post(url, sData, function(rData) { 
			var dates = [];
			for (i = 0; i < rData.length; i++) {
				var date = new Date(rData[i]);
				var month = date.getMonth() + 1; // 월
				if(month < 10) {
					month = "0" + month;
				}
				var day = date.getDate(); // 일
				if(day < 10) {
					day = "0" + day;
				}
				var newDate = month + "/" + day; // 영화, 극장에 맞는 상영 날짜 얻기
				dates.push(newDate); // 배열에 날짜 넣기
			}
			
			var tds = $("#div-day").find("td");
			for(i = 0; i < dates.length; i++) {
				for(j = 0; j < tds.length; j++) {
					if(tds[j].innerText == dates[i]) {
						$("#div-day").find("td").eq(j).css("color", "black");
					}
				}
			}
			// 다음 선택요소 선택가능으로 변경
			$("#div-day").css("opacity", 1)
		 				 .attr("data-op", 1);

		}); //$.post
	});
	
	// 날짜 선택
	$(".td-day").click(function() {
		
		var op = $("#div-day").attr("data-op");
		var fontColor = $(this).css("color"); // 글자 색상 얻기
		if(op == 0.5 || fontColor == "rgb(128, 128, 128)") {
			return;
		}
		// 날짜 바뀔 경우 세팅값 변경
		$("#div-time").find("td").css("background-color", "#fff");
		$("#div-time").css("opacity", 0.5);	
		$("#div-seat").slideUp(1000);
		$("#tr-time-ment").hide(); // tr-ment-time 숨기기
		$(".td-time").hide(); // td-time 숨기기
		
		
		
		$(".td-day").css("background-color", "#fff")
		$(this).css("background-color", "#e75e8d");
		select_day = $(this).text().trim();
		// 비동기 요청
		var url = "/movie/checkTime";
		var sData = {
				"cinema_name" : select_theater,
				"cinema_movie" : select_movie,
				"day" : select_day
				};
		$.post(url, sData, function(rData) {
			var times = [];
			for (i = 0; i < rData.length; i++) {
				var date = new Date(rData[i]);
				var day = date.getDate(); // 일
				if(day < 10) {
					day = "0" + day;
				}
				var hour = date.getHours(); // 시간
				if(hour < 10) {
					hour = "0" + hour;
				}
				var min = date.getMinutes(); // 분
				if(min < 10) {
					min = "0" + min;
				}
				var time = day + " " + hour + " : " + min; // 영화, 극장, 날짜에 맞는 상영 시간 얻기
				times.push(time); // 배열에 날짜 넣기
			}
			
			var tds = $("#div-time").find(".td-time");
			for(i = 0; i < times.length; i++) {
				for(j = 0; j < tds.length; j++) {
					if(tds[j].dataset.time == times[i]) { // tds[j]에 들어있는 data-time 값과 times[i]번째 값 비교
						$(".td-time").eq(j).show();
						//$("#div-time").find("td").eq(j).css("color", "black");
					} 
				}
			}  
			// 다음 선택요소 선택가능으로 변경
			$("#div-time").css("opacity", 1)
			  			  .attr("data-op", 1);
		}); //$.post
		
		
	});
	
	// 시간 선택
	$(".td-time").click(function() {
		check_personnel = 0; // 인원 초기화
		seats = []; // 좌석 초기화
		
		$(".td-time").css("background-color", "#fff")
		$(this).css("background-color", "#e75e8d");
		select_time = $(this).text().trim();
		
		// 비동기 요청
		var url = "/movie/checkSeat";
		var sData = {
				"cinema_name" : select_theater,
				"cinema_movie" : select_movie,
				"cinema_time" : "2023/" + select_day + " " + select_time
				};
		
		$.post(url, sData, function(rData) { 
			$("#div-seat").remove();
			$("#booking-div").append(rData);
			
			// 좌석 선택
			$(".a-seat").click(function(e) {
				e.preventDefault();
				
				var isChecked = $(this).attr("data-check"); // 좌석 체크상태 정보 받기
				if(isChecked == "false") { // 좌석이 선택되지 않은경우
					// 좌석선택 진행
					check_personnel += 1; 
					$(this).text("■");
					$(this).css("color", "#e75e8d");
					$(this).attr("data-check", "true");
					
					seats.push($(this).attr("data-seat")); // 좌석 배열에 선택된 좌석 넣기
					seats.sort(); // 정렬
				} else { // 이미 선택된 좌석인 경우
					check_personnel -= 1;
					$(this).text("□");
					$(this).css("color", "#fff");
					$(this).attr("data-check", "false");
					// 좌석값 지우기
					var removeSeat = $(this).attr("data-seat");
					for(var i = 0; i <= seats.length; i++) {
						if (seats[i] == removeSeat) {
							seats.splice(i,1); //splice(시작인덱스, 길이)
							seats.sort(); // 정렬
						}
					} 
				}
			});// 좌석선택 끝
			
			// 사용불가 좌석
			$(".a-noseat").click(function(e) {
				e.preventDefault();
			}); // 좌석선택
			
			
			
			// 좌석 선택완료 버튼
			$("#btn-payment").click(function(e) {
				e.preventDefault();
				
				if (check_personnel != 0) {
					// 사용자 정보값 모달에 세팅
					$("#span-movie").text(select_movie);
					$("#span-theater").text(select_theater);
					$("#span-day").text(select_day);
					$("#span-time").text(select_time);
					$("#span-personnel").text(check_personnel+"명");
					// 배열에 있는 좌석값 문자열로 받기
					var choice_seat = "";
					for(var i in seats) {
						if (i == seats.length-1) {
							choice_seat += seats[i];
						} else {
							choice_seat += seats[i] + ", ";
						}	
					}
					$("#span-seat").text(choice_seat); // 좌석 세팅하기
					pay = (10000 * check_personnel);
					var text = "금액 : " + pay + "원";
					$(".modal-footer").find("h4").text(text); // 요금세팅하기
					// 트리거 -> 모달창 띄우기
					$("#btn-modal").trigger("click");
				} else {
					alert("인원수 및 좌석을 확인해주세요.");
				}
			});//결제

			// 결제하기()
			$("#btn-payment-run").click(function(e) {
				e.preventDefault();
				$("#re_movie").val($("#span-movie").text()); // 예매한 영화
				$("#re_cinema").val($("#span-theater").text()); // 예매한 극장
				$("#re_day").val($("#span-day").text()); // 예매한 날짜정보(영화 날짜, 결제날X)
				$("#re_time").val($("#span-time").text()); // 예매한 시간정보(영화 시간, 결제시간X)
				$("#re_personnel").val($("#span-personnel").text()); // 예매한 인원수
				$("#re_seats").val($("#span-seat").text()); // 예매한 좌석
				$("#re_cost").val(pay + "원"); // 예매한 총비용
				$("#form-pay").submit();
			});
			
		}); //$.post 
		
		// 좌석,인원 초기화
		$("#div-seat").slideDown(1000);
		
	}); // 시간선택 끝
	
});
</script>

<div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
          <!-- 예매 -->
          <div class="row">
            <div class="col-lg-12">
              <div class="featured-games header-text">
                <div class="heading-section">
                  <h4>예매하기</h4>
                </div>
               	<div id="booking-div" class="row">
					<div class="col-md-3"><!-- 영화선택 -->
		                  <div class="ticketing-list">
		                  		<table class="table table-hover">
									<thead class="ticketing-theader">
										<tr>
											<th>
												영화
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${map.movie}" var="mList">
										<tr>
											<td class="td-movie">
												${mList}
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
		                  </div>
		                
					</div><!-- 영화선택 끝 -->
					
					<div class="col-md-4"><!-- 상영관 선택 -->
						<div id="div-theater" class="ticketing-list" 
							style="opacity: 0.5" data-op="0.5">
		                  		<table class="table">
									<thead class="ticketing-theader">
										<tr>
											<th>
												극장
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${map.cinema}" var="cList">
										<tr>
											<td class="td-theater" style="color: gray">
												${cList}
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
		                  </div>
					</div>
					
					
					<div class="col-md-2"><!-- 날짜 선택 -->
						<div id="div-day" class="ticketing-list" 
							style="opacity: 0.5" data-op="0.5">
		                  		<table class="table">
									<thead>
										<tr class="ticketing-theader">
											<th>
												날짜
											</th>
										</tr>
									</thead>
									<tbody style="text-align: center">
										<c:forEach items="${map.date}" var="dList">
										<tr>
											<td class="td-day" style="color: gray">
												<fmt:formatDate value="${dList}" pattern="MM/DD"/>
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
		                  </div>
					</div>
					
					
					<div class="col-md-3"><!-- 시간 선택 -->
						<div id="div-time" class="ticketing-list" 
							style="opacity: 0.5">
		                  		<table class="table">
									<thead class="ticketing-theader">
										<tr>
											<th>
												시간
											</th>
										</tr>
									</thead>
									<tbody style="text-align: center">
										<tr id="tr-time-ment"><td>영화, 극장, 날짜를 선택하세요.</td></tr>
										<c:forEach items="${map.time}" var="tList">
										<tr class="tr-times">
											<td class="td-time" style="color: black; display: none"
											data-time="<fmt:formatDate value="${tList}" pattern="DD HH : mm"/>">
												<fmt:formatDate value="${tList}" pattern="HH : mm"/>
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
		                  </div>
					</div>
				</div><!-- 예매 구성 끝  -->
				
				
              </div>
            </div>
          </div> <!-- 예매 끝 -->
          
          <!-- 모달 시작  -->
          <button id="btn-modal" type="button" style="display: none" data-toggle="modal" data-target="#myModal">
			  modal
		  </button>
          
          	<!-- The Modal -->
			<div class="modal" id="myModal">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title" style="color: black">결제 확인</h4>
			      </div>
			
			      <!-- Modal body -->
			      <div class="modal-body" style="font-size: large;">
			        선택하신 영화 : <span id="span-movie"></span><br>
			        상영관 : <span id="span-theater"></span><br>
			        날짜 : <span id="span-day"></span><br>
			        시간 : <span id="span-time"></span><br>
			        인원 : <span id="span-personnel"></span><br>
			        좌석 : <span id="span-seat"></span>
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			      	<h4 style="color: black; margin-right: 160px">총 금액 : xxx원</h4>
			      	<form id="form-pay" action="reservation.run" method="post">
			      		<input type="hidden" name="userid" value="hong"><!-- userid임시 설정  -->
			      		<input type="hidden" id="re_movie" name="re_movie" value="">
			      		<input type="hidden" id="re_cinema" name="re_cinema" value="">
			      		<input type="hidden" id="re_day" name="re_day" value="">
			      		<input type="hidden" id="re_time" name="re_time" value="">
			      		<input type="hidden" id="re_personnel" name="re_personnel" value="">
			      		<input type="hidden" id="re_seats" name="re_seats" value="">
			      		<input type="hidden" id="re_cost" name="re_cost" value="">
			      		<button id="btn-payment-run" type="button" class="btn btn-success" data-dismiss="modal">결제</button>
			      	</form>
			        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			      </div>
			
			    </div>
			  </div>
			</div> <!-- 모달 끝  -->
          
		
        </div>
      </div>
    </div>
  </div>
<%@include file="../include/footer.jspf" %>
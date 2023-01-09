<%@page import="com.kh.project.util.MovieShuffle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jspf" %>
<script>
$(function() {
	var adult_personnel = 0; // 선택된 성인 수
	var student_personnel = 0; // 선택된 청소년 수
	var total_personnel = 0; // 선택한 총 인원 수
	var check_personnel = 0; // 체크된 인원 수(좌석 선택된 수)
	
	// 예매 정보
	var select_movie = "";
	var select_theater = "";
	var select_day = "";
	var select_time = "";
	
	var seats = []; // 선택 좌석
	
	if (adult_personnel == 0 && student_personnel == 0) {
		$("#table-seat").css("opacity", 0.3); // 기본값, 선택인원이 0명, 0명일 경우 좌석 흐리게
	}
	
	
	// 영화선택
	$(".td-movie").click(function() {
		// 선택할 경우 배경색 변경, 다음 항목 선택 가능하게 오픈, 예매정보에 선택된 정보 넣기
		$(".td-movie").css("background-color", "#fff")
		$(this).css("background-color", "#e75e8d");
		$("#div-theater").css("opacity", 1)
						 .attr("data-op", 1);
		select_movie = $(this).text();
	});
	
	// 상영관 선택
	$(".td-theater").click(function() {
		var op = $("#div-theater").attr("data-op"); // 저장된 op값 확인
		if(op == 0.5) { // op값이 0.5인 경우(이전 항목이 선택되 않음) - 이벤트 작동 막기
			return;
		}
		$(".td-theater").css("background-color", "#fff")
		$(this).css("background-color", "#e75e8d");
		$("#div-day").css("opacity", 1)
					 .attr("data-op", 1);
		select_theater = $(this).text();
	});
	
	// 날짜 선택
	$(".td-day").click(function() {
		var op = $("#div-day").attr("data-op");
		if(op == 0.5) {
			return;
		}
		$(".td-day").css("background-color", "#fff")
		$(this).css("background-color", "#e75e8d");
		$("#div-time").css("opacity", 1)
					  .attr("data-op", 1);
		select_day = $(this).text();
	});
	
	// 시간 선택
	$(".td-time").click(function() {
		var op = $("#div-time").attr("data-op");
		if(op == 0.5) {
			return;
		}
		$(".td-time").css("background-color", "#fff")
		$(this).css("background-color", "#e75e8d");
		$("#div-seat").slideDown(1000);
		select_time = $(this).text();
	});
	
	// 인원 선택
	// 성인
	$("#adult-personnel").change(function() {
		adult_personnel = $(this).val();
		if (adult_personnel != 0) {
			$("#table-seat").css("opacity", 1);
		} 
	});
	// 청소년
	$("#student-personnel").change(function() {
		student_personnel = $(this).val();
		if (student_personnel != "0") {
			$("#table-seat").css("opacity", 1);
		} 
	});
	
	
	
	// 좌석 선택
	$(".a-seat").click(function(e) {
		e.preventDefault();
		// 총인원 받기
		total_personnel = parseInt($("#adult-personnel").val())+parseInt($("#student-personnel").val());
		if (total_personnel == 0) { // 총 선택한 인원이 0명인 경우
			$(".a-seat").text("□");
			$(".a-seat").css("color", "#fff");
			$(".a-seat").attr("data-check", "false");
			alert("최소 1명 이상의 인원을 선택하셔야 합니다.");
			$("#table-seat").css("opacity", 0.3);
			check_personnel = 0;
			seats = []; // 저장된 좌석값 초기화
			return;
		}
		
		
		var isChecked = $(this).attr("data-check"); // 좌석 체크상태 정보 받기
		if(isChecked == "false") { // 좌석이 선택되지 않은경우
			if (check_personnel == total_personnel) { // 좌석을 선택한 수 = 총인원 수
				alert("인원수를 확인해 주세요.");
				return;
			} else if (check_personnel > total_personnel) { // 좌석을 선택한 수 > 총인원 수
				// 모든 선택여부 취소로 만들기
				$(".a-seat").text("□");  
				$(".a-seat").css("color", "#fff");
				$(".a-seat").attr("data-check", "false");
				check_personnel = 0; // 선택된 인원 0명으로 초기화
				seats = [];
			}
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
	
	
	
	// 결제
	$("#btn-payment").click(function(e) {
		e.preventDefault();
		// 총인원 값 받아오기
		total_personnel = parseInt($("#adult-personnel").val())+parseInt($("#student-personnel").val());
		if (adult_personnel == 0 && student_personnel == 0) {
			alert("최소 1명 이상의 인원이 선택되어야 합니다.");
			return;
		}
		if (check_personnel != 0 && check_personnel == total_personnel) {
			// 사용자 정보값 모달에 세팅
			$("#span-movie").text(select_movie);
			$("#span-theater").text(select_theater);
			$("#span-day").text(select_day);
			$("#span-time").text(select_time);
			$("#span-personnel").text(total_personnel+"명(성인:" + adult_personnel + 
													", 청소년:" + student_personnel + ")");
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
			var pay = (10000 * adult_personnel) + (7000 * student_personnel); // 요금 계산(성인1만원, 학생7천원 기준)
			var text = "금액 : " + pay + "원";
			$(".modal-footer").find("h4").text(text); // 요금세팅하기
			// 트리거 -> 모달창 띄우기
			$("#btn-modal").trigger("click");
		} else {
			alert("인원수 및 좌석을 확인해주세요.");
			$("#adult-personnel").focus();
		}
	});//결제
	

	
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

               	<div class="row">
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
										<c:forEach var="v" begin="1" end="8">
										<tr>
											<td class="td-movie">
												영화${v}
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
												상영관
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="v" begin="1" end="9">
										<tr>
											<td class="td-theater">
												상영관${v}
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
									<tbody>
										<c:forEach var="v" begin="1" end="31">
										<tr>
											<td class="td-day">
												${v}일
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
		                  </div>
					</div>
					
					
					<div class="col-md-3"><!-- 시간 선택 -->
						<div id="div-time" class="ticketing-list" 
							style="opacity: 0.5"  data-op="0.5">
		                  		<table class="table">
									<thead class="ticketing-theader">
										<tr>
											<th>
												시간
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="v" begin="1" end="15">
										<tr>
											<td class="td-time">
												시간${v}
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
		                  </div>
					</div>
				</div><!-- 예매 구성 끝  -->
				
				<!-- 좌석선택  -->
               	<div id="div-seat" style="margin-top: 30px; width: 100%; display: none">
               		<div class="heading-section">
	                	<div><h4>좌석선택</h4></div>
	                	<!-- 인원  -->
	                	<div style="margin-bottom: 20px">
	                	<label for="adult-personnel" style="color: white">성인
	                		<select id="adult-personnel">
	                			<c:forEach begin="0" end="10" var="i">
	                				<option value="${i}">${i}</option>
	                			</c:forEach>
	                		</select>
	                	</label>
	                	<label for="student-personnel" style="color: white; margin-left: 10px">청소년
	                		<select id="student-personnel">
	                			<c:forEach begin="0" end="10" var="i">
	                				<option value="${i}">${i}</option>
	                			</c:forEach>
	                		</select>
	                	</label>
	                	<div style="text-align: right;"><!-- 좌석 상태 설명 -->
	                		<span style="color: white; margin-right: 10px">□ : 선택가능</span>
	                		<span style="color: red"> ▩ : 선택불가능</span>
	                	</div>
	                	</div>
	                	<!-- 인원 끝  -->
	              	</div>
               		<table border="2; solid" id="table-seat"
               		style="width: 100%; color: white; text-align: center; opacity: 0.3">
               			<tr>
               				<td colspan="12"><h4>screen</h4></td>
               			</tr>
               			<c:forEach begin="1" end="7" var="w">
	               			<tr>
	               				<c:forEach begin="1" end="8" var="v">
	               					<td style="font-size: x-large;">
	               						<c:choose>
	               							<c:when test="${v%3 eq 0}">
	               								<a class="a-noseat" style="color: red" href="#">▩</a>
	               							</c:when>
	               							<c:otherwise>
	               								<a class="a-seat" data-seat="${w}열 ${v}번"
	               								data-check="false" href="#">□</a>
	               							</c:otherwise>
	               						</c:choose>
	               					</td>
	               				</c:forEach>	
	               			</tr>
               			</c:forEach>	

               		</table>
               		<div class="col-lg-12">
	                  <div class="main-button" style="text-align: center; margin-top: 25px">
	                    <a id="btn-payment" href="#">선택완료</a>
	                  </div>
	                </div>
               	</div><!-- 좌석선택 끝  -->
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
			      	<button type="button" class="btn btn-success" data-dismiss="modal">결제</button>
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
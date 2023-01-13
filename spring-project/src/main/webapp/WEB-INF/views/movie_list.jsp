<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jspf" %>
<script>
$(document).ready(function(){
	$(".n_score").css("color", "#ec6090");
	$("#pre").hide();
	$("#a_now").css("color", "#ec6090");
	
	var toggle_command = false;
	$("#a_pre").click(function(e){
 	  e.preventDefault();
 	  if (toggle_command == true) return;
 	  toggle_command = true;
 	  $("#pre").show();
 	  $("#now").hide();
	  $("#a_now").unwrap("<em></em>");
	  $(this).wrap("<em></em>");
	  $(this).css("color", "#ec6090");
	  $("#a_now").css("color", "#CCC");
	});
	$("#a_now").click(function(e){
	  e.preventDefault();
 	  if (toggle_command == false) return;
 	  toggle_command = false;
	  $("#now").show();
 	  $("#pre").hide();
	  $("#a_pre").unwrap("<em></em>");
	  $(this).wrap("<em></em>");
	  $(this).css("color", "#ec6090");
	  $("#a_pre").css("color", "#CCC");
	});
});
</script>
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

          <!-- ***** 영화 리스트 ***** -->
			<div class="row">
				<div class="col-lg-3">
					<div class="heading-section">
						<h4><em><a href="#" id="a_now">현재 상영작</a></em></h4>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="heading-section">
						<h4><a href="#" id="a_pre">예정 상영작</a></h4>
					</div>
				</div>
				<div class="col-lg-12" id="now">
				<!-- 영화 한 편 시작:복사 시작 -->
					<div class="col-lg-3 col-sm-6">
						<div class="item">
							<div class="thumb">
								<h4 class="n_score"><i class="fa fa-check"> No.1</i></h4><br>
								<a href="/movie/detail">
									<img src="/assets/images/mov02.jpg" alt="" style="border-radius: 23px;">
							    </a>
							</div>
							<div class="down-content">
								<span><i class="fa fa-eye"></i> 183</span>
								<h4>
									<a href="/movie/detail">써니</a>
								</h4>
							</div>
							<div class="down-content" style="margin-top:5px;">
								<h6>
									예매율 66%<br>
									<span><i class="fa fa-star" style="color: yellow;"></i>	4.9</span>
								</h6>
							</div>
							<div class="down-content">
								<h6>2023년01월05일</h6>
							</div>
							<div class="down-content">
								<div class="main-button" style="margin-top:10px">
									<a href="/movie/booking">예매하기</a>
								</div>
								<span><i class="fa fa-eye"></i> 183</span>
							</div>
						</div>
					</div>
				<!--영화 한 편 끝: 복사 끝 -->
				</div> 
				<!-- 현재 상영작 끝-->
				
				
				<!-- 상영 예정작 시작-->
				<div class="col-lg-12" id="pre">
				<!-- 영화 한 편 시작:복사 시작 -->
					<div class="col-lg-3 col-sm-6">
						<div class="item">
							<div class="thumb">
								<h4 class="n_score"><i class="fa fa-check"> No.1</i></h4><br>
								<a href="/movie/detail">
									<img src="/assets/images/mov01.jpg" alt="" style="border-radius: 23px;">
							    </a>
							</div>
							<div class="down-content">
								<span><i class="fa fa-eye"></i> 183</span>
								<h4>
									<a href="/movie/detail">비열한 거리</a>
								</h4>
							</div>
							<div class="down-content" style="margin-top:5px;">
								<h6>
									예매율 66%<br>
									<span><i class="fa fa-star" style="color: yellow;"></i>	4.9</span>
								</h6>
							</div>
							<div class="down-content">
								<h6>2023년01월05</h6>
							</div>
							<div class="down-content">
								<div class="main-button">
									<a href="/movie/booking">예매하기</a>
								</div>
								<span><i class="fa fa-eye"></i> 183</span>
							</div>
						</div>
					</div>
				<!--영화 한 편 끝: 복사 끝 -->
				</div> 
				<!-- 상영 예정작 끝 -->
			</div>
        </div>
      </div>
    </div>
  </div>
  
  <%@include file="../include/footer.jspf" %>
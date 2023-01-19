<%@page import="com.kh.project.util.MovieShuffle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String playList = MovieShuffle.shuffle();
	String[] movies = playList.split(",");
	String firstMovie = movies[0];
%>
<%@include file="../include/header.jspf" %>

<script>
$(document).ready(function(){
	
	 /* 상영예정 및 현재 상영작 캐러셀 이벤트 */
	   var toggle_command = false;
	   $("#pre").hide();
	   $("#a_now").css("color", "#ec6090");
	   
	   $("#a_pre").click(function(e){
	      console.log("a_pre");
	      e.preventDefault();
	      if (toggle_command == true) return;
	      $("#pre").show();
	      $("#now").hide();
	      $("#a_now").unwrap("<em></em>");
	      $(this).wrap("<em></em>");
	      $(this).css("color", "#ec6090");
	      $("#a_now").css("color", "#CCC");
	      toggle_command = true;
	      console.log(toggle_command)
	   });   
	   
	   $("#a_now").click(function(e){
	      console.log("p_now");
	      e.preventDefault();
	      if (toggle_command == false) return;
	      $("#now").show();
	      $("#pre").hide();
	      $("#a_pre").unwrap("<em></em>");
	      $(this).wrap("<em></em>");
	      $(this).css("color", "#ec6090");
	      $("#a_pre").css("color", "#CCC");
	      toggle_command = false;
	      console.log(toggle_command)
	   });
});
</script>
<div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

          <!-- ***** 영화 티저 영상 ***** -->
          <div class="row">
            <div class="col-lg-12">
              <div class="featured-games header-text">
                <div class="heading-section">
                  <h4><span style="color: white">상영 및 상영예정</span> 예고편</h4>
                </div>
                <div>
                	<iframe frameborder="0" width="100%" height="500px" title="예고편"
                	src="
                	https://www.youtube.com/embed/<%=firstMovie %>?
					autoplay=1&
					mute=1&
					controls=0&
					fs=0&
					loop=1&
					modestbranding=1&
					playlist=<%=playList %>&
					rel=0&
					disablekb=1&               
                	vq=hd1080">
                	</iframe>
                </div>
                
              </div>
            </div>
          </div> <!-- ***** 영화 티저 끝 ***** -->
          
          
          <!-- ***** 현재&예정 영화 시작***** -->
          <div class="start-stream" style="margin-top: 30px" >
            <div class="row">
             <div class="col-lg-12">
              <div class="featured-games header-text">
                <div class="heading-section">
	               <h4><em><a href="#" id="a_now" style="margin-right: 35px">현재 상영작</a></em><a href="#" id="a_pre">예정 상영작</a></h4>
                </div>
                <!-- ***** 현재 영화 ***** -->
                <div id="now">
                 <div class="owl-features owl-carousel">
               	 <!-- 영화 한 편 시작-->
               	 	  <c:forEach items="${movie_list}" var="movie_list">
	                  <div class="item">
	                    <div class="thumb">
	                      <a href="${contextPath}/movie/detail?movie_no=${movie_list.movie_no}"><img src="${movie_list.posters}"></a>
	                      <div class="hover-effect">
	                        <h6>${movie_list.movie_title}</h6>
	                      </div>
	                    </div>
	                   <h4><a href="${contextPath}/movie/detail?movie_no=${movie_list.movie_no}" style="font-size:18px;">${movie_list.movie_title}</a><br><span>249K Downloads</span></h4>
	                    <ul>
	                      <li><i class="fa fa-star"></i> ${movie_list.score}</li>
	                      <li><i class="fa fa-eye"></i> 2.3M</li>
	                    </ul>
	                   </div>
	                   </c:forEach>
	              <!-- 영화 한 편 끝 -->
                 </div>
                </div><!--***** 상영작 ***** -->
            
          		<!-- ***** 예정 영화 ***** -->
          		<div id="pre">
	                <div class="owl-features owl-carousel">
	               	 <!-- 영화 한 편 시작-->
	               	 	  <c:forEach items="${pre_movie_list}" var="pre_movie_list">
		                  <div class="item">
		                    <div class="thumb">
		                      <a href="${contextPath}/movie/detail?movie_no=${pre_movie_list.movie_no}"><img src="${pre_movie_list.posters}"/></a>
		                      <div class="hover-effect">
		                        <h6>${pre_movie_list.movie_title}</h6>
		                      </div>
		                    </div>
		                   <h4><a href="${contextPath}/movie/detail?movie_no=${pre_movie_list.movie_no}" style="font-size:18px;">${pre_movie_list.movie_title}</a><br><span>249K Downloads</span></h4>
		                    <ul>
		                      <li><i class="fa fa-star"></i> 4.8</li>
		                      <li><i class="fa fa-eye"></i> 2.3M</li>
		                    </ul>
		                    </div>
		                    </c:forEach>
		              <!-- 영화 한 편 끝 -->
	                </div>
                </div>
               </div>
              </div>
            </div>
          </div>
          <!-- ***** 현재&예정 영화 끝 ***** -->
          
          <!-- ***** 메인: 이벤트 캐러셀 시작 ***** -->
          <div class="row" style="margin-top: 30px">
            <div class="col-lg-12">
              <div class="featured-games header-text">
                <div class="heading-section">
                  <h4><span style="color: white">Today</span> Event</h4>
                </div>
                <div class="owl-features owl-carousel">
                  <div class="item">
                    <div class="thumb">
                      <img src="/assets/images/eventJoin.png" alt="eventJoin">
                      <div class="hover-effect">
                        <h6><a href="${contextPath}/movie/event_detail?event=join">해당 이벤트로 이동</a></h6>
                      </div>
                    </div>
                    <h4>회원가입 인증 할인<br><span>애용해주세요♥</span></h4>
                    <ul>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                  <div class="item">
                    <div class="thumb">
                      <img src="/assets/images/eventParking.png" alt="eventParking">
                      <div class="hover-effect">
                         <h6><a href="${contextPath}/movie/event_detail?event=parking">해당 이벤트로 이동</a></h6>
                      </div>
                    </div>
                    <h4>무료 주차 4시간<br><span>아바타도 끄덕없다</span></h4>
                    <ul>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                        <div class="item">
                    <div class="thumb">
                      <img src="/assets/images/eventStudents.png" alt="eventStudents">
                      <div class="hover-effect">
                         <h6><a href="${contextPath}/movie/event_detail?event=students">해당 이벤트로 이동</a></h6>
                      </div>
                    </div>
                   <h4>학생증 할인<br><span>고생했어 오늘도~♬</span></h4>
                    <ul>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                  <div class="item">
                    <div class="thumb">
                      <img src="/assets/images/eventWelcome.png" alt="eventWelcome">
                      <div class="hover-effect">
                         <h6><a href="${contextPath}/movie/event_detail?event=welcome">해당 이벤트로 이동</a></h6>
                      </div>
                    </div>
                     <h4>재방문 할인<br><span>어서와 재방문은 처음이지?</span></h4>
                    <ul>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                  <div class="item">
                    <div class="thumb">
                      <img src="/assets/images/eventZero.png" alt="eventZero">
                      <div class="hover-effect">
                        <h6><a href="${contextPath}/movie/event_detail?event=zero">해당 이벤트로 이동</a></h6>
                      </div>
                    </div>
                     <h4>환경운동 캠페인<br><span>제로 웨이스트 동참하실래요?</span></h4>
                    <ul>
                      <li><i class="fa fa-star"></i></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** 메인: 이벤트 캐러셀 끝 ***** -->
          
           <!-- ***** 메인: 스토어 시작 ***** -->
          <div class="row" style="margin-top: 30px">
            <div class="col-lg-4">
              <div class="top-downloaded">
                <div class="heading-section">
                  <h4>영화관람권</h4>
                </div>
                <ul>
               <li><img src="/assets/images/storeTicketA.png" alt="storeTicketA">
               </li>
               <li><img src="/assets/images/storeTicketB.png" alt="storeTicketB">
               </li>
               <li><img src="/assets/images/storeTicketC.png" alt="storeTicketC">
               </li>
            </ul>
                <div class="text-button">
                  <a href="/movie/store">스토어로 이동</a>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="top-downloaded">
                <div class="heading-section">
                  <h4>기프트카드</h4>
                </div>
                <ul>
               <li><img src="/assets/images/storeCardTypeA.png" alt="storeCardTypeA">
               </li>
               <li><img src="/assets/images/storeCardTypeB.png" alt="storeCardTypeB">
               </li>
               <li><img src="/assets/images/storeCardTypeC.png" alt="storeCardTypeC">
               </li>
            </ul>
                <div class="text-button">
                  <a href="/movie/store">스토어로 이동</a>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="top-downloaded">
                <div class="heading-section">
                  <h4>스낵</h4>
                </div>
                <ul>
               <li><img src="/assets/images/storeSnackPopcorn.png" alt="storeSnackPopcorn">
               </li>
               <li><img src="/assets/images/storeSnackHotdog.png" alt="storeSnackHotdog">
               </li>
               <li><img src="/assets/images/storeSnackNacho.png" alt="storeSnackNacho">
               </li>
            </ul>
                <div class="text-button">
                  <a href="/movie/store">스토어로 이동</a>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** 메인: 스토어 끝 ***** -->
          
          <!-- ***** 우수 소원 소개 *****  -->
          <div class="featured-games header-text row mb-5"  style="margin-top: 30px">
			
		  		<div class="heading-section">
					<h4>이달의 우수 사원</h4>
				</div>
				
				<div class="start-stream col-md-4 mb-5">
					<div class="card" style="background-color: black;">
						<img src="https://source.unsplash.com/random/1920x1080" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">카드 타이틀</h5>
							<p class="card-text">카드 설명</p>
							<div class="main-button">
								<a href="#">버튼</a>
							</div>
						</div>
					</div>
				</div>
				
				<div class="start-stream col-md-4 mb-5">
					<div class="card" style="background-color: black;">
						<img src="https://source.unsplash.com/random/1920x1080" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">카드 타이틀</h5>
							<p class="card-text">카드 설명</p>
							<div class="main-button">
								<a href="#">버튼</a>
							</div>
						</div>
					</div>
				</div>
				
				<div class="start-stream col-md-4 mb-5">
					<div class="card" style="background-color: black;">
						<img src="https://source.unsplash.com/random/1920x1080" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">카드 타이틀</h5>
							<p class="card-text">카드 설명</p>
							<div class="main-button">
								<a href="#">버튼</a>
							</div>
						</div>
					</div>
				</div>
				
				<div class="start-stream col-md-4 mb-5">
					<div class="card" style="background-color: black;">
						<img src="https://source.unsplash.com/random/1920x1080" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">카드 타이틀</h5>
							<p class="card-text">카드 설명</p>
							<div class="main-button">
								<a href="#">버튼</a>
							</div>
						</div>
					</div>
				</div>
				
				<div class="start-stream col-md-4 mb-5">
					<div class="card" style="background-color: black;">
						<img src="https://source.unsplash.com/random/1920x1080" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">카드 타이틀</h5>
							<p class="card-text">카드 설명</p>
							<div class="main-button">
								<a href="#">버튼</a>
							</div>
						</div>
					</div>
				</div>
		
		  </div>
          <!-- ***** 우수 소원 소개 끝 *****  -->

        </div>
      </div>
    </div>
  </div>
<%@include file="../include/footer.jspf" %>


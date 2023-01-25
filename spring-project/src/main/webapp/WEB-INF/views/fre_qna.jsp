<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jspf" %>
<style> 
.page-link {
	background-color: #1f2122;
	border-color: #1f2122;
}

.span {
	color: #ec6090;
}
.nav-link {
	color: #ccc;
	font-size: 20px;
}
.nav {
	--bs-nav-link-hover-color: #f290b1;
}
.gaming-library .item ul li:last-child{
	text-align: left;
	width:40%;
}
.h_title {
	width: 800px;
}
</style>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			
				<div class="page-content">
				<!-- NavBar start -->
				<div class="col-lg-12">
					<ul class="nav">
						<li class="nav-item"><a class="nav-link active" href="${contextPath}/movie/fre_qna">자주하는 질문</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="${contextPath}/movie/ann">공지사항</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="${contextPath}/movie/qna">Q&A</a>
						</li>
					</ul>
				</div>
				<!-- NavBar end -->
					<!-- ***** Gaming Library Start ***** -->
					<div class="gaming-library profile-library" style="margin-top: 0px">
						<div class="heading-section row">
							<div class="col-lg-8">
								<h4>
									자주하는 질문
								</h4>
							</div>
						</div>
						<div class="col-lg-12">
						<!-- 타이틀 시작 -->
							<div class="item">
								<ul>
									<li><h4>글번호</h4></li>
									<li style="margin-left:30px;"><h4>구분</h4></li>
									<li><h4>제목</h4></li>
								</ul>
							</div>
						<!-- 타이틀 끝 -->	
							<div class="item">
									<ul> 
										<li style="margin-right:10px; margin-left:20px;"><h4>3</h4></li>
										<li><h4>주차</h4></li>
										<li class="li_title"><h4 class="h_title">
												<a href="#" class="title_qna">무료주차 이용 가능 한가요?</a>
											</h4></li>
									</ul>
									<div class="answer" style="display:none; margin-left:330px; margin-top:10px;">
											<h6>A. 당일 영화권을 보여주시면 가능합니다.</h6>	
									</div>
							</div>
							<div class="item">
									<ul>
										<li style="margin-right:10px; margin-left:20px;"><h4>2</h4></li>
										<li><h4>시설</h4></li>
										<li style="margin-right: 230px;"><h4 class="h_title">
												<a href="#" class="title_qna">매점은 몇 층에 있나요?</a>
											</h4></li>
									</ul>
									<div class="answer" style="display:none; margin-left:330px; margin-top:10px;">
											<h6>A. 3층에 있습니다.</h6>	
									</div>
							</div>
							<div class="item">
									<ul>
										<li style="margin-right:10px; margin-left:20px;"><h4>1</h4></li>
										<li><h4>결제</h4></li>
										<li style="margin-right: 230px;"><h4 class="h_title">
												<a href="#" class="title_qna">인터넷 결제는 어떻게 하나요?</a>
											</h4></li>
									</ul>
									<div class="answer" style="display:none; margin-left:330px; margin-top:10px;">
											<h6>A. 결제 페이지에서 포인트로 가능합니다.</h6>	
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function(){
		// nav 해당 페이지 글색
		$(".active").css("color", "#ec6090");
		// 제목 10자리 이상 ..표시
// 		var title_qna = $(".title_qna");
// 		for (i = 0 ; i < title_qna.length; i++){
// 			//console.log(title_qna[i].innerText.substring(0,10));	
// 			if(title_qna[i].innerText.length > 10){
// 				//title_qna[i].text(title_qna[i].innerText.substring(0,10)) + "...";
// 				$(".item").find("a").eq(i).text(title_qna[i].innerText.substring(0,10) + "...");
// 			}
// 			$(".item").find("a").eq(i).text(title_qna[i].innerText);
// 		}
		
		// 제목 클릭하면 자주하는 질문 답변 등장
		$(".title_qna").each(function(e){
			var q = $(this);
			q.click(function(e){
				e.preventDefault();
				var target = $(this).closest("ul").next();
	 			//console.log("target:", target);
	 			var targetStatus = target.attr("data-answer-show");
				$(".answer").each(function(){
					var a = $(this);
					a.attr("data-answer-show", "false").slideUp(1000);
				});
				if(targetStatus == "true"){
 					target.slideUp(1000);
 					target.attr("data-answer-show", "false");
				} else {
					target.slideDown(1000);
					target.attr("data-answer-show", "true");
	 			}
			});
		});
	});
	</script>
	
<%@include file="../include/footer.jspf" %>


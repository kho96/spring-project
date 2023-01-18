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
							<div class="item">
								<ul>
									<li><h4>글번호</h4></li>
									<li style="margin-left:30px;"><h4>구분</h4></li>
									<li style="margin-left:5px; margin-right: 200px;"><h4>제목</h4></li>
									<li style="margin-left:10px;"><h4>등록날짜</h4></li>
								</ul>
							</div>
								<c:forEach var="i2" begin="1" end="10">
							<div class="item">
									<ul>
										<li style="margin-right:10px; margin-left:20px;"><h4>1</h4></li>
										<li><h4>결제</h4></li>
										<li style="margin-right: 230px;"><h4>
												<a href="#" class="title">인터넷 결제는 어떻게 하나요?</a>
											</h4></li>
										<li><h4>2023/01/06</h4></li>
									</ul>
									<div class="answer" style="display:none; margin-top:10px;">
											<h6>Q. 인터넷 결제는 어떻게 하나요?</h6><br>
											<h6>A. 결제 페이지에서 신용카드로 가능합니다.</h6>	
									</div>
							</div>
								</c:forEach>
						</div>
					</div>
					<div style="margin-top: 15px; text-align: center"> <!-- 페이징 시작  -->
		         	<div class="pagination">
					  <a href="#">&laquo;</a>
					  <c:forEach var="i" begin="1" end="5">
					  	<a href="#"
					  		<c:if test="${i eq 1 }">style="background-color: #e75e8d"</c:if>
					  	>${i}</a>
					  </c:forEach>
					  <a href="#">&raquo;</a>
					</div>
		         </div><!-- 페이징 끝  -->
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
		var title = $(".title").text().substring(0, 10) + "...";
		$(".title").text(title);
		// 제목 클릭하면 자주하는 질문 답변 등장
		$(".title").click(function(e){
			e.preventDefault();
// 			var target = $(this).parent().parent().parent().next();
			var target = $(this).closest("ul").next();
			$(".answer").slideUp(1000);
			if($(this).attr("data-answer-show") == "true"){
				target.slideUp(1000);
				$(this).attr("data-answer-show", "false");
			} else {
				target.slideDown(1000);
				$(this).attr("data-answer-show", "true");
			}
		});
	});
	</script>
	
	
<%@include file="../include/footer.jspf" %>
	

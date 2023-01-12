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
	color: #ec6090;
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
									<li><h4>구분</h4></li>
									<li style="margin-right: 225px"><h4>제목</h4></li>
									<li><h4>등록날짜</h4></li>
								</ul>
							</div>
							<div class="item">
								<ul>
									<li><h4>1000</h4></li>
									<li><h4>결제</h4></li>
									<li style="margin-right: 225px" id="title"><h4>
											<a href="#" class="title">인터넷 결제는 어떻게 하나요?</a>
										</h4></li>
									<li><h4>2023/01/06</h4></li>
								</ul>
							</div>
							<div class="item answer" style="display:none">
								<h6>자주하는 질문의 답</h6>
							</div>
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
<%@include file="../include/footer.jspf" %>
	<script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	</script>
	<script>
	$(document).ready(function(){
		// 제목 10자리 이상 ..표시
		var title = $(".title").text().substring(0, 10) + "...";
		$(".title").text(title);
		// nav 해당 페이지 글색
		$(".active").css("color", "#ccc");
		// 제목 클릭하면 자주하는 질문 답변 등장
		$(".title").click(function(e){
			e.preventDefault();
			if((".answer").css("display","none")){
				$(".answer").slideDown(1000);
			} else {
				$(".answer").slideUp(1000);
			}
		});
	});
	</script>


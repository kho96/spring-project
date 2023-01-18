<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jspf"%>
<script>
$(document).ready(function(){
	// 하트 버튼을 눌렀을 때
	$("#btnHeart").click(function(e){
		e.preventDefault();
		$("#innerHeart").css("color", "#FF0000");
	});
	// nav 해당 페이지 글색
	$(".active").css("color", "#ec6090");
});
</script>
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
		<div class="page-content">
		<!-- NavBar start -->
				<div class="col-lg-12">
					<ul class="nav">
						<li class="nav-item"><a class="nav-link" href="${contextPath}/movie/fre_qna">자주하는 질문</a>
						</li>
						<li class="nav-item"><a class="nav-link active" href="${contextPath}/movie/ann">공지사항</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="${contextPath}/movie/qna">Q&A</a>
						</li>
					</ul>
				</div>
				<!-- NavBar end -->
			<div class="gaming-library profile-library" style="margin-top: 0px">
				<div class="heading-section row">
					<a id="a_wirte" href="${contextPath}/movie/ann">
						<i class="fa fa-reply fa-2x" aria-hidden="true"></i></a>
					<div class="col-lg-12" style="padding-top:10px;">
						<h5><span>인터넷 결제는 어떻게 하나요?</span></h5>
						<h6 style="padding-left:880px"><span>조회수 55  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 등록일자 2023/01/12</span></h6>
					</div>
				</div>
				<div class="col-lg-12 question" style="margin-top:10px">
					<textarea id="textarea" rows="10" cols="140" style="background-color:#1f2122; color:#ccc;" readonly>안녕하세요. </textarea>
				</div>
				<div class="col-lg-12" style="text-align:center">
						<a href="#" class="btn" style="background-color:#e75e8d" id="btnHeart">
							<i class="fa fa-heart fa-2x" aria-hidden="true" id="innerHeart"></i>
							<span class="badge" style="font-size:20px">55</span>
						</a>
					<button type="button" class="btn btn-lg btnModifyOk" style="background-color:#FFF0F5; color:#ccc; display:none;">완료</button>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jspf"%>
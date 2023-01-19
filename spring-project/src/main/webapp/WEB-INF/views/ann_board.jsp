<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jspf"%>
<script> 
$(document).ready(function(){
	var isLike = "${likeMap.likeResult}";
	console.log("isLike", isLike);
	if(isLike == "true"){
		$("#innerHeart").css("color", "#FF0000");
	}
	// 하트 버튼을 눌렀을 때
	$("#btnHeart").click(function(e){
		e.preventDefault();
		var userid = "${userVo.userid}";
		console.log("userid:" , userid);
		if(userid == null || userid == ""){
			alert("로그인 해주세요");
			location.href = "${contextPath}/movie/login";
			return;
		}
		var ann_no = $(this).attr("data-ann_no");
		var sData = {
				"ann_no":ann_no
		};
		//console.log(ann_no);
		var url = "";
		// 좋아요 눌러져있음
		if(isLike == "true"){
			console.log("delete");
			url = "${contextPath}/movie/likeCancle"; // 삭제
		} else{
			url = "${contextPath}/movie/sendLike";
		} 
		$.post(url, sData, function(rData){
			$.get("${contextPath}/movie/getLikeCount", {"ann_no":ann_no, "userid" : userid}, function(rData){
				var count = $("#likeCount").text();
				if(isLike == "true"){
					isLike = "false";
					$("#innerHeart").css("color", "#000000");
					count--;
				} else {
					isLike = "true";
					$("#innerHeart").css("color", "#FF0000");
					count++;
				}
				$("#likeCount").text(count);
			});
		});
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
					<a id="a_wirte" href="${contextPath}/movie/ann?page=${page}">
						<i class="fa fa-reply fa-2x" aria-hidden="true"></i></a>
					<div class="col-lg-12" style="padding-top:10px;">
						<h5><span>${annVo.ann_title}</span></h5>
						<h6 style="padding-left:805px"><span>조회수 ${annVo.ann_viewcnt}  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 등록일자 ${annVo.ann_regdate}</span></h6>
					</div>
				</div>
				<div class="col-lg-12 question" style="margin-top:10px">
					<textarea id="textarea" rows="10" cols="140" style="background-color:#1f2122; color:#ccc;" readonly>${annVo.ann_content}</textarea>
				</div>
				<div class="col-lg-12" style="text-align:center">
						<a href="#" data-ann_no="${annVo.ann_no}" class="btn" style="background-color:#e75e8d" id="btnHeart">
							<i class="fa fa-heart fa-2x" aria-hidden="true" id="innerHeart"></i>
							<span id="likeCount" class="badge" style="font-size:20px">${likeCount}</span>
						</a>
					<button type="button" class="btn btn-lg btnModifyOk" style="background-color:#FFF0F5; color:#ccc; display:none;">완료</button>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jspf"%>
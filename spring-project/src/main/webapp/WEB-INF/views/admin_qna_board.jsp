<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jspf"%>
<script>
$(document).ready(function(){
	// 등록 버튼
	$(".btnWrite").click(function(){
		var qna_no = $(this).attr("data-no");
		//console.log(qna_no);
		var qna_comment = $("#textarea").val();
		//console.log(qna_reply);
		var sData = {
				"qna_no" : qna_no,
				"qna_comment" : qna_comment
		};
		var url = "${contextPath}/movie/admin/insertQnaComment";
		var page = $(this).attr("data-page");
		$.post(url, sData, function(rData){
			console.log(rData);
			if(rData == "true"){
				alert("등록되었습니다");
				location.href = "${contextPath}/movie/admin/qna_detail?qna_no=" + qna_no + "&page=" + page;
			}
		});
	});
	// 수정 버튼 클릭하면
	$(".btnModify").click(function(){
		$("#textarea").attr("readonly", false).focus();
		$(this).hide();
		$(".btnModifyOk").show();
	});
	// 완료 버튼 클릭하면
	$(".btnModifyOk").click(function(){
		$(this).css("background-color", "#e75e8d");
		var qna_no = $(this).attr("data-no");
		//console.log(qna_no);
		var qna_comment = $("#textarea").val();
		//console.log(qna_reply);
		var sData = {
				"qna_no" : qna_no,
				"qna_comment" : qna_comment
		};
		var url = "${contextPath}/movie/admin/modifyQnaComment";
		var page = $(this).attr("data-page");
		$.post(url, sData, function(rData){
			console.log(rData);
			if(rData == "true"){
				console.log(rData);
				alert("수정되었습니다");
				location.href = "${contextPath}/movie/admin/qna_detail?qna_no=" + qna_no + "&page=" + page;
			}
		});
	});
	// 삭제 버튼 클릭하면
	$(".btnDelete").click(function(){
		var qna_no = $(this).attr("data-no");
		console.log(qna_no);
		var url = "${contextPath}/movie/admin/deleteQnaComment";
		var page = $(this).attr("data-page");
		$.post(url, {"qna_no":qna_no}, function(rData){
			console.log(rData);
			if(rData == "true"){
				alert("삭제되었습니다");
				location.href = "${contextPath}/movie/admin/qna_detail?qna_no=" + qna_no + "&page=" + page;
			}
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
<!-- 		<!-- NavBar start --> -->
<!-- 				<div class="col-lg-12"> -->
<!-- 					<ul class="nav"> -->
<%-- 						<li class="nav-item"><a class="nav-link" href="${contextPath}/movie/fre_qna">자주하는 질문</a> --%>
<!-- 						</li> -->
<%-- 						<li class="nav-item"><a class="nav-link" href="${contextPath}/movie/ann">공지사항</a> --%>
<!-- 						</li> -->
<%-- 						<li class="nav-item"><a class="nav-link active" href="${contextPath}/movie/qna">Q&A</a> --%>
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 				NavBar end -->
			<div class="gaming-library profile-library"  style="margin-top: 0px">
				<div class="heading-section row">
					<a id="a_wirte" href="${contextPath}/movie/admin/qnaList?page=${page}">
						<i class="fa fa-reply fa-2x" aria-hidden="true"></i></a>
					<div class="col-lg-12" style="padding-top:10px;">
						<h5><span>${qnaVo.qna_title}</span></h5>
						<h6 style="padding-left:890px"><span>등록일자 ${qnaVo.qna_regdate}</span></h6>
					</div>
				</div>
				<div class="col-lg-12 question" style="margin-top:10px">
					<textarea rows="10" cols="140" style="background-color:#1f2122; color:#ccc;" readonly>${qnaVo.qna_content}</textarea>
				</div>
				<div class="col-lg-12" style="margin-top:50px">
					<h5 style="color:#e75e8d"><span>답변</span></h5>
					<h6 id="comment_regdate" style="padding-left:890px" style="display:none"><span>등록일자 ${qnaCommentVo.qna_comment_regdate}</span></h6>
				</div>
				<div class="col-lg-12 answer" style="margin-top:10px">
					<textarea id="textarea" rows="10" cols="140" style="background-color:#1f2122; color:#ccc;">${qnaCommentVo.qna_comment}</textarea>
				</div>
				<div class="col-lg-12" style="margin-top:25px; padding-left:905px">
					<button type="button" class="btn btn-lg btnWrite" style="background-color:#e75e8d; color:#ccc;" data-no="${qnaVo.qna_no}" data-page="${page}">등록</button>
					<button type="button" class="btn btn-lg btnModify" style="background-color:#e75e8d; color:#ccc;">수정</button>
					<button type="button" class="btn btn-lg btnModifyOk" style="background-color:#FFF0F5; color:#ccc; display:none;" data-no="${qnaVo.qna_no}" data-page="${page}">완료</button>
					<button type="button" class="btn btn-lg btnDelete" style="background-color:#e75e8d; color:#ccc;" data-no="${qnaVo.qna_no}" data-page="${page}">삭제</button>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jspf"%>
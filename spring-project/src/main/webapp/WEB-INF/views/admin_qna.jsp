<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jspf" %>
<script>
$(document).ready(function() {
	$('.list-group > a').click(function(e){
		$('.list-group > a').removeClass('active');
		$(this).addClass('active');
	});
});
</script>
<div class="sidebar">
    <!-- 사이드 바 메뉴-->
    <div class="panel panel-info">
    
    	<!-- 타이틀 -->
         <div class="panel-heading">
           <h3 class="panel-title">관리자 메뉴</h3>
         </div>
         <!-- 타이틀 끝 -->
         
         <div class="list-group">
           <a href="${contextPath}/movie/admin" class="list-group-item list-group-item-action" aria-current="true">
             관리자 페이지
           </a>
           <a href="${contextPath}/movie/admin/movie_management" class="list-group-item list-group-item-action">
             영화 관리
           </a>
           <a href="${contextPath}/movie/admin/theater_management" class="list-group-item list-group-item-action">
             상영관 관리
           </a>
           <a href="${contextPath}/movie/admin/annList" class="list-group-item list-group-item-action">
             공지사항 관리
           </a>
           <a href="${contextPath}/movie/admin/qnaList" class="list-group-item list-group-item-action active">
             QNA 관리
           </a>
           <a href="${contextPath}/movie/admin/member" class="list-group-item list-group-item-action">
             회원 관리
           </a>
         </div>
         <!-- 메뉴 끝 -->
    </div>
     <!-- 사이드 바 메뉴 끝-->
  </div>
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
<!-- 				NavBar start -->
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
					<!-- ***** Gaming Library Start ***** -->
					<div class="gaming-library profile-library" style="margin-top: 0px">
						<div class="heading-section row">
							<div class="col-lg-8">
								<h4>
									Q<span style="color: #fff; font-size: 34px">&</span>A
								</h4>
							</div>
<!-- 							<div class="col-lg-4 main-button" style="text-align: right"> -->
<!-- 								<a id="a_wirte" href="#"><i class="fa fa-pencil fa-2x" -->
<!-- 									aria-hidden="true"></i></a> -->
<!-- 							</div> -->
						</div>
						<div class="col-lg-12">
							<div class="item">
								<ul>
									<li style="margin-right:10px; margin-left:10px;"><h4>글번호</h4></li>
									<li style="margin-left:10px"><h4>작성자</h4></li>
									<li style="margin-right:180px"><h4>제목</h4></li>
									<li><h4>등록날짜</h4></li>
									<li style="margin-left:10px"><h4>답변여부</h4></li>
								</ul>
							</div>
								<c:forEach items="${list}" var="qnaVo">
							<div class="item">
									<ul>
										<li style="margin-right:10px; margin-left:20px;"><h4>${qnaVo.qna_no}</h4></li>
										<li><h4>${qnaVo.userid}</h4></li>
										<li style="margin-right:180px" id="title"><h4>
												<a  href="${contextPath}/movie/admin/qna_detail?qna_no=${qnaVo.qna_no}&page=${pagingDto.page}" class="title">${qnaVo.qna_title}</a>
											</h4></li>
										<li><h4>${qnaVo.qna_regdate}</h4></li>
										<li>
										<c:choose>
											<c:when test="${qnaVo.answer_no eq 0}">
												<h4 style="color:#ec6090">미완료</h4>
											</c:when>
											<c:otherwise>
												<h4>완료</h4>
											</c:otherwise>
											</c:choose>
										</li>
									</ul>
							</div>
								</c:forEach>
						</div>
					</div>
					<div style="margin-top: 15px; text-align: center"> <!-- 페이징 시작  -->
		         	<div class="pagination">
		         	 <c:if test="${pagingDto.startPage ne 1}">
					  	<a href="#">&laquo;</a>
					 </c:if>
					  <c:forEach var="i" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
					  	<a class="page" href="#"
					  		<c:if test="${pagingDto.page eq i}">
					  			style="background-color: #e75e8d"
					  		</c:if>
					  		>${i} <!-- a> -->
					  	</a>
					  </c:forEach>
					  <c:if test="${pagingDto.endPage < pagingDto.totalPage}">
					  	<a href="#">&raquo;</a>
					  </c:if>
					</div>
		         </div><!-- 페이징 끝  -->
<!-- 		         모달 시작 -->
<!-- 				<div class="col-md-12"> -->
<!-- 					<a id="modal-422289" href="#modal-container-422289" role="button" -->
<!-- 						class="btn" data-toggle="modal" style="display: none">Launch -->
<!-- 						demo modal</a> -->

<!-- 					<div class="modal fade" id="modal-container-422289" role="dialog" -->
<!-- 						aria-labelledby="myModalLabel" aria-hidden="true"> -->
<!-- 						<div class="modal-dialog" role="document" style="color: #27292a"> -->
<!-- 							<div class="modal-content"> -->
<!-- 								<div class="modal-header"> -->
<!-- 									<h4 class="modal-title" style="color: #ec6090">문의하기</h4> -->
<!-- 									<button type="button" class="close" data-dismiss="modal"> -->
<!-- 										<span aria-hidden="true">×</span> -->
<!-- 									</button> -->
<!-- 								</div> -->
<!-- 								<div class="modal-body"> -->
<!-- 									<textarea rows="1" cols="50" placeholder="제목을 입력하세요.(50자 이내)"></textarea> -->
<!-- 									<textarea rows="5" cols="50" placeholder="문의할 내용을 입력하세요." style="margin-top:5px;"></textarea> -->
<!-- 								</div> -->
<!-- 								<div class="modal-footer"> -->
<!-- 									<input type="radio" name="state"/> 공개 -->
<!-- 									<input type="radio" name="state"/> 비공개 -->
<!-- 									<button type="button" class="btn btn-primary" style="background-color:#ec6090">제출</button> -->
<!-- 									<button type="button" class="btn btn-secondary" -->
<!-- 										data-dismiss="modal">닫기</button> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				모달 끝 -->
				</div>
			</div>
		</div>
	</div>
<%@include file="../include/footer.jspf" %>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function(){
		// 제목 10자리 이상 ..표시
// 		if($(".title").text().length() >= 10){
// 			var title = $(".title").text().substring(0, 10) + "...";			
// 			$(".title").text(title);
// 		}
		// 페이지 번호를 눌렀을 때
		$(".page").click(function(e){
			e.preventDefault();
			var page = $(this).text();
			console.log(page);
			location.href = "${contextPath}/movie/admin/qnaList?page=" + page;
		});
		// 연필을 눌렀을 때 모달 띄우기
// 		$(".main-button").click(function(e){
// 		e.preventDefault();
// 		$("#modal-422289").trigger("click");
// 		});
		// nav 해당 페이지 글색
		$(".active").css("color", "#ec6090");
	});
	</script>

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
						<li class="nav-item"><a class="nav-link" href="${contextPath}/movie/fre_qna">자주하는 질문</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="${contextPath}/movie/ann">공지사항</a>
						</li>
						<li class="nav-item"><a class="nav-link active" href="${contextPath}/movie/qna">Q&A</a>
						</li>
					</ul>
				</div>
				<!-- NavBar end -->
					<!-- ***** Gaming Library Start ***** -->
					<div class="gaming-library profile-library" style="margin-top: 0px">
						<div class="heading-section row">
							<div class="col-lg-8">
								<h4>
									Q<span style="color: #fff; font-size: 34px">&</span>A
								</h4>
							</div>
							<div class="col-lg-4 main-button" style="text-align: right">
								<a id="a_wirte" href="#"><i class="fa fa-pencil fa-2x"
									aria-hidden="true"></i></a>
							</div>
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
								<c:forEach var="i2" begin="1" end="10">
							<div class="item">
									<ul>
										<li style="margin-right:10px; margin-left:20px;"><h4>${i2}</h4></li>
										<li><h4>userid</h4></li>
										<li style="margin-right:180px" id="title"><h4>
												<a href="${contextPath}/movie/qna_board" class="title">인터넷 결제는 어떻게 하나요?</a>
											</h4></li>
										<li><h4>2023/01/06</h4></li>
										<li><h4>완료</h4></li>
									</ul>
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
		         <!-- 모달 시작 -->
				<div class="col-md-12">
					<a id="modal-422289" href="#modal-container-422289" role="button"
						class="btn" data-toggle="modal" style="display: none">Launch
						demo modal</a>

					<div class="modal fade" id="modal-container-422289" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document" style="color: #27292a">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" style="color: #ec6090">문의하기</h4>
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">
									<textarea rows="5" cols="50" placeholder="문의할 내용을 입력하세요."></textarea>
								</div>
								<div class="modal-footer">
									<input type="checkbox"checked/> 공개
									<input type="checkbox"/> 비공개
									<button type="button" class="btn btn-primary" style="background-color:#ec6090">제출</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달 끝 -->
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
		// 연필을 눌렀을 때 모달 띄우기
		$(".main-button").click(function(e){
		e.preventDefault();
		$("#modal-422289").trigger("click");
		});
		// nav 해당 페이지 글색
		$(".active").css("color", "#ccc");
	});
	</script>


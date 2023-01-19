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
						<li class="nav-item"><a class="nav-link" href="${contextPath}/movie/fre_qna">자주하는 질문</a>
						</li>
						<li class="nav-item"><a class="nav-link active" href="${contextPath}/movie/ann">공지사항</a>
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
									공지사항
								</h4>
							</div>
							<div class="col-lg-4 main-button" style="text-align: right; display:none;">
								<a id="a_wirte" href="#"><i class="fa fa-pencil fa-2x"
									aria-hidden="true"></i></a>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="item">
								<ul>
									<li><h4>글번호</h4></li>
									<li style="margin-left:5px;"><h4>구분</h4></li>
									<li style="margin-left:10px; margin-right: 200px"><h4>제목</h4></li>
									<li><h4>등록날짜</h4></li>
									<li><h4>조회수</h4></li>
								</ul>
							</div>
								<c:forEach items="${list}" var="annVo">
							<div class="item">
									<ul>
										<li style="margin-left:10px;"><h4>${annVo.ann_no}</h4></li>
										<c:choose>
											<c:when test="${annVo.ann_category == 1}">
												<li><h4>결제</h4></li>									
											</c:when>
											<c:when test="${annVo.ann_category == 2}">
												<li><h4>시설</h4></li>									
											</c:when>
											<c:when test="${annVo.ann_category == 3}">
												<li><h4>주차</h4></li>									
											</c:when>
										</c:choose>
										<li style="margin-right: 200px" id="title"><h4>
												<a href="${contextPath}/movie/ann_board?ann_no=${annVo.ann_no}&page=${pagingDto.page}" id="title">${annVo.ann_title}</a>
											</h4></li>
										<li><h4>${annVo.ann_regdate}</h4></li>
										<li><h4>${annVo.ann_viewcnt}</h4></li>
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
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function(){
		// 제목 10자리 이상 ..표시
		var title = $(".title");
		for (i = 0 ; i < title.length; i++){
			//console.log(title[i].innerText.substring(0,10));	
			if(title[i].innerText.length > 10){
				//title[i].text(title[i].innerText.substring(0,10)) + "...";
				$(".item").find("a").eq(i).text(title[i].innerText.substring(0,10) + "...");
			}
			$(".item").find("a").eq(i).text(title[i].innerText);
		}
		console.log(title);
		// nav 해당 페이지 글색
		$(".active").css("color", "#ec6090");
		$(".page").click(function(e){
			e.preventDefault();
			var page = $(this).text();
			console.log(page);
			location.href = "${contextPath}/movie/ann?page=" + page;
		});
	});
	</script>
<%@include file="../include/footer.jspf" %>

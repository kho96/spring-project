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
									aria-hidden="true" data-userid="${qnaVo.userid}"></i></a>
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
								<c:forEach items="${list}" var="qnaVo">
							<div class="item">
									<ul>
										<li style="margin-right:10px; margin-left:20px;"><h4>${qnaVo.qna_no}</h4></li>
										<li><h4>${qnaVo.userid}</h4></li>
										<li style="margin-right:180px" id="title"><h4>
												<a data-userid="${qnaVo.userid}" data-state="${qnaVo.qna_state}" data-qna_no="${qnaVo.qna_no}" data-page="${pagindDto.page}" href="#" class="title">${qnaVo.qna_title}</a>
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
									<textarea id="qna_title" rows="1" cols="50" placeholder="제목을 입력하세요.(50자 이내)"></textarea>
									<textarea id="qna_content" rows="5" cols="50" placeholder="문의할 내용을 입력하세요." style="margin-top:5px;"></textarea>
								</div>
								<div class="modal-footer">
									<div>
									<input type="radio" name="radio" value="1"/> 공개
									<input type="radio" name="radio" value="2"/> 비공개</div>
									<button id="btnWrite" type="button" class="btn btn-primary" style="background-color:#ec6090">제출</button>
									<button id="btnClose" type="button" class="btn btn-secondary"
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
		// 제목을 눌렀을 때
		$(".title").click(function(e){
			e.preventDefault();
			// 로그인한 아이디
			var userid = "${userVo.userid}";
			console.log("userid:", userid);
			var writer = $(this).attr("data-userid");
			var qna_state = $(this).attr("data-state");
			var qna_no = $(this).attr("data-qna_no");
			var page = $(this).attr("data-page");
// 			console.log(qna_state);
// 			console.log(qna_no);
// 			console.log(page);
			if(userid == null || userid == ""){
				alert("로그인 해주세요");
				location.href = "${contextPath}/movie/login";
				return;
			}
			if((userid != writer || userid == writer) && qna_state == "1"){
				location.href = "${contextPath}/movie/qna_board?writer=" + writer + "&qna_no=" + qna_no + "&page="+ page;
			} else if(userid == writer &&  qna_state == "2") {
				location.href = "${contextPath}/movie/qna_board?writer=" + writer + "&qna_no=" + qna_no + "&page="+ page;
			} else if(userid != writer && qna_state == "2"){
				alert("비공개 글 입니다");				
			}
		});
		// 연필을 눌렀을 때 모달 띄우기
		$(".main-button").click(function(e){
			e.preventDefault();
			var userid = "${userVo.userid}";
			// 로그인 하지 않은 상태
			if(userid == null || userid == ""){
				alert("로그인 해주세요");
				location.href = "${contextPath}/movie/login";
			}
			// 로그인한 상태
			$("#modal-422289").trigger("click");
		});
		// 제출 버튼 눌렀을 때
		$("#btnWrite").click(function(){
			// 로그인한 아이디
			var userid = "${userVo.userid}";
			var qna_title = $("#qna_title").val();
			//console.log(qna_title);
			var qna_content = $("#qna_content").val();
			//console.log(qna_content);
			var qna_state = $("input[name='radio']:checked").val();
			//console.log(qna_state);
			var sData = {
					"userid" : userid,
					"qna_title" : qna_title,
					"qna_content" : qna_content,
					"qna_state" : qna_state
			};
			if(qna_title == null || qna_content == null ||qna_state == null){
				alert("빈 칸을 모두 채워 주세요");
				return;
			}
			var url = "${contextPath}/movie/insertQna";
			$.post(url, sData, function(rData){
				console.log(rData);
				if(rData == "true"){
					$("#btnClose").trigger("click");
					location.href = "${contextPath}/movie/qna";
				}
			});
		});
		$(".page").click(function(e){
			e.preventDefault();
			var page = $(this).text();
			console.log(page);
			location.href = "${contextPath}/movie/qna?page=" + page;
		});
		// nav 해당 페이지 글색
		$(".active").css("color", "#ec6090");
	});
	</script>
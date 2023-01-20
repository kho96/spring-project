<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<script> 
$(document).ready(function() {
	var moviePage = "${contextPath}/movie/admin/movie_management";
	
	$('.list-group > a').click(function(e){
		$('.list-group > a').removeClass('active');
		$(this).addClass('active');
	});
	
	$(".modifyMovie").click(function(e) {
		e.preventDefault();
		var movie_no = $(this).attr("data-movie-no");
		var sData = {
			"movie_no" : movie_no	
		};
		var url = "${contextPath}/movie/admin/movie_management/get_detail";
		
		$.post(url, sData, function(rData) {
			console.log(rData);
			$("#modal_movie_no").val(rData.movie_no);
			$("#modal_movie_title").val(rData.movie_title);
			$("#modal_movie_story").val(rData.movie_story);
			$("#modal_staff_list").val(rData.staff_list);
			$("#modal_rating").val(rData.rating).prop("selected", true);
			$("#modal_genre").val(rData.genre);
			$("#modal_runtime").val(rData.runtime);
			$("#modal_release_date").val(rData.release_date);
			$("#modal_score").val(rData.score);
			$("#modal_status").val(rData.status).prop("selected", true);
		});
		
		// 영화 수정 버튼
		$("#btnModify").click(function() {
			$("#frmUpdateMovie").submit();
		});
		
		// 영화 삭제 버튼
		$("#btnDelete").click(function() {
			var result = confirm("정말 삭제하시겠습니까?");
			console.log(result);
			if (result == true) {
				var delete_url = moviePage + "/delete_movie?movie_no=" + movie_no;
				location.href = delete_url;
			} else {
				return;
			}
		});
	});
	
	// 영화 이름으로 검색
	$("#frmSearchMovieApi").submit(function(e) {
		e.preventDefault();
		var received_data = ""; // 전역변수 received_data 초기화
		$('#term > option').remove();
		$("#term").append("<option selected'>영화 선택</option>");
		var keyword = $("#keyword").val(); // 영화 이름
		var url = "${contextPath}/movie/admin/movie_management/search?keyword=" + keyword;
		
        fetch(url, {
        	method : 'POST',
        	headers : {
        		"Content-Type": "application/json",
        	},
        })
        .then(response => response.json())
        .then(json => {
        	var result = json.Data[0].Result;
        	try {
	            for (var i = 0; i < result.length; i++) {
	            	// 제목 앞뒤로 !HS !HE 붙은거 자르기
	            	const regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
	            	var title = result[i].title.replace(regExp, "");
	            	title = title.replace(/HE|HS/g, "");
	            	title = title.replace(/ +/g, " ");
	            	title = title.trim(); // 공백 제거
	            	
	            	// 셀렉트 박스에 제목 넣기
	            	$('<option></option>').val(title).text(title).appendTo($('#term'));
	            };
        	} catch (e) {
        		alert("검색어를 제대로 입력해주세요");
        		location.href = moviePage;
        	};
        	
        	// 받아온 영화 데이터 폼에 입력하기
        	$("#term").change(function() {
        		var select = $("#term option:selected");
        		var movie_title = select.val(); // 선택된 영화 제목 저장
        		var idx = $("#term option").index(select) - 1; // 선택한 영화 인덱스값
        		var selectMovie = result[idx]; // 선택한 영화
        		var plotText = "";
        		try {
	        		plotText = selectMovie.plots.plot[0].plotText; // 영화 줄거리
					
				} catch (e) {
					alert("줄거리가 없습니다");
				}
        		var posters = selectMovie.posters.split("|")[0];
        		console.log(selectMovie);
        		
        		var genre = selectMovie.genre // 장르
        		
        		var rating = selectMovie.rating // 관람등급
        		rating = rating.substring(0, 2);
        		switch (rating) {
				case "전체":
					rating = "1";
					break;
				case "12":
					rating = "2";
					break;
				case "15":
					rating = "3";
					break;
				case "18":
					rating = "4";
					break;
				default:
					rating = "1";
					break;
				}
        		
        		var runtime = selectMovie.runtime // 상영시간
      
        		// 개봉일 날짜 형식 수정
        		var repRlsDate = selectMovie.repRlsDate; // 개봉일
        		var year = repRlsDate.substring(0, 4);
        		var month = repRlsDate.substring(4, 6);
        		var date = repRlsDate.substring(6, 8);
        		var finalDate = year + "년 " + month + "월 " + date + "일"; 
        		
        		// 출연진
        		var staff = selectMovie.staffs.staff;
        		var director = staff[0].staffNm; // 감독
        		var staff_list = [];
        		// 역할이 '출연'인 배우만 고르기
        		staff.filter(function (obj) {
        			if (obj['staffRoleGroup'] === "출연") {
        			 staff_list.push(obj['staffNm']);
        			}
        		});
        		staff_list = staff_list.slice(0, 4); // 4명만 배열에 넣기
        		
        		$("#movie_title").val(movie_title).text(movie_title);
        		$("#movie_story").val(plotText);
        		if (posters != "") {
        			$("#posters").attr("src", posters);
        			$("#send_porster").attr("value", posters);
        		} else {
        			$("#posters").attr("src", "/assets/images/popular-05.jpg"); // 기본 포스터
        			$("#send_porster").attr("value", "/assets/images/popular-05.jpg")
        		}
        		$("#staff_list").val("감독 : " + director + ", 출연진 : " + staff_list);
        		$("#genre").val(genre);
        		
        		$('#rating').val(rating).prop("selected", true);
        		
        		$("#runtime").val(runtime + "분");
        		$("#release_date").val(finalDate);
        		
        		var compare_date = new Date(year + "-" + month + "-" + date); 
        		var today = new Date();
        		var status = "";
        		if (today > compare_date) status = "상영종료";
        		if (today < compare_date) status = "상영예정";
        		if (today == compare_date) status = "상영중";
        		console.log(status);
        		$("#status").val(status).prop("selected", true);
        	});
        }) // fetch
	}); // 영화 검색 api

	// 영화 추가 버튼 클릭
	$("#btnInsertMovie").click(function(e) {
		e.preventDefault();
		console.log('영화 등록');
		try {
			$("#frmInsertMovie").submit();
		} catch (e) {
			alert("입력값을 확인해주세요");
			location.href = moviePage;
		}
		
	});
});
</script>

  <!-- 사이드바 시작 -->
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
           <a href="${contextPath}/movie/admin/movie_management" class="list-group-item list-group-item-action active">
             영화 관리
           </a>
           <a href="${contextPath}/movie/admin/theater_management" class="list-group-item list-group-item-action">
             상영관 관리
           </a>
           <a href="${contextPath}/movie/admin/annList" class="list-group-item list-group-item-action">
             공지사항 관리
           </a>
           <a href="${contextPath}/movie/admin/qnaList" class="list-group-item list-group-item-action">
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
  <!-- 사이드바 끝 -->
  
  <!-- 모달창 시작 -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content custom-modal">
      <div class="modal-header custom-modal-header">
        <h4 class="modal-title" id="exampleModalLabel">영화 관리</h4>
        <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="frmUpdateMovie" action="${contextPath}/movie/admin/movie_management/update_run" method="POST">
          <input id="modal_movie_no" name="movie_no" type="hidden" value="">
          <div class="form-group">
            <label for="movie_title" class="col-form-label">제목:</label>
            <input type="text" class="form-control" id="modal_movie_title" name="movie_title">
          </div>
          
          <div class="form-group">
            <label for="movie_story" class="col-form-label">줄거리:</label>
            <textarea class="form-control" cols="10" id="modal_movie_story" name="movie_story"></textarea>
          </div>
          
          <div class="form-group">
            <label for="staff_list" class="col-form-label">출연진:</label>
            <input type="text" class="form-control" id="modal_staff_list" name="staff_list">
          </div>
          
          <div class="form-group">
            <label for="genre" class="col-form-label">장르:</label>
            <input type="text" class="form-control" id="modal_genre" name="genre">
          </div>
          
          <div class="form-group">
            <label for="rating">등급</label>
            <select class="form-select" aria-label="Default select example" id="modal_rating" name="rating">
              <option value="0" selected>등급을 선택해주세요</option>
              <option value="1">전체관람가</option>
              <option value="2">12세관람가</option>
              <option value="3">15세관람가</option>
              <option value="4">청소년 관람불가</option>
            </select>
          </div>
          
          <div class="form-group">
            <label for="runtime" class="col-form-label">상영시간:</label>
            <input type="text" class="form-control" id="modal_runtime" name="runtime">
          </div>
          
          <div class="form-group">
            <label for="release_date" class="col-form-label">개봉일:</label>
            <input type="text" class="form-control" id="modal_release_date" name="release_date">
          </div>
          
          <div class="form-group">
            <label for="score" class="col-form-label">평점:</label>
            <input type="text" class="form-control" id="modal_score" name="score">
          </div>
          
          <div class="form-group">
            <label for="status">상태</label>
            <select class="form-select" aria-label="Default select example" id="modal_status" name="status">
              <option value="0" selected>상태를 선택해주세요</option>
              <option value="상영중">상영중</option>
              <option value="상영예정">상영예정</option>
              <option value="상영종료">상영종료</option>
            </select>
          </div>
          
        </form>
      </div>
      <div class="modal-footer custom-modal-footer">
        <button type="button" id="btnDelete" class="btn btn-danger">삭제</button>
        <button type="button" id="btnModify" class="btn custom-btn">수정</button>
      </div>
    </div>
  </div>
  </div>
  <!-- 모달창 끝 -->
  
  <div class="container">
    <!-- ***** 영화 관리 페이지 ***** -->
    <div class="row">
      <div class="col-12">
        <div class="page-content" style="padding-top: 5px">
        
          <!--
          <div class="game-details">
            <h2>영화 관리 페이지</h2>
          </div>
          -->
          
          <!-- 영화 관리 시작 -->
          <div class="most-popular header-text">
            <div class="row">
              <div class="col-lg-12">

                <div class="heading-section">
                  <h4><em>영화 관리</em></h4>
                </div>

                <div class="row">
                  <h4>영화 검색</h4>
                  <div class="form-area" style="margin-top:10px">
                    <form class="form-input" id="frmSearchMovieApi" action="#">
                      <input type="text" placeholder="영화 검색하기" id="keyword" name="keyword">
                      <i class="fa fa-search"></i>
                    </form>
                  </div>
                </div>
                
                <div class="row" style="margin-top:10px;">
                  <h4>영화 리스트</h4>
                  <div class="form-area" style="margin-top:10px">
                    <form class="form-input" id="frmMovieList" action="#">
                       <ul>
					     <li>
					       <select class="form-select" name="term" id="term">
					         <option selected>영화 선택</option>
					       </select>
					     </li>
					   </ul>
                    </form>
                  </div>
                </div>

              </div>
            </div>

            <form class="form-input" id="frmInsertMovie" action="${contextPath}/movie/admin/movie_management/insert_run" method="POST" style="margin: 12px;">
            <div class="row">
              <div class="col-lg-6">
                <div class="row" style="margin-top:10px;">
                  <div class="form-group">
                    <h4><label for="movie_title">영화 제목</label></h4>
                    <input type="text" class="form-control" id="movie_title" name="movie_title">
                  </div>
                  
                  <div class="form-group movie-list">
                    <h4><label for="movie_story">줄거리</label></h4>
                    <textarea class="form-control" rows="10" id="movie_story" name="movie_story"></textarea>
                  </div>
                  
                  <div class="form-group movie-list">
                    <h4><label for="staff_list">출연진</label></h4>
                    <input type="text" class="form-control" id="staff_list" name="staff_list">
                  </div>
                  
                  <div class="form-group movie-list">
                    <h4><label for="genre">장르</label></h4>
                    <input type="text" class="form-control" id="genre" name="genre">
                  </div>

                  <div class="form-group movie-list">
                    <h4><label for="rating">등급</label></h4>
                    <select class="form-select" aria-label="Default select example" id="rating" name="rating">
                      <option value="0" selected>등급을 선택해주세요</option>
                      <option value="1">전체관람가</option>
                      <option value="2">12세관람가</option>
                      <option value="3">15세관람가</option>
                      <option value="4">청소년 관람불가</option>
                    </select>
                  </div>
                  
                  <div class="form-group movie-list">
                    <h4><label for="runtime">상영시간</label></h4>
                    <input type="text" class="form-control" id="runtime" name="runtime">
                  </div>
                  
                  <div class="form-group movie-list">
                    <h4><label for="release_date">개봉일</label></h4>
                    <input type="text" class="form-control" id="release_date" name="release_date">
                  </div>
                  
                  <div class="form-group movie-list">
                    <h4><label for="score">평점</label></h4>
                    <input type="text" class="form-control" id="score" name="score" required>
                  </div>
                  
                  <div class="form-group movie-list">
                    <h4><label for="status">상태</label></h4>
                    <select class="form-select" aria-label="Default select example" id="status" name="status">
                      <option value="0" selected>상태를 선택해주세요</option>
                      <option value="상영중">상영중</option>
                      <option value="상영예정">상영예정</option>
                      <option value="상영종료">상영종료</option>
                    </select>
                  </div>
                  
                </div>
              </div>
              
              <div class="col-lg-6">
              
                <div class="row" style="margin-top:10px;">
                  <h4>사진</h4>
                  <input type="hidden" id="send_porster" name="posters" value="/assets/images/popular-05.jpg">
                  <img src="/assets/images/popular-05.jpg" class="img-fluid img-thumbnail" 
                   id="posters" style="width: 90%; margin: auto; margin-top: 10px;">
                </div> 
                
              </div>
            </div>
            
            <div class="row" style="margin:50px;">
              <div class="main-button">
                <a href="#" id="btnInsertMovie" style="width: inherit;">영화 등록하기</a>
              </div>
            </div>
            
            </form>
            
          </div>
          <!-- 영화 관리 끝 -->

          <!-- 영화 리스트 -->
          <div class="game-details">
            <h2>영화 목록</h2>
          </div>
          
          <div class="gaming-library">
            <div class="col-lg-12">

              <c:forEach items="${list}" var="list">
              <div class="item"
              style="margin-top: 50px">
                <ul>
                  <li><img src="${list.posters}" alt="" class="templatemo-item"></li>
                  <li style="margin-right: 50px;"><h4>제목</h4><span>${list.movie_title}</span></li>
                  <li><h4>상영일</h4><span>${list.release_date }</span></li>
                  <li><h4>상영시간</h4><span>${list.runtime}</span></li>
                  <li><h4>상태</h4><span>${list.status}</span></li>
                  <li style="text-align: center;position: absolute;width: 150px;">
                    <div class="main-border-button">
                      <a href="#" class="modifyMovie" data-toggle="modal" data-target="#exampleModal" data-movie-no="${list.movie_no}">
                      관리
                      </a>
                    </div>
                  </li>
                </ul>
              </div>
              </c:forEach>
              
              <!-- 페이징 시작  -->
              <div style="margin-top: 15px; text-align: center"> 
		        <div class="pagination">
				 <a href="#">&laquo;</a>
				 <c:forEach var="i" begin="1" end="1">
					<a href="#"
						<c:if test="${i eq 1 }">style="background-color: #ec6090"</c:if>
					>${i}</a>
				 </c:forEach>
				 <a href="#">&raquo;</a>
				</div>
		      </div>
		      <!-- 페이징 끝  -->
		         
            </div>
          </div>
          <!-- 영화 리스트 -->
          
        </div>
      </div>
    </div>
    <!-- ***** 영화 관리 페이지 끝 ***** -->
    
  </div>

<%@ include file="../include/footer.jspf" %>
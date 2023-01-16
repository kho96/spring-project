<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<script>
$(document).ready(function() {
	$('.list-group > a').click(function(e){
		$('.list-group > a').removeClass('active');
		$(this).addClass('active');
	});
	
	// 영화 삭제 버튼
	$("#btnDelete").click(function() {
		var result = confirm("정말 삭제하시겠습니까?");
		console.log(result);
		if (result == true) {
			location.href = "${contextPath}/movie/admin/movie";
		} else {
			return;
		}
		
	});
	
	// 영화 수정 버튼
	$("#btnModify").click(function() {
		location.href = "${contextPath}/movie/admin/movie";
	});

	// 영화 이름으로 검색
	$("#frmSearchMovieApi").submit(function(e) {
		e.preventDefault();
		var received_data = ""; // 전역변수 received_data 초기화
		var keyword = $("#keyword").val(); // 영화 이름
		var url = "${contextPath}/movie/admin/movie/search?keyword=" + keyword;
		
        fetch(url, {
        	method : 'POST',
        	headers : {
        		"Content-Type": "application/json",
        	},
        })
        .then(response => response.json())
        .then(json => {
        	var result = json.Data[0].Result;
           
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
            
        	// 받아온 영화 데이터 폼에 입력하기
        	$("#term").change(function() {
        		var select = $("#term option:selected");
        		var movie_title = select.val(); // 선택된 영화 제목 저장
        		var idx = $("#term option").index(select) - 1; // 선택한 영화 인덱스값
        		var selectMovie = result[idx]; // 선택한 영화
        		var plotText = selectMovie.plots.plot[0].plotText; // 영화 줄거리
        		$("#movie_title").val(movie_title).text(movie_title);
        		$("#movie_story").val("123");
        	});
        })
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
           <a href="${contextPath}/movie/admin/movie" class="list-group-item list-group-item-action active">
             영화 관리
           </a>
           <a href="${contextPath}/movie/admin/article" class="list-group-item list-group-item-action">
             게시글 관리
           </a>
           <a href="${contextPath}/movie/admin/member" class="list-group-item list-group-item-action">
             회원 관리
           </a>
         </div>
         <!-- 메뉴 끝 -->
    </div>
     <!-- 사이드 바 메뉴 끝-->
  </div>
  
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
        <form>
          <div class="form-group">
            <label for="title" class="col-form-label">제목:</label>
            <input type="text" class="form-control" id="title">
          </div>
          <div class="form-group">
            <label for="date" class="col-form-label">상영일:</label>
            <input type="text" class="form-control" id="date">
          </div>
          <div class="form-group">
            <label for="time" class="col-form-label">상영시간:</label>
            <input type="text" class="form-control" id="time">
          </div>
          <div class="form-group">
            <label for="content" class="col-form-label">줄거리:</label>
            <textarea class="form-control" id="content" rows="8">대충 내용</textarea>
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
					       <select name="term" id="term">
					         <option value="">영화 선택</option>
					       </select>
					     </li>
					   </ul>
                    </form>
                  </div>
                </div>

<!--                 <div class="row"> -->
<!--                   <div class="main-border-button"> -->
<!--                     <a href="#" data-toggle="modal" data-target="#exampleModal"> -->
<!--                       영화 추가 하기 -->
<!--                     </a> -->
<!--                   </div> -->
<!--                 </div> -->

              </div>
            </div>
            
            <div class="row">
            
              <div class="col-lg-6">
                <div class="row" style="margin-top:10px;">
                  <form class="form-input" id="frmMovieInsert" action="#">
                    <h4><label for="movie_title">영화 제목</label></h4>
                    <input type="text" class="form-control" id="movie_title" name="movie_title">
                  </form>
                </div>
              </div>
              
              <div class="col-lg-6">
                <div class="row" style="margin-top:10px;">
                  <form class="form-input" id="frmMovieInsert" action="#">
                    <h4><label for="movie_story">줄거리</label></h4>
                    <textarea class="form-control" rows="5" id="stroy" name="movie_story"></textarea>
                  </form>
                </div>
              </div>
              
            </div>
          </div>
          <!-- 영화 관리 끝 -->

          <!-- 영화 리스트 -->
          <div class="game-details">
            <h2>영화 목록</h2>
          </div>
          
          <div class="gaming-library">
            <div class="col-lg-12">
            
              <!-- 폼 테스트 -->
              <div class="form-area">
                <form class="form-input" action="#">
                  <input type="text" placeholder="영화 제목 검색" id="searchText" name="searchKeyword" onkeypress="handle">
                  <i class="fa fa-search"></i>
                </form>
              </div>
              <!-- // 폼 테스트 -->
              
              <c:forEach var="i" begin="1" end="10">
              <div
              <c:choose>
                <c:when test="${i eq 10}">
                  class="item last-item"
                </c:when>
                <c:otherwise>
                  class="item"
                </c:otherwise>
              </c:choose>
              style="margin-top: 50px">
                <ul>
                  <li><img src="/assets/images/game-01.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>제목</h4><span>Sandbox</span></li>
                  <li><h4>상영일</h4><span>05/01/2022</span></li>
                  <li><h4>상영시간</h4><span>1시간 50분</span></li>
                  <li><h4>상태</h4><span>상영중</span></li>
                  <li>
                    <div class="main-border-button">
                      <a href="#" data-toggle="modal" data-target="#exampleModal">
                      관리
                      </a>
                    </div>
                  </li>
                </ul>
                

              </div>
              </c:forEach>
              
              <div style="margin-top: 15px; text-align: center"> <!-- 페이징 시작  -->
		         	<div class="pagination">
					  <a href="#">&laquo;</a>
					  <c:forEach var="i" begin="1" end="5">
					  	<a href="#"
					  		<c:if test="${i eq 1 }">style="background-color: #ec6090"</c:if>
					  	>${i}</a>
					  </c:forEach>
					  <a href="#">&raquo;</a>
					</div>
		         </div><!-- 페이징 끝  -->
		         
            </div>
          </div>
          <!-- 영화 리스트 -->
          
        </div>
      </div>
    </div>
    <!-- ***** 영화 관리 페이지 끝 ***** -->
    
  </div>

<%@ include file="../include/footer.jspf" %>
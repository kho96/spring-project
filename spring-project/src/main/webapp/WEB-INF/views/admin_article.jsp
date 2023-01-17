<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<script>
$(document).ready(function() {
	$('.list-group > a').click(function(e){
		$('.list-group > a').removeClass('active');
		$(this).addClass('active');
	});
	
	// 게시글 삭제 버튼
	$("#btnDelete").click(function() {
		var result = confirm("정말 삭제하시겠습니까?");
		console.log(result);
		if (result == true) {
			location.href = "${contextPath}/movie/admin/article";
		} else {
			return;
		}
		
	});
	
	// 게시글 수정/작성 버튼
	$("#btnInsert, #btnModify").click(function() {
		location.href = "${contextPath}/movie/admin/article";
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
           <a href="${contextPath}/movie/admin/movie_management" class="list-group-item list-group-item-action">
             영화 관리
           </a>
           <a href="${contextPath}/movie/admin/theater_management" class="list-group-item list-group-item-action">
             상영관 관리
           </a>
           <a href="${contextPath}/movie/admin/article" class="list-group-item list-group-item-action active">
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
  <!-- 사이드바 끝 -->
  
  <!-- 공지사항 관리 모달창 시작 -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content custom-modal">
      <div class="modal-header custom-modal-header">
        <h4 class="modal-title" id="exampleModalLabel">공지사항</h4>
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
            <label for="content" class="col-form-label">내용:</label>
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
  <!-- 공지사항 관리 모달창 끝 -->
  
  <!-- 공지사항 작성 모달창 시작 -->
  <div class="modal fade" id="addMovie" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content custom-modal">
      <div class="modal-header custom-modal-header">
        <h4 class="modal-title" id="exampleModalLabel">공지사항</h4>
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
            <label for="content" class="col-form-label">내용:</label>
            <textarea class="form-control" id="content" rows="8">대충 내용</textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer custom-modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">닫기</button>
        <button type="button" id="btnInsert" class="btn custom-btn">작성</button>
      </div>
    </div>
  </div>
  </div>
  <!-- 공지사항 작성 모달창 끝 -->
  
  <!-- 메인 컴포넌트 시작 -->
  <div class="container">
  
    <!-- ***** 게시글 관리 페이지 ***** -->
    <div class="row">
      <div class="col-12">
        <div class="page-content" style="padding-top: 5px">
        
          <div class="game-details">
            <h2>게시글 관리 페이지</h2>
          </div>
                   
          <div class="featured-games header-text">
            <div class="heading-section">
              <h4><span style="color: white">공지사항</span></h4>
              <div class="main-button" style="height: 0px;">
                <a href="#" data-toggle="modal" data-target="#addMovie"
                   style="position: relative;left: 90%;bottom: 68px;">
                  글쓰기
                </a>
              </div>
            </div>
            <div>
              <table class="table list-table">
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>등록일</th>
                </tr>
                <c:forEach var="i" begin="1" end="10">
                <tr>
                  <td>${i}</td>
                  <td>
                    <a href="#" data-toggle="modal" data-target="#exampleModal">
                      제목${i}
                    </a>
                  </td>
                  <td>2001-01-0${i + 1}</td>
                </tr>
                </c:forEach>
              </table>
            </div>
            
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
      </div>
    </div>
    <!-- ***** 영화 관리 페이지 끝 ***** -->
    
  </div>
  <!-- 메인 컴포넌트 끝 -->
<%@ include file="../include/footer.jspf" %>
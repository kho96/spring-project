<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<script>
$(document).ready(function() {
	$('.list-group > a').click(function(e){
		$('.list-group > a').removeClass('active');
		$(this).addClass('active');
	});
	
	// 유저 삭제 버튼
	$("#btnDelete").click(function() {
		var result = confirm("정말 삭제하시겠습니까?");
		console.log(result);
		if (result == true) {
			location.href = "${contextPath}/movie/admin/member";
		} else {
			return;
		}
		
	});
	
	// 회원 수정 버튼
	$("#btnModify").click(function() {
		location.href = "${contextPath}/movie/admin/member";
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
           <a href="${contextPath}/movie/admin/article" class="list-group-item list-group-item-action">
             게시글 관리
           </a>
           <a href="${contextPath}/movie/admin/member" class="list-group-item list-group-item-action active">
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
        <h4 class="modal-title" id="exampleModalLabel">회원 관리</h4>
        <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="userid" class="col-form-label">아이디:</label>
            <input type="text" class="form-control" id="userid">
          </div>
          <div class="form-group">
            <label for="username" class="col-form-label">이름:</label>
            <input type="text" class="form-control" id="username">
          </div>
          <div class="form-group">
            <label for="regdate" class="col-form-label">가입일:</label>
            <input type="text" class="form-control" id="regdate">
          </div>
          <div class="form-group">
            <label for="userpoint" class="col-form-label">마일리지:</label>
            <input type="text" class="form-control" id="userpoint">
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
  
  <!-- 메인 컴포넌트 시작 -->
  <div class="container">
  
    <!-- ***** 회원 관리 페이지 ***** -->
    <div class="row">
      <div class="col-12">
        <div class="page-content" style="padding-top: 5px">
        
          <div class="game-details">
            <h2>회원 관리 페이지</h2>
          </div>
                   
          <div class="featured-games header-text">
            <div class="heading-section">
              <h4><span style="color: white">회원</span> 리스트</h4>
            </div>
            <div>
              <table class="table list-table">
                <tr>
                  <th>#</th>
                  <th>아이디</th>
                  <th>이름</th>
                  <th>마일리지</th>
                  <th>생성일</th>
                  <th>관리</th>
                </tr>
                <c:forEach var="i" begin="1" end="10">
                <tr>
                  <td>${i}</td>
                  <td>test${i}</td>
                  <td>홍길동${i}</td>
                  <td>${1 + i}</td>
                  <td>2001-01-0${i + 1}</td>
                  <td>
                    <div class="main-border-button">
                      <a href="#" data-toggle="modal" data-target="#exampleModal">
                        관리하기
                      </a>
                    </div>
                  </td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<script src="/js/myscript.js"></script>
<script> 
$(document).ready(function() {
	$('.list-group > a').click(function(e){
		$('.list-group > a').removeClass('active');
		$(this).addClass('active');
	});
	
	// 게시글 작성 버튼
	$("#btnInsert").click(function(){
		console.log("btnInsert click");
		var ann_title = $("#ann_title").val();
		var ann_content = $("#ann_content").val();
		var ann_category = $("#ann_category").val();
		var url = "${contextPath}/movie/admin/insertAnn";
		var sData = {
				"ann_category": ann_category,
				"ann_title" : ann_title,
				"ann_content" : ann_content
		};
		//console.log(sData);
		$.post(url, sData, function(rData){
			console.log(rData);
			if(rData == "true"){
				$("#btnClose").trigger("click");
				location.href = "${contextPath}/movie/admin/annList";
 			}
		});
	});
	
	// 게시글 제목 클릭
	$(".a_ann_title").click(function(){
		var url = "${contextPath}/movie/admin/showAnnDetail";
		var ann_no = $(this).attr("data-no");
		$.get(url, {"ann_no" : ann_no}, function(rData){
			console.log(rData);
			var ann_title = rData.ann_title;
			var ann_content = rData.ann_content;
			var ann_category = rData.ann_category;
			$("#title").val(ann_title);
			$("#content").val(ann_content);
			$("#category").val(ann_category);
			$("#btnModify").attr("data-no", ann_no);
			$("#btnDelete").attr("data-no", ann_no);
		});
	});
	
	// 게시글 수정 버튼
	$("#btnModify").click(function(){
		var url = "${contextPath}/movie/admin/modifyAnn";
		var ann_no = $(this).attr("data-no");
		var ann_title = $("#title").val();
		var ann_content = $("#content").val();
		var ann_category = $("#category").val();
		var sData = {
				"ann_no":ann_no,
				"ann_category":ann_category,
				"ann_title":ann_title,
				"ann_content":ann_content
		};
		$.post(url, sData, function(rData){
			if(rData == "true"){
				location.href = "${contextPath}/movie/admin/annList";
			}
		});
	});
	// 게시글 삭제 버튼
	$("#btnDelete").click(function() {
		var ann_no = $(this).attr("data-no");
		//console.log(ann_no);
		var url = "${contextPath}/movie/admin/deleteAnn";
		$.post(url, {"ann_no":ann_no}, function(rData){
			if(rData == "true"){
				location.href = "${contextPath}/movie/admin/annList";
			}
		});
		
	});
	// 페이지 번호를 눌렀을 때
	$(".page").click(function(e){
		e.preventDefault();
		var page = $(this).text();
		//console.log(page);
		location.href = "${contextPath}/movie/admin/annList?page=" + page;
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
           <a href="${contextPath}/movie/admin/annList" class="list-group-item list-group-item-action active">
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
            <input type="text" class="form-control" id="title"></input>
          </div>
          <div class="form-group">
            <label for="content" class="col-form-label">내용:</label>
            <textarea class="form-control" id="content" rows="8"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer custom-modal-footer">
      	<select id="category">
      			<option value="1">결제</option>
      			<option value="2">시설</option>
      			<option value="3">주차</option>
      	</select>
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
            <input type="text" class="form-control" id="ann_title" name="ann_title">
          </div>
          <div class="form-group">
            <label for="content" class="col-form-label">내용:</label>
            <textarea class="form-control" rows="8" id="ann_content" name="ann_content"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer custom-modal-footer">
      	<select name="ann_category" id="ann_category">
      		<option value="1">결제</option>
      		<option value="2">시설</option>
      		<option value="3">주차</option>
      	</select>
        <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close" id="btnClose">닫기</button>
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
              	<thead>
	                <tr>
	                  <th>번호</th>
	                  <th>제목</th>
	                  <th>등록일</th>
	                </tr>
                </thead>
                <c:forEach items="${list}"  var="annVo">
                <tbody id="articleList">
	                <tr>
	                  <td>${annVo.ann_no}</td>
	                  <td><a href="#" data-toggle="modal" data-target="#exampleModal" class="a_ann_title" data-no="${annVo.ann_no}">${annVo.ann_title}</a></td>
	                  <td>${annVo.ann_regdate}</td>
	                </tr>
	            </tbody>
	            </c:forEach>
              </table>
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
    <!-- ***** 영화 관리 페이지 끝 ***** -->
    
  </div>
  <!-- 메인 컴포넌트 끝 -->
<%@ include file="../include/footer.jspf" %>
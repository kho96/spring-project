<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<script>
$(document).ready(function() {
	$('.list-group > a').click(function(e){
		$('.list-group > a').removeClass('active');
		$(this).addClass('active');
	});
	
	var theater_name = "";
	$("#select_theater").change(function() {
		var select = $("#select_theater option:selected").val();
		console.log(select);
		
		if (select == "add_theater") {
			$("#add_theater").fadeIn(500);
		}
		theater_name = select;
	});
	
	$("#btnSend").click(function() {
		console.log("확인");
		$("#theater").text(select);
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
           <a href="${contextPath}/movie/admin/theater_management" class="list-group-item list-group-item-action active">
             상영관 관리
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
  <!-- 사이드바 끝 -->
  
  <div class="container">
<!-- 모달창 시작 -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content custom-modal">
      <div class="modal-header custom-modal-header">
        <h4 class="modal-title" id="exampleModalLabel">상영관</h4>
        <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-area">
          <form class="form-input" id="frmSearchTheater" action="#">
            <select id="select_theater" class="form-control">
              <option>울산 성남</option>
              <option value="add_theater">상영관 추가하기</option>
            </select>
            <input type="text" id="add_theater" style="display: none; margin-top: 15px" placeholder="추가할 상영관 이름을 입력하세요.">
          </form>
        </div>
      </div>
      <div class="modal-footer custom-modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        <button type="button" id="btnSend" class="btn custom-btn">확인</button>
      </div>
    </div>
  </div>
  </div>
  <!-- 모달창 끝 -->
  
    <!-- ***** 관리자 페이지 ***** -->
    <div class="row">
      <div class="col-12">
        <div class="page-content" style="padding-top: 5px">
        
          <!-- 영화 관리 시작 -->
          <div class="most-popular header-text">
            <div class="row">
              <div class="col-lg-12">

                <div class="heading-section">
                  <h4><em>상영관 관리</em></h4>
                </div>

                <div class="row">
                  <h4>영화 검색</h4>
                  <div class="form-area" style="margin-top:10px">
                    <form class="form-input" id="frmSearchMovieApi" action="#">
                        
					  <div class="row row-theater">
					    <div class="col-md-2">
                          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                          상영관 선택 / 추가
                          </button>
					    </div>
					    
					    <div class="col-md-10">
					      <input type="text" id="theater" placeholder="극장을 입력하세요.">
					    </div>
					  </div>
					  
					  <div class="row row-theater">
					    <div class="col-md-2">
					      <button class="btn btn-primary">영화 선택</button>
					    </div>
					    
					    <div class="col-md-10">
					      <input type="text" placeholder="영화를 선택하세요.">
					    </div>
					  </div>
					  
					  <div class="row row-theater">
					    <div class="col-md-2">
					      <button class="btn btn-primary">상영시간</button>
					    </div>
					    
					    <div class="col-md-10">
					      <input type="text" placeholder="상영시간을 입력하세요.">
					    </div>
					  </div>
					  
					  <div class="row row-theater" style="margin-left: 1px;">
					    <div class="col-md-2">
	                      <select class="form-control">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                          </select>
					    </div>
					    
					    <div class="col-md-2">
	                      <select class="form-control">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                          </select>
					    </div>
					  </div>
					  
					<!-- 좌석선택  -->
					  <div class="row">
               	      <div id="div-seat" style="margin-top: 30px; width: 100%;">
               	    	 <div class="heading-section">
	                    	<div><h4>좌석선택</h4></div>
	                    	<div style="text-align: right;"><!-- 좌석 상태 설명 -->
	                    		<span style="color: white; margin-right: 10px">□ : 선택가능</span>
	                    		<span style="color: red"> ▩ : 선택불가능</span>
	                    	</div>
	                  	  </div>
               	    	<table border="2; solid" id="table-seat"
               	    	style="width: 100%; color: white; text-align: center;">
               	    		<tr>
               	    			<td colspan="12"><h4>screen</h4></td>
               	    		</tr>
               	    		<c:forEach begin="1" end="7" var="w">
	                   			<tr>
	                   				<c:forEach begin="1" end="8" var="v">
	                   					<td style="font-size: x-large;">
	                   						<c:choose>
	                   							<c:when test="${v%3 eq 0}">
	                   								<a class="a-noseat" style="color: red" href="#">▩</a>
	                   							</c:when>
	                   							<c:otherwise>
	                   								<a class="a-seat" data-seat="${w}열 ${v}번"
	                   								data-check="false" href="#">□</a>
	                   							</c:otherwise>
	                   						</c:choose>
	                   					</td>
	                   				</c:forEach>	
	                   			</tr>
               	    		</c:forEach>	
                    
               	    	</table>
               	    	<div class="col-lg-12">
	                      <div class="main-button" style="text-align: center; margin-top: 25px">
	                        <a id="btn-payment" href="#">선택완료</a>
	                      </div>
	                    </div>
               	      </div>
               	      <!-- 좌석선택 끝  -->
               	    
					  </div>
                    </form>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
          <!-- 영화 관리 끝 -->
          
        </div>
      </div>
    </div>
    <!-- ***** 관리자 페이지 끝 ***** -->
    
  </div>
<%@ include file="../include/footer.jspf" %>
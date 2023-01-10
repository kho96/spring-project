<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jspf" %>
<script>
$(function() {
	// 공지사항 질문 마우스 이벤트
	$(".notice-title").mouseenter(function() {
		$(this).css("color", "#e75e8d");
	});
	$(".notice-title").mouseout(function() {
		$(this).css("color", "#fff");
	});
	
	// 공지사항 클릭 이벤트
	$(".notice-title").click(function() {
		if ($(this).next().css("display") == "none") {
			$(".notice-content").slideUp(300);
			$(this).next().slideDown(300);
		} else {
			$(".notice-content").slideUp(300);
		}
	}); // 공지사항 끝
});
</script>
<div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
        	<a href="support"><i class="fa fa-reply fa-2x" aria-hidden="true"></i></a>
        	<!--***** 공지사항 시작  *****-->
			<div class="live-stream" style="margin-top: 35px">
              	<div class="heading-section row">
		            <div class="col-lg-8">
	              		<h4>공지사항</h4>
	              	</div>	
	                <div class="col-lg-4 main-button" style="text-align: right">
	                	<div class="row">
		                	<div class="col-md-8">
		                		<input type="text" class="form-control" style="width: 100%; margin-top: 5px"/>
		                	</div>
		                	<div class="col-md-4" style="text-align: center">
		                		<a href="#"><i class="fa fa-search fa-lg" aria-hidden="true"></i></a>
		                	</div>
	                	</div>
	                </div>
	              	
	            </div>
	            
	            <div class="row">
	            	<div class="col-lg-12">
	            		<c:forEach begin="1" end="11" var="i">
	            			<p class="notice-title" style="color: #fff; font-size: x-large;
	            				margin: 10px">공지사항${i} 입니다.</p>
	            			<p class="notice-content" style="background-color: #aaa; 
	            				color: black; font-size: large; margin: 10px; display: none">공지 내용입니다.</p>
	            		</c:forEach>	
	            	</div>
	            </div>
	         </div> 
	         <!--***** 공지사항 끝  *****-->
        </div>
      </div>
    </div>
</div>
<%@include file="../include/footer.jspf" %>
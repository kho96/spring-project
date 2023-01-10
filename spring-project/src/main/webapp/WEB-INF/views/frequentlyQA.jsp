<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jspf" %>
<script>
$(function() {
	// 자주하는 질문 마우스 이벤트(enter, out)
	$(".frequentlyQ").mouseenter(function() {
		$(this).css("color", "#e75e8d");
	});
	$(".frequentlyQ").mouseout(function() {
		$(this).css("color", "#fff");
	});
	
	// 자주하는 질문 클릭 이벤트
	$(".frequentlyQ").click(function() {
		if ($(this).next().css("display") == "none") {
			$(".frequentlyA").slideUp(300);
			$(this).next().slideDown(300);
		} else {
			$(".frequentlyA").slideUp(300);
		}
	}); // 자주하는 질문 끝
});
</script>
<div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
        	
        	<a href="support"><i class="fa fa-reply fa-2x" aria-hidden="true"></i></a>
        	<!--***** 자주하는 질문 시작  *****-->
			<div class="live-stream" style="margin-top: 35px">
              	<div class="heading-section row">
		            <div class="col-lg-8">
	              		<h4>자주하는 질문</h4>
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
	            		<c:forEach begin="1" end="8" var="i">
	            			<p class="frequentlyQ" style="color: #fff; font-size: x-large;
	            				margin: 10px">Q${i}. 질문${i} 입니다.</p>
	            			<p class="frequentlyA" style="background-color: #aaa; 
	            				color: black; font-size: large; margin: 10px; display: none">A) 답변${i} 입니다.</p>
	            		</c:forEach>	
	            	</div>
	            </div>
	         </div> 
	         <!--***** 자주하는 질문 끝  *****-->
        </div>
      </div>
    </div>
</div>
<%@include file="../include/footer.jspf" %>
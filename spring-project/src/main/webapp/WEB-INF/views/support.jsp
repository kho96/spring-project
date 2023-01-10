<%@page import="com.kh.project.util.MovieShuffle"%>
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
	
	// Q&A 마우스 이벤트
	$(".question").mouseenter(function() {
		$(this).css("color", "#e75e8d");
	});
	$(".question").mouseout(function() {
		$(this).css("color", "#fff");
	});
	
	// Q&A 클릭 이벤트
	$(".question").click(function() {
		if ($(this).next().css("display") == "none") {
			$(".answer").slideUp(300);
			$(this).next().slideDown(300);
		} else {
			$(".answer").slideUp(300);
		}
	});
	
	
});
</script>
<div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
        
        	<!--***** 공지사항 시작  *****-->
			<div class="live-stream" style="margin-top: 0px">
              	<div class="heading-section row">
		            <div class="col-lg-8">
	              		<h4>공지사항</h4>
	              	</div>	
	                <div class="col-lg-4 main-button" style="text-align: right">
	                	<a href="support?page=notice"><i class="fa fa-ellipsis-h fa-lg" aria-hidden="true"></i></a>
	                </div>
	              	
	            </div>
	            
	            <div class="row">
	            	<div class="col-lg-12">
	            		<c:forEach begin="1" end="5" var="i">
	            			<p class="notice-title" style="color: #fff; font-size: x-large;
	            				margin: 10px">공지사항${i} 입니다.</p>
	            			<p class="notice-content" style="background-color: #aaa; 
	            				color: black; font-size: large; margin: 10px; display: none">공지 내용입니다.</p>
	            		</c:forEach>	
	            	</div>
	            </div>
	         </div> 
	         <!--***** 공지사항 끝  *****-->
	         
	        <!--***** 자주하는 질문 시작  *****-->
			<div class="live-stream" style="margin-top: 35px">
              	<div class="heading-section row">
		            <div class="col-lg-8">
	              		<h4>자주하는 질문</h4>
	              	</div>	
	                <div class="col-lg-4 main-button" style="text-align: right">
	                	<a href="support?page=frequentlyQ"><i class="fa fa-ellipsis-h fa-lg" aria-hidden="true"></i></a>
	                </div>
	              	
	            </div>
	            
	            <div class="row">
	            	<div class="col-lg-12">
	            		<c:forEach begin="1" end="5" var="i">
	            			<p class="frequentlyQ" style="color: #fff; font-size: x-large;
	            				margin: 10px">Q${i}. 질문${i} 입니다.</p>
	            			<p class="frequentlyA" style="background-color: #aaa; 
	            				color: black; font-size: large; margin: 10px; display: none">A) 답변${i} 입니다.</p>
	            		</c:forEach>	
	            	</div>
	            </div>
	         </div> 
	         <!--***** 자주하는 질문 끝  *****-->
	         
	        <!--***** Q&A 시작  *****--> 
			<div class="live-stream" style="margin-top: 35px">
              	<div class="heading-section row">
		            <div class="col-lg-8">
	              		<h4>Q<span style="color: #fff; font-size: 34px">&</span>A</h4>
	              	</div>	
	                <div class="col-lg-4 main-button" style="text-align: right">
	                	<a href="support?page=qa-board"><i class="fa fa-ellipsis-h fa-lg" aria-hidden="true"></i></a>
	                </div>
	              	
	            </div>
	            
	            <div class="row">
	            	<div class="col-lg-12">
	            		<c:forEach begin="1" end="5" var="i">
	            			<p class="question" style="color: #fff; font-size: x-large;
	            				margin: 10px">Q${i}. 유저질문${i} 입니다. 
	            				<c:choose>
	            					<c:when test="${i eq 3}">
	            						<span style="font-size: x-large; margin-left: 20px">[답변 완료]</span>
	            					</c:when>
	            					<c:otherwise>
	            						<span style="font-size: x-large; margin-left: 20px">[대기중]</span>
	            					</c:otherwise>
	            				</c:choose>
            				</p>
	            			<div class="answer" style="background-color: #aaa; 
	            				color: black; font-size: large; margin: 10px; display: none">
	            				<c:choose>
		            				<c:when test="${i eq 3}">
	            						<b>작성자 : 김아무개${i}</b><br>
	            						어쩌고 저쩌고 질문이 이렇궁 저렇궁
	            						<hr>
	            						<b>[답변] xxxx-xx-xx</b><br>
	            						그래서 어쩌라고요.
	            					</c:when>
	            					<c:otherwise>
	            						<b>작성자 : 김아무개${i}</b><br>
	            						어쩌고 저쩌고 질문이 이렇궁 저렇궁
	            					</c:otherwise>
            					</c:choose>
            				</div>
	            		</c:forEach>	
	            	</div>
	            </div>
	         </div>
	         <!--***** Q&A 끝  *****-->
	          
	   </div>
     </div>
   </div>
</div>          
<%@include file="../include/footer.jspf" %>
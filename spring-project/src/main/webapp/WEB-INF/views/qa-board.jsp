<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jspf" %>
<script>
$(function() {
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
	
	// 질문하기 클릭
	$("#a_wirte").click(function(e) {
		e.preventDefault();
		// 모달 기본세팅 초기화
		// 문의 modal setting
		$(".modal-title").text("문의하기");
		$(".modal-body textarea").val("");
		$(".modal-footer h4").text("제출하시겠습니까?");
		$(".btn-success").text("제출");
		$("#btn-modal").trigger("click");
	});
	
	// 수정하기
	$(".btn-modify").click(function(e) {
		// 문의 modal setting
		$(".modal-title").text("수정하기");
		$(".modal-body textarea").val("수정하기 전 내용 입니다.");
		$(".modal-footer h4").text("수정하시겠습니까?");
		$(".btn-success").text("수정");
		//모달 띄우기
		$("#btn-modal").trigger("click");
	});
	// 삭제하기
	$(".btn-delete").click(function(e) {
		var result = confirm("삭제하시겠습니까?");
		if(result) {
			alert("삭제완료");
		} 
	});
});
</script>
<div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
        	<div style=" float: left;">
        		<a href="support"><i class="fa fa-reply fa-2x" aria-hidden="true"></i></a>
        	</div>
        	<div style="float: right; text-align: right">	
        		<!-- modal, page... 뭐가 편하지....  -->
        		
       			<a id="a_wirte" href="#"><i class="fa fa-pencil fa-2x" aria-hidden="true"></i></a>
       		</div>	
       		
        	<!--***** Q&A 시작  *****--> 
			<div class="live-stream" style="margin-top: 50px">
              	<div class="heading-section row">
		            <div class="col-lg-8">
	              		<h4>Q<span style="color: #fff; font-size: 34px">&</span>A</h4>
	              	</div>	
	                <div class="col-lg-4 main-button" style="text-align: right">
	                	<div class="row">
		                	<div class="dropdown col-md-3" style="text-align: left; margin-top: 5px">
		                		<!-- 드롭다운 넣어 말아,.. 콤보박스?  -->
		                	</div>	
		                	<div class="col-md-6">
		                		<input type="text" class="form-control" style="width: 100%; margin-top: 5px"/>
		                	</div>
		                	<div class="col-md-3" style="text-align: center">
		                		<a href="#"><i class="fa fa-search fa-lg" aria-hidden="true"></i></a>
		                	</div>
	                	</div>
	                </div>
	              	
	            </div>
	            
	            <div class="row">
	            	<div class="col-lg-12">
	            		<c:forEach begin="1" end="14" var="i">
	            			<p class="question" style="color: #fff; font-size: x-large;
	            				margin: 10px">Q${i}. 유저질문${i} 입니다. 
	            				<c:choose>
	            					<c:when test="${i%3 eq 0}">
	            						<span style="font-size: x-large; margin-left: 20px">[답변 완료]</span>
	            					</c:when>
	            					<c:otherwise>
	            						<span style="font-size: x-large; color: #fff; margin-left: 20px">[대기중]</span>
	            					</c:otherwise>
	            				</c:choose>
            					<button type="button" data-q_no="${i}" 
            						class="btn btn-sm btn-success btn-modify">수정</button>
            					<button type="button" data-q_no="${i}"
            						 class="btn btn-sm btn-danger btn-delete">삭제</button>
            				</p>
	            			<div class="answer" style="background-color: #aaa; 
	            				color: black; font-size: large; margin: 10px; display: none">
	            				<c:choose>
		            				<c:when test="${i%3 eq 0}">
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
	        
	       <!-- 모달 시작  -->
           <button id="btn-modal" type="button" style="display: none" data-toggle="modal" data-target="#myModal">
			  modal
		   </button>
	        
	        <!-- The Modal -->
			<div class="modal" id="myModal">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			      		<h4 class="modal-title" style="color: black">문의하기</h4>
			      </div>
			
			      <!-- Modal body -->
			      <div class="modal-body" style="font-size: large;">
			      		<textarea rows="5" cols="50" placeholder="문의할 내용을 입력하세요."></textarea> 
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
				      	<h4 style="color: black; margin-right: 130px">제출하시겠습니까? </h4>
				      	<button type="button" class="btn btn-success" data-dismiss="modal">제출</button>
				        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			      </div>
			
			    </div>
			  </div>
			</div> <!-- 모달 끝  -->
			
        </div>
      </div>
    </div>
</div>
<%@include file="../include/footer.jspf" %>
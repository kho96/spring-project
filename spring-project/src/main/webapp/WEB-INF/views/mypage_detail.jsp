<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<script>
$(document).ready(function() {
	$("#btnRegister").click(function() {
		console.log("등록버튼");
	});
	
	if ($("#userpw").val().trim() != $("#userpw2").val().trim()) {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	
	// 삭제 버튼 클릭시
	$("#btnDel").click(function() {
		e.preventDefault();
		$("#frmRegister").attr("action", "delete").submit();
	});
	
	$("#btnCheckDup").click(function() {
		var userid = $("#userid").val();
		console.log("userid:" + userid);
		if (userid.trim() == "") {
			alert("아이디를 입력해주세요").
			$("#userid").focus();
			return;
		}
		var sData = {
				"userid" : userid
		};
		var url = "/movie/checkDupId";
		$.post(url, sData, function(rData) {
			console.log("rData:" + rData);
			var checkResult = $("#checkResult");
			checkResult.removeClass();
			checkResult.hide();
			if (parseInt(rData) == 0) {
				checkResult.addClass("alert alert-success");
				checkResult.text("사용할 수 있는 아이디");
				$("#btnCheckDup").attr("data-id", userid);
			} else {
				checkResult.addClass("alert alert-danger");
				checkResult.text("사용할 수 없는 아이디");
				$("#btnCheckDup").removeAttr("data-id");
			}
			checkResult.slideDown(1000);
		});
	});
});

</script>
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

          <div class="row">
            <div class="col-lg-12">
              <div class="top-streamers" style="max-height:700px;">
                <div class="heading-section">
                  <h4>회원상세정보</h4>
                </div>
                <form class="user" id="frmRegister" method="post"
                            	action="modify">
                   	<input type="hidden" name="userpic" value="${vo.userpic}">
                   	<input type="hidden" name="usergrade" value="${vo.usergrade}">
                   	<input type="hidden" name="userno" value="${vo.user_no}">

                <ul>
                  <li>  
                   <div class="form-group row">
                         <div class="col-sm-4" style="margin-top:10px">
                               <label class="label">아이디&nbsp&nbsp&nbsp</label>
                               <input type="text" id="userid" value="${vo.userid}"
                                     placeholder="아이디" name="userid" readonly>
                         </div>
                      </div>
                  </li>
                  <li>
                    <div class="form-group row">
                    	<div>
                        </div>
                        <div class="col-sm-12">
                    		<label class="label">비밀번호</label>
                             <input type="password" value="${vo.userpw}"
                                 id="userpw" name="userpw" placeholder="패스워드">
                              <input type="password" 
                                 id="userpw2" name="userpw2" placeholder="패스워드 확인">
                        </div>
                             <div class="col-sm-3">
                             
                           </div>
                     </div>   
                  </li>
                  <li>   
                     <label class="label">이름&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
					 <input type="text" value="${vo.username}" id="username" name="username" placeholder="이름"> <br>
                  </li>
                  <li>
				      <label class="label">생년월일</label>
				      <select name="year">
				        <option value="">-- 선택 --</option>
				        <c:forEach var="year" begin="1990" end="2010" step="1" varStatus="st">
				       	 	<option value="${st.index}" >${st.index}</option>
				        </c:forEach>
				      </select>
				      <select name="month">
				      <option value="">-- 선택 --</option>
				        <c:forEach var="year" begin="1" end="12" step="1" varStatus="st">
				       	 	<option value="${st.index}">${st.index}</option>
				        </c:forEach>
				      </select>
				      <select name="day">
				        <option value="">-- 선택 --</option>
				        <c:forEach var="year" begin="1" end="31" step="1" varStatus="st">
				       	 	<option value="${st.index}">${st.index}</option>
				        </c:forEach>
				      </select>
     				 </li>
      					<li> 
     						 <label class="label">이메일&nbsp&nbsp&nbsp</label>
     						 <input type="email" id="useremail" value="${useremail}" name="useremail" placeholder="email@gmail.com">
     					</li>
     						 <div class="main-border-button" style="padding-left:500px">
                        		<button type="submit" id="btnMod">수정</button>
                        		<button type="button" id="btnDel" onclick="location.href='${contextpath}/movie/delete?userid=${vo.userid}'">삭제</button>
                   			 </div>				
				      	</ul>
				      	
				    	</form>
	         		</div>
				</div>
 			</div>
		</div>
   </div>
  </div>
 </div>
<%@ include file="../include/footer.jspf"%>
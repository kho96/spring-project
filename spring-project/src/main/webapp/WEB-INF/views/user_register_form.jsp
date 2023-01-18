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
                  <h4>회원가입</h4>
                </div>
                <form class="user" id="frmRegister" method="post"
                            	action="register">
                <ul>
                  <li>  
                   <div class="form-group row">
                         <div class="col-sm-4" style="margin-top:10px">
                               <label class="label">아이디&nbsp&nbsp&nbsp</label>
                               <input type="text" id="userid"
                                     placeholder="아이디" name="userid">
                         </div>
                         <div class="col-sm-6">
                               <button type="button" style="background-color:#e75e8d" id="btnCheckDup">아이디 중복 체크</button>
                         </div>
                         <div class="alert alert-success"
                          style="display:none" id="checkResult">
                                	사용할수 있는 아이디
                         </div>
                      </div>
                  </li>
                  <li>
                    <div class="form-group row">
                    	<div>
                        </div>
                        <div class="col-sm-12">
                    		<label class="label">비밀번호</label>
                             <input type="password"
                                 id="userpw" name="userpw" placeholder="패스워드">
                              <input type="password" 
                                 id="userpw2" name="userpw2" placeholder="패스워드 확인">
                        </div>
                             <div class="col-sm-3">
                             
                           </div>
                     </div>   
                     <!-- 비밀번호 일치 불일치 따라message출력 -->          
                           <div id=userpwCheck>message</div>
                  </li>
                  <li>   
                     <label class="label">이름&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
					 <input type="text" id="username" name="username" placeholder="이름"> <br>
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
     						 <input type="email" id="useremail" name="useremail" placeholder="email@gmail.com">
     					</li>
     					<li>
     					<div class="row">
                                	<div class="col-sm-11 ml-3 mb-3 mb-sm-0 custom-file">
                                	<label class="label" for="customFile">프로필사진</label>
                                		<input type="file" class="custom-file-input" 
                                			id="customFile" name="file">
                                	</div>
     						 </div>
     					</li>
     						 <div class="main-border-button" style="padding-left:500px">
                        	<button type="submit" id="btnRegister">회원가입</button>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

          <div class="row">
            <div class="col-lg-12">
              <div class="top-streamers">
                <div class="heading-section">
                  <h4>회원가입</h4>
                </div>
                <form class="user" id="frmRegister" method="post"
                            	action="login">
                <ul>
                  <li>  
                   <div class="form-group row">
                         <div class="col-sm-4" style="margin-top:10px">
                               <label class="label">아이디&nbsp&nbsp&nbsp</label>
                               <input type="text" id="userid"
                                     placeholder="아이디" name="userid">
                         </div>
                         <div class="col-sm-6">
                               <button type="button" style="background-color:#e75e8d" id="btnChecked">아이디 중복 체크</button>
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
                           <div style="display:none" id=userpwCheck>비밀번호가 다릅니다.</div>
                  </li>
                  <li>   
                     <label class="label">이름&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
					 <input type="text" name="name" placeholder="이름"> <br>
                  </li>
                  <li>
				      <label class="label">생년월일</label>
				      <select name="year">
				        <option value="">-- 선택 --</option>
				        <c:forEach var="year" begin="1990" end="2010" step="1" varStatus="st">
				       	 	<option value="${st.index}">${st.index}</option>
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
     						 <input type="email" name="email" placeholder="email@gmail.com">
     						 
     						 <div class="main-border-button" style="padding-left:500px;">
                        <button type="submit" id="btnRegister">회원가입</button>
                   			 </div>
      					</li>
      					
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
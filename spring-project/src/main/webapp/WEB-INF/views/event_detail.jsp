<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<c:set var="event" value="<%=request.getParameter(\"event\")%>"/> 
<c:choose>
	<c:when test="${event eq 'join'}">
		 <div class="container">
		    <div class="row">
		      <div class="col-lg-12">
		        <div class="page-content">
		
		          <!-- ***** Banner Start ***** -->
		          <div class="row">
		            <div class="col-lg-12">
		              <div class="main-profile ">
		                <a id="a_wirte" href="${contextPath}/movie/event">
						<i class="fa fa-reply fa-2x" aria-hidden="true"></i></a>
		                <div class="row">
		                 <div class="heading-section">
		                 <h5>[회원가입] 인증하고 할인받자!</h5><br>
		                 </div>
		                <img src="../assets/images/eventJoin.png" alt="eventJoin">
		                </div>
		              </div>
		            </div>
		          </div>
		          <!-- ***** Banner End ***** -->
		          
			      </div>
			    </div>
			  </div>
		  </div>
	</c:when>
	
	<c:when test="${event eq 'parking'}">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-content">

						<!-- ***** Banner Start ***** -->
						<div class="row">
							<div class="col-lg-12">
								<div class="main-profile ">
									<a id="a_wirte" href="${contextPath}/movie/event">
									<i class="fa fa-reply fa-2x" aria-hidden="true"></i></a>
									<div class="row">
										<div class="heading-section">
											<h5>[전국] 아바타도 끄덕없는 무료 주차 즐겨봐~</h5>
											<br>
										</div>
										<img src="../assets/images/eventParking.png" alt="eventPaking">
									</div>
								</div>
							</div>
						</div>
						<!-- ***** Banner End ***** -->
						
					</div>
				</div>
			</div>
		</div>
	</c:when>
	
	<c:when test="${event eq 'students'}">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-content">

						<!-- ***** Banner Start ***** -->
						<div class="row">
							<div class="col-lg-12">
								<div class="main-profile ">
									<a id="a_wirte" href="${contextPath}/movie/event">
									<i class="fa fa-reply fa-2x" aria-hidden="true"></i></a>
									<div class="row">
										<div class="heading-section">
											<h5>[전국] 학생들 모두모두 모여라~♪</h5>
											<br>
										</div>
										<img src="../assets/images/eventStudents.png" alt="eventStudents">
									</div>
								</div>
							</div>
						</div>
						<!-- ***** Banner End ***** -->
					</div>
				</div>
			</div>
		</div>
	</c:when>
	
	<c:when test="${event eq 'welcome'}">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-content">

						<!-- ***** Banner Start ***** -->
						<div class="row">
							<div class="col-lg-12">
								<div class="main-profile ">
									<a id="a_wirte" href="${contextPath}/movie/event">
									<i class="fa fa-reply fa-2x" aria-hidden="true"></i></a>
									<div class="row">
										<div class="heading-section">
											<h5>[전국] 다시 만나서 반가워♥</h5>
											<br>
										</div>
										<img src="../assets/images/eventWelcome.png" alt="eventWelcome">
									</div>
								</div>
							</div>
						</div>
						<!-- ***** Banner End ***** -->
					</div>
				</div>
			</div>
		</div>
	</c:when>
	
	<c:when test="${event eq 'zero'}">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-content">

						<!-- ***** Banner Start ***** -->
						<div class="row">
							<div class="col-lg-12">
								<div class="main-profile ">
									<a id="a_wirte" href="${contextPath}/movie/event">
									<i class="fa fa-reply fa-2x" aria-hidden="true"></i></a>
									<div class="row">
										<div class="heading-section">
											<h5>[전국] 환경운동에 동참하고 할인도 누리자 !</h5>
											<br>
										</div>
										<img src="../assets/images/eventZero.png" alt="eventZero">
									</div>
								</div>
							</div>
						</div>
						<!-- ***** Banner End ***** -->
					</div>
				</div>
			</div>
		</div>
	</c:when>
</c:choose>
<%@ include file="../include/footer.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf"%>
<script>
	$(document).ready(function() {
	});
</script>

<!-- ***** Details Start ***** -->
<div class="page-content">
	<div class="game-details">
		<div class="row">
			<div class="col-lg-12">
				<h2>"${userVo.username}"님의 Mypage</h2>
			</div>
			<div class="col-lg-12">
				<div class="top-downloaded">
					<div class="heading-section" style="margin-top: 50px">
						<div class="mypage">
							<div class="profile">
								<img id="profileimage" src="${userVo.userpic}"
									style="max-width: 200px; margin-right: 50px; margin-left: 50px; float: left; width: 135px; height: 135px">
							</div>
							<div class="profile-info">
								<strong
									style="color: #ec6090; font-size: 34px; text-decoration: none; margin-bottom: 30px;">"${userVo.username}"님</strong>
								<em style="color: #fff; font-weight: 700; margin-right: 20px">아이디:"${userVo.userid}"</em>
								<span style="color: #fff; font-weight: 700; margin-right: 20px">회원번호:"${userVo.user_no}"</span>
								<a href="mypage_detail" id="mypage_detail"
									style="border-radius: 25px; color: #fff; background-color: #e75e8d;">내
									상세정보</a>
							</div>
							<hr style="background-color: #fff; height: 2px">
							<div>
								<h6>
									"${userVo.username}"님은 <span
										style="margin-right: 5px; color: yellow; font-size: 30px">"${userVo.usergrade}"</span>입니다
								</h6>
							</div>
							<div class="benefit" style="margin-top: 100px">
								<div class="row">
									<div class="col-lg-4">
										<h5 style="margin-bottom: 10px; text-align: center">MY
											MOVIE</h5>
										<ul>
											<li><a href="#">나의 예매내역</a><span
												style="margin-left: 250px">${rCount}개</span></li>
											<li><a href="#">내가 본 영화</a><span
												style="margin-left: 260px">${mCount}개</span></li>
										</ul>
									</div>
									<div class="col-lg-4">
										<h5 style="margin-bottom: 10px; text-align: center">MY
											POINT</h5>
										<ul>
											<li style="color: #fff; font-size: 20px">내 포인트:<span
												style="margin-left: 250px; font-size: 13px">"${userVo.userpoint}"</span></li>
										</ul>
										<div>
											<h5 style="margin-bottom: 10px; text-align: center">등급점수</h5>
											<ul>
												<li style="color: #fff; font-size: 20px">등급점수:<span
													style="margin-left: 250px; font-size: 13px">10000</span></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ***** Featured Games End ***** -->

</body>
</html>
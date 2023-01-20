<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<style>
img {
	width: 90%;
}
</style>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="page-content">

				<!-- ***** Banner Start ***** -->
				<div class="row">
					<div class="col-lg-12">
						<div class="main-profile">
							<div class="row">
								<div class="col-lg-5" style="margin-left: 350px">

									<ul>
										<li onclick="kakaoLogin();"><img
											src="../assets/images/logoKakaoLogins.png"
											style="margin-left: 20px"><a href="javascript:void(0)">
										</a></li>
										<li onclick="kakaoLogout();"><img
											src="../assets/images/logoKakaoLogout.png"
											style="margin-left: 20px"><a href="javascript:void(0)">
										</a></li>
									</ul>
									<!-- 카카오 스크립트 -->
									<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
									<script>
										Kakao
												.init('c20a7c7c09a19e1232dce0affc2fa35c'); //발급받은 키 중 javascript키를 사용해준다.
										console.log(Kakao.isInitialized()); // sdk초기화여부판단
										//카카오로그인
										function kakaoLogin() {
											Kakao.Auth.login({
														success : function(response) {
															Kakao.API.request({
																		url : '/v2/user/me',
																		success : function(response) {
																			console.log(response)
																			//location.href = "booking";

																		},
																		fail : function(error) {
																			console.log("error,",error)
																		},
																	})
														},
														fail : function(error) {
															console.log(error)
														},
													})
										}
										//카카오로그아웃  
										function kakaoLogout() {

											if (Kakao.Auth.getAccessToken()) {
												Kakao.API.request({
															url : '/v1/user/unlink',
															success : function(response) {
																location.href = "login";
															},
															fail : function(error) {
																console.log(error)
															},
														})
												Kakao.Auth.setAccessToken(undefined)

											}
										}
									</script>


								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jspf"%>
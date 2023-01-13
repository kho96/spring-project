<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jspf" %>
<script>
 $(document).ready(function(){
	  $("#a_more").hide();
	  var story = $(".story").text();
	  var cut_story = story.substring(0, 150) + "...";
	  console.log(cut_story);
	  
	  if(story.length >= 150){
		  $("#a_more").css("color", "#ec6090").show();
		  $("#content").html(cut_story);
		  getBtn();
	  } else{
		  $("#content").html(story);
	  }
	  
	  function getBtn(){
		  $("#a_more").click(function(e){
		  var text = $("#a_more").text(); 
			  console.log(text)
			  e.preventDefault();
			  if(text == "더 보기"){
			  $("#content").html(story);
				  $(this).text("접기");
			  } else if(text == "접기"){
				  $("#content").html(cut_story);
				  $(this).text("더 보기");
			  }
		  }); 
	  } 
});
</script>

  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

          <!-- ***** Banner Start ***** -->
          <div class="row">
            <div class="col-lg-12">
              <div class="main-profile ">
                <div class="row">
                  <div class="col-lg-4">
                    <img src="/assets/images/mov03.jpg" alt="" style="border-radius: 23px;">
                  </div>
                  <div class="col-lg-8">
                    <div class="main-info header-text">
                      <span>현재상영중</span><!--상영 예정작: <span>예매 중</span><span>d-10</span>  -->
                      <h2>써니</h2><br>
                      <h6>감독  강형철</h6>
                      <h6>장르  코미디, 드라마</h6>
                      <h6>국가  대한민국</h6>
                      <h6>등급  15세</h6>
                      <h6>개봉  2011.05.04</h6>
                      <h6>타입  2D</h6>
                      <h6>러닝타임  124분</h6>
                      <h6>배급사  CJ E&M Pictures</h6><br>
                      <h6>7공주 써니의 멤버였던 주인공 나미가 어른이 되어 옛 친구들을 찾아 나서는 이야기와, 어릴 적 나미가 7공주 써니의 멤버였을 때의 이야기를 복합적으로 다루고 있다.</h6>
                      <div class="main-border-button">
                        <a href="booking">예매하기</a> <!-- 상영 예정작: 날짜에 따라 없을 수도.. -->
                      </div> <br>
                      <div class="col-lg-8">
                      	<a  href="#btnStory"><span>줄거리</span></a>
                      	<a href="#btnStillCut"><span>스틸컷</span></a>
                      	<a href="#btnProducer"><span>감독 및 출연진</span></a>
                      	<a href="#btnReview"><span>리뷰</span></a>
	                 </div>
                  </div> 
                </div>
                <!-- 줄거리 시작 -->
                <div class="row"  id="btnStory">
                  <div class="col-lg-12">
                    <div class="clips">
                      <div class="row">
                        <div class="col-lg-12">
                          <div class="heading-section">
                            <h4><em>줄거리</em></h4>
                          </div>
                        </div>
                        <div class="col-lg-12 story"> <!-- div -->
                            <h5 id="content">2010년[5], 잘나가는 사업가 남편과 고등학생 딸을 둔 주부 임나미. 남부러울 것 하나 없는 화려한 인생이지만, 그녀는 자신의 삶에 2%의 무언가가 부족하다고 생각했다. 그러던 어느 날, 친정어머니 문병차 병원에 들렀다가 '하춘화' 라는 이름이 새겨진 병실을 발견했다. 병실에 입원한 춘화는 바로 나미의 고등학교 시절 절친한 친구. 학창시절만 해도 대장 노릇을 톡톡히 하던 그녀였지만, 성인이 된 지금은 폐암 말기로 길어야 2개월밖에 못 사는 상황이었다. 춘화는 "세상을 떠나기 전, 흩어진 친구들을 다시 만나는 게 소원"이라고 했고, 나미는 그녀의 소원대로 흥신소를 동원해 연락이 끊긴 친구들을 찾아다니는 사이, 까맣게 잊고 있던 25년 전의 과거를 떠올린다.

1986년, 전라남도 보성군 벌교읍의 새벌교고등학교에서 전학을 온 18살 임나미. 하지만 극도의 긴장감과 툭하면 터져나오는 전라도 사투리 때문에 첫날부터 날라리들의 놀림감이 되었다. 바로 그때 이런 자신을 반갑게 맞아주는 친구가 하나 있었으니, 그 친구가 바로 춘화. 이후 춘화의 소개로 그녀의 패거리 멤버들을 소개받는다. 욕쟁이 진희, 못난이 장미, 왈가닥 금옥, 4차원 복희, 얼음공주 수지까지. 경쟁써클 '소녀시대' 와의 맞짱 대결에서 할머니께 전수받은 사투리 욕 신공[6][7]으로 상대방을 단숨에 KO시키는 대활약을 펼쳤다. 이때부터 다른 친구들은 모두 나미를 열렬히 반겼지만 유독 수지만큼은 나미를 철저하게 경멸했다.

하지만 곧 수지하고도 오해를 푼 뒤부터는 전보다 훨씬 더 친구들이랑 가까워졌고, 다같이 학교 축제에 선보일 학예회 무대를 연습하며 즐거운 시간을 보내고 있었다. 그러나 축제 당일, 뜻밖의 사고가 터지는 바람에 무대 근처에도 가지 못했고, 모든 멤버들이 각기 다른 곳으로 흩어지고 만 것이다. 그리고 시간이 흘러 삶에 치이느라 서로를 새까맣게 잊은 것이었다.</h5>
                          </div> <!-- div -->
                        </div>
                        <div class="col-lg-12 col-sm-6">
                        	<h6><a href="#" id="a_more">더 보기</a></h6>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** 줄거리 끝 ***** -->
          
          <!-- 스틸컷 시작-->
          <div class="other-games"  id="btnStillCut">
	          <div class="row">
	                  <div class="col-lg-12">
	                      <div class="row">
	                        <div class="col-lg-12">
	                          <div class="heading-section">
	                            <h4><em style="margin-right: 980px">스틸컷</em><a href="#" style="color:#ec6090">...</a></h4>
	                          </div>
	                        </div>
<!-- 	                        <div class="col-lg-12"> -->
		                        <div class="owl-features owl-carousel">
		                  				<div class="item"><!-- 스틸컷 시작 -->
		                    				<div class="thumb">
												<img src="/assets/images/mov01.jpg"/>
		                    				</div>
										</div><!-- 스틸컷 끝 -->
	                		</div>
	                        <div class="col-lg-12">
<!-- 	                          <div class="main-button"> -->
<!-- 	                            <a href="#">Load More Clips</a> -->
								<br>
	                          </div>
	                        </div>
	                      </div>
	                  </div>
	                </div>
          <!-- 스킬컷 끝 -->
          
          
          <!-- ***** 출연진 정보 ***** -->
          <div class="other-games"  id="btnProducer">
            <div class="row">
              <div class="col-lg-12">
                <div class="heading-section">
                  <h4><em style="margin-right: 865px">감독 및 출연진</em><a href="#" style="color:#ec6090">...</a></h4>
                </div>
              </div>
              <div class="col-lg-4"> <!-- 출연진 정보 시작 -->
                <div class="item">
                  <img src="/assets/images/game-01.jpg" alt="" class="templatemo-item">
                  <h6>강형철</h6><span>감독</span>
                </div>
              </div> <!-- 출연진 정보 끝 -->
              <div class="col-lg-4">
                <div class="item">
                  <img src="/assets/images/game-01.jpg" alt="" class="templatemo-item">
                  <h6>강형철</h6><span>감독</span>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="item">
                  <img src="/assets/images/game-01.jpg" alt="" class="templatemo-item">
                  <h6>강형철</h6><span>감독</span>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** 출연진 끝 ***** -->
          
          <!-- ***** 리뷰 시작 ***** -->
          <div class="other-games" id="btnReview">
            <div class="row">
              <div class="col-lg-12">
                <div class="heading-section">
                  <h4><em style="margin-right: 1015px">리뷰</em><a href="#" style="color:#ec6090">...</a></h4>
                </div>
              </div> 
              <div class="col-lg-6"><!-- 리뷰 시작 -->
                <div class="item">
                  <img src="/assets/images/game-01.jpg" alt="" class="templatemo-item">
                  <h6>Dota 2</h6><br>
                  <span>일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육</span> <!-- 45자 이내로 쪼개기 사용..? -->
                  <span>일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육</span>
                  <ul>
                    <li><i class="fa fa-star"></i> 4.8</li>
                    <li><i class="fa fa-download"></i> 2.3M</li>
                  </ul>
                </div>
              </div><!-- 리뷰 끝 -->
              <div class="col-lg-6">
                <div class="item">
                  <img src="/assets/images/game-02.jpg" alt="" class="templatemo-item">
                  <h4>Dota 2</h4><span>Sandbox</span>
                  <ul>
                    <li><i class="fa fa-star"></i> 4.8</li>
                    <li><i class="fa fa-download"></i> 2.3M</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** 리뷰 끝 ***** -->
          
        </div>
      </div>
    </div>
  </div>
  
  <%@include file="../include/footer.jspf" %>
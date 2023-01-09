<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
  <!-- ***** 관리자 페이지 ***** -->
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="page-content" style="padding-top: 5px">
        
          <div class="game-details">
            <h2>관리자 페이지</h2>
          </div>
          
          <div class="start-stream header-text">
            <div class="col-lg-12">
              <div class="row">
                <div class="col-lg-4">
                  <div class="item">
                    <div class="icon">
                      <img src="/assets/images/service-01.jpg" alt="" style="max-width: 60px; border-radius: 50%;">
                    </div>
                    <h4>영화 관리</h4>
<!--                     <p>Cyborg Gaming is free HTML CSS website template provided by TemplateMo. This is Bootstrap v5.2.0 layout.</p> -->
                    <div class="main-button">
					<a href="#" data-bs-toggle="modal" data-bs-target="#myModal">
					  영화 관리
					</a>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4">
                  <div class="item">
                    <div class="icon">
                      <img src="/assets/images/service-02.jpg" alt="" style="max-width: 60px; border-radius: 50%;">
                    </div>
                    <h4>게시판 관리</h4>
<!--                     <p>If you wish to support us, you can make a <a href="https://paypal.me/templatemo" target="_blank">small contribution via PayPal</a> to info [at] templatemo.com</p> -->
                    <div class="main-button">
					<a href="#" data-bs-toggle="modal" data-bs-target="#myModal">
					  게시판 관리
					</a>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4">
                  <div class="item">
                    <div class="icon">
                      <img src="/assets/images/service-03.jpg" alt="" style="max-width: 60px; border-radius: 50%;">
                    </div>
                    <h4>회원 관리</h4>
<!--                     <p>You are not allowed to redistribute this template's downloadable ZIP file on any other template collection website.</p> -->
                    <div class="main-button">
					<a href="#" data-bs-toggle="modal" data-bs-target="#myModal">
					  회원 관리
					</a>
                    </div>
                  </div>
                </div>
<!--                 <div class="col-lg-12"> -->
<!--                   <div class="main-button"> -->
<!--                     <a href="profile.html">Go To Profile</a> -->
<!--                   </div> -->
<!--                 </div> -->
              </div>
            </div>
          </div>
          <!-- ***** Start Stream End ***** -->
          
          <!-- ***** 전체 회원 조회 ***** -->
          <div class="game-details">
            <h2>회원 현황</h2>
          </div>
          
          <div class="gaming-library">
            <div class="col-lg-12">
              <div class="item">
                <ul>
                  <li><img src="/assets/images/game-01.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>Dota 2</h4><span>Sandbox</span></li>
                  <li><h4>Date Added</h4><span>24/08/2036</span></li>
                  <li><h4>Hours Played</h4><span>634 H 22 Mins</span></li>
                  <li><h4>Currently</h4><span>Downloaded</span></li>
                  <li><div class="main-border-button border-no-active"><a href="#">Donwloaded</a></div></li>
                </ul>
              </div>
            </div>
          </div>
          <!-- ***** 전체 회원 조회 End ***** -->
          
        </div>
      </div>
    </div>
    <!-- ***** 관리자 페이지 끝 ***** -->
    
  </div>
  
<%@ include file="/WEB-INF/include/footer.jspf" %>

  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  <script src="/vendor/jquery/jquery.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

  <script src="/assets/js/isotope.min.js"></script>
  <script src="/assets/js/owl-carousel.js"></script>
  <script src="/assets/js/tabs.js"></script>
  <script src="/assets/js/popup.js"></script>
  <script src="/assets/js/custom.js"></script>


  </body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
  $(document).ready(function() {
	  
	//마우스 이벤트
	   $(".img-items").mouseover(function() {
	      var imgSrc = $(this).attr("src");
	      var index = imgSrc.indexOf(".");
	      var imgSrcPre = imgSrc.substring(0, index);
	      $(this).attr("src", imgSrcPre + "-over.png");
	   });
	   $(".img-items").mouseleave(function() {
	      var imgSrc = $(this).attr("src"); 
	      var index = imgSrc.indexOf("-");
	      var imgSrcPre = imgSrc.substring(0, index);
	      $(this).attr("src", imgSrcPre + ".png");
	   });
	   
	
	   
	  //클릭
		$(".img-items").click(function() {
			var goods = $(this).attr("data-name");
			var price = $(this).attr("data-price");
			var count = "";
			$("#count").on("input", function(e){
				count = e.target.value;
				console.log(count);
			var totalPrice = price*count;
			console.log(totalPrice);
			$("#totalPrice").val(totalPrice);
			
			});
			
			$("#goods").val(goods);
			$("#price").val(price);
			$("#count").val(count);

		});

		//모달
			  $("#btnStorePayModal").click(function(e){
				 e.preventDefault();
				$("#spanCartPrice").text(totalPrice.value);
				$("#spanCartPay").text(totalPrice.value);
			  });
			  $("#btnStorePayModal").trigger("click");
	});
</script>

<style>
.top-downloaded img {
	width: 100%;
	height: 100%;
}

.btnStorePay{
	margin-left:625px;
}

th, td {
	color : #fff;
 	padding : 30px; 
}

input{
	width:90px;
	height:25px;
	text-align:center;
}

.total{
	height:25px;
	text-align:center;
}

</style>
  
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
        	<div class="heading-section">
               <h4><em>MOVIE</em> STORE</h4>
	
				</div>
   <!-- ***** 스토어 시작 ***** -->
          <div class="row" style="margin-top:50px">
            <div class="col-lg-4">
              <div class="top-downloaded">
                <div class="heading-section" style="margin-bottom:50px">
                  <h4>영화관람권</h4>
                </div>
                <ul>
					<li><img class="img-items" src="/assets/images/storeTicketA_.png" alt="storeTicketA" data-name="영화관람권" data-price="12000"></li>
					<li><img class="img-items" src="/assets/images/storeTicketB.png" alt="storeTicketB" data-name="영화관람권" data-price="30000"></li>
					<li><img class="img-items" src="/assets/images/storeTicketC.png" alt="storeTicketC" data-name="영화관람권" data-price="50000"></li>
				</ul>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="top-downloaded">
                <div class="heading-section" style="margin-bottom:50px">
                  <h4>기프트카드</h4>
                </div>
                <ul>
					<li><img class="img-items" src="/assets/images/storeCardTypeA.png" alt="storeCardTypeA" data-name="기프트카드 Type A" data-price="20000"></li>
					<li><img class="img-items" src="/assets/images/storeCardTypeB.png" alt="storeCardTypeB" data-name="기프트카드 Type B" data-price="30000"></li>
					<li><img class="img-items" src="/assets/images/storeCardTypeC.png" alt="storeCardTypeC" data-name="기프트카드 Type C" data-price="50000"></li>
				</ul>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="top-downloaded">
                <div class="heading-section" style="margin-bottom:50px">
                  <h4>스낵</h4>
                </div>
                <ul>
					<li><img class="img-items" src="/assets/images/storeSnackHotdog.png" alt="storeSnackHotdog" data-name="핫도그" data-price="4500"></li>
					<li><img class="img-items" src="/assets/images/storeSnackNacho.png" alt="storeSnackNacho" data-name="나쵸" data-price="5000"></li>
					<li><img class="img-items" src="/assets/images/storeSnackPopcorn.png" alt="storeSnackPopcorn" data-name="팝콘" data-price="6000"></li>
				</ul>
              </div>
            </div>
            <div class="col-lg-4" style="margin-top:50px">
              <div class="top-downloaded">
                <div class="heading-section" style="margin-bottom:50px">
                  <h4>음료</h4>
                </div>
                <ul>
					<li><img class="img-items" src="/assets/images/storeDrinkCarbonic_.png" alt="storeDrinkCarbonic" data-name="탄산음료" data-price="3000"></li>
					<li><img class="img-items" src="/assets/images/storeDrinkCoffee_.png" alt="storeDrinkCoffee" data-name="아메리카노" data-price="4000"></li>
					<li><img class="img-items" src="/assets/images/storeDrinkAde_.png" alt="storeDrinkAde" data-name="에이드" data-price="5000"></li>
				</ul>
              </div>
            </div>
            <div class="col-lg-8" style="margin-top:50px">
              <div class="top-downloaded">
                <div class="heading-section" style="margin-bottom:50px">
                  <h4>선택 내역</h4>
                  <!-- 결제 모달 시작 -->
					<button type="button" class="btn btn-md btn-danger btnStorePay" id="btnStorePayModal"
						data-toggle="modal" data-target="#myModal">구매하기</button>
					<div class="modal fade" id="myModal">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title" style="color:black">결제 확인</h4>
								</div>

								<!-- Modal body -->
								<div class="modal-body" style="font-size:15pt">
									총 상품 금액 : <span id="spanCartPrice"></span><br><br>
							        할인 금액 : <span id="spanCartDiscount"></span><br><br>
							        총 결제 예정 금액 : <span id="spanCartPay"></span><br>
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-success"
										data-dismiss="modal" >결제</button>
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">취소</button>
								</div>

							</div>
						</div>
					</div>
					<!-- 결제 모달 끝 -->
                </div>
							<!--  내용들어가기 -->
							<div class="cart-table">
								<table border="2"; style="width: 100%; color: white; text-align: center">
									<thead>
										<tr>
											<!-- 상품 전체선택 -->
											<th scope="col">상품명</th>
											<th scope="col">상품 금액</th>
											<th scope="col">수량</th>
											<th scope="col">총 구매 금액</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="td-goods"><input type="text" id="goods"/><br></td>
											<td class="td-price"><input type="text" id="price"/><br></td>
											<td class="td-count"><input type="number" id="count"/><br></td>
											<td class="td-total"><input type="text" id="totalPrice"/><br></td>
										</tr>
									</tbody>
								</table>
							</div>
							
              </div>
            </div>
            </div>
          
          <!-- ***** 스토어 끝 ***** -->
           </div>
      </div>
    </div>
  </div>
  
  <%@include file="../include/footer.jspf" %>
  
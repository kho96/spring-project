<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 좌석선택  -->
<script>
var seatsLeft = "${seatsLeft}";
if (seatsLeft == 0) alert("모두 매진되었습니다.");
</script>
				<c:if test="${seatsLeft gt 0}"> <!-- 잔여 좌석이 존재한다면 -->
            	<div id="div-seat" style="margin-top: 30px; width: 100%;">
               		<div class="heading-section">
	                	<div><h4>좌석선택</h4></div>
	                	<!-- 좌석 상태 설명 -->
	                	<div style="text-align: right; margin-bottom: 10px">
	                		<span style="color: white; margin-right: 10px">□ : 선택가능</span>
	                		<span style="color: red"> ▩ : 선택불가능</span>
	                	</div>
                	</div>
              	
               		<table border="2 solid" id="table-seat"
               		style="width: 100%; height: 450px; color: white; text-align: center;">
               			<tr>
               				<td colspan="${maxCol}"><h4>screen</h4></td>
               			</tr>
               			<tr>
               			<c:forEach items="${allList}" var="all" varStatus="status">
               				<td>
               				<c:choose>
               					<c:when test="${all.cinema_able eq 'F'}">
	               								<a class="a-noseat" style="color: red" href="#">▩</a>
             					</c:when>
             					<c:otherwise>
             						<a class="a-seat" data-seat="${all.cinema_row}열 ${all.cinema_col}번"
             							data-col="${all.cinema_col}" data-row="${all.cinema_row}" 
             							data-check="false" href="#">□</a>
             					</c:otherwise>
             				</c:choose>
               				</td>
               				<c:if test="${status.count mod maxCol eq 0}">
               				</tr>
               				<tr>
               				</c:if>
               			</c:forEach>
               			
               			</tr>	

               		</table>
               		<div class="col-lg-12">
	                  <div class="main-button" style="text-align: center; margin-top: 25px">
	                    <a id="btn-payment" href="#">선택완료</a>
	                  </div>
	                </div>
               	</div><!-- 좌석선택 끝  -->
               	</c:if>
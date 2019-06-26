<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*, java.text.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<!-- bootstrap css 파일 추가하기 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- bootstrap js 파일 추가하기 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<title>TMI 캐시</title>


<style>


.container1 {
	width: 1200px;
	margin: 0 auto;
}

.refunding-box {
	width: 700px;
	margin: 0 auto;
	border: 1px solid lightgray;
	margin-top: 50px;
	background-color: #dcdcdc;
}

.ref-info {
	display: inline-block;
	margin-left: 20px;
}

.clearFix::after {
	width: 100%;
	content: '';
	clear: both;
	display: block;
}

.cashPrice {
	width: 800px;
	float: left;
}

.cashPrice div {
	width: 700px;
}



.cashDoubleCheck {
	padding-left : 15%;
	padding-top : -10%;
}


.cashPriceCheck {
	width: 280px;
	
	height: auto;
	border: 1px solid lightgray;
	background-color: #D7E8F2;
}

.cashPrice>li {
	list-style: none;
	border: 1px solid lightgray;
	padding: 10px 5px;
}

.nowCash {
	font-weight: bolder;
}

.cashBox {
	border-top: 2px dashed #3DA8E5;
	width: 100%;
}

.priceNum {
	font-size: 16px;
	font-weight: bold;
}

.font-noto{
		font-family: 'Noto Sans KR', sans-serif;
    	font-weight: 400;
	}
	
	.par{ text-align: center; }

/*radio 버튼 색상변경 */
input[type='radio'] {
	-webkit-appearance: none;
	width: 18px;
	height: 18px;
	border: 2px solid #A0AFFF;
	border-radius: 50%;
	outline: none;
	background: #e6e6e6;
	margin-left:15%;
}

input[type='radio']:before {
	content: '';
	display: block;
	width: 75%;
	height: 75%;
	margin: 13% auto;
	border-radius: 50%;
}

input[type='radio']:checked:before {
	background: #A0AFFF;
}
</style>
<!-- <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script> -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>

</head>
<body>
	<%@ include file="/views/common/cateheader2.jsp"%>

	<%
	DecimalFormat df = new DecimalFormat("###,###");
	int val = m.getCash();
	%>

	<section>
	
		<div class="container1 font-noto">
			
				<div class="ui two column very relaxed grid" style="margin-top:3%;">
					<div class="column">
						<h2 class="modal-title" style="padding-left:25%; margin-bottom:6%;">캐시</h2>
						<div class="form-row align-items-center">
							<div class="col-auto my-1"></div>
							<table class="table table-hover" style="width: 400px; margin-left:30%;">
								<thead>
									<tr>
										<th scope="col" style="text-align:center; font-size:17px;">충 전 가 능 금 액</th>

									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row"><label style="display: block;"> <input
												type="radio" name="cPrice" value="10000">
												<div class="awesome-radio-text"
													style="display: inline; padding-right: 300px;"> &nbsp;&nbsp;
													<b class="priceNum"><i class="won sign icon"></i>10,000</b>
													&nbsp;&nbsp;
												</div>
										</label></th>

									</tr>
									<tr>
										<th scope="row"><label> <input type="radio"
												name="cPrice" value="30000">
												<div class="awesome-radio-text"
													style="display: inline; padding-right: 300px;"> &nbsp;&nbsp;
													<b class="priceNum"><i class="won sign icon"></i>30,000</b>
													&nbsp;&nbsp;
												</div>
										</label></th>

									</tr>
									<tr>
										<th scope="row"><label> <input type="radio"
												name="cPrice" value="50000">
												<div class="awesome-radio-text"
													style="display: inline; padding-right: 300px;"> &nbsp;&nbsp;
													<b class="priceNum"><i class="won sign icon"></i>50,000</b>
													&nbsp;&nbsp;
												</div>
										</label></th>
									</tr>
									<tr>
										<th scope="row"><label> <input type="radio"
												name="cPrice" value="100000">
												<div class="awesome-radio-text"
													style="display: inline; padding-right: 300px;"> &nbsp;&nbsp;
													<b class="priceNum"><i class="won sign icon"></i>100,000</b>
													&nbsp;&nbsp;
												</div>
										</label></th>
									</tr>
									<tr>
										<th scope="row"><label> <input type="radio"
												name="cPrice" value="300000">
												<div class="awesome-radio-text"
													style="display: inline; padding-right: 300px;"> &nbsp;&nbsp;
													<b class="priceNum"><i class="won sign icon"></i>300,000</b>
													&nbsp;&nbsp;
												</div>
										</label></th>
									</tr>
									<tr>
										<th scope="row"><label> <input type="radio"
												name="cPrice" value="500000">
												<div class="awesome-radio-text"
													style="display: inline; padding-right: 300px;"> &nbsp;&nbsp;
													<b class="priceNum"><i class="won sign icon"></i>500,000</b>
													&nbsp;&nbsp;
												</div>
										</label></th>
									</tr>
									<tr>
										<th scope="row"><label> <input type="radio"
												name="cPrice" value="1000000">
												<div class="awesome-radio-text"
													style="display: inline; padding-right: 300px;"> &nbsp;&nbsp;
													<b class="priceNum"><i class="won sign icon"></i>1,000,000</b>
													&nbsp;&nbsp;
												</div>
										</label></th>
									</tr>
									<tr>
										<th scope="row"><label> <input type="radio"
												name="cPrice" value="3000000">
												<div class="awesome-radio-text"
													style="display: inline; padding-right: 300px;"> &nbsp;&nbsp;
													<b class="priceNum"><i class="won sign icon"></i>3,000,000</b>
													&nbsp;&nbsp;
												</div>
										</label></th>
									</tr>
									<tr>
										<th scope="row"><label> <input type="radio"
												name="cPrice" value="5000000">
												<div class="awesome-radio-text"
													style="display: inline; padding-right: 300px;"> &nbsp;&nbsp;
													<b class="priceNum"><i class="won sign icon"></i>5,000,000</b>
													&nbsp;&nbsp;
												</div>
										</label></th>
									</tr>
									<tr><th></th></tr>
								</tbody>
							</table>
							<div>
								<br>
							</div>
						</div>
					</div>
					<div class="column" style="padding-left:5%;">
						<br>
						<div class="ui form">
							<div class="inline field">
								<div class="cashPriceCheck">
									<div class="cashDoubleCheck" style="margin-top:10%; display:inlne">
										<img src="/semi/resources/images/cashIcon.png" width="65px" height="65px" >
									</div>

									<div class="cashDoubleCheck now" style="display:inline-bolder; padding-left:45%; margin-top:-25%; margin-botton:10%;">
										<p style="font-weight:bolder; font-size:20px;">보유캐시</p>
										
										<span class="nowCash" style="color: red; font-size: 18px;"><%=df.format(val)%>원</span>
									</div>
									<br><br>
									<hr class="cashBox">
									<br>

									<div class="wPrice">
										<p style="padding-left: 20px; display: inline; font-size:20px; font-weight:bolder;">충전 금액 &nbsp; &nbsp; &nbsp;</p>
										<div style="align-text:right; display:inline;" width="50px">
											<i class="won sign icon" style="padding-left:12%;"></i>
											<p style="font-size:20px; display:inline; padding-left:6%;" class="pricewon">0</p>
											
										</div>
										<br>
										<br>
										<p style="padding-left: 40px; font-size:20px; font-weight:bolder; display: inline;">
											<i class="plus icon"></i>충전 혜택 &nbsp; &nbsp; &nbsp;
										</p>
										<div style="align-text:right; display:inline;" width="50px">
											<i class="won sign icon"></i>
											<p style="font-size:20px; display:inline; margin-left:-2%;" class="moremoney">0</p>
											
										</div>
										<br>
										<br>
										<br><br>
										

										<p style="padding-top:15%; padding-left: 20px; display: inline; font-size:20px; font-weight:bolder;">총 충전 금액 &nbsp; &nbsp; &nbsp;</p>
										<div style="align-text:right; display:inline;" width="50px">
											<i class="won sign icon" style="padding-left:3.5%;"></i>
											<p style="font-size:20px; display:inline; padding-left:3%; color:red;" class="totalprice">0</p>
											
										</div>
										
								
									</div> <br>
									<hr class="cashBox"> <br>
									<b style="font-size:20px; padding-left:20px;">총 결제 금액</b> <br> <br> <br> <br> <br>
									<div class="par"">
									<i class="won sign icon" style="font-size:25px; display: inline-block;"></i>
									<span style="font-size: 35px; color: red; font-weight: bold; display: inline-block;" class="pricewon">0</span>
									<span style="font-size: 35px; color: red; font-weight: bold; display: inline-block;">원</span>
									<br><br>
									</div>
								</div>
								<br><br>
								<div>
									<button class="ui red button font-noto" style="width:280px; font-size:20px;">충전하기</button>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- <div class="ui vertical divider">★</div> -->
			
		</div>


<br><br><br>
		<div class="refunding-box">
			<h4>
				<i class="exclamation triangle icon"></i>TMI 캐시 안내
			</h4>
			<p style="margin-left: 20px;">TMI 캐시는 충전캐시와 적립캐시가 있습니다.</p>
			<div class="ref-info">
				<ul padding-left="0%">
					<li style="font-weight: bolder">충전캐시</li>
					<div class="refungding1"
						style="margin-left: 15px;">
						<ol>
							<li>회원이 직접 충전했거나 주문이 취소된 후 예치된 캐시입니다.</li>
							<li>유효기간은 충전일로 5년이며, 서비스 구매 시 유효기간 만료일이 가까운 순서대로 사용됩니다.</li>
							<li>충전캐시는 전액 환불만 가능합니다.</li>
						</ol>
					</div>
					<li style="font-weight: bolder">적립캐시</li>
					<div class="refunding2"
						style="margin-left: 15px;">
						<ol>
							<li>각종 이벤트 참여 등에 따른 리워드로 적립된 캐시입니다.</li>
							<li>유효기간은 통상적으로 1년이나, 프로모션 성격에 따라 유효기간이 다를 수 있습니다.</li>
							<li>적립캐시는 서비스 구매 시 유효기간 만료일이 가까운 순서대로 사용됩니다.</li>
							<li>적립캐시는 비현금성으로 환불되지 않습니다.</li>
						</ol>
					</div>
				</ul>
			</div>
		</div>
		<table style="display:none;">
			<!-- 결제 정보에 사용-->
			<tr>
				<td>이름 : <span id="userName" value="<%=m.getUserName()%>"><%=m.getUserName()%></span></td>
			</tr>
			<tr>
				<td>이메일 : <span id="email" value="<%=m.getUserName()%>"><%=m.getEmail()%></span></td>
			</tr>
			<tr>
				<td>연락처 : <span id="phone" value="<%=m.getPhone()%>"><%=m.getPhone()%></span></td>
			</tr>
		</table>


	</section>


	<script>
	

	$('th').click(function(){
		var price = Number($("input:radio[name=cPrice]:checked").val());
		var pricemore = price*0.1;
		var tprice = price+pricemore;
		console.log(price);
		console.log(pricemore);
		console.log(tprice);
		
		$('.pricewon').text(Number(price).toLocaleString('en').split(".")[0]);
		$('.moremoney').text(Number(pricemore).toLocaleString('en').split(".")[0]);
		$('.totalprice').text(Number(tprice).toLocaleString('en').split(".")[0]);
	});
	
	$('button').click(function(){ <%-- 이거 나중에 지우고 아래 주석처리 한 것을 올려야해욥(지금은 결제 막아놓음. 바로 결제완료로 감) --%>
		var price = Number($("input:radio[name=cPrice]:checked").val()); //가격받는부분
		var pricemore = price*0.1; //혜택(10%)
		var tprice = price+pricemore;
		console.log("결제금액 : " + price);
	
		var uname = $('#userName').text();
		var uemail = $('#email').text();
		console.log(uname);
		console.log(uemail);

	
	
        //성공 시 이동할 페이지
        <%-- location.href="<%=request.getContextPath()%>/views/personBUY/billingHistory.jsp"; --%>
        <%--location.href="<%=request.getContextPath()%>/mCashRec.bo?price="+price+"&email="+uemail;--%> <%-- MemberDB로 넘어가서 캐시 충전 --%>
        location.href="<%=request.getContextPath()%>/insertRech.bo?tprice="+tprice+"&email="+uemail; <%-- CashDB로 넘어가서 충전내역으로 남김 --%>
       
	}); 
	
	
	<%-- 
	$('button').click(function(){
		var price = Number($("input:radio[name=cPrice]:checked").val()); //가격받는부분
		var pricemore = price*0.1; //혜택(10%)
		var tprice = price+pricemore;
		console.log(price);
	
		var uname = $('#userName').text();
		var uemail = $('#email').text();var uphone = $('#phone').text();
		console.log(uname);
		console.log(uemail);
		console.log(uphone);

		//--
		var IMP = window.IMP; // 생략가능
		IMP.init('imp75606853'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용 [완료시imp91745666]

		IMP.request_pay({
    		pg : 'html5_inicis', // version 1.1.0부터 지원.
    		pay_method : 'card',
    		merchant_uid : 'merchant_' + new Date().getTime(),
    		name : 'TMI 캐시 충전',
    		amount :price,
    		buyer_email : uemail,
    		buyer_name : uname,
    		buyer_tel : uphone,
    		buyer_addr : '서울특별시 강남구 삼성동',
    		buyer_postcode : '123-456',
    		m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
    		if ( rsp.success ) {
        		var msg = '결제가 완료되었습니다.';
        		msg += '고유ID : ' + rsp.imp_uid;
        		msg += '상점 거래ID : ' + rsp.merchant_uid;
        		msg += '결제 금액 : ' + rsp.paid_amount;
        		msg += '카드 승인번호 : ' + rsp.apply_num;
   		
        		alert(msg);
        
        		//성공 시 이동할 페이지 (MemberDB로 연결되어 캐시 충전으로 잔액에 플러스)
        		location.href="<%=request.getContextPath()%>/insertRech.bo?price="+price+"&email="+uemail;
        
    		} else {
      			//실패 시 이동할 페이지
        		location.href="<%=request.getContextPath()%>/views/personBUY/failPay.jsp";
        
    		}
		});
	}); 
	--%>
	
</script>

	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
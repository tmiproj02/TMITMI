<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, member.model.vo.*, buyingctrl.model.vo.*, charge.model.vo.*" %>
<% 
ArrayList<DealMng> reqList = (ArrayList<DealMng>)request.getAttribute("nreqList");
PageInfo pi = (PageInfo)request.getAttribute("pi");
int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();

int s1 = 0;
int s2 = 0;
int s3 = 0;

for(DealMng d : reqList){
   switch(d.getProgress()){
      case "진행중" : s1+=1; break;
      case "완료" : s2+=1; break;
      case "취소" : s3+=1; break;
    }
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMI 구매 관리</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<style>

	.container1 {
	width: 1200px;
	margin: 0 auto;
	border : 1px solid red;
	}

	.clearFix::after {
	width: 100%;
	content: '';
	clear: both;
	display: block;
	}
	
	.listcontent{
		padding-left : 5%;
	}
	
	.detail-list{
		border: solid #E6E6E6 1px !important;
		padding : 85px 0;
		text-align : center;
		margin-top : 20px;
	}
	
	.font-noto{
		font-family: 'Noto Sans KR', sans-serif;
    	font-weight: 400;
	}
	.my-page-buy{
		margin:0 auto;
	}
	.scontainer{

		width : 1024px;
		margin:0 auto;
		overflow : hidden;
	}
	.scontainer1{
		padding-left : 15px;
		padding-right : 15px;
		margin:0 auto;
	}
	.scontainer2{

		margin:0 auto;
		float : left;
	}
	
	.profile{
		margin-top:20px;
	}
	.width-25per{
		width:25%;

	}
	.width-75per{
		width:75%;

	}
	.user-profile-body{
		border: solid #E6E6E6 1px;
		border-bottom:none;
		text-align : center;
		padding-top : 20px;
	}
	.user-profile-box>li{
		border: solid #E6E6E6 1px;
		border-bottom:none;
		list-style : none;
		overflow : hidden;
	}
	
	.sell{
		margin-top : 40px;
	}
	.seller-check{
		display: inline;
	    border-radius: 10px;
	    padding: 1px 7px 2px 7px;
	    font-size: 75%;
	    line-height: 1;
	    color: #fff;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: baseline;
	    background : #364559;
	}
	.padding-15{
		padding:0 15px;
	}
	.income-out{
		padding :15px 0;
	}
	.income-out>div{
		display : inline-block;
		
	}
	.income-out-div{
		text-align:left; 
		width:50%;
		padding-left:15px; 
		padding-right: 0px;
		float:left;
		
	}
	.won{
		text-align:right; 
		width:50%;
		padding-right:15px; 
		padding-left:0;
	}
	.menu-line{
		border: solid #E6E6E6 1px;
		border-bottom:none;
		overflow:hidden;
	}
	.menu-line>a{
		display : inline-block;
		width:50%;
		margin-bottom : 0;
		float:left;
	}
	.menu-box img{
		width : 40px;
	}
	.menu-box{
	
	}
	.menu-box>div>div{

	}
	.padding-all-15{
		padding : 15px;
	}
	.menu-slot{
		width:100%;
		
	}
	.sell-ing{
		padding-bottom : 15px;
		 border-bottom:solid #E6E6E6 1px;
	}
	.sell-ing>li{
		list-style: none;
		display : inline-block;
		margin-right : 15px;
		
	}
	.sell-ing>li>a{
		color : #878787;
		font-family: 'Noto Sans KR', font;
		font-weight : 500;
		cursor:pointer;
	}
	.detail-box{
	    border-bottom: solid #E6E6E6 1px !important;
	}
	.detail-list{
		border: solid #E6E6E6 1px !important;
		padding : 85px 0;
		text-align : center;
		margin-top : 20px;
	}
	
	.detail-list2{
		text-align : center;
		margin-top : 20px;

	}
	
	table {
	border-radius: 5px;
		border:3px solid #BDD4F2;		
		width:100%;
				margin-bottom : 20px;
	}
	
	.bcthumb{
		text-align:left;
		padding-left : 30px;
		width:180px;
	}
	
	.bcinfo{
		text-align:left;
		color :gray;
		font-size: 12px;
		width:350px;
	}
	
	.bcprice{
		text-align:right;
		padding-right:30px;
	}
	
	.selling-history{
	    vertical-align: 1px;
	    font-size: 11px;
	    color: #878787;
	    padding: 1px 6px;
	    background-color: #ddd;
	    border-radius: 500px !important;
	}
	.active{
		background:#E8F0F5;
	}
	.select{
		background-color: #BDD4F2;
		color : #000;
	}
	
	.margin-bottom-15{
		margin-bottom:15px;
	}
	
	.margin-top-5{
		margin-top : 5px;
	}
	
	.link-color-blue{
		color:#FF5050;
	}
	
	.padding-left-20{
		padding-left:20px;
	}
	
	#bcNotList{
		letter-spacing : -1.7px;
	}

	
	
</style>
</head>
<body>
	<%@ include file="/views/common/cateheader2.jsp" %>

	<%
	DecimalFormat df = new DecimalFormat("###,###");
	int val = m.getCash();
	%>

	<div class="my-page-buy">
		<div class="scontainer">
			<div class="scontainer1">
				<div class = "sell font-noto">
					<h3>구매</h3>
				</div>
			</div>
			<div class="scontainer2 width-25per">
					<div class="profile">
						<div class="padding-15">
						<div class="user-profile-body">
							<img src="/semi/resources/images/myprofile.png" style="border-radius: 500px;width:100px;height:100px"/>
						</div>
						<ul class="user-profile-box">
							<li style=" border-top:none;"><div style="text-align : center; margin-bottom:20px;">
								<div class="font-noto" style="margin-top:5px;margin-bottom:10px;"><a href="../member/memberUpdateForm.jsp"><%=m.getNickName() %></a></div>
								<br>
								<div class="font-color-lighter font-size-h6 font-noto">TMI캐시</div>
								<h3 class="margin-bottom-15 margin-top-5 link-color-blue NGB"><i class="won sign icon"></i><%=df.format(val)%> 원</h3>
								<div>
									<label class="seller-check font-noto" style="cursor:pointer;" onclick="lbcash();"><i class="credit card outline icon"></i>캐시충전</label>
									
								</div>
							</div>
							</li>
							
						</ul>
					</div>
					<div class="menu-box">
						<div class="padding-15">
							<div class="menu-line" style="text-align:center">
								<a style="cursor:pointer;"><div class="padding-all-15 menu-slot active" style="border-right:solid #E6E6E6 1px;" onclick="nrequest();">							
									<div><img src="/semi/resources/images/buying_active.png"/></div>
									<h6>구매관리</h6>							
								</div></a>
								<a href="/semi/views/personBUY/cash.jsp"><div class="padding-all-15 menu-slot">
									<div><img src="/semi/resources/images/noun_won.png"/></div>
									<h6>TMI캐시</h6>			
								</div></a>
							</div>
							<div class="menu-line" style="text-align:center;border-bottom:solid #E6E6E6 1px;">
								<a style="cursor:pointer;"><div class="padding-all-15 menu-slot" style="border-right:solid #E6E6E6 1px;" onclick="billHist();">							
									<div><img src="/semi/resources/images/payment_active.png"/></div>
									<h6>캐시내역</h6>							
								</div></a>
								<a href="/semi/views/personBUY/coupon.jsp"><div class="padding-all-15 menu-slot">
									<div><img src="/semi/resources/images/coupon_active.png"/></div>
									<h6>쿠폰</h6>			
								</div></a>
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
			<div class="scontainer3 width-75per" style="float:left">
				<div class="padding-15">
					<h3 class="font-noto" style="font-weight:700; margin-top:3%">구매관리</h3>
				</div>
				<div style="margin-top:20px">
					<div class="padding-15">
						<ul class="sell-ing">
							<li>
								<a style="color:#000; cursor:pointer" onclick="nrequest();">전체내역 &nbsp; <span class="selling-history select"><%=reqList.size() %></span></a>
							</li>
							<li>
								<a style="cursor:pointer;" onclick="prging();">진행중 &nbsp; <span class="selling-history"><%= s1 %></span></a>
							</li>
							<li>
								<a style="cursor:pointer;" onclick="finlist();">완료 &nbsp; <span class="selling-history"><%= s2 %></span></a>
							</li>
							<li>
								<a  style="cursor:pointer;" onclick="cclist();">취소 &nbsp; <span class="selling-history"><%= s3 %></span></a>
							</li>
						</ul>
					</div>
				</div>
				<div style="margin-top:20px">
					<div class="font-noto" style="padding: 0 71.5%;">
							<div class="ui icon input">
  							<input type="text" id="keyword" placeholder="서비스 제목 검색">
							<i class="inverted circular search link icon" onclick="search();"></i>
						</div>
					</div>
				</div>
				
				
				<% if (reqList.size()==0) { %>
					<div class="padding-15" style="margin-top:10px">
						<div class="detail-box">
						
							<div class="detail-list">
								<!-- 내역이 없을 때 -->
								<div><img src="/semi/resources/images/nothing.png" style="width:50px;vertical-align: middle;border:0" /></div>
								<h5 class="font-noto" style="margin:10px 0;">내역이 없습니다.</h5>
											
							</div>
						</div>
					</div>
					
					<% } else {%>
							
						<div class="detail-list2 padding-15">
					
							<!-- 내역이 있을 때 -->
							
								
								<div class="detail-list" style="padding:0">
								<%for(DealMng d : reqList){ %>

								<div class="mySlist" style="margin:0;padding: 20px 0">
									<div style="width:20%; "><img width=100px src="/semi/resources/images/cashIcon.png" alt="" /></div>
									<div style="width:50%; "><div><a href="/semi/listDetail.bo?bno=<%= d.getBno()%>"><h5 style="text-align:left; margin:0 20px"><%=d.getBtitle() %></h5></a></div></div>
									<div style="width:15%; "><div style="margin:30px 0"><h5><%=d.getPrice() %></h5></div></div>
									<div style="width:15%; border-right:none;"><div style="margin:30px 0"><h5><%=d.getProgress()%></h5></div></div>
								</div>
								<%} %>
							</div>
							
						
					</div>
					
					<%} %>
			
					
					<br>
					
					<%-- 페이징 처리 --%>
		<div class="pagingArea" align="center">
			<button class="ui black button" onclick="location.href='<%= request.getContextPath() %>/nReq.bo?currentPage=1'"><<</button>
			<%  if(currentPage <= 1){  %>
			<button class="ui grey button" disabled><</button>
			<%  }else{ %>
			<button class="ui grey button" onclick="location.href='<%= request.getContextPath() %>/nReq.bo?currentPage=<%=currentPage - 1 %>'"><</button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button class="ui blue basic button" disabled><%= p %></button>
			<%      }else{ %>
				<button class="ui blue basic button" onclick="location.href='<%= request.getContextPath() %>/nReq.bo?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button class="ui grey button" disabled>></button>
			<%  }else{ %>
			<button class="ui grey button" onclick="location.href='<%= request.getContextPath() %>/nReq.bo?currentPage=<%=currentPage + 1 %>'">></button>
			<%  } %>
			<button class="ui black button" onclick="location.href='<%= request.getContextPath() %>/nReq.bo?currentPage=<%= maxPage %>'">>></button>
		</div>
					
					
					
					<br><br><br>
					<div class="row" style="text-align:left;">
                            <div class="col-xs-12">
                                <div class="padding-15 panel bg-color-main profits-panel-border border-radius-0 border-solid">
                                    <div class="panel-body" style="border:1px solid lightgray; background-color:#dcdcdc; margin-top:50px;">

                                        <h6 class="NGB margin-all-0 padding-bottom-5" style="font-size:17px;">
                                            <i class="bullhorn icon"></i>
                                            <b>꼭 확인해주세요!</b>
                                        </h6>
                                        <ul class="font-color-light margin-top-5 margin-top-5 margin-bottom-0 font-size-h6 padding-left-20">
                                            <li id="bcNotList">세금계산서는 거래 주체인 전문가가 의뢰인에게 발행합니다.</li>
                                            <li id="bcNotList">세금계산서는 사업자 인증 받은 기업전문가에게 요청하실 수 있습니다.</li>
                                            <li id="bcNotList">이벤트 쿠폰 사용 금액은 할인된 금액이기 때문에 세금계산서에 포함되지 않습니다.</li>
                                            <li id="bcNotList">거래명세서는 결제가 완료되었음을 증명하는 용도로만 활용 가능하며 세무상의 지출증빙 효력이 없습니다.</li>
                                            <li id="bcNotList">현금영수증은 개인의 소득공제용으로만 사용 가능하며, 결제 당시 지출 증빙용으로 선택하셨더라도 매입세액공제를 받으실 수 없습니다.</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
					
					
					
				</div>
				<br><br>
				
				
				
			 </div>
		</div>

	




    

	<script>
		function lbcash(){
			location.href="/semi/views/personBUY/cash.jsp";
		}
		
		function billHist(){
			location.href="/semi/cList.bo"
		}
		
		function nrequest(){
			location.href="/semi/nReq.bo"
		}
		
		function prging(){
			location.href="/semi/prging.bo"
		}
		
		function finlist(){
			location.href="/semi/finished.bo"
		}
		
		function cclist(){
			location.href="/semi/cced.bo"
		}
		
		function search(){
			location.href="<%=request.getContextPath()%>/searchA.bo?keyword="+$('#keyword').val();
		}
		
	</script>
	
	


	 <%@include file="/views/common/footer.jsp" %>
</body>
</html>
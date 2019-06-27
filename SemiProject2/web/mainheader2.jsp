<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="seller.model.vo.Seller,sellerboard.model.vo.*,java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
   <%DecimalFormat dc = new DecimalFormat("###,###,###,###");%> 
<%
	int mCount = 0;
	int buyCount = 0;
	int sellCount = 0;
		
	    mCount = (int)(session.getAttribute("mCount"));

		buyCount = (int)(session.getAttribute("buyCount"));

	    sellCount = (int)(session.getAttribute("sellCount"));
	    ArrayList<Top5> list =(ArrayList<Top5>)request.getAttribute("list");
		Top5 t = (Top5)request.getAttribute("t");
		
		ArrayList<String> str= new ArrayList<String>();
		ArrayList<Integer> num1= new ArrayList<Integer>();
		
		

		
		
		for(Top5 to : list){
			System.out.println(to.getTop1());
			System.out.println(t.getTop1());
			if(to.getCate().equals(t.getTop1())){
				str.add(to.getNickname());
				num1.add(to.getIncome());
			}
		}
		for(Top5 to : list){
			if(to.getCate().equals(t.getTop2())){
				str.add(to.getNickname());
				num1.add(to.getIncome());
			}
		}
		for(Top5 to : list){
			if(to.getCate().equals(t.getTop3())){
				str.add(to.getNickname());
				num1.add(to.getIncome());
			}
		}	
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="icon" href="/semi/resources/images/pic.jpg"/>
<link rel="stylesheet" href="../dist/css/swiper.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>

<title>로그인 후 메인화면</title>

<style>
*{
	font-family: 'Noto Sans KR', sans-serif;
}
.section1{
	margin:0 auto;
}
.section2{
	width : 1200px;
	margin:0 auto;
	margin-top: 50px;
}
.content1{
	width : 1200px;
	margin:0 auto;
	background: #f3f4f8;;
	padding:15px;
	display: inline-block;
}
.content1>div{
	display: inline-block;
	float:left;
	
}
.use{
	width:210px;
	padding: 8px 10px; 
	border: 1px solid #d2d5e3; 
	text-align:center;
	background: #fff;
    border-radius: 2px;
}
.usestep{
	width:210px;
	padding-top:5px;
}
.row1>div{
	display: inline-block;
}
.row2>div{
	display: inline-block;
}
.row3>div{
	display: inline-block;
}
.right-side{
	margin: 0 auto;
}
.coupon{
	
	border: 1px solid #d2d5e3; 
	text-align:center;
	background: #fff;
    border-radius: 2px;
}
.coupon>div{
	display: inline-block;
	margin:0 auto;
}

.content2{
	width: 1200px;
    margin: 0 auto;
}

.indexTitle{
    font-size: 16px;
    margin-top: 60px;
    color: #333;
}
.indexTitle1{
    font-size: 16px;
    margin-top: 20px;
    color: #rgba(51, 51, 51, 0.801);

}
.indexTitle1 p{
    font-size: 15px;
    margin-top: 2px;
    margin-bottom:-5px;
    color: #rgba(51, 51, 51, 0.801);

}
.slider1{
    margin-top: 10px;
    display: inline-block;
}

.sildercon{
    float: left;
    margin-right: 20px; 
}
.sildercon1{
    float: left;
    margin:0;
}

 .swiper-container {
      width:650px;
      height:230px;
    }
.swiper-slide {
  text-align: center;
  font-size: 18px;
  background: #fff;
  /* Center slide text vertically */
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  -webkit-align-items: center;
  align-items: center;
}
.container12{
	width: 1200px;
	margin: 0 auto;
	
	}
.indexTitle1{
    font-size: 16px;
    margin-top: 100px;
    color: #rgba(51, 51, 51, 0.801);

}
.indexTitle1 p{
    font-size: 15px;
    margin-top: 2px;
    margin-bottom:-5px;
    color: #rgba(51, 51, 51, 0.801);

}
.slider1{
    /* border: 1px solid #f00; */
    margin-top: 10px;
    display: inline-block;
}

.sildercon{
    /* border: 1px solid #0f0; */
    float: left;
    margin-right: 20px; 
}
.sildercon1{
    float: left;
    margin:0;
}
.rank{
    float: left;
    background: #BDD4F2;
    margin-top: 15px;
    margin-right: 20px; 
    border-radius: 10px;
    width:384px;
    
}
.scontent2:nth-child(6){
    border: none;
}
.rank1{
    float: left;
    background: #BDD4F2;
    margin-top: 15px;
    border-radius: 10px;
    width:384px;
     /* height: 350px; */
     /* border: 1px solid #ccc; */
    
}
.scontent1{
	padding-top:14px;
}
.scontent1 p{
    text-align: center;
    font-size: 18px;
    margin-top: 10px;  
    color: #333;  
}
.first{
    margin: 15px 15px;
    background: rgba(255, 255, 255, 0.733);
    border-radius: 10px;
}

.firstimg{
    float: left;
    margin-left: 10px;
}
.firsttext{
    float: left;
    text-align: center;
    margin: 10px;
    margin-left: 70px;
    margin-right: 70px;
}

.scontent2{
    background: #fff;
    border-bottom: 1px solid #ccc;
    width: 100%;
    padding: 11px 0;
    /* height:47px; */
    margin: 0 auto;
    
}
.scontent2 p{
    display: inline-block;
    padding-left: 50px;
    padding-right: 30px;
    /* margin-top: 10px; */
}
    .clearFix::after{
    content: '';
    clear: both;
    display: block;
}
</style>
</head>
<body>
<%@include file= "/views/common/faq.jsp"%>
<%@include file= "/views/common/cateheader1.jsp"%>

<%-- <% if(m == null){
  	response.sendRedirect("index.jsp");
 } %> --%>
<!-- <script>
	<% if(m != null) {  %>
		
		sessionStorage.setItem('memberLoginChk', '1');
		
	<% } %>
	window.onload = function() {
		if (sessionStorage.getItem('reloadChk') != 1){
			sessionStorage.setItem('reloadChk', 1);
			if (sessionStorage.getItem('memberLoginChk') != 1) {
			    location.href = 'index.jsp';
			}
		} else {
			sessionStorage.setItem('reloadChk', 0);
		}
	}
	/* 
 	window.onbeforeunload = function(e) {
	  if (sessionStorage.getItem('memberLoginChk') != 1) {
	    location.href = 'index.jsp';
	  }
	}; */
 </script>   -->
 
<div class="section1">
	<div class="section2">	
		<div class="content1">
		
			<div class="c1" style="padding: 10px; width:20%;">
				
					<div class="use"><b>TMI 이용방법</b></div>
					<div class="usestep">
						<div class="row1" style="padding:10px;">
							<div class="list1" style="margin-right:10px;">
								 <img src="/semi/resources/images/search.png" style="width:30px; height:30px;">
							</div>
							<div class="list2">
								<div class="step1" style="font-size:14px;"><b>서비스 찾기</b></div>
								<div class="step2" style="font-size:12px;">원하는 서비스를 찾으세요.</div>
							</div>
						</div>
						<div class="row2" style="padding:10px;">
							<div class="list1" style="margin-right:10px;">
								<img src="/semi/resources/images/goo.png" style="width:30px; height:30px;">
							</div>
							<div class="list2">
								<div class="step1" style="font-size:14px;"><b>주문하기</b></div>
								<div class="step2" style="font-size:12px;">판매금액에 맞춰 주문하세요.</div>
							</div>
						</div>
						<div class="row3" style="padding:10px; ">
							<div class="list1" style="margin-right:10px;">
								<img src="/semi/resources/images/bat.png" style="width:30px; height:30px;">
							</div>
							<div class="list2">
								<div class="step1" style="font-size:14px;"><b>작업물 받기</b></div>
								<div class="step2" style="font-size:12px;">최종 작업물을 받으세요.</div>
							</div>
						</div>
					</div>
				
			</div>
			
			
			<div class="c2" style="padding: 5px; width:60%;">
					<div class="swiper-container">
					    <div class="swiper-wrapper">
					      <div class="swiper-slide"><img src="/semi/resources/images/ad.PNG" style="width:650px; height:280px;"></div>
					      <div class="swiper-slide"><img src="/semi/resources/images/ad1.PNG" style="width:650px; height:245px;"></div>
					      <div class="swiper-slide"><img src="/semi/resources/images/ad2.PNG" style="width:650px; height:256px;"></div>
					    </div> 
					    <!-- Add Pagination -->
					    <div class="swiper-pagination"></div>
					    <!-- Add Arrows -->
					    <div class="swiper-button-next" style="color:#red;"></div>
					    <div class="swiper-button-prev"></div>
					  </div>
					
					  <!-- Swiper JS -->
					  <script src="../dist/js/swiper.min.js"></script>
					
					  <!-- Initialize Swiper -->
					  <script>
					    var swiper = new Swiper('.swiper-container', {
					      slidesPerView: 1,
					      spaceBetween: 30,
					      loop: true,
					      autoplay: {
					    	    delay: 1500,
					    	  },
					      speed: 200, 
					      pagination: {
					        el: '.swiper-pagination',
					        clickable: true,
					      },
					      navigation: {
					        nextEl: '.swiper-button-next',
					        prevEl: '.swiper-button-prev',
					      },
					    });
					  </script>
			</div>		
			
			
			<div class="c3" style="padding: 5px; width:20%">
				<div class="right-side">
					<div class="user" style="padding:10px;">
						<div class="user1" style="font-size:16px; margin-bottom: 5px;"><b>반가워요!</b></div>
						<div class="user2" style="font-size:16px;"><%=m.getNickName() %>님!</div>
					</div>
					<div class="progress" style="padding:10px;">
						<div class="progress1" style="font-size:14px; margin-bottom:5px;">메세지 수
							<a href="/semi/messageList" style="margin-left: 118px;">
							<span style="color:#f1c40f;"><%=mCount%></span>
							</a>건
						</div>
						<div class="progress2" style="font-size:14px; margin-bottom: 5px;">구매 진행중 
						<a href="/semi/prging.bo" style="margin-left: 106px;">
							<span style="color:#f1c40f;"><%=buyCount%></span>
							</a>건
						</div>
						<div class="progress3" style="font-size:14px; margin-bottom: 5px;">판매 진행중 
						<a href="" style="margin-left: 106px;">
							<span style="color:#f1c40f;"><%= sellCount %></span>
							</a>건
						</div>
					</div>
					<a href="">
					<div class="coupon" style="padding:15px;text-align:center">
						<div class="coupon1" style="vertical-align:middle;margin-right:10px;">
							 <img src="/semi/resources/images/pic.jpg" style="width:40px; height:40px;  border-radius: 8px; vertical-align:middle;">
						</div>
						<div class="coupon2" style="vertical-align:middle;">
							<div class="step1" style="font-size:14px;">친구초대하면</div>
							<div class="step2" style="font-size:16px;"><b>5,000원</b>할인</div>
						</div>
					</div>
					</a>
				</div>
			</div>
		</div>
		
		
		
		
		<div class="content2">
            <div class="indexTitle">
                <p><b>디자인 카테고리</b>에서 인기있어요!</p> 
            </div>

            <div class="slider1 clearFix">
                <div class="sildercon">
                    <div style="width:224px; height: 300px;  margin:-1px;">
                    	
                    	<div style="width:224px; ">
						 	
						 	<div class="ui card" style="margin:0;">
							  <div class="image" style="height:170px;">
							    <img src="/semi/resources/images/night-sky.jpg" style="height:170px;">
							  </div>
							  <div class="content" style="height:120px;">
							    <a class="header">Kristy</a>
							    <div class="meta">
							      <span class="date">Joined in 2013</span>
							    </div>
							    <div class="description">
							      Kristy is an art director living in New York.
							    </div>
							  </div>
							  <div class="extra content">
							    <a>
							      <i class="ui" style="height:33px;"></i>
							      <div class="ui heart rating" data-rating="1" data-max-rating="1"></div>
							      <div class="ui star rating" data-rating="3" style="float:right;"></div>
							    </a>
							  </div>
							</div>
							<script>
							$('.special.cards .image').dimmer({
								  on: 'hover'
								});
							$('.ui.rating')
							  .rating({
							    initialRating: 3,
							    maxRating: 5
							  })
							;
							</script>
						 	
						 </div>
                    	
                    	
                    </div>
                </div>
                <div class="sildercon">
                    <div style="width:224px; height: 300px; margin:-1px;">
                    	<div style="width:224px; ">
						 	
						 	<div class="ui card" style="margin:0;">
							  <div class="image" style="height:170px;">
							    <img src="/semi/resources/images/night-sky.jpg" style="height:170px;">
							  </div>
							  <div class="content" style="height:120px;">
							    <a class="header">Kristy</a>
							    <div class="meta">
							      <span class="date">Joined in 2013</span>
							    </div>
							    <div class="description">
							      Kristy is an art director living in New York.
							    </div>
							  </div>
							  <div class="extra content">
							    <a>
							      <i class="ui" style="height:33px;"></i>
							      <div class="ui heart rating" data-rating="1" data-max-rating="1"></div>
							      <div class="ui star rating" data-rating="3" style="float:right;"></div>
							    </a>
							  </div>
							</div>
							<script>
							$('.special.cards .image').dimmer({
								  on: 'hover'
								});
							$('.ui.rating')
							  .rating({
							    initialRating: 3,
							    maxRating: 5
							  })
							;
							</script>
						 	
						 </div>
                    </div>
                </div>
                <div class="sildercon">
                    <div style="width:224px; height: 300px; margin:-1px;">
                    	<div style="width:224px; ">
						 	
						 	<div class="ui card" style="margin:0;">
							  <div class="image" style="height:170px;">
							    <img src="/semi/resources/images/night-sky.jpg" style="height:170px;">
							  </div>
							  <div class="content" style="height:120px;">
							    <a class="header">Kristy</a>
							    <div class="meta">
							      <span class="date">Joined in 2013</span>
							    </div>
							    <div class="description">
							      Kristy is an art director living in New York.
							    </div>
							  </div>
							  <div class="extra content">
							    <a>
							      <i class="ui" style="height:33px;"></i>
							      <div class="ui heart rating" data-rating="1" data-max-rating="1"></div>
							      <div class="ui star rating" data-rating="3" style="float:right;"></div>
							    </a>
							  </div>
							</div>
							<script>
							$('.special.cards .image').dimmer({
								  on: 'hover'
								});
							$('.ui.rating')
							  .rating({
							    initialRating: 3,
							    maxRating: 5
							  })
							;
							</script>
						 	
						 </div>
                    </div>
                </div>
                <div class="sildercon">
                    <div style="width:223px; height: 300px; margin:-1px;">
                    	<div style="width:224px; ">
						 	
						 	<div class="ui card" style="margin:0;">
							  <div class="image" style="height:170px;">
							    <img src="/semi/resources/images/night-sky.jpg" style="height:170px;">
							  </div>
							  <div class="content" style="height:120px;">
							    <a class="header">Kristy</a>
							    <div class="meta">
							      <span class="date">Joined in 2013</span>
							    </div>
							    <div class="description">
							      Kristy is an art director living in New York.
							    </div>
							  </div>
							  <div class="extra content">
							    <a>
							      <i class="ui" style="height:33px;"></i>
							      <div class="ui heart rating" data-rating="1" data-max-rating="1"></div>
							      <div class="ui star rating" data-rating="3" style="float:right;"></div>
							    </a>
							  </div>
							</div>
							<script>
							$('.special.cards .image').dimmer({
								  on: 'hover'
								});
							$('.ui.rating')
							  .rating({
							    initialRating: 3,
							    maxRating: 5
							  })
							;
							</script>
						 	
						 </div>
                    </div>
                </div>
                <div class="sildercon1">
                    <div style="width:223px; height: 300px; margin:-1px;">
                    	<div style="width:224px; ">
						 	
						 	<div class="ui card" style="margin:0;">
							  <div class="image" style="height:170px;">
							    <img src="/semi/resources/images/night-sky.jpg" style="height:170px;">
							  </div>
							  <div class="content" style="height:120px;">
							    <a class="header">Kristy</a>
							    <div class="meta">
							      <span class="date">Joined in 2013</span>
							    </div>
							    <div class="description">
							      Kristy is an art director living in New York.
							    </div>
							  </div>
							  <div class="extra content">
							    <a>
							      <i class="ui" style="height:33px;"></i>
							      <div class="ui heart rating" data-rating="1" data-max-rating="1"></div>
							      <div class="ui star rating" data-rating="3" style="float:right;"></div>
							    </a>
							  </div>
							</div>
							<script>
							$('.special.cards .image').dimmer({
								  on: 'hover'
								});
							$('.ui.rating')
							  .rating({
							    initialRating: 3,
							    maxRating: 5
							  })
							;
							</script>
						 	
						 </div>
                    </div>
                </div>

            </div>
        </div>
        
        <div class="content2">
            
            <div class="indexTitle">
                 <p><b>IT/프로그래밍 카테고리</b>에서 인기있어요!</p> 
            </div>

            <div class="slider1 clearFix">
                <div class="sildercon">
                    <div style="width:224px; height: 300px;  margin:-1px;">
                    	
                    	<div style="width:224px; ">
						 	
						 	<div class="ui card" style="margin:0;">
							  <div class="image" style="height:170px;">
							    <img src="/semi/resources/images/night-sky.jpg" style="height:170px;">
							  </div>
							  <div class="content" style="height:120px;">
							    <a class="header">Kristy</a>
							    <div class="meta">
							      <span class="date">Joined in 2013</span>
							    </div>
							    <div class="description">
							      Kristy is an art director living in New York.
							    </div>
							  </div>
							  <div class="extra content">
							    <a>
							      <i class="ui" style="height:33px;"></i>
							      <div class="ui heart rating" data-rating="1" data-max-rating="1"></div>
							      <div class="ui star rating" data-rating="3" style="float:right;"></div>
							    </a>
							  </div>
							</div>
							<script>
							$('.special.cards .image').dimmer({
								  on: 'hover'
								});
							$('.ui.rating')
							  .rating({
							    initialRating: 3,
							    maxRating: 5
							  })
							;
							</script>
						 	
						 </div>
                    	
                    	
                    </div>
                </div>
                <div class="sildercon">
                    <div style="width:224px; height: 300px; margin:-1px;">
                    	<div style="width:224px; ">
						 	
						 	<div class="ui card" style="margin:0;">
							  <div class="image" style="height:170px;">
							    <img src="/semi/resources/images/night-sky.jpg" style="height:170px;">
							  </div>
							  <div class="content" style="height:120px;">
							    <a class="header">Kristy</a>
							    <div class="meta">
							      <span class="date">Joined in 2013</span>
							    </div>
							    <div class="description">
							      Kristy is an art director living in New York.
							    </div>
							  </div>
							  <div class="extra content">
							    <a>
							      <i class="ui" style="height:33px;"></i>
							      <div class="ui heart rating" data-rating="1" data-max-rating="1"></div>
							      <div class="ui star rating" data-rating="3" style="float:right;"></div>
							    </a>
							  </div>
							</div>
							<script>
							$('.special.cards .image').dimmer({
								  on: 'hover'
								});
							$('.ui.rating')
							  .rating({
							    initialRating: 3,
							    maxRating: 5
							  })
							;
							</script>
						 	
						 </div>
                    </div>
                </div>
                <div class="sildercon">
                    <div style="width:224px; height: 300px; margin:-1px;">
                    	<div style="width:224px; ">
						 	
						 	<div class="ui card" style="margin:0;">
							  <div class="image" style="height:170px;">
							    <img src="/semi/resources/images/night-sky.jpg" style="height:170px;">
							  </div>
							  <div class="content" style="height:120px;">
							    <a class="header">Kristy</a>
							    <div class="meta">
							      <span class="date">Joined in 2013</span>
							    </div>
							    <div class="description">
							      Kristy is an art director living in New York.
							    </div>
							  </div>
							  <div class="extra content">
							    <a>
							      <i class="ui" style="height:33px;"></i>
							      <div class="ui heart rating" data-rating="1" data-max-rating="1"></div>
							      <div class="ui star rating" data-rating="3" style="float:right;"></div>
							    </a>
							  </div>
							</div>
							<script>
							$('.special.cards .image').dimmer({
								  on: 'hover'
								});
							$('.ui.rating')
							  .rating({
							    initialRating: 3,
							    maxRating: 5
							  })
							;
							</script>
						 	
						 </div>
                    </div>
                </div>
                <div class="sildercon">
                    <div style="width:223px; height: 300px; margin:-1px;">
                    	<div style="width:224px; ">
						 	
						 	<div class="ui card" style="margin:0;">
							  <div class="image" style="height:170px;">
							    <img src="/semi/resources/images/night-sky.jpg" style="height:170px;">
							  </div>
							  <div class="content" style="height:120px;">
							    <a class="header">Kristy</a>
							    <div class="meta">
							      <span class="date">Joined in 2013</span>
							    </div>
							    <div class="description">
							      Kristy is an art director living in New York.
							    </div>
							  </div>
							  <div class="extra content">
							    <a>
							      <i class="ui" style="height:33px;"></i>
							      <div class="ui heart rating" data-rating="1" data-max-rating="1"></div>
							      <div class="ui star rating" data-rating="3" style="float:right;"></div>
							    </a>
							  </div>
							</div>
							<script>
							$('.special.cards .image').dimmer({
								  on: 'hover'
								});
							$('.ui.rating')
							  .rating({
							    initialRating: 3,
							    maxRating: 5
							  })
							;
							</script>
						 	
						 </div>
                    </div>
                </div>
                <div class="sildercon1">
                    <div style="width:223px; height: 300px; margin:-1px;">
                    	<div style="width:224px; ">
						 	
						 	<div class="ui card" style="margin:0;">
							  <div class="image" style="height:170px;">
							    <img src="/semi/resources/images/night-sky.jpg" style="height:170px;">
							  </div>
							  <div class="content" style="height:120px;">
							    <a class="header">Kristy</a>
							    <div class="meta">
							      <span class="date">Joined in 2013</span>
							    </div>
							    <div class="description">
							      Kristy is an art director living in New York.
							    </div>
							  </div>
							  <div class="extra content">
							    <a>
							      <i class="ui" style="height:33px;"></i>
							      <div class="ui heart rating" data-rating="1" data-max-rating="1"></div>
							      <div class="ui star rating" data-rating="3" style="float:right;"></div>
							    </a>
							  </div>
							</div>
							<script>
							$('.special.cards .image').dimmer({
								  on: 'hover'
								});
							$('.ui.rating')
							  .rating({
							    initialRating: 3,
							    maxRating: 5
							  })
							;
							</script>
						 	
						 </div>
                    </div>
                </div>

            </div>
        </div>
		
		 
            <div class="container12">
                <div class="indexTitle1">
                    <b>TOP 카테고리 전문가 랭킹</b> 
                    <p>TMI에서 가장 많이 판매한 인기 전문가 랭킹 입니다.</p> 
                </div>
            

            <div class="slider1 clearFix">
                    <div class="rank">                
                        <div class="sheader2">
                        <div class="scontent1">
                            <p><b>웹사이트 개발</b></p>
                        </div>
 
                        <div class="first clearFix">
                            <div class="firstimg">
                                <img src="/semi/resources/images/medal.png" style="width:70px; height:90px;">
                            </div>
                            <div class="firsttext">
                                <p>총 판매 금액</p>
                                <p>20000원</p>
                                <p>아이디</p>
                            </div>
                        </div>
                        
                            <div class="scontent2">    
                                <p>2위</p>
                                <p>1000원</p>
                                <p>아이디</p>                            
                            </div>

                            <div class="scontent2">                            
                                <p>3위</p>
                                <p>1000원</p>
                                <p>아이디</p>                            
                            </div>

                            <div class="scontent2">                            
                                <p>4위</p>
                                <p>1000원</p>
                                <p>아이디</p>                        
                            </div>

                            <div class="scontent2">
                                <p>5위</p>
                                <p>1000원</p>
                                <p>아이디</p>
                            </div>
                            
                            </div>
                        
                        </div>                                
                    
                    <div class="rank">
                           <div class="sheader2">
                        <div class="scontent1">
                            <p><b>자소서/이력서</b></p>
                        </div>
 
                        <div class="first clearFix">
                            <div class="firstimg">
                                    <img src="/semi/resources/images/medal.png" style="width:70px; height:90px;">
                            </div>
                            <div class="firsttext">
                                <p>총 판매 금액</p>
                                <p>20000원</p>
                                <p>아이디</p>
                            </div>
                        </div>
                        
                            <div class="scontent2">    
                                <p>2위</p>
                                <p>1000원</p>
                                <p>아이디</p>                            
                            </div>

                            <div class="scontent2">                            
                                <p>3위</p>
                                <p>1000원</p>
                                <p>아이디</p>                            
                            </div>

                            <div class="scontent2">                            
                                <p>4위</p>
                                <p>1000원</p>
                                <p>아이디</p>                        
                            </div>

                            <div class="scontent2">
                                <p>5위</p>
                                <p>1000원</p>
                                <p>아이디</p>
                            </div>
                            
                            </div>
                        </div>

                        <div class="rank1">
                            <div class="sheader2">
                                <div class="scontent1">
                                    <p><b>푸드</b></p>
                                </div>
            
                                <div class="first clearFix">
                                    <div class="firstimg">
                                            <img src="/semi/resources/images/medal.png" style="width:70px; height:90px;">
                                    </div>
                                    <div class="firsttext">
                                        <p>총 판매 금액</p>
                                        <p>20000원</p>
                                        <p>아이디</p>
                                    </div>
                                </div>
                                
                                    <div class="scontent2">    
                                        <p>2위</p>
                                        <p>1000원</p>
                                        <p>아이디</p>                            
                                    </div>
        
                                    <div class="scontent2">                            
                                        <p>3위</p>
                                        <p>1000원</p>
                                        <p>아이디</p>                            
                                    </div>
        
                                    <div class="scontent2">                            
                                        <p>4위</p>
                                        <p>1000원</p>
                                        <p>아이디</p>                        
                                    </div>
        
                                    <div class="scontent2">
                                        <p>5위</p>
                                        <p>1000원</p>
                                        <p>아이디</p>
                                    </div>
                         </div>

                </div>
            </div>
     
		
		
		
	</div>
	</div>
</div>


<%@include file= "/views/common/footer.jsp"%>
</body>
</html>
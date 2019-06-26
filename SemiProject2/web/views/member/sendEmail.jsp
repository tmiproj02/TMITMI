<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.Properties" %>
<%@ page import = "javax.mail.Message" %>
<%@ page import = "javax.mail.MessagingException" %>
<%@ page import = "javax.mail.PasswordAuthentication" %>
<%@ page import = "javax.mail.Session" %>
<%@ page import = "javax.mail.Transport" %>
<%@ page import = "javax.mail.internet.InternetAddress" %>
<%@ page import = "javax.mail.internet.MimeMessage" %>
<%@ page import = "member.common.PasswordWrapper" %>

<% 
	final String sender = "tmicor@naver.com"; // 보내는 사람 ID (Ex: @naver.com 까지..)
	final String password = "TmiTmi123!"; // 보내는 사람 Password
	
	String receiver = request.getParameter("email"); // 받는 사용자 (Ex: @naver.com 까지..)
	
	
	// Get the session object
	Properties props = new Properties();
	props.put("mail.smtp.host", "smtp.naver.com");
	props.put("mail.smtp.auth", "true");
	
	Session ses = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(sender, password);
		}
	});
	String host = "http://192.168.20.49/semi/views/member/"; // 사이트
	String code = null; // 암호화된 인증코드 담을 변수
	String contents = "인증을 위한 인증 메일입니다. 버튼을 누르세요." + "<a href='" + host + "mailVerifyCheck.jsp?code="
				      + PasswordWrapper.getSHA512(receiver) + "&receiver=" + receiver + "'>" + "인증하기" + "</a>";
	// Compose the message
	try {
		MimeMessage message = new MimeMessage(ses);
		message.setFrom(new InternetAddress(sender));
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
	
		// sender Email Address
		message.setFrom("TMICorporation <" + sender + ">");
	
		// Subject
		message.setSubject("[인증] 회원가입을 위한 인증 메일입니다.");
	
		// Text
		message.setContent(contents,"text/html; charset=UTF-8");
		// send the message
		Transport.send(message);
	
	
	} catch (MessagingException e) {
		System.out.println("전송 실패!! ㅠㅠ");
		e.printStackTrace();
	}
	

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<title>메일전송 완료!</title>

<style>
*{
   font-family: 'Noto Sans KR', sans-serif;
}
.logo{
   width: 500px;
   text-align:center;
   margin:0 auto;
}
.section1{
   margin:0 auto;
}
.section2{
   width : 1200px;
   margin:0 auto;
   margin-top: 50px;
}
.loginDiv{
   margin:0 auto;
   position: relative; 
   padding: 15px;
}
.loginDiv>div{
   margin:0 auto;
}
.login1{
   width: 350px;
   margin: 0 auto;
   padding:20px;
}
.login2{
   width: 310px;
   margin: 0 auto;
}
.login3{
   width: 350px;
   margin: 0 auto;
   padding:20px;
}
</style>

</head>


<body>
  <div class="Wrapper" style="margin: 0 auto; border-bottom: 4px solid #BDD4F2!important;">
   <div class="logo">
      <img src="/semi/resources/images/KakaoTalk_20190606_164601739.png" style="width:125px; cursor:pointer; margin-bottom: -9px;" onclick="toMain();">   
   </div>
  </div>
   
  <div class="section1">
      <div class="section2">
         
         <div class="loginDiv">
           	<h2>인증메일 전송 완료!</h2>
            <h3>입력하신 이메일로 인증메일을 보냈습니다. 메일을 확인하시고 인증버튼을 눌러주세요.</h3>
   		 </div>
   
    
    </div>
    </div>


	<%@ include file="../common/footer.jsp" %>

</body>
<script>
	function toMain(){
		location.href="index.jsp";
		
	}

</script>

</html>
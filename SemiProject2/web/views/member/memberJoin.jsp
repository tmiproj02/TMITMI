<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.4.1.min.js"></script>
 <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>





<style>

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
.section3{
   margin:0 auto;
   padding:30px;
   position: relative; 
}
.section3>div{
   display:inline-block;
}
.join1{
  width:420px;
  border-right:2px solid #BDD4F2;
  margin-left:150px;
}
.join2{
  width:470px;
}
.email>div{
   width :300px; 
   height:40px; 
   display:inline-block;
}
.join1>form>p{
   font-size:15px;
   margin-top:14px;
   margin-bottom:3px;
   font-family: 'Noto Sans KR', sans-serif;
}
.check{
    margin-bottom: 132px;

}
input{margin-bottom: 9px;}
.term-box{
 font-family: 'Noto Sans KR', sans-serif;
   width:350px;
   height:160px;
   margin-left:15px;
   border-radius:3px;
}
   
   
</style>
<title>TMI - 회원가입 </title>
</head>


<body>
<div class="Wrapper" style="margin: 0 auto; border-bottom: 4px solid #BDD4F2!important;">
   <div class="logo">
      <img src="/semi/resources/images/KakaoTalk_20190606_164601739.png" style="width:125px; cursor:pointer; margin-bottom: -9px;" onclick="toMain();">   
   </div>
</div>

<div class="section1">
   <div class="section2">
      <div class="section3">
         <div class="join1">
            <form action="/semi/mInsert.do" method="post" onsubmit="return validate();" style="margin-top:-10px;">
            
               <p><b>이메일</b></p>
               <input type="email" name="email" id="email" style="width :268px; height:40px; display:inline-block;" required="required" placeholder="이메일을 입력해주세요" class="form-control"/>
               <input type="button" value="중복확인" id="emailDupCheckBtn" style="margin: -2px 0px 0px 7px; height:40px; background:#364559;" class="btn btn-primary"> 
               <input type="hidden" name="isSNS" id="isSNS" value="N">
               
               <p><b>비밀번호</b></p>
               <input type="password" name="userPwd" id="userPwd" style="width : 268px;  height:40px;" required="required" placeholder="비밀번호를 입력해주세요" class="form-control"/>
               
               <p><b>비밀번호 확인</b></p>
               <input type="password" name="userPwd2" id="userPwd2" style="width : 268px;  height:40px; margin-bottom:10px;" required="required" placeholder="비밀번호를 재입력해주세요" class="form-control"/>
               <label id="pwdResult" style="font-size:12px;  display:block;"></label>
               
               <p><b>이름</b></p>
               <input type="text" name="userName" style="width : 268px; height:37px;" required="required" class="form-control"/>
               
                 <p><b>주민등록번호</b></p>
                <input type="text" name="memberSSN1" id="memberSSN1" style="width :125px; height:37px; display:inline; margin-bottom:0px;" required="required" class="form-control"/>&nbsp; - &nbsp;<input type="password" name="memberSSN2" id="memberSSN2" style="width : 124px; height:37px; display:inline; margin-bottom:0px;" required="required" class="form-control"/>
                <label id="ssnResult"></label>
                
                <p><b>닉네임</b></p>
                <input type="text" name="nickName" id="nickName" class="form-control" required="required" style="width:268px;height:37px; display:inline-block;"/>
                <input type="button" value="중복확인" id="nickNameDupCheckBtn" style="margin: -2px 0px 0px 7px; height:40px; background:#364559;" class="btn btn-primary">
               <p><b>연락처</b></p>
               <input type="tel" name="phone1" required="required" style="width:77px; height:37px; display:inline;" class="form-control"/>&nbsp - &nbsp<input type="tel" name="phone2" required="required" style="width:77px; height:37px; display:inline;" class="form-control"/>&nbsp; - &nbsp;<input type="tel" name="phone3" required="required" style="width:76px; height:37px; display:inline;" class="form-control"/>
                <input type="submit" id="submitBtn" value=" 동의 후 회원 가입" class="btn btn-primary" style="text-align:center;width: 351px; height:45px; margin-left: 56px; margin-top:-10px;background:#364559;left:601px;position:absolute" disabled/> 
            </form>
            
         </div>
         <div class="join2">
            <div class="check" style="position:absolute;top:39px">
               <div class="custom-control custom-checkbox" style="margin-left:40px;font-family: 'Noto Sans KR', sans-serif;">
                  <input type="checkbox" class="custom-control-input" id="term1" onchange="isChecked();">
                   <label class="custom-control-label" for="term1">서비스 이용약관 동의 (필수)</label><br>   
                    <textarea class="term-box" readonly>국회의원과 정부는 법률안을 제출할 수 있다. 국회의 정기회는 법률이 정하는 바에 의하여 매년 1회 집회되며, 국회의 임시회는 대통령 또는 국회재적의원 4분의 1 이상의 요구에 의하여 집회된다. 국회의원은 그 지위를 남용하여 국가·공공단체 또는 기업체와의 계약이나 그 처분에 의하여 재산상의 권리·이익 또는 직위를 취득하거나 타인을 위하여 그 취득을 알선할 수 없다. 국회의원은 현행범인인 경우를 제외하고는 회기중 국회의 동의없이 체포 또는 구금되지 아니한다. 정기회의 회기는 100일을, 임시회의 회기는 30일을 초과할 수 없다. 타인의 범죄행위로 인하여 생명·신체에 대한 피해를 받은 국민은 법률이 정하는 바에 의하여 국가로부터 구조를 받을 수 있다.
                 </textarea>
                 </div>
                 
                 <div class="custom-control custom-checkbox" style="margin-left:40px;font-family: 'Noto Sans KR', sans-serif;margin-top:30px;">
                  <input type="checkbox" class="custom-control-input" id="term2" onchange="isChecked();">
                   <label class="custom-control-label" for="term2">개인정보 수집 • 이용에 대한 동의 (필수)</label>
                   <textarea class="term-box" readonly>국회의원과 정부는 법률안을 제출할 수 있다. 국회의 정기회는 법률이 정하는 바에 의하여 매년 1회 집회되며, 국회의 임시회는 대통령 또는 국회재적의원 4분의 1 이상의 요구에 의하여 집회된다. 국회의원은 그 지위를 남용하여 국가·공공단체 또는 기업체와의 계약이나 그 처분에 의하여 재산상의 권리·이익 또는 직위를 취득하거나 타인을 위하여 그 취득을 알선할 수 없다. 국회의원은 현행범인인 경우를 제외하고는 회기중 국회의 동의없이 체포 또는 구금되지 아니한다. 정기회의 회기는 100일을, 임시회의 회기는 30일을 초과할 수 없다. 타인의 범죄행위로 인하여 생명·신체에 대한 피해를 받은 국민은 법률이 정하는 바에 의하여 국가로부터 구조를 받을 수 있다.
                 </textarea>
                   </div>
                </div>
                
         </div>      
      </div>
   </div>
</div>


    
   <%@ include file="../common/footer.jsp" %>
</body>

<script>

   var emailDupCheckNum = -1;
   var nickDupCheckNum = 0;
   // SNS 가입 시 이메일 자동 채움 함수
   $(function(){
      var email = "<%=request.getParameter("email")%>";
      // 이메일 입력란 readonly처리
      if(email != 'null'){
          $('#email').attr({
             'value' : email,
             readonly : true
             
          });
          
          // 이메일 중복확인 키 무효화
          $('#emailDupCheckBtn').attr('disabled',true);
           
          $('#isSNS').attr('value','Y');
          
          // 이메일 중복확인 유효성체크
          window.emailDupCheckNum = 0;
      }
      
    });

   // 이메일 중복체크 함수
      function isDupEmail(){
         
         $.ajax({   
            url : "/semi/emailDupCheck.do",
            type : "get",
            data : {email : $("#email").val()},
            success : function(data){
               var isDup = data;
               
               if(isDup == 1){
                  alert("이미 사용 중인 이메일입니다!");
                  $('#email').val("").select();
                  window.emailDupCheckNum = 1;
                  return false;
               }else{
                  window.emailDupCheckNum = 0;
                  alert("사용 가능한 이메일입니다.");
                  return true;
               }
            },

            error : function(data){
               console.log("에러!");
               
            }
         });
      }
   
   
     // 이메일 중복체크 버튼 이벤트
      $("#emailDupCheckBtn").click(function(){
         isDupEmail();
      });
     
   // 닉네임 중복체크 버튼 이벤트
      $("#nickNameDupCheckBtn").click(function(){
         isDupNick();
      });
      
      
   
      // 닉네임 중복 체크 함수
      function isDupNick(){
    	
    	  $.ajax({
    		  url : "/semi/nickDupCheck",
    		  type : "get",
    		  data : {nickName:$('#nickName').val()},
    		  success : function(data){
    			  var isDup = data;
    		
    			  // 중복인 경우
    			  if(isDup == 1){
    				  window.nickDupCheckNum = 0;
    				   alert("이미 사용중인 닉네임입니다.");
    			  }else{
    				   alert("사용가능한 닉네임입니다.")
    				  window.nickDupCheckNum = 1;
    			
    			  }
    		  },
    		  error : function(){
    			  alert("닉네임 중복체크 ajax에러");
    		  }
    		  
    	  });
    	  
    	  
      }
      
      
      
      
      // 비밀번호 유효성 체크 정규표현식 함수(영문,숫자,특수문자 8자리 이상 20자리 이하)
      function pwdRegEx(pwd){  
         var pwdRegEx = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
      
         return pwdRegEx.test(pwd);
      }
      
      // 두 비밀번호가 같은지 체크하는 함수
      function isSamePwd(pwd1,pwd2){
         if(pwd1 == pwd2){
            return true;
         }else return false;
         
      }
      
      
      // 비밀번호 유효성체크 이벤트 함수
      $('[name^="userPwd"]').change(function(){
         var pwd1 = $('#userPwd').val();
         var pwd2 = $('#userPwd2').val();
      
         if(!isSamePwd(pwd1,pwd2)){
            $('#pwdResult').html("비밀번호가 일치하지 않습니다.").css('color','red');
         }else if(!pwdRegEx(pwd2)){
            $('#pwdResult').html("");
            $('#pwdResult').html("비밀번호는 숫자,영문 대소문자, 특수문자로 구성된<br> 8자리 이상 20자리 이하이어야 합니다.").css('color','red');
         }else{
            $('#pwdResult').html("사용 가능한 비밀번호입니다.").css('color','green');
         }
         
      });
      
      // 주민등록번호 유효성 체크 정규표현식 함수
      function ssnRegEx(ssn1,ssn2){
         // 선생님 코드
         
         //^\d{2}(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])-//
         var regEx1 = /^\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/
         var regEx2 = /^[1-4][0-9]{6}$/;
         console.log(regEx1.test(ssn1));
         console.log(regEx2.test(ssn2));
         if(regEx1.test(ssn1) && regEx2.test(ssn2)){
            $('#ssnResult').html("");
            return true;
         }else{
            $('#ssnResult').html("유효하지 않은 주민등록번호입니다.").css({
               'color': 'red',
               'font-size' : '11px'
         
            });
            return false;
         }
      }
      
      // 주민등록번호 이벤트 함수
      
      $('[name^="memberSSN"]').change(function(){
         var ssn1 = $('#memberSSN1').val();
         var ssn2 = $('#memberSSN2').val();
         
         ssnRegEx(ssn1,ssn2);
         
      });

      
      
      
      
      
  
      function validate(){
    
         // 비밀번호
         var pwd1 = $('#userPwd').val();
         var pwd2 = $('#userPwd2').val();
         // 주민등록번호 
         var ssn1 = $('#memberSSN1').val();
         var ssn2 = $('#memberSSN2').val();
         
    
         // 이메일 중복 체크
         if(emailDupCheckNum == 1){
            alert("이미 사용 중인 이메일입니다!");
            return false;
         } else if(emailDupCheckNum == -1){
            alert("이메일 중복검사를 해주세요");
            return false;
         }
   	  
   	
         // 비밀번호 체크
         if(!isSamePwd(pwd1,pwd2)){   
          alert("비밀번호가 일치하지 않습니다.");
             return false;
         }
         
         if(!pwdRegEx(pwd2)){
            alert("올바르지 않은 형식의 비밀번호입니다.");
            return false;
         }
	   	
	   
	   	  // 닉네임 중복체크
	       if(nickDupCheckNum == 0){
	      	 alert("이미 사용중인 닉네임입니다!");
	      	 return false;
	       }
         
         
         
         alert("제출시점 nickDupCheckNum :" + nickDupCHeckNum);
         // 주민등록번호 체크
         if(!ssnRegEx(ssn1,ssn2)){
            alert("올바르지 않은 형식의 주민등록번호입니다.");
            return false;
         }

         if(!$('#term1').prop('checked')|| !$('#term2').prop('checked')){
            return false;
         }
        
  
      
         
         
      }
      
      
      
      
      
      function toMain(){
         location.href = "/semi/index.jsp";
      }
      
      function isChecked(){
               if($('#term1').prop('checked') && $('#term2').prop('checked')){
                  $('#submitBtn').attr('disabled', false);
               
               }else{
                  $('#submitBtn').attr('disabled',true);      
               }
      }
      
     
     
</script>


</html>
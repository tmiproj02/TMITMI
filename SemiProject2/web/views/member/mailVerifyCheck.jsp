<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.common.PasswordWrapper"%>
<%@ page import ="member.model.dao.MemberDao"%>
<%@ page import ="member.model.service.MemberService" %>
<%@ page import ="java.io.PrintWriter" %>
<%
	// 이메일에서 보내온 암호화된 코드
	String code = request.getParameter("code");
	String edittedCode = code.replace(" ", "+");
	
	String email = request.getParameter("receiver");
	String compareCode = PasswordWrapper.getSHA512(email);
	
	
	MemberService ms = new MemberService();
	
	
	if(edittedCode.equals(compareCode)){
		
		PrintWriter script = response.getWriter();
		
		int result = ms.verifyEmail(email);
		if(result > 0){
			script.println("<script>");
			script.println("alert('인증이 완료되었습니다. 로그인하세요!')");
			script.println("location.href = '/semi/index.jsp'");
			script.println("</script>");
		
			
		}else{
			script.println("<script>");
			script.println("alert('DB상의 문제로 인증실패')");
			script.println("location.href = '/semi/index.jsp'");
			script.println("</script>");
			
		}
		
		script.close();
		
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이메일 값이 틀립니다.')");
		script.println("location.href = '/semi/index.jsp'");
		script.println("</script>");
		
		script.close();
	
	}
	
	
	
	






%>

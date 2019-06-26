package message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.ClientRequest;
import member.model.vo.Member;
import message.model.service.MessageService;
import message.model.vo.PageInfo;


@WebServlet("/messageList")
public class MessageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public MessageListServlet() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 게시판 페이징 처리하기
				// 대용량의 데이터를 한 번에 처리하지 않고
				// 특정 개수만큼 끊어서 표현하는 기술
				
				ArrayList<ClientRequest> requestList = null;
				HttpSession session = request.getSession();
				Member m = (Member)session.getAttribute("member");
				String email = m.getEmail();
				
				// 페이징 처리에 필요한 변수들 
				// 1,2,3,4,5 --> 1 
				// 6,7,8,9,10 --> 6
				// 한 번에 표시할 페이지들 중 가장 앞의 페이지
				
				int startPage;
				
				// 한 번에 표시할 페이지들 중 가장 뒤의 페이지
				int endPage;
				
				// 전체 페이지의 가장 마지막 페이지
				int maxPage;
				
				// 사용자가 위치한 현재 페이지
				int currentPage;
				
				// 총 페이지 수(한 페이지 당 보여줄 게시글 수 )
				int limit;
				
				
				// 처음 접속 시 페이지는 1페이지부터 시작한다.
				currentPage = 1;
				
				// 글 개수 및 페이지 수 10개로 제한하기
				limit = 10;
				
				
				
				// 만약에 사용자가 현재 페이지의 정보를 들고왔다면
				// 현재 페이지의 정보를 1에서 특정 페이지로 수정해주어야한다.
				
				if(request.getParameter("currentPage") != null) {
				   // 현재 사용자의 페이지 위치
				   currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
				
				
				// 페이징 처리
				// 전체 게시물 수를 가져오는 메소드. list.size()로 가져오면 너무 많은거 가져와서 느림.
				int listCount = new MessageService().getListCount(email);
				System.out.println("총 페이지 개수 : " + listCount);
				
				// 총 250개
				// 25개
				// 만약 전체 게시글 수가 13개라면
				// 페이지는 1, 2 총 2개가 나와야한다.
				// ** 짜투리 게시글도 하나의 페이지로 처리해야 한다.
				// 13 --> 1.3 --> 2(올림)
				// 11 --> 1.1 --> 2..
				// 19 --> 1.9 --> 2.8 --> 2
				
				// int로 강제형변환하면 소숫점 날라감
				maxPage = (int)((double)listCount / limit + 0.9);
				
				// 시작 페이지와 마지막 페이지 계산하기
				// 페이지 수가 1 ~ 10개   7 --> 1 / 10
				
				// 1 ~ 10(currentPage를 7로 가정) : 7     /  10 -->0.7+0.9 --> 1 -1 --> 0 *10 + 1 = 1(최종)
				// 11 ~ 20(currentPage를 19로 가정) : 19     /  10 -->1.9+0.9 --> 2.8 -1 --> 1 *10 + 1 = 11(최종)
				
			
				startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
				
				// 마지막 페이지
				// 1 ~ 10 : 10
				// 11 ~ 20 : 20
				
				endPage = startPage + limit -1;
				
				// 만약 마지막 페이지보다 현재 게시글이 끝나는 페이지가 작다면
				// 1 ~ 10 : 7 . . .
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				
				requestList = new MessageService().selectList(email,currentPage,limit);
				
				String page = "";
				
				if(requestList !=null) {
					page ="views/message/message.jsp";
					request.setAttribute("requestList", requestList);
					
					// 페이지 정보를 묶어서 보내기 위한 Vo
					PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
					
					request.setAttribute("pi",pi);
					
				}else {
					System.out.println("메시지가 없습니다");
				}
				
				request.getRequestDispatcher(page).forward(request, response);

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		doGet(request, response);
	}

}

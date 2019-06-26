package buyingctrl.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import buyingctrl.model.exception.buyingctrlException;
import buyingctrl.model.service.DealMngService;
import buyingctrl.model.vo.DealMng;
import member.model.vo.Member;

/**
 * Servlet implementation class finishedListServlet
 */
@WebServlet("/finished.bo")
public class finishedListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public finishedListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		
		ArrayList<DealMng> finList = new ArrayList<DealMng>();
		
		DealMngService dms = new DealMngService();
		
		String page="";
		
		try {
			
			finList = dms.finselectList(m);
			
			page = "views/personBUY/buyingcontrolFin.jsp";
			
			request.setAttribute("finList", finList);
			
			request.getRequestDispatcher(page).forward(request, response);
			
			
			
		} catch(buyingctrlException e) {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "요구사항이 없는 것 불러오기 에러!");
			request.setAttribute("exception", e);
			e.printStackTrace();
			
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

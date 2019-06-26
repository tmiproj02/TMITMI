package buyingctrl.model.service;

import java.sql.Connection;
import java.util.*;
import buyingctrl.model.dao.DealMngDao;
import buyingctrl.model.exception.buyingctrlException;
import buyingctrl.model.vo.DealMng;
import member.model.vo.Member;

import static member.common.JDBCTemplete.*;


public class DealMngService {

	private Connection con;
	private DealMngDao dmDao = new DealMngDao();
	
	//전체 구매 내역 조회
	public ArrayList<DealMng> nrselectList(int currentPage, int limit, Member m) throws buyingctrlException {

		con = getConnection();

		ArrayList<DealMng> nreqList = dmDao.nrqselectList(con, currentPage, limit, m);
		System.out.println("구매전체조회service : " + nreqList);
		close(con);
		
		return nreqList;
	}

	
	
	//진행중 조회
	public ArrayList<DealMng> ingselectList(Member m) throws buyingctrlException {
		ArrayList<DealMng> dingList = null;
		con = getConnection();
		try {
			dingList = dmDao.ingselectList(con, m);
			System.out.println("진행중조회service : " + dingList);

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		close(con);
		
		return dingList;
		
	}


	//거래 완료 조회
	public ArrayList<DealMng> finselectList(Member m) throws buyingctrlException {
		
		con = getConnection();
		ArrayList<DealMng> finList = dmDao.finselectList(con, m);
		System.out.println("완료리스트조회service : " + finList);
		
		close(con);
		
		return finList;
		
		
		
	}


	//거래 취소 조회
	public ArrayList<DealMng> ccselectList(Member m) throws buyingctrlException {

		con = getConnection();
		ArrayList<DealMng> ccList = dmDao.ccselectList(con, m);
		System.out.println("완료리스트조회service : " + ccList);
		
		close(con);
		
		return ccList;
	}


	//구매 전체 내역에서 검색
	public ArrayList<DealMng> searchAllList(String keyword, Member m) throws buyingctrlException {
		
		con = getConnection();
		System.out.println("keyword service : " + keyword);
		ArrayList<DealMng> nreqList = null;
		
		nreqList = dmDao.searchAllList(con, keyword, m);
		
		
		return nreqList;
		
		
		
	}


//페이징, 게시할 개수 세어보는 부분 (전체조회)
	public int getListCount(Member m) {
		con = getConnection();
		int listCount = dmDao.getListCount(con, m); //함수 실행시키고 (create method합니당~)
		
		close(con); //실행 완료됐으면
		
		return listCount; //결과를 넣어서 반환해요
	}



	public ArrayList<DealMng> selectDeal(int sno) {
		con = getConnection();
		ArrayList<DealMng> list = dmDao.selectDeal(con,sno);
		
		close(con);
		
		return list;
	}



	public int updateProgress(String progress, String dmcode) throws buyingctrlException {
		con=getConnection();
		int result = dmDao.updateProgress(con,progress,dmcode);
		
		if(result>0) commit(con);
		else rollback(con);
		
		return result;
		
		
	}



	public void dealComplete(int mno, int bno, int sno,int cp) {
		con = getConnection();
		try {
			dmDao.dealComplete(mno,bno,sno,con,cp);
			dmDao.makeIncome(bno,sno,cp,con);
			dmDao.makeIncomeToSeller(sno,cp,con);
			
			commit(con);
		}
		catch(Exception e) {
			rollback(con);
			e.printStackTrace();
		}
		
		
		
	}

	
}

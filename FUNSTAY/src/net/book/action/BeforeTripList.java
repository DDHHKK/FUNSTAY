package net.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.book.controller.Action;
import net.book.controller.ActionForward;
import net.book.db.BookBean;
import net.book.db.BookDAO;

public class BeforeTripList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BeforeTripList execute()");
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		
		//home_num파라미터 가져오기
		
		int home_num=Integer.parseInt(request.getParameter("home_num"));
		
		BookDAO bdao=new BookDAO();
		BookBean bb=bdao.GetBeforeTrip(home_num);
				
        //request 저장 bb
		request.setAttribute("bb", bb);
				
		ActionForward forward=new ActionForward();
		//이동./myinfo/my_reserve.jsp
		forward.setRedirect(false); 
		forward.setPath("./myinfo/my_reserve.jsp");//포워딩 경로 설정
				
		return forward;
		
		
		
		
		
		
		
	}
	

}

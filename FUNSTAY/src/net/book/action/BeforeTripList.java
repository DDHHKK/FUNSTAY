package net.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.controller.Action;
import net.book.controller.ActionForward;
import net.book.db.BookDAO;

public class BeforeTripList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BeforeTripList execute()");
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		
		BookDAO bdao=new BookDAO();
		
		ActionForward forward=new ActionForward();
		return null;
	}
	

}

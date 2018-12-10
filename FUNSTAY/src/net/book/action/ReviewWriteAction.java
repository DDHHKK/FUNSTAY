package net.book.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.controller.Action;
import net.book.controller.ActionForward;
import net.book.db.ReviewBean;
import net.book.db.BookDAO;

public class ReviewWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewWriteAction execute()");
		//request �븳湲�泥섎━
		request.setCharacterEncoding("utf-8");
		
		//ReviewBean bb媛앹껜�깮�꽦
		ReviewBean bb=new ReviewBean();
		
	    bb.setPayment_num(request.getParameter("payment_num"));
		bb.setContent(request.getParameter("content"));
		bb.setSatisfaction(request.getParameter("satisfaction"));
		bb.setClean(request.getParameter("clean"));
		bb.setAccess(request.getParameter("access"));
		bb.setMember_email(request.getParameter("member_email"));
		bb.setHome_num(Integer.parseInt(request.getParameter("home_num")));
		System.out.println(bb.getPayment_num());
		System.out.println(bb.getAccess());
		
		//BookDAO bdao媛앹껜�깮�꽦
		BookDAO bdao=new BookDAO();
		//硫붿꽌�뱶�샇異� insertReview(�뤌�뙆�씪誘명꽣 ���옣�맂 �옄諛붾퉰 二쇱냼)
		bdao.insertReview(bb);
		//�씠�룞  ./ReviewList.bo
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./room_info/subpage.jsp");
		return forward;
	}
	

}

















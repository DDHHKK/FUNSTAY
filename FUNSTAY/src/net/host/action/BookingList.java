package net.host.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.booking.db.BookingBean;
import net.booking.db.BookingDAO;
import net.booking.db.PaymentBean;

public class BookingList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BookingList execute()");
		int room_num = 1;//Integer.parseInt(request.getParameter("room_num"));

		BookingDAO bdao = new BookingDAO();
		Vector<?> vector = bdao.getBookingList(room_num);
	
		List<BookingBean> bookinglist = (List<BookingBean>) vector.get(0);
		List<PaymentBean> paymentlist=(List<PaymentBean>) vector.get(1);
		
		request.setAttribute("bookinglist", bookinglist);
		request.setAttribute("paymentlist", paymentlist);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./host/host_book_check.jsp");
		return forward;
	}

}

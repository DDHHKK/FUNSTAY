package net.wishlist.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.wishlist.db.WishlistBean;
import net.wishlist.db.WishlistDAO;

public class AddWishlist implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("AddWishlist execute()");
		request.setCharacterEncoding("utf-8");
		String list_name = (String)request.getParameter("list_name");
		String list_photo = (String)request.getParameter("list_photo");
		HttpSession session = request.getSession();
		String member_email = (String)session.getAttribute("email");
		WishlistDAO wdao = new WishlistDAO();
		int count = wdao.CountWishlist(member_email);
		ActionForward af = new ActionForward();
		af.setRedirect(true);
		if(count>=12)
		{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('최대 항목입니다. 리스트를 제거 후 다시 시도 바랍니다.');");
				out.println("location.href='./Wishlist.wi'");
				out.println("</script>");
				out.close();
		}
		else
		{
			WishlistBean wb = new WishlistBean();
			wb.setList_name(list_name);
			wb.setMember_email(member_email);
			wb.setList_photo(list_photo);
			
			wdao.addWishList(wb);
			
			af.setPath("./Wishlist.wi");
			
		}
		return af;
	}

}

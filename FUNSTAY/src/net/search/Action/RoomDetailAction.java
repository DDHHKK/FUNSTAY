package net.search.Action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.search.controller.Action;
import net.search.controller.ActionForward;
import net.search.db.SearchBean;
import net.search.db.SearchDAO;



public class RoomDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RoomDetailAction execute()");
		request.setCharacterEncoding("UTF-8");
//-----------------------------------------------
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		SearchDAO bdao = new SearchDAO();
		bdao.updateReadcount(num); 
		SearchBean sc= bdao.getSearchboard(num);
		
		request.setAttribute("sc", sc);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		
		
//-----------------------------------------------
		ActionForward forward = new ActionForward();
		forward.setPath("./RoomDetailAction.sc");
		forward.setRedirect(false);

		return forward;
	}	
}

package net.FAQ.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.FAQ.controller.Action;
import net.FAQ.controller.ActionForward;
import net.FAQ.db.FAQBean;
import net.FAQ.db.FAQDAO;


public class FAQ_boardDeleteAction implements Action{



	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FAQ_boardDeleteAction execute()");
		request.setCharacterEncoding("UTF-8");
//-----------------------------------------------
		int num = Integer.parseInt(request.getParameter("num"));
	
		FAQDAO bdao = new FAQDAO();
		bdao.FAQ_boardDelete(num);
	

		
//-----------------------------------------------
		ActionForward forward = new ActionForward();
		forward.setPath("./FAQ_boardList.fa");
		forward.setRedirect(true);

		return forward;
	}	
}
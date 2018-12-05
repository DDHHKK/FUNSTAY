package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		String pass = (String)session.getAttribute("pass");
		
		
		return null;
	}
	
}

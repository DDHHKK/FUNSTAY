package net.host.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class HostPassCheckAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("HostPassCheckAction execute()");
		
				
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		String pass = request.getParameter("pass");
		

		
		ActionForward forward = null;
		MemberDAO mdao = new MemberDAO();
		int check = mdao.userCheck(email, pass);
		
		if (check == 1) {
			
			forward = new ActionForward();
			forward.setPath("./HostRoomList.ho");
			forward.setRedirect(true);
			return forward;

		} else if (check == 0) {
			// check == 0 비밀번호 오류. 뒤로 이동.

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호 오류');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;

		} else {
			// check == -1 아이디없음.

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 없음');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;

		}
		
	}
	
	

}

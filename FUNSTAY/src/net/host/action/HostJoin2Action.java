package net.host.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class HostJoin2Action implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HostJoin2Action execute()");
		
		request.setCharacterEncoding("utf-8");
			

		String room_subject=request.getParameter("room_subject");
		String room_content=request.getParameter("room_content");
		String restroom=request.getParameter("restroom");
		String price=request.getParameter("price");
		String start_date=request.getParameter("start_date");
		String end_date=request.getParameter("end_date");
		String address=request.getParameter("address");
		String in_time=request.getParameter("in_time");
		String out_time=request.getParameter("out_time");
		String room_type=request.getParameter("room_type");
		String convenience=request.getParameter("convenience");
	
		
		request.setAttribute("room_subject",room_subject);
		request.setAttribute("room_content",room_content);
		request.setAttribute("restroom",restroom);
		request.setAttribute("price",price);
		request.setAttribute("start_date",start_date);
		request.setAttribute("end_date",end_date);
		request.setAttribute("address",address);
		request.setAttribute("in_time",in_time);
		request.setAttribute("out_time",out_time);
		request.setAttribute("room_type",room_type);
		request.setAttribute("convenience",convenience);
		

							
		String photo1=request.getParameter("photo1");
		String photo2=request.getParameter("photo2");
		String photo3=request.getParameter("photo3");
		String photo4=request.getParameter("photo4");
		String photo5=request.getParameter("photo5");
		
			
		
		request.setAttribute("photo1",photo1);
		request.setAttribute("photo2",photo2);
		request.setAttribute("photo3",photo3);
		request.setAttribute("photo4",photo4);
		request.setAttribute("photo5",photo5);
		
	


		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./host/host_join3.jsp");
		return forward;
	}

}

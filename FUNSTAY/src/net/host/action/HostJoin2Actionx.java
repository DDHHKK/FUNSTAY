package net.host.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;






public class HostJoin2Actionx implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HostJoin2Action execute()");
		
		request.setCharacterEncoding("utf-8");
		

		String room_subject=request.getParameter("room_subject");
		String room_content=request.getParameter("room_content");
		int restroom=Integer.parseInt(request.getParameter("restroom"));
		int price=Integer.parseInt(request.getParameter("price"));
		String address=request.getParameter("address");
		String start_date=request.getParameter("start_date");
		String end_date=request.getParameter("end_date");
		//String[] convenience=request.getParameterValues("convenience");
		String in_time=request.getParameter("in_time");
		String out_time=request.getParameter("out_time");
		String room_type=request.getParameter("room_type");
		String photo=request.getParameter("photo");
		int max_people=Integer.parseInt(request.getParameter("max_people"));

		
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
		//request.setAttribute("convenience",convenience);
		request.setAttribute("max_people",max_people);
		request.setAttribute("photo",photo);
	

		
	


		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./host/host_join3.jsp");
		return forward;
	}

}

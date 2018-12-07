package net.book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.book.action.BeforeTripList;
import net.book.action.ReviewWriteAction;



public class BookFrontController extends HttpServlet {
	// 서버 시작
	// 브라우저 가상주소  http://localhost:8080/Funstay2/BeforeTripList.bk
	
	protected void doProcess(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		System.out.println("BookFrontController doProcess()메서드");
		//가상주소 뽑아오기
		// URI 주소 뽑아오기                 /Funstay2/BeforeTripList.bk
		String requestURI=request.getRequestURI();
		System.out.println(requestURI);
		// 프로젝트경로  Context 경로    /Funstay2
		String contextPath=request.getContextPath();
		System.out.println(contextPath);
		System.out.println("Context 길이 : "+contextPath.length());
		// requestURI 에서  Context 길이 부터 끝까지 문자열 뽑아오기
		//                        /BeforeTripList.bk
		String command=requestURI.substring(contextPath.length());
		System.out.println(command);
		//가상주소 비교하기  
		// 뽑아온 가상의 주소    "/BeforeTripList.bk" 비교
		// 일치하면   ./myinfo/my_reserve.jsp 이동
		ActionForward forward=null;
		Action action=null;
		if(command.equals("/ReviewWrite.bk")){
			
			forward=new ActionForward();
			forward.setRedirect(false);   //  true/false
			forward.setPath("./myinfo/reviewWrite.jsp");
		}else if(command.equals("/ReviewWriteAction.bk")){
			action=new ReviewWriteAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
		}else if(command.equals("/MyReserve.bk")){
			action=new BeforeTripList();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
			
		}else if(command.equals("/ReserveCancel.bk")){
			forward=new ActionForward();
			forward.setRedirect(false);   //  true/false
			forward.setPath("./myinfo/reserveCancel.jsp");
		}
		
		//이동
		if(forward!=null){//forward정보가 있으면
			if(forward.isRedirect()){
				//true면 sendRedirect()가 동작.
				response.sendRedirect(forward.getPath());
			}else{
				//false면 forward()가 동작.
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
					
		}

		
		
		
		
		
      }//doProcess메서드 끝

	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
		
	}
	  
	
	
	
	
	
	
	
	
	

}//BookFrontController클래스 끝




























package net.book.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;





public class BookDAO {
	
	//디비연결 메서드
	private Connection getConnection() throws Exception{
		
		//p443
		//커넥션 풀 (Connection Pool)
		//프로그램 설치 Java Naming DI API
		//DBCP API
		
		//tomcat-dbcp.jar 설치
		//1. WebContent/META-INF/context.xml
		//2. WebContent/WEB-INF/web.xml
		
		Connection con=null;
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		return con;
		
	}
	
	
	//리뷰 작성 메서드(sql-insert문)
	public void insertReview(ReviewBean bb){
		
		Connection con=null;
	    PreparedStatement pstmt=null;
	    ResultSet rs=null;
	    
	    
	    
		 try{
			    //1,2단계 디비연결하는 메서드 호출
				con=getConnection();
				 //3단계 sql 구문
				String sql="insert into review values(?,?,now(),?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				//System.out.println(bb.getPayment_num());
				pstmt.setString(1,bb.getPayment_num()); //payment_num 			
				pstmt.setString(2,bb.getContent());//content
			    pstmt.setInt(3,bb.getSatisfaction());//satisfaction
				pstmt.setInt(4,bb.getClean());//clean
				pstmt.setInt(5,bb.getAccess());//access
				pstmt.setString(6,bb.getMember_email());//member_email
				pstmt.setInt(7,bb.getHome_num());//home_num

                //4단계 실행
				pstmt.executeUpdate(); 
				
				
		 }catch(Exception e){
			 e.printStackTrace();
		 }finally{
			 //try안에서 예외 발생여부 상관없이 마무리 작업함.
			 //객체 생성해서 사용한 기억공간 없애줌 .close()
			 if(rs!=null) try{rs.close();}catch(SQLException ex){}
			 if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			 if(con!=null) try{con.close();}catch(SQLException ex){}
			 
		 }
		 
	}//리뷰 작성 메서드 끝
	
	
	
	
	
	//완료된 숙소 가져오는 메서드(sql-select문)
    public BookBean GetBeforeTrip(int home_num){
		
		Connection con=null;
	    PreparedStatement pstmt=null;	
	    ResultSet rs=null;
	    
	    BookBean bb=new BookBean();
		
		try{
			//1,2단계 메서드 호출
			con=getConnection();
                
				String sql="select room_subject from home where home_num=?";
				
		        pstmt=con.prepareStatement(sql);//객체생성
		        pstmt.setInt(1,home_num);
		        
		        rs=pstmt.executeQuery();
		        
		        //5단계 저장된 결과
		        
		        if(rs.next()){ 
					//첫 행 이동 열접근해서

					bb.setHome_num(rs.getInt(1));//home_num
					bb.setHost_email(rs.getString(2));//host_email
					bb.setAddress(rs.getString(3));//address
					bb.setRoom_type(rs.getString(4));//room_type
					bb.setPhoto(rs.getString(5));//photo
					bb.setRoom_subject(rs.getString(6));//room_subject
					bb.setRoom_content(rs.getString(7));//room_content
				/*	bb.setRe_lev(rs.getInt(8));//restroom
					bb.setRe_seq(rs.getInt(9));//in_time
					bb.setReadcount(rs.getInt(10));//out_time
					bb.setDate(rs.getDate(11));//start_date   end_date  apply_date  price  home_status
*/					
				}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					 if(rs!=null) try{rs.close();}catch(SQLException ex){}
					 if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
					 if(con!=null) try{con.close();}catch(SQLException ex){}
				}
				return bb;
		
		
	}//완료된 숙소 가져오는 메서드 끝
    

	

}//BookDAO 클래스 끝













































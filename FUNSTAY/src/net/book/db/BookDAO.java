package net.book.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.booking.db.BookingBean;
import net.booking.db.PaymentBean;
import net.host.db.HostBean;





public class BookDAO {
	
	//�뵒鍮꾩뿰寃� 硫붿꽌�뱶
	private Connection getConnection() throws Exception{
		
		//p443
		//而ㅻ꽖�뀡 �� (Connection Pool)
		//�봽濡쒓렇�옩 �꽕移� Java Naming DI API
		//DBCP API
		
		//tomcat-dbcp.jar �꽕移�
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
			    //1,2�떒怨� �뵒鍮꾩뿰寃고븯�뒗 硫붿꽌�뱶 �샇異�
				con=getConnection();
				 //3�떒怨� sql 援щЦ
				String sql="insert into review values(?,?,now(),?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				//System.out.println(bb.getPayment_num());
				pstmt.setString(1,bb.getPayment_num()); //payment_num 			
				pstmt.setString(2,bb.getContent());//content
			    pstmt.setString(3,bb.getSatisfaction());//satisfaction
				pstmt.setString(4,bb.getClean());//clean
				pstmt.setString(5,bb.getAccess());//access
				pstmt.setString(6,bb.getMember_email());//member_email
				pstmt.setInt(7,bb.getHome_num());//home_num

                //4�떒怨� �떎�뻾
				pstmt.executeUpdate(); 
				
				
		 }catch(Exception e){
			 e.printStackTrace();
		 }finally{
			 //try�븞�뿉�꽌 �삁�쇅 諛쒖깮�뿬遺� �긽愿��뾾�씠 留덈Т由� �옉�뾽�븿.
			 //媛앹껜 �깮�꽦�빐�꽌 �궗�슜�븳 湲곗뼲怨듦컙 �뾾�븷以� .close()
			 if(rs!=null) try{rs.close();}catch(SQLException ex){}
			 if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			 if(con!=null) try{con.close();}catch(SQLException ex){}
			 
		 }
		 
	}//리뷰작성 메서드 끝
	
	
	
	
	
	//완료된 숙소 가져오는 메서드(sql-select臾�)
    public Vector<?> GetBeforeTrip(String member_email){
		List bookingList=new ArrayList<>();
		List paymentList=new ArrayList<>();
		List hostList=new ArrayList<>();
    	Vector vector=new Vector<>();
		
		Connection con=null;
	    PreparedStatement pstmt=null;	
	    ResultSet rs=null;
	    
		try{
			//1,2�떒怨� 硫붿꽌�뱶 �샇異�
			con=getConnection();
                
                   String sql2="select distinct h.room_subject,b.check_in, b.check_out,p.sum_price from home h, payment p , booking b "
                   		+ "where p.member_email=? and b.payment_num=p.payment_num and b.home_num=h.home_num and b.check_in<now()";
                   
                   pstmt=con.prepareStatement(sql2);//媛앹껜�깮�꽦
   		           pstmt.setString(1,member_email);
   		          
   		           rs=pstmt.executeQuery();
   		           

   		        while(rs.next()){ 
					//첫 행 이동 열접근해서

   		        	HostBean hb=new HostBean();
   		        	PaymentBean pb=new PaymentBean();
   		        	BookingBean bb=new BookingBean();
   		        	
   		        	bb.setCheck_in(rs.getDate("check_in"));
   		        	bb.setCheck_out(rs.getDate("check_out"));
   		        	hb.setRoom_subject(rs.getString("room_subject"));
   		        	pb.setSum_price(rs.getInt("sum_price"));
   		        	
   		        	bookingList.add(bb);
   		        	paymentList.add(pb);
   		        	hostList.add(hb);
   		        
				}
   		        vector.add(bookingList);
   		        vector.add(paymentList);
   		        vector.add(hostList);
   		        
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					 if(rs!=null) try{rs.close();}catch(SQLException ex){}
					 if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
					 if(con!=null) try{con.close();}catch(SQLException ex){}
				}
				
		return vector;
		
	}//완료된 숙소 가져오는 메서드 끝
    
    
    
  //예약취소 메서드(sql-update문)
  	public void BillCancel(BookingBean bb,PaymentBean pb){
  		
  		Connection con=null;
  	    PreparedStatement pstmt=null;
  	    ResultSet rs=null;
  	    
  	    
  	    
  		 try{
  			    //1,2단계 디비연결하는 메서드 호출
  				con=getConnection();
  			    //3단계
  				String sql="update booking set booking_status=? where booking_num=?";
  				pstmt=con.prepareStatement(sql);
  				
  				pstmt.setInt(1, 0);
  				pstmt.setInt(2, bb.getBooking_num());
  				
  			    //4단계 실행
  				pstmt.executeUpdate(); 
  				
  				
  			    //3단계
  				sql="update payment set payment_status=? where payment_num=?";
  				pstmt=con.prepareStatement(sql);
  				
  				pstmt.setString(1, "결제취소");
  				pstmt.setString(2, pb.getPayment_num());
  				
  			    //4단계 실행
  				pstmt.executeUpdate(); 
  				
  				
  				
  				
  		 }catch(Exception e){
  			 e.printStackTrace();
  		 }finally{
  			
  			 if(rs!=null) try{rs.close();}catch(SQLException ex){}
  			 if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
  			 if(con!=null) try{con.close();}catch(SQLException ex){}
  			 
  		 }
  		 
  	}//예약취소 메서드 끝
    

	

}//BookDAO 끝













































<%@page import="net.book.db.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		
<%
	ReviewBean bb= (ReviewBean)request.getAttribute("bb");
	int num = ((Integer) request.getAttribute("num")).intValue();
%>


	<div id="room_review">
<a name="후기"><h1>후기 280개(평균 평점 ★★★★★) </h1></a>
<a href="./ReviewWrite.bk"><h2 align="right">후기쓰기</h2></a>
<table id="" border="1">
<tr><th class="" rowspan="4"><img src="./img/user.png" alt="img02"></th>
	<th class=""><%=bb.getPayment_num() %></th>
    <th class=""><%=bb.getMember_email() %></th>
    <th class=""><%=bb.getHome_num() %></th>
    <tr><th  class="" colspan="3"><%=bb.getContent() %></th></tr>
    <tr><th  class="" colspan="3"><%=bb.getAccess()%></th></tr>
    <tr><th class="" colspan="3"><%=bb.getClean() %></th></tr>  
    <tr><th class="" colspan="3"><%=bb.getSatisfaction() %></th></tr>  
</table>
<br><br><br><br><br><br><br>
	</div>
</body>


</html>
<%@page import="net.host.db.HostBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico"> 
<title>FunStay</title>
<!-- 페이지 default 링크 시작 -->
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<link href="./css/default/login.css" rel="stylesheet">
<link href="./css/default/default.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="./css/default/subpage_content.css" rel="stylesheet">
<link href="./css/default/subpage.css" rel="stylesheet">
<script src="./js/default/jquery-3.3.1.js"></script>
<!-- 페이지 default 링크 끝-->



<link href="./css/host/host_page.css" rel="stylesheet"> 
<link href="./css/host/component.css" rel="stylesheet"> 
<link href="./css/host/com_default.css" rel="stylesheet"> 

<script src="./js/host/modernizr.custom.js"></script>

</head>

<body>

<!-- header  시작-->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header  끝-->

<hr>


<!-- 회원 관리 페이지 왼쪽메뉴바 시작 -->
<jsp:include page="../include/subpage.jsp"></jsp:include>
<!-- 회원 관리 페이지 왼쪽메뉴바 끝 -->


<!-- 각 페이지 내용을  content 영역 안에 배치 해주세요.-->
<div id="content" style="display: block;">

<%
int home_status=1;
List hostHome=(List)request.getAttribute("hostHome");
home_status = (Integer)session.getAttribute("home_status");

HostBean hb=new HostBean();

%>

<!-- 여기서부터 페이지 내용을 적어주세요. -->

<h1>내 숙소관리</h1>
 


 
 <table class="grid cs-style-3">
 

    <%
    if(hb.getHome_status()==1){
    
    for(int i=0; i<hostHome.size(); i++){
	 hb=(HostBean)hostHome.get(i);
	 
	 if(i%3==0) { %>
	  <tr> <% } %>
	  

  
<td><figure><img src="./upload/<%=hb.getPhoto().split(",")[0]%>" width="300" height="300"> 
	<figcaption>

<<<<<<< HEAD
		<img src="./img/icon/paper.png" width="50px" height="50px" onclick="">
		<img src="./img/icon/pen.png" width="50px" height="50px"  onclick="">
		<img src="./img/icon/basket.png" width="50px" height="50px" onclick="">
=======
		<a href="./room_info"><img src="./img/icon/paper.png" width="45px" height="45px"></a>
		<a href="./room_info"><img src="./img/icon/calendar.png" width="45px" height="45px"></a>
		<a href="./HostModify.ho?home_num=<%=hb.getHome_num()%>"><img src="./img/icon/pen.png" width="45px" height="45px"></a>
		<a href="./HostDelete.ho?home_num=<%=hb.getHome_num()%>" onclick="fun1()"><img src="./img/icon/basket.png" width="45px" height="45px"></a>
>>>>>>> branch 'master' of https://github.com/DDHHKK/FUNSTAY.git
	</figcaption></figure></td>


<% if(i%3==2) { %>
</tr> 
  <% } } }%> 

 </table> 




</div>
<script src="./js/host/toucheffects.js"></script>




  
  
  
  

<!-- content 영역 끝 -->  





<script>

function fun1() {
	r=confirm ("정말 숙소를 삭제하시겠습니까?");
		
	if(r==true){
		//삭제액션으로 가기
		location.href="/HostDeleteAction.ho";
	
	}else if(r==false) {
		alert("취소되었습니다.");
		history.go(-1);
		
	}
	return false;
}

</script>



<!-- 페이지내용 끝 -->
</div><!-- 회원 관리 페이지 'subpage' include된 페이지의 div끝 !!지우지마세요!!-->
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>
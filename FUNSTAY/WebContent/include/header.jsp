<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<script src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript">
   //인원 텍스트창을 클릭하면 스크롤바가 내려온다 
$(document).ready(function(){
	$("img_1_WS").click(function(){
		$(this).next().slideToggle('slow');
	});
});    
</script>
<script type="text/javascript">
	function abc111(){
	var search_info = document.getElementById("text_1_WS").value;
	location.href='./MemberSearchAction2.me?search_info='+search_info;
	return;
}
	
</script>
<!-- 로그인/회원가입 버튼/달력 -->
<script src="js/login.js"></script>

<!-- id값을 가져오기 위해 객체생성 -->
<%MemberDAO md = new MemberDAO();
MemberBean mb = new MemberBean(); 
String email = (String)session.getAttribute("email");
mb=md.getMember(email);
int hostCheck = 0;
hostCheck = (int)session.getAttribute("hostCheck");
%>
<section class="sec01_WS">
<table>
<tr>
<td id="pont1_WS"><a href="./Main.me">FUNSTAY</a></td>
<td><input type="text" id="text_1_WS" name="search_info" placeholder="검색할 내용을 적으세요">
<input type="button" value="검색" id="btn_1_WS" onclick="abc111()"></td>
<td><a href="./HostMain.ho">호스트로 등록해보세요</a></td>
<td><a href="./FAQ_boardList.fa">FAQ</a></td>

<!-- email값이 null이면 로그인과 회원가입이 보이고  null이아니면 사진창이뜨면서 회원닉네임과함께 문구가뜬다 -->
<%

if(email==null){
	%>
<td><button class="btn_remove" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">로그인</button>
<%
}else{
	%>
	<td><a href="javascript:void(0)" onclick="document.getElementById('light1').style.display='block';document.getElementById('fade1').style.display='block'"><img src="./img/<%=mb.getProfile_photo()%>" id="img_1_WS"></a>
 <div id="light1" class="white_content_1">
  <div>
  <ul id="list_1_WS">
	<li><a href="./MemberUpdate.me">프로필수정</a></li>
	<li><a href="./Booking.bo">예약및 결제하기</a></li>
	<li><a href="./MyReserve.bk">MY RESERVE</a></li>
	<li><a href="./Wishlist.wi">위시리스트</a></li>
	<li><a href="./MemberMileage.me">마일리지</a></li>
	<li><a href="./MemberQNAlist.me">문의하기</a></li>
	<%
	}if(email.equals("admin")){
	%>
	
	<li><a href="./MemberListAction.me">회원목록</a></li>
	<li><a href="./FAQ_boardList.fa">FAQ 관리</a></li>	
	<% }	
	else if(hostCheck==1){%>
	
	<li><a href="./HostPassCheckAction.ho">숙소 정보 수정</a></li>
	<li><a href="#">숙소 삭제(없음)</a></li>
	<li><a href="#">예약 관리(없음)</a></li>
	<li><a href="./HostCash.ho">MY CASH</a></li>
	<%} %>
	
	<li><a href="./MemberLogout2.me">로그아웃</a></li>
  </ul>
  </div>
  <a href="javascript:void(0)" onclick="document.getElementById('light1').style.display='none';document.getElementById('fade1').style.display='none'"><p id="font_2_WS">닫기</p></a>
  </div>
  <div id="fade1" class="black_overlay_1"></div>
</td>
<%mb=md.getMember(email);%>
<td><%=mb.getName()%>님 반갑습니다!</td>


<!-- 로그인 -->
<div id="id01" class="modal">
  <form class="modal-content animate" action="./MemberLoginAction2.me" method="post">
  <!-- 닫기버튼 스타일 -->
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
  <!-- 로고스타일 -->    
      <div id="logo_sh">FUNSTAY</div>
    </div>
    <div class="container">
     <div class="join_box">
  <!-- 이메일(아이디)입력 폼 -->   
      <label for="uname"><b>ID</b></label>
      <input type="text" placeholder="ID를 email형식으로 입력 해주세요" name="email" required>
  <!-- 비밀번호 입력 폼 -->
      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Password를 입력하세요" name="pass" id="myInput" required>
      </div>
  <!-- caps lock -->
     <p id="text">WARNING! Caps lock is ON.</p> 
  <!-- 전송버튼 -->     
      <button type="submit" class="subtn"><a>로그인</a></button>
  <!-- 아이디저장  --> 
      <label>
        <input type="checkbox" checked="checked" name="remember"> ID기억하기
      </label>
  <!-- 비밀번호 찾기 -->    
      <span class="psw"><a href="#">패스워드를 잊어버리셨나요?</a></span>
    </div>

<!-- 취소버튼 사용유무    
<div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" 
      class="cancelbtn">Cancel</button> 
    </div> -->
  </form>
</div>
</td>




<%
if(session.getAttribute("email")==null){
	%>
<td><button class="btn_remove" onclick="document.getElementById('id02').style.display='block'" style="width:auto;">회원가입</button>
<% 
}
%>
<!-- 회원가입 -->
<div id="id02" class="modal">
  <form class="modal-content animate" action="./MemberJoinAction2.me" method="post">
  <!-- 닫기버튼 -->
    <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
  <!-- logo style -->    
      <div id="logo_sh">FUNSTAY</div>
    </div>

    <div class="container">
    <div class="join_box">
<!-- 이메일(아이디)입력 폼 -->    
      <i class="fa fa-envelope icon"></i>
      <label for="email"><b>ID</b></label>
      <input type="text" placeholder="ID를 email형식으로 입력 해주세요" name="email" required>
<!-- 비밀번호 입력 폼 -->      
<i class="fa fa-key icon"></i>
      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Password 입력 해주세요" name="pass" id="myInput1" required>
<!-- 비밀번호 보이게 -->
      <input type="checkbox" onclick="myFunction()" id="chb_WS">Password 보기<br>
<!-- 비밀번호 확인 폼-->
<i class="fa fa-key icon"></i>
      <label for="psw-repeat"><b>Password 재확인</b></label>
      <input type="password" placeholder="Password 다시 한번더 입력 해주세요" name="psw-repeat" required>
      <!-- 이름 폼 -->      
<i class="fa fa-drivers-license"></i>
      <label for="name"><b>이름</b></label>
      <input type="text" placeholder="이름을 입력해주세요" name="name" id="myname" required>    
<!-- 생년월일 폼 -->      
<i class="fa fa-heart icon"></i>
      <label for="birth"><b>생년월일</b></label><br> 
      <input type="text" name="birth_yy" class="birth" placeholder="ex) 2018"required> 

      <input type="text" name="birth_mm" class="birth" placeholder="01"required>

      <input type="text" name="birth_dd" class="birth" placeholder="01" required><br>  
<!-- 폰번호 폼 -->      
<i class="fa fa-phone icon"></i>
      <label for="phone"><b>전화번호</b></label>
      <input type="text" placeholder="전화번호를 입력 해주세요" name="phone" required><br>   
      
<!-- 아이디저장일단 주석(회원가입은 자동 저장이 필요없으므로) -->
      <!--<label>
        <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> 자동저장
      </label>-->
<!-- 약관동의 -->
      <p>계정을 생성하면 이용약관 및 개인정보 보호 정책에 동의하게 됩니다 <a href="#" style="color:dodgerblue"><br>동의약관</a>.</p>
<!-- 전송버튼 -->
      <div class="clearfix">
        <button type="submit" class="subtn"><a>가입완료</a></button>
        </div>
<!-- 취소버튼 사용 유무        
<div class="container" style="background-color:#f1f1f1">
<button type="button" onclick="document.getElementById('id02').style.display='none'" 
 class="cancelbtn">Cancel</button>  -->
      </div>
    </div>
  </form>
</div>
</td>
</tr>
</table>

</section>


</header>















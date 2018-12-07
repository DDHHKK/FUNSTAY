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
<td><button class="btn_remove" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">로그인</button></td>
<td><button class="btn_remove" onclick="document.getElementById('id02').style.display='block'" style="width:auto;">회원가입</button></
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
	int hostCheck = 0;
	hostCheck = (int)session.getAttribute("hostCheck");
	if(email.equals("admin")){
	%>
	
	<li><a href="./MemberListAction.me">회원목록</a></li>
	<li><a href="./FAQ_boardList.fa">FAQ 관리</a></li>	
	<% }	
	else if(hostCheck==1){%>
	
	<li><a href="./HostPassCheckAction.ho">숙소 정보 수정</a></li>
	<li><a href="#">숙소 삭제(없음)</a></li>
	<li><a href="#">예약 관리(없음)</a></li>
	<li><a href="./HostCash.ho">MY CASH</a></li>
	<%} 
	}
	%>
	
	<li><a href="./MemberLogout.me">로그아웃</a></li>
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
<div class="modal_sh">
  <form class="modal-content animate" action="./MemberLoginAction.me" method="post">
  <!-- 닫기버튼 스타일 -->
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
  <!-- 로고스타일 -->    
      <div id="logo_sh">FUNSTAY</div>
    </div>
    <div class="container">
     <div class="join_box">
  <!-- 이메일(아이디)입력 폼 -->   
      <label for="email"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="email" required>
  <!-- 비밀번호 입력 폼 -->
      <label for="pass"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="pass" id="myInput" required>
      </div>
  <!-- caps lock -->
     <p id="caps">WARNING! Caps lock is ON.</p> 
  <!-- SNS -->
      <div id="col_box">   
	  <div class="col">
       <!--  <a href="#" class="sns_btn naver">
          <i class="fa fa-twitter fa-fw"></i>Naver</a> -->
<!-- 카카오 연동 로그인 -->
  
<!-- <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<a id="kakao-login-btn"></a>
	<a href="http://developers.kakao.com/logout"></a>
	<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('5bd0699811ddfc0b8ef260a07e7c9163');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
    </script> -->
       
      </div><!-- //col -->
      <div class="col">
<!--         <a href="#" class="sns_btn google">
          <i class="fa fa-google fa-fw"></i>Google</a> -->
 <!-- 네이버 연동 로그인 -->

  <!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  네이버아이디로로그인 버튼 노출 영역
  <div id="naver_id_login" class="naver_box"></div>
  //네이버아이디로로그인 버튼 노출 영역
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("y_Gput02XwU2j3ZEUW3w", "http://localhost:8080/");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3,48);
  	naver_id_login.setDomain("http://localhost:8080/");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script> -->
          
      </div><!-- //col --> 
       </div><!-- //col_box --> 
  <!-- 전송버튼 -->     
      <button type="submit" class="subtn"><a>로그인</a></button>
      <br><br>
        <!-- 아이디저장  --> 
<!--       <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label> -->
      <br>
  <!-- 비밀번호 찾기 --> 
   <div id="forget_sh">
 		 <div class="forget">
  		<a href="./find_pw.me">Forget password?</a>
  		</div><!-- //forget --> 
  
  <!-- 아이디 찾기 -->
 	 	 <div class="forget">
  		<a href="./find_id.me">Forget email?</a>
  		</div><!-- //forget -->
  	</div><!-- //forget_sh --> 
    </div><!-- container -->

<!-- 취소버튼 사용유무    
<div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" 
      class="cancelbtn">Cancel</button> 
    </div> -->
  </form>
 </div><!-- modal_sh -->
</div><!-- modal -->





<%
if(session.getAttribute("email")==null){
	%>

<% 
}
%>
<!-- 회원가입 -->
<div id="id02" class="modal">
  <form class="modal-content animate" action="./MemberJoinAction.me" method="post" name="fr" enctype="multipart/form-data">
  <!-- 닫기버튼 -->
    <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
  <!-- 로고스타일 -->    
      <div id="logo_sh">FUNSTAY</div>
    </div>

    <div class="container">
    <div class="join_box">
<!-- 이메일(아이디)입력 폼 -->    
      <i class="fa fa-envelope icon"></i>
      <label for="email"><b>Email</b></label>
      <input type="email" placeholder="Enter Email" name="email">
<!-- 이메일 중복체크 입력 폼 -->       
      <div>
      <input type="button" value="E-mail중복체크" class="e_check" onclick="idcheck()">
      </div>
<!-- 비밀번호 입력 폼 -->      
<div id="clear"></div>
<i class="fa fa-key icon"></i>
      <label for="pass"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="pass" id="myInput1">
<!-- 비밀번호 보이게
      <input type="checkbox" onclick="myFunction()">Show Password<br> -->
<!-- 비밀번호 확인 폼-->
<i class="fa fa-key icon"></i>
      <label for="psw-repeat"><b>Repeat Password</b></label>
      <input type="password" placeholder="Repeat Password" name="pass2" onblur="passchk()">
	   <input type="text" class="psw-repeat" name="chk" value="비밀번호를 입력하세요" readonly="readonly">
<!-- 이름 폼 -->      
<i class="fa fa-user-o"></i>
      <label for="name"><b>NAME</b></label>
      <input type="text" placeholder="Enter Name" name="name" id="myname">    
<!-- 생년월일 폼 -->      
<i class="fa fa-heart icon"></i>
      <label><b>birth</b></label><br> 
      <select name="birth_yy" class="birth">
<!--년-->      	
      <%for(int i=2018; i>=1900; i--){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
     </select>

      <select name="birth_mm" class="birth">
<!--월-->
      <%for(int i=1; i<=12; i++){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
      </select> 
<!--일-->     
      <select name="birth_dd" class="birth">
      <%for(int i=1; i<=31; i++){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
      </select> 
      <br>
<!-- 폰번호 폼 -->      
<i class="fa fa-phone icon"></i>
      <label for="phone"><b>phone</b></label>
      <input type="text" placeholder="Enter phone number" name="phone"><br>   
      
<!-- 약관동의 -->
       <p>이용약관 및 개인정보 보호 정책에 동의하여 주십시요 <br><input type="checkbox" name="req"> 개인정보 수집 및 이용에 동의합니다. 
       <a href="./member/agree.jsp" style="color:dodgerblue">동의약관</a>.</p>
<!-- 전송버튼 -->
      <div class="clearfix">
        <button type="button" class="subtn" onclick="regChk()"><a>가입완료</a></button>
        </div>
<!-- 취소버튼 사용 유무        
<div class="container" style="background-color:#f1f1f1">
<button type="button" onclick="document.getElementById('id02').style.display='none'" 
 class="cancelbtn">Cancel</button>  -->
      </div><!-- //join_box -->
    </div><!-- //container -->
  </form>
</div><!-- //modal -->
</td>
</tr>
</table>

</section>


</header>















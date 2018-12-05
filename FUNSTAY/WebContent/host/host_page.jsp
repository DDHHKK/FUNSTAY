<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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


<!--my_reserve.css  -->
<link href="./css/myinfo/my_reserve.css" rel="stylesheet">
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
<div id="content_DY">

<!-- 여기서부터 페이지 내용을 적어주세요. -->

<p class="letter">내 숙소관리</p>
 


<!--완료된 숙소탭 시작  -->
<div id="London" class="w3-container city">

 <!--썸네일1시작 -->

  <a href="#">
  <div class="mywish_shj">
  <div id="outerbox_shj"><img src="./img/담양1.png"></div>
  <div id="imginfo_shj">
  <div id="imgname_shj">부산광역시 해운대</div>
  <input type="button" value="수정하기" class="update_btn" onclick="location.href='./HostUpdate.ho'"><br>
  <input type="button" value="삭제하기" onclick="fun1()">
  </div>
  </div>
  </a>

  <!--썸네일1끝  -->
  
  
  
  <!--썸네일2시작  -->
  <a href="#">
  <div class="mywish_shj">
  <div id="outerbox_shj"> <img src="./img/담양1.png"> </div>
  <div id="imginfo_shj">
  <div id="imgname_shj">부산광역시 해운대</div>
  <div></div>
  </div>
  </div>
  </a>
  <!--썸네일2끝  -->
  
  
  <!--썸네일3시작  -->
  <a href="#">
  <div class="mywish_shj">
  <div id="outerbox_shj"> <img src="./img/담양1.png"> </div>
  <div id="imginfo_shj">
  <div id="imgname_shj">부산광역시 해운대</div>

  </div>
  </div>
  </a>
  <!--썸네일3끝  -->
  
  
  
  <!--썸네일4시작  -->
  <a href="#">
  <div class="mywish_shj">
  <div id="outerbox_shj"> <img src="./img/담양1.png"> </div>
  <div id="imginfo_shj">
  <div id="imgname_shj">부산광역시 해운대</div>

  </div>
  </div>
  </a>
  <!--썸네일4끝  -->
  
  
  <!--썸네일5시작  -->
   <a href="#">
  <div class="mywish_shj">
  <div id="outerbox_shj"> <img src="./img/담양1.png"> </div>
  <div id="imginfo_shj">
  <div id="imgname_shj">부산광역시 해운대</div>

  </div>
  </div>
  </a>
  <!--썸네일5끝  -->
  
  <!--썸네일6시작  -->
  <a href="#">
  <div class="mywish_shj">
  <div id="outerbox_shj"> <img src="./img/담양1.png"> </div>
  <div id="imginfo_shj">
  <div id="imgname_shj">부산광역시 해운대</div>

  </div>
  </div>
  </a>
  <!--썸네일6끝  -->
  
  
  
  
</div>
<!--완료된 숙소 끝  -->







</div>





  
  
  
  

<!-- content 영역 끝 -->  





<script>

function fun1() {
	r=confirm ("정말 숙소를 삭제하시겠습니까?");
		location.href="/HostDeleteAction.ho"
	if(r==true){
		//삭제액션으로 가기
	}else if(r==false) {
		alert("취소되었습니다.");
		history.go(-1);
	}
}

</script> 



<!-- 페이지내용 끝 -->
</div>
</div><!-- 회원 관리 페이지 'subpage' include된 페이지의 div끝 !!지우지마세요!!-->
<div class="clear"></div>
<hr>
<!-- footer 시작-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- footer 끝-->
</body>
</html>
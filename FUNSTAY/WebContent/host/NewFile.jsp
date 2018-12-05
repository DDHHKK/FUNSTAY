<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>

function getThumbnailPrivew1(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
            $target.html('<img src="' + e.target.result + '" border="0" alt="" style="width:226px;"/>');
        }
        reader.readAsDataURL(html.files[0]);
    }
}

/* function getThumbnailPrivew2(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
            $target.html('<img src="' + e.target.result + '" border="0" alt="" style="width:226px;"/>');
        }
        reader.readAsDataURL(html.files[0]);
    }
}

function getThumbnailPrivew3(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
            $target.html('<img src="' + e.target.result + '" border="0" alt="" style="width:226px;"/>');
        }
        reader.readAsDataURL(html.files[0]);
    }
}

function getThumbnailPrivew4(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
            $target.html('<img src="' + e.target.result + '" border="0" alt="" style="width:226px;"/>');
        }
        reader.readAsDataURL(html.files[0]);
    }
}

function getThumbnailPrivew5(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            //$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
            $target.html('<img src="' + e.target.result + '" border="0" alt="" style="width:226px;"/>');
        }
        reader.readAsDataURL(html.files[0]);
    }
} */


</script>
<style>
.filebox {float:left;}

.filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
    width:200px;
    max-width:200px;
}
 
.filebox input[type="file"] {  /* 파일 필드 숨기기 */
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

#cma_image2{
	margin :300px;
}




</style>
 </head>
 <body>
<form name="form" id="form" action="" method="post" enctype="multipart/form-data" autocomplete="off">
    <div class="filebox">
        <label for="cma_file">숙소 사진 업로드</label>
        <input type="file" name="cma_file1" id="cma_file" accept="image/*" capture="camera" onchange="getThumbnailPrivew1(this,$('#cma_image1'))"/>
        <br>
        <div id="cma_image1" style="width:226px;max-width:226px;display:none;"></div>
    </div>
    
        <div class="filebox">
        <label for="cma_file">사진 인증샷 업로드</label>
        <input type="file" name="cma_file2" id="cma_file" accept="image/*" capture="camera" onchange="getThumbnailPrivew2(this,$('#cma_image2'))"/>
        <br>
        <div id="cma_image2" style="width:226px;max-width:226px;border:1px solid #000;display:none;"></div>
    </div>
    
        <div class="filebox">
        <label for="cma_file">사진 인증샷 업로드</label>
        <input type="file" name="cma_file3" id="cma_file" accept="image/*" capture="camera" onchange="getThumbnailPrivew3(this,$('#cma_image3'))"/>
        <br>
        <div id="cma_image3" style="width:226px;max-width:226px;border:1px solid #000;display:none;"></div>
    </div>
    
        <div class="filebox">
        <label for="cma_file">사진 인증샷 업로드</label>
        <input type="file" name="cma_file4" id="cma_file" accept="image/*" capture="camera" onchange="getThumbnailPrivew4(this,$('#cma_image4'))"/>
        <br>
        <div id="cma_image4" style="width:226px;max-width:226px;border:1px solid #000;display:none;"></div>
    </div>
    
        <div class="filebox">
        <label for="cma_file">사진 인증샷 업로드</label>
        <input type="file" name="cma_file5" id="cma_file" accept="image/*" capture="camera" onchange="getThumbnailPrivew5(this,$('#cma_image5'))"/>
        <br>
        <div id="cma_image5" style="width:226px;max-width:226px;border:1px solid #000;display:none;"></div>
    </div>

</form>
</body>
</html>

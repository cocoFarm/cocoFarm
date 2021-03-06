﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>농산물 판매 상품 등록</title>
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" type="text/css" href="/css/board.css">
<link rel="stylesheet" type="text/css" href="/css/message.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	
<!-- Naver SmartEditor -->
<script type="text/javascript"
 src="/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
/* 숫자만 입력 시키게 하는것 */
function onlyNumber(obj){
	val=obj.value;
	re=/[^0-9]/gi;
	obj.value=val.replace(re,"");
}

$(document).ready(function() {
	

	$("#messageCate").change(function() {

		var messageCate = $(this).val();
		$.ajax({
			type : "POST",
			url : "/mypage/readMessage.do",
			dataType : "html",
			data : {
				messageCate : messageCate
				 , curPage: '${curPage }'
			},
			success : function(res) {
// 				alert("성공");
				$("#messageBox").html(res);
			}
		});
	});

	$("#messageCate").trigger("change");
	
	$("#sendMessageBtn").click(function(e){
		popupOpen();
	});
	function popupOpen(){
		var url= "/mypage/writeMessage.do";    //팝업창 페이지 URL
		var winWidth = 400;
	    var winHeight = 500;
	    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
		window.open(url,"",popupOption);
	}
	
	
	
	$(".mypage_navbody").on("click", ".nav-link", function() {
		var page = $(this).children().attr("href");
		console.log(page);
		
		$(".mypage_page01").load(page);
		
		return false;
	});
	
	$(".mail_box").on("click", ".nav-link", function() {
		var page = $(this).attr("href");
		console.log(page);
		
		$(".mypage_page01").load(page);
		
		return false;
	});
	
	
	/* 글자수 제한  */
	var textCountLimit = 15;
	var textCountLimit2 = 40;
	$('textarea[name=optionName]').keyup(function() {
	     // 텍스트영역의 길이를 체크
	     var textLength = $(this).val().length;
	
	     // 입력된 텍스트 길이를 #textCount 에 업데이트 해줌
	     $('#textCount').text(textLength);
	      
	     // 제한된 길이보다 입력된 길이가 큰 경우 제한 길이만큼만 자르고 텍스트영역에 넣음
	     if (textLength > textCountLimit) {
	         $(this).val($(this).val().substr(0, textCountLimit));
	     }
	});

	$(".save_button").click(function() {
		if($(".category option:selected").val()==0) {
		  alert("카테고리를 선택해주세요.");
		  return false;
		} else if($.trim($("#title").val())=="") {
		  alert("제목을 입력해주세요.");
		  return false;
		} else if($("textarea[name=optionName]").val()==""){
		  alert("옵션을 입력해주세요.");
		  return false;
		} else if($("textarea[name=startAmount]").val()==""){
	    alert("판매수량을 입력해주세요.");
	    return false;
		} else if($("textarea[name=unit]").val()==""){
      alert("단위를 입력해주세요.");
      return false;
		} else if($("textarea[name=price]").val()==""){
      alert("판매가격을 입력해주세요.");
      return false;
		}
		
		submitContents($(this));
	});
	
});

function optionSelect(sVal) {
	var str = ""
	for(var i=0; i<sVal; i++) {
		str += '<ul>'
			+'<li><p>옵션제목 </p><textarea name="saleOptions[' + i + '].optionName" placeholder="15자 이내에 글자" style="resize:none" rows="1" cols="30"></textarea></li>'
			+'<li><p>총판매수량 </p><textarea name="saleOptions[' + i + '].startAmount" style="resize:none" onkeyup="onlyNumber(this)" placeholder="숫자만 입력가능" rows="1" cols="15"></textarea>개</li>'	
			+'<li><p>단위 </p><textarea name="saleOptions[' + i + '].unit" style="resize:none" placeholder="ex) kg" rows="1" cols="5"></textarea></li>'	
			+'<li><p>단위당가격 </p><textarea name="saleOptions[' + i + '].price" style="resize:none" onkeyup="onlyNumber(this)" placeholder="숫자만 입력가능" rows="1" cols="14"></textarea>원</li>'
			+'</ul>';
	}
	document.getElementById("option_boby").innerHTML = str;
	
	// 옵션 개수 선택 할 때 다른 방법이 있을까 하다가 생각해본 것. 되진 않음!
// 	$("#option_body1").show();
// 	$("#option_body3").hide();
// 	$("#option_body3").hide();
	
// 	if (sVal == "2") {
// 		$("#option_body2").show();
// 	} else if (sVal == "3") {
// 		$("#option_body3").show();
// 	}
}

// 네이버 스마트에디터를 사용하는 방법
function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

    try {
      elClickedObj.form.submit();
    } catch(e) {}
}

</script>
</head>
<body>
<div id="mypageheader">

<!--Mypage부분 header ver3부분  -->
<jsp:include page="/WEB-INF/views/tile/head/mypagehead.jsp" flush="false"/>
	
	<div class="container">
		<!--Mypage부분  검색 로고부분 -->
		<jsp:include page="/WEB-INF/views/tile/head/mypageSearch.jsp" flush="false"/>
		
		<div class="mypage_box">
			
			<!--Mypage부분  판매자 인트로부분 -->
			<jsp:include page="/WEB-INF/views/tile/mypage/sellerIntro.jsp" flush="false"/>
			
			
			<div class="mypage_page01">
				
				<jsp:include page="/WEB-INF/views/tile/message/message.jsp" flush="false"/>
			
			</div>
		</div>
	</div>
</div>	
</body>
</html>
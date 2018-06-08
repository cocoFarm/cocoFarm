<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" type="text/css" href="/css/sellerstyle.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$(".save_button").click(function() {
		submitContents($(this));
	});
	
	
	/*이미지 클릭했을때  */
	/* $(".img_click").on("click", function() {
		console.log(44444);
		
	});  */


});	

</script>

</head>
<body>
<div id="header">

	<div id="header_top">
	<div class="container">
		<ul class="rigth_list">
			<li><a href="#">고객</a></li>
			<li><a href="#">사업자</a></li>
			<li><a href="#">관리자</a></li>
		</ul>
		
		<ul class="left_list">
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
			<li><a href="#">알림</a></li>	
			<li><a href="/product/insert.do">마이페이지</a></li>	
		</ul>
	</div>
	</div>
	<div class="container">
		<div id="header_boby">
				<div class="logo"><img src="/img/main/logo_color.png" alt="코코팜 로고"></div>
				<!--2018년 5월 25일 hwanmin 추가   -->
				<div class="search">
					<form action="/seller.do" method="post">
						<input type="text" name="search_name" placeholder="농산물 검색하기"><button class="search_icon" style="cursor:pointer">
						</button>
					</form> 
				</div>
		
		</div>
		<div id="header_nav">
			<ul class="nav">
				<li><a href="#">농수산물</a></li>
				<li><a href="#">경매</a></li>
				<li><a href="#">농부 스토리</a></li>	
				<li><a href="#">자주 묻는 질문</a></li>	
				<li><a href="#">공지사항</a></li>
				<li><a href="#">회사소개</a></li>
			</ul>
		</div>
		
		<div id="header_footimg">
			<div class="scarecrow"></div>
			<div class="calligraphy"></div>
		</div>
	
	</div>
	<div id="bottom_vimg"></div>
</div>

<div id="view_seller">
	<div class="container">
		<c:forEach items="${seller}" var="data" varStatus="status">
			<c:choose>
				<c:when test="${status.count%5==0}">
					<div class="prodisplay_last">
						
						<a href="/sellerDetail.do?idx=${data.idx}"><img class="img_click" height="210px" alt="${data.title}사진" src="/proimg/${data.faceImg}" style="overflow: hidden;"></a>
						<div class="pro_info">
						<span class="pro_title">${data.title}</span>
						<span class="pro_price"><fmt:formatNumber value="${data.min_price}" pattern="#,###"/>원</span> 
						<span class="pro_origin">${data.origin}</span>
						
						</div>
					</div>
				</c:when> 
				<c:otherwise>
					<div class="prodisplay">
						<a href="/sellerDetail.do?idx=${data.idx}"><img class="img_click" height="210px" alt="${data.title}사진" src="/proimg/${data.faceImg}"></a>
						<div class="pro_info">
						<span class="pro_title">${data.title}</span>
						<span class="pro_price"><fmt:formatNumber value="${data.min_price}" pattern="#,###"/>원</span> 
						<span class="pro_origin">${data.origin}</span>
				
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>
</body>
</html>
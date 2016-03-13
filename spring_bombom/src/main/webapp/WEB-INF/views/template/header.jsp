<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
	String root = request.getContextPath(); 
    String id = (String)session.getAttribute("id");
    String grade = (String)session.getAttribute("grade");
%>
<HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
<title></title>
<script src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<style type="text/css">
ul#login_box li{
display : inline;
}
ul#login_box li a{
background-color: black;
color:white;
pading : 10px 20px;
text-decoration:none;
border-radius:4px 4px 0 0;
}
ul#login_box li a:hover{
background-color: orange;
}

li#admin{
float:right;
padding-right: 30px
} 
</style>
<style type="text/css">
.jbFixed {
       position: fixed;
       top: 0px;
     }
</style>
<script type="text/javascript">
$(function() {
	$('#navi li div').css("display","none");
	$('#navi li').hover(function() {
$('div', this).slideDown(200);
}, function() {
	$('div', this).slideUp(100);
	 });
});
 </script>
 <style type="text/css">
 #navi {position:relative }
 #navi li { float:left; margin-right:30px; cursor:pointer; overflow:hidden }
 #navi li div { position:absolute; left:0; width:900px; height:180px; z-index:10; border:0px solid white; background:skyblue}
 .sub1{ width:500px; height:160px; background:skyblue; font-size:13px;}
 .sub1_img{ width:400px; height:160px; background:skyblue}
 #form_body
 {
  border:solid 0px #C6C6C6;
  background:#EFEFEF;
  width:1000px;
  height:100px;
  margin:0px auto; /* 전체 자동으로 가운데 정렬 0은 위아래 auto는 좌우*/
 } 
  #top
 {
  border:solid 0px #C6C6C6;
  background:yellow;
  width:1000px;
  height:100px;
  margin:0px auto; /* 전체 자동으로 가운데 정렬 0은 위아래 auto는 좌우*/
 }
 </style>


<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script>
      $( document ).ready( function() {
        var jbOffset = $( '#top' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '#top' ).addClass( 'jbFixed' );
          }
          else {
            $( '#top' ).removeClass( 'jbFixed' );
          }
        });
      } );
    </script>
<style>
.tdsize{width:520pt;}
</style>
<style>
	#product_list{font-size:12px;}
	#product_img{ style="width: 150px; height: 150px;"}
</style>
</head>
<body>
<div id="form_body">
<div id="top"><!---top meme start-->
  <!--top memu-->
  <!--로그인 박스-->
  
<div id="login_box_start">  
    <tr>
    <td>
    <ul id="login_box">
     <p style="font-size: 12px; text-align: right; ">
     	 <li><a href="<%=root %>/">홈</a></li> 
<% if(id==null){ %>        
        <li><a href="/order/basket.html">장바구니</a><span class="bar"></span></li>
        <li><a href="/myshop/order/list.html">주문조회</a><span class="bar"></span></li>
        <li><a href="/myshop/index.html">마이쇼핑</a><span class="bar"></span></li>
        <li><a href="/board/index.html">게시판</a><span class="bar"></span></li>
        <li><a href="<%=root %>/member/login">로그인</a><span class="bar"></span></li>
        <li><a href="<%=root %>/member/agree">회원가입</a><span class="bar"></span></li>
        <li><a href="<%=root %>">아이디찾기</a></li>   
	    <li><a href="<%=root %>">비번찾기</a></li>
        
        
<% }else{ %>  
		<li><a href="/order/basket.html">장바구니</a><span class="bar"></span></li>
        <li><a href="/myshop/order/list.html">주문조회</a><span class="bar"></span></li>
        <li><a href="/myshop/index.html">마이쇼핑</a><span class="bar"></span></li>
        <li><a href="/board/index.html">게시판</a><span class="bar"></span></li>	        
	     <li><a href="<%=root %>/member/logout">로그아웃</a><span class="bar"></span></li>   
	     <li><a href="<%=root %>/member/read">회원정보</a><span class="bar"></span></li>   
	     <li><a href="<%=root %>/member/update">회원수정</a><span class="bar"></span></li>   
	     <li><a href="<%=root %>/member/delete">회원탈퇴</a><span class="bar"></span></li>   
<% } %>
<%--      <li><a href="<%=root %>/bbs/list">게시판목록</a></li>   --%>
<%--      <li><a href="<%=root %>/bbs/create">게시판생성</a></li>   --%>
<%--      <li><a href="<%=root %>/memo/list">메모목록</a></li>   --%>
<%--      <li><a href="<%=root %>/memo/create">메모생성</a></li>  --%>
<%--      <li><a href="<%=root %>/img/list">이미지목록</a></li>   --%>
<%--      <li><a href="<%=root %>/img/create">이미지생성</a></li>  --%>
     
     <li><a href="<%=root %>/product/read?product_no=10848">제품정보 보기</a></li> 
<% if(id!=null && grade.equals("A")) {%> 
     <li id="admin"><a href="<%=root %>/admin/list">회원목록</a></li> 
<% } %>
<!-- 검색-->
        <li><input maxlength="20" name="검색" size="20" type="text" />
        <input name="검색" type="button" value="검색" /></li>
	</p>
     </ul>
    </td> 
  </tr>
</div> 
  
<div id="navi">
 <ul>
 <li>2016년다이어리
 	<div id="parent">
	 <table border="0" cellpadding="0" cellspacing="0" background="skyblue">
		<tbody>
			<tr >
				<td class="sub1"> 
				<table border="0" cellpadding="0" cellspacing="0" style="width: 500px; height: 180px;"> 
					<tbody>			
						<tr><td><b>만년형</b></td><td><b>날짜형</b></td><td><b>비즈니스</b></td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td><b>캐시북</b></td><td><b>캘린더</b></td><td><b>코코 시리즈</b></td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
					</tbody>
				</table>
				</td>
				<td class="sub1_img">
				  <ul>
				     <img src="${pageContext.request.contextPath}/product_images/storedada_844.jpg" width="140px" height="140px"/>
				     &nbsp;&nbsp;
				     <img src="${pageContext.request.contextPath}/product_images/storedada_858.jpg" width="140px" height="140px"/>
			     </ul>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
 </li>
 <li>디자인문구
 	<div id="parent">
 	<table border="0" cellpadding="0" cellspacing="0" background="skyblue">
		<tbody>
			<tr >
				<td class="sub1"> 
				<table border="0" cellpadding="0" cellspacing="0" style="width: 500px; height: 180px;"> 
					<tbody>			
						<tr><td><b>노트</b></td><td><b>데스크 용품</b></td><td><b>필기류</b></td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td><b>카드/편지/봉투</b></td><td><b>캐시북</b></td><td><b>데코레이션</b></td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
					</tbody>
				</table>
				</td>
				<td class="sub1_img">
				  <ul>
				     <img src="${pageContext.request.contextPath}/product_images/storedada_844.jpg" width="140px" height="140px"/>
				     &nbsp;&nbsp;
				     <img src="${pageContext.request.contextPath}/product_images/storedada_858.jpg" width="140px" height="140px"/>
			     </ul>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
 </li>
 <li>프리미엄 가죽
 	<div id="parent">
 	
 	<table border="0" cellpadding="0" cellspacing="0" background="skyblue">
		<tbody>
			<tr >
				<td class="sub1"> 
				<table border="0" cellpadding="0" cellspacing="0" style="width: 500px; height: 180px;"> 
					<tbody>			
						<tr><td><b>지갑</b></td><td><b>패션 소품</b></td><td><b>데스크 소품</b></td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td><b>&nbsp;</b></td><td><b>핸드폰</b></td><td><b>&nbsp;</b></td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
					</tbody>
				</table>
				</td>
				<td class="sub1_img">
				  <ul>
				     <img src="${pageContext.request.contextPath}/product_images/storedada_844.jpg" width="140px" height="140px"/>
				     &nbsp;&nbsp;
				     <img src="${pageContext.request.contextPath}/product_images/storedada_858.jpg" width="140px" height="140px"/>
			     </ul>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
 </li>
 <li>패션/잡화
 	<div id="parent">
 	
 	<table border="0" cellpadding="0" cellspacing="0" background="skyblue">
		<tbody>
			<tr >
				<td class="sub1"> 
				<table border="0" cellpadding="0" cellspacing="0" style="width: 500px; height: 180px;"> 
					<tbody>			
						<tr><td><b>지갑</b></td><td><b>가방</b></td><td><b>소품</b></td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td><b>파우치</b></td><td><b>기념/행사</b></td><td><b>&nbsp;</b></td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
					</tbody>
				</table>
				</td>
				<td class="sub1_img">
				  <ul>
				     <img src="${pageContext.request.contextPath}/product_images/storedada_844.jpg" width="140px" height="140px"/>
				     &nbsp;&nbsp;
				     <img src="${pageContext.request.contextPath}/product_images/storedada_858.jpg" width="140px" height="140px"/>
			     </ul>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
 </li>
 <li>가구
 	<div id="parent">

 	<table border="0" cellpadding="0" cellspacing="0" background="skyblue">
		<tbody>
			<tr >
				<td class="sub1"> 
				<table border="0" cellpadding="0" cellspacing="0" style="width: 500px; height: 180px;"> 
					<tbody>			
						<tr><td><b>책상</b></td><td><b>책장</b></td><td><b>서랍장</b></td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td><b>테이블</b></td><td><b>모니터 받침대</b></td><td><b>소품가구</b></td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
					</tbody>
				</table>
				</td>
				<td class="sub1_img">
				  <ul>
				     <img src="${pageContext.request.contextPath}/product_images/storedada_844.jpg" width="140px" height="140px"/>
				     &nbsp;&nbsp;
				     <img src="${pageContext.request.contextPath}/product_images/storedada_858.jpg" width="140px" height="140px"/>
			     </ul>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
 </li>
 <li>여행
     <div id="parent">
     
     <table border="0" cellpadding="0" cellspacing="0" background="skyblue">
		<tbody>
			<tr >
				<td class="sub1"> 
				<table border="0" cellpadding="0" cellspacing="0" style="width: 500px; height: 180px;"> 
					<tbody>			
						<tr><td><b>여권 지갑</b></td><td><b>여행파우치</b></td><td><b>네임텍</b></td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
					</tbody>
				</table>
				</td>
				<td class="sub1_img">
				  <ul>
				     <img src="${pageContext.request.contextPath}/product_images/storedada_844.jpg" width="140px" height="140px"/>
				     &nbsp;&nbsp;
				     <img src="${pageContext.request.contextPath}/product_images/storedada_858.jpg" width="140px" height="140px"/>
			     </ul>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
 </li>
 <li>디지털/핸드폰
     <div id="parent">
     
     <table border="0" cellpadding="0" cellspacing="0" background="skyblue">
		<tbody>
			<tr >
				<td class="sub1"> 
				<table border="0" cellpadding="0" cellspacing="0" style="width: 500px; height: 180px;"> 
					<tbody>			
						<tr><td><b>폰 케이스</b></td><td><b>폰 파우치</b></td><td><b>스트랩</b></td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td><b>필름</b></td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
					</tbody>
				</table>
				</td>
				<td class="sub1_img">
				  <ul>
				     <img src="${pageContext.request.contextPath}/product_images/storedada_844.jpg" width="140px" height="140px"/>
				     &nbsp;&nbsp;
				     <img src="${pageContext.request.contextPath}/product_images/storedada_858.jpg" width="140px" height="140px"/>
			     </ul>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
 </li>
 <li>커피
     <div id="parent">
     
     <table border="0" cellpadding="0" cellspacing="0" background="skyblue">
		<tbody>
			<tr >
				<td class="sub1"> 
				<table border="0" cellpadding="0" cellspacing="0" style="width: 500px; height: 180px;"> 
					<tbody>			
						<tr><td><b>원두</b></td><td><b>핸드드립</b></td><td><b>커피기구</b></td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
					</tbody>
				</table>
				</td>
				<td class="sub1_img">
				  <ul>
				     <img src="${pageContext.request.contextPath}/product_images/storedada_844.jpg" width="140px" height="140px"/>
				     &nbsp;&nbsp;
				     <img src="${pageContext.request.contextPath}/product_images/storedada_858.jpg" width="140px" height="140px"/>
			     </ul>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
	 </li>
	
	 </ul>
	 </div>
  </div>
  </div>
  <!---top memu end-->
 
 
 
<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">

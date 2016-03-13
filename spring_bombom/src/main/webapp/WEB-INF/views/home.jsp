<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="title" value="나의 여행 블로그"/>
<c:if test="${not empty sessionScope.id && sessionScope.grade=='A'}">
	<c:set var="title" value="관리자 페이지"/>
</c:if>
<html>
<head>
	<title>Home</title>
<style type="text/css"> 

</style> 
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<DIV class="title">${title}</DIV> 
 
<DIV class='content'> 
  <IMG src='./images/blueNavi.png' width='20%'><br> 
<c:choose>
	<c:when test="${empty sessionScope.id }">
		<input type='button' value='로그인' 
           onclick="location.href='./member/login'">   
	</c:when>
	<c:otherwise>
		<input type='button' value='로그아웃' 
           onclick="location.href='./member/logout'"> 
	</c:otherwise>
</c:choose>   
</DIV> 
 
<DIV class="bottom"></DIV> 
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
</style> 
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
 
<DIV class="title">로그인</DIV>
 
<FORM name='frm' method='POST' action='${pageContext.request.contextPath}/member/login'>
  <TABLE class='table'>
    <TR>
      <TH>아이디</TH>
      <TD><input type="text" name="id" size="20" value="${c_id_val}">
      <c:choose>
			<c:when test="${c_id=='Y'}">
				<input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장 
			</c:when>
			<c:otherwise>
				<input type='checkbox' name='c_id' value='Y' > ID 저장 
			</c:otherwise>
		</c:choose>
      </TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd" size="20"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='로그인'>
    <input type='button' value='회원가입' onclick="location.href='${pageContext.request.contextPath}/member/agree'">
  </DIV>
  <!-- form close before!! -->
  <input type="hidden" name="flag" value="${param.flag}">
  <input type="hidden" name="bbsno" value="${bbsno}">
  <input type="hidden" name="nowPage" value="${nowPage}">
  <input type="hidden" name="nPage" value="${nPage}">
  <input type="hidden" name="col" value="${param.col}">
  <input type="hidden" name="word" value="${param.word}">
</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
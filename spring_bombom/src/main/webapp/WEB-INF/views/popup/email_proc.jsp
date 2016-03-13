<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href='../css/style.css' rel='Stylesheet' type='text/css'> 
<script type="text/javascript">
function use(){
	opener.frm.email.value='${param.email}';
	self.close();
}
</script>
</head> 
<body> 

<DIV class='title'>Email 중복 확인</DIV> 
 
<DIV class='content'>  
  입력된 Email: ${param.email}<br><br>
  
  <c:choose>
	<c:when test="${cnt==1}">
		중복되어 사용할 수 없습니다.<br>
	</c:when>
	<c:otherwise>
		중복 아님, 사용 가능합니니다.<br>
	</c:otherwise>
</c:choose>

</DIV>
 
<DIV class="bottom"> 
	<c:if test="${cnt!=1}">
		<input type='button' value='사용' onclick='use()'>
	</c:if>
  <input type='button' value='다시시도' onclick="location.href='emailForm'">
  <input type='button' value='닫기' onclick="window.close();">
</DIV> 
 
</body> 
</html> 
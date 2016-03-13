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
  font-size: 20px; 
} 
</style>
 
<link href='../css/style.css' rel='Stylesheet' type='text/css'> 
<script type="text/javascript">
function use(){
	opener.frm.id.value='${param.id}';
	self.close();
}
</script>
</head> 
<body> 
 
<DIV class='title'>아이디 중복 확인</DIV> 
  
<DIV class='content'>
  입력된 ID: ${param.id}<br><br>
  <c:choose>
	<c:when test="${cnt==1}">
		중복되어 사용할 수 없습니다.<br><br>
	</c:when>
	<c:otherwise>
		중복 아님, 사용 가능합니니다.<br><br>
	</c:otherwise>
</c:choose>
</DIV>
 
<DIV class="bottom">
	<c:if test="${cnt!=1}">
		<input type='button' value='사용' onclick='use()'>
	</c:if>
  <input type='button' value='다시시도' onclick="location.href='idForm'">
  <input type='button' value='닫기' onclick="window.close();">
 
</DIV> 
 
</body> 
</html> 
 

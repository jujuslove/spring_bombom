<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
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
<script type="text/javascript">
function read(memono){
	location.href='read.do?memono='+memono;
	}
</script>
</head> 
<body>


<DIV class="title">
  메모 목록
</DIV>
 
<TABLE align='center' border='1px' cellpadding='10px' cellspacing='0px'>
  <TR>
    <TH>번호</TH>
    <TH>제목</TH>
    <TH>날짜</TH>
    <TH>조회수</TH>
  </TR>
  
  <c:choose>
  	<c:when test="${empty list}">
  		<TR>
	      <TD colspan="4">등록된 메모가 없습니다.</TD>
	    </TR>
  	</c:when>
  	<c:otherwise>
  		<c:forEach var="vo" items="${list}">
  			<TR>
		      <TD>${vo.memono}</TD>
		      <TD width="50%"><a href="javascript:read('${vo.memono}')">${vo.title}</a>
		      <c:if test="${util:newImg(fn:substring(vo.wdate,0,10)) }">
		     		<img src="${pageContext.request.contextPath}/images/new.gif">
				</c:if>
		      </TD>
		      <TD>${fn:substring(vo.wdate,0,10)}</TD>
		      <TD>${vo.viewcnt}</TD>
    		</TR>   
  		</c:forEach>
  	</c:otherwise>
  </c:choose> 
</TABLE> 
	<DIV style='text-align: center; margin-top: 20px'>
			${paging}
	<input type='button' value='등록' onclick="location.href='./create.do'">
	</DIV>
</body> 
</html> 

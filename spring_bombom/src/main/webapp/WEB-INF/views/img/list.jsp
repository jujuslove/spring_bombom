<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<% request.setCharacterEncoding("UTF-8"); %>

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
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">
	function read(imgno){
		var url = "./read.do?imgno="+imgno;
			url += "&col=${param.col}";
			url += "&word=${param.word}";
			url += "&nowPage=${nowPage}";
			location.href=url;
	}
	
</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">이미지목록</DIV>
 
<FORM name='frm' method='POST' action='./list'>
	<input type="hidden" name="nowPage" value=${nowPage }>
	<div style="width:80%; text-align: center; margin: 5px auto;">
		<select name="col">
			<option value="total" <c:if test="${col==total}">selected='selected'</c:if> >전체</option>
			<option value="title" <c:if test="${col==title}">selected='selected'</c:if> >제목</option>
			<option value="wname" <c:if test="${col==wname}">selected='selected'</c:if> >작성자</option>
			<option value="content" <c:if test="${col==content}">selected='selected'</c:if> >내용</option>
		</select>
		<input type="text" name="word" value="${param.word}">
		<input type="submit" value="검색">
	</div>

  <TABLE class='table' width="70%">
    <TR>
		<TH>번호</TH>
		<TH>이름</TH>
		<TH width="50%">제목</TH>
		<TH>조회수</TH>
		<TH>그림</TH>
    </TR>
    <c:choose>
    <c:when test="${empty list }">
		<TR>
	   		<TD colspan="5" align="center">게시물이 없습니다.</TD>
	   </TR>
    </c:when>
	<c:otherwise>
	<c:forEach var="dto" items="${list}">
	<TR>
    	<TD>${dto.imgno}</TD>
    	<TD>${dto.wname}</TD>
    	<TD>
    	
    	<c:forEach begin="1" end="${dto.indent}">
       	<c:out value="&nbsp;&nbsp;" escapeXml="false"></c:out>
	    </c:forEach>
	    <c:if test="${dto.indent > 0 }">
	    	[답변]
	    </c:if>
		<a href="javascript:read('${dto.imgno}')">${dto.title}</a>
		<c:if test="${util:newImg(fn:substring(dto.wdate,0,10)) }">
		<img src="${pageContext.request.contextPath}/images/new.gif" >
	    </c:if>

    	</TD>
    	<TD>${dto.viewcnt}</TD>
    	<TD><img src="${pageContext.request.contextPath}/storage/${dto.filename}" width="50px">
    	</TD>
    </TR>
	</c:forEach>
</c:otherwise>
</c:choose>
  </TABLE>
  <DIV class='bottom'>
    <input type="button" onclick="location.href='./create.do'" value="등 록">
   ${paging}
  </DIV>
</FORM>
 
</body>
<!-- *********************************************** -->
</html> 
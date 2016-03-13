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
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function read(bbsno){
	var url = "read?bbsno="+bbsno;
	url = url +"&col=${col}";
	url = url +"&word=${word}";
	url = url +"&nowPage=${nowPage}";
	
	location.href=url;
	
}
</script>

</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class='title'>
  게시판 목록
</DIV>

<DIV style='width: 80%; text-align: center; margin: 1px auto;'> 
  <FORM name='frm' method='post' action="./list.do"> 
  <SELECT name='col'> <!-- 검색할 컬럼 -->
    <OPTION value='wname' <c:if test="col=='wname'">selected='selected'</c:if>>성 명</OPTION> 
    <OPTION value='title' <c:if test="col=='title'">selected='selected'</c:if>>제 목</OPTION> 
    <OPTION value='content' <c:if test="col=='content'">selected='selected'</c:if>>내 용</OPTION> 
    <OPTION value='total'>전체출력</OPTION> 
  </SELECT> 
  <input type='text' name='word' value='${word}'> <!-- 검색어 -->
  <input type='submit' value='검색'> 
  <input type='button' value='등록' onclick="location.href='./create.do'"> 
  </FORM> 
</DIV> 
 

<TABLE class='table'>
  <TR>
    <TH>번호</TH>
    <TH>제목</TH>
    <TH>성명</TH>
    <TH>조회수</TH>
    <TH>등록일</TH>
    <TH>grpno</TH>
    <TH>indent</TH>
    <TH>ansnum</TH>
  </TR>
  <c:choose>
  <c:when test="${empty list}">
    <TR>
      <TD colspan='8' align='center'>등록된 글이 없습니다.</TD>
    </TR>
 </c:when>
 <c:otherwise>
	<c:forEach var="dto" items="${list}">
    <TR>
      <TD>${dto.bbsno}</TD>
      <TD>
      	<c:forEach begin="1" end="${dto.indent}">
      		<c:out value="&nbsp;&nbsp;" escapeXml="false"></c:out>
      	</c:forEach>
      	<c:if test="${dto.indent>0 }">
      		[답변]
      	</c:if>
          <c:set var="rcount" value="${util:rcount(dto.bbsno,rdao) }"/>
          <A href="javascript:read('${dto.bbsno}')">
          ${dto.title}
          <c:if test="${rcount>0 }">
            <span style="color:red;">(${rcount})</span>
          </c:if>
          </A>
        <c:if test="${util:newImg(fn:substring(dto.wdate,0,10)) }">
     		<img src="${pageContext.request.contextPath}/images/new.gif">
		</c:if>
      </TD>
      <TD>${dto.wname}</TD>
      <TD>${dto.viewcnt}</TD>
      <TD>${fn:substring(dto.wdate,0,10)}</TD>
      <TD>${dto.grpno}</TD>
      <TD>${dto.indent}</TD>
      <TD>${dto.ansnum}</TD>
    </TR>
  </c:forEach>
  </c:otherwise> 
  </c:choose>
</TABLE>
 
<DIV style='text-align: center; margin-top: 20px'>
  <input type='button' value='등록' onclick="location.href='./create.do'">
  ${paging}
</DIV>

</body>
<!-- *********************************************** -->
</html> 


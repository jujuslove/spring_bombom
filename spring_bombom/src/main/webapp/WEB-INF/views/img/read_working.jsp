<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}

.curImg {
	margin-right: 0;
	border-style: solid;
	border-width: 3px;
	border-color: red;
}

.td_padding {
	padding: 5px 5px
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function readGo(imgno){
var url ="./read.do";
url = url + "?col=${param.col}";
url = url + "&word=${param.word}";
url = url + "&nowPage=${param.nowPage}";
url = url + "&imgno="+imgno;

location.href=url;

}
 function listB(){
 var url ="./list.do";
url = url + "?col=${param.col}";
url = url + "&word=${param.word}";
url = url + "&nowPage=${param.nowPage}";

location.href=url;
 }
 function updateB(imgno){
	 var url = "./update.do";
	 url = url + "?col=${param.col}";
	 url = url + "&word=${param.word}";
	 url = url + "&nowPage=${param.nowPage}";
	 url = url + "&imgno="+imgno;	 
	 
	location.href=url;	 
 }
 function deleteB(imgno){
	 var url = "./delete.do";
	 url = url + "?col=${param.col}";
	 url = url + "&word=${param.word}";
	 url = url + "&nowPage=${param.nowPage}";
	 url = url + "&imgno="+imgno;
location.href=url;	 
 }
 function replyB(imgno){
	 var url = "./reply.do";
	 url = url + "?col=${param.col}";
	 url = url + "&word=${param.word}";
	 url = url + "&nowPage=${param.nowPage}";
	 url = url + "&imgno="+imgno;
location.href = url;
}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<DIV
		style='font-size: 24px; text-align: center; text-decoration: underline; margin-top: 10px; margin-bottom: 20px;'>
		조회</DIV>

	<TABLE align='center' border='1px' width="50%" cellpadding='10px'
		cellspacing='0px'>

		<TR>
			<TD colspan="2"><img
				src="${pageContext.request.contextPath}/view/img/storage/${dto.filename}"
				width="100%"></TD>
		</TR>
		<TR>
			<TH width="30%">제목</TH>
			<TD width="70%">${dto.title}</TD>
		</TR>
		<TR>
			<TH>내용</TH>
			<TD>${dto.content}</TD>
		</TR>
		<TR>
			<TH>성명</TH>
			<TD>${dto.wname}</TD>
		</TR>

		<TR>
			<TH>조회수</TH>
			<TD>${dto.viewcnt}</TD>
		</TR>
	</TABLE>

<!-- pre_imgno2 //이전 -->
<!-- pre_file2 -->
<!-- pre_imgno1//이전전 -->
<!-- pre_file1 -->
<!-- nex_imgno1 //다음 -->
<!-- nex_file1 -->
<!-- nex_imgno2 //다음다음 -->
<!-- nex_file2 -->
	<TABLE align="center" width="50%" style="margin: 10px auto">
		<tr>
		<c:forEach var="imgList" items="list">
		<c:choose>
			<c:when test="${empty list.get(0) }">
				<td><img src="${pageContext.request.contextPath}/view/img/storage/default.jpg"
				width="100%" border="0"></td>
			</c:when>
			<c:otherwise>
				<td class="td_padding">
				<a href="javascript:readGo('${list.get(0) }')"> <img class="curImg"
					src="${pageContext.request.contextPath}/view/img/storage/${list.get(1)}"
					width="100%" border='0'></a></td>
			</c:otherwise>
		
		</c:choose>
		</c:forEach>
		</tr>
	</TABLE>


	<DIV style='text-align: center; margin-top: 20px'>
		<input type='button' value='등록' onclick="location.href='./create.do'">
		<input type='button' value='목록' onclick="listB()">
		<input type='button' value='수정' onclick="updateB('${param.imgno}')">
	    <input type='button' value='삭제' onclick="deleteB('${param.imgno}')"> 
	    <input type='button' value='답변' onclick="replyB('${param.imgno}')">

	</DIV>

</body>
<!-- *********************************************** -->
</html>

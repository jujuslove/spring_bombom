<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	function readGo(imgno) {
		var url = "./read";
		url = url + "?col=${param.col}";
		url = url + "&word=${param.word}";
		url = url + "&nowPage=${param.nowPage}";
		url = url + "&imgno=" + imgno;

		location.href = url;

	}
	function listB() {
		var url = "./list";
		url = url + "?col=${param.col}";
		url = url + "&word=${param.word}";
		url = url + "&nowPage=${param.nowPage}";

		location.href = url;

	}
	function updateB(imgno) {
		var url = "./update";
		url = url + "?col=${param.col}";
		url = url + "&word=${param.word}";
		url = url + "&nowPage=${param.nowPage}";
		url = url + "&imgno=" + imgno;
		location.href = url;
	}
	function deleteB(imgno) {
		var url = "./delete";
		url = url + "?col=${param.col}";
		url = url + "&word=${param.word}";
		url = url + "&nowPage=${param.nowPage}";
		url = url + "&imgno=" + imgno;
		location.href = url;
	}
	function replyB(imgno) {
		var url = "./reply";
		url = url + "?col=${param.col}";
		url = url + "&word=${param.word}";
		url = url + "&nowPage=${param.nowPage}";
		url = url + "&imgno=" + imgno;
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
				src="${pageContext.request.contextPath}/storage/${dto.filename}"
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

	<TABLE align="center" width="50%" style="margin: 10px auto">
		<tr>
			<c:set var="s" value="${list[0]}"/>
			<c:set var="numArr" value="${list[1]}"/>
			
			<c:forEach var="i" begin="0" end="4">
				<c:choose>
					<c:when test="${empty s[i]}">
						<td><img
							src="${pageContext.request.contextPath}/storage/default.jpg"
							width="100%" border="0"></td>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${numArr[i] == param.imgno }">
								<td class="td_padding"><a
									href="javascript:readGo('${numArr[i]}')"><img
										class="curImg"
										src="${pageContext.request.contextPath }/storage/${s[i]}"
										width="100%" border='0'></a></td>
							</c:when>
							<c:otherwise>
								<td class="td_padding"><a
									href="javascript:readGo('${numArr[i]}')"><img
										src="${pageContext.request.contextPath }/storage/${s[i]}"
										width="100%" border='0'></a></td>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tr>
	</TABLE>


	<DIV style='text-align: center; margin-top: 20px'>
		<input type='button' value='등록' onclick="location.href='./create'">
		<input type='button' value='목록' onclick="listB()">
		<input type='button' value='수정' onclick="updateB('${param.imgno}')">
	    <input type='button' value='삭제' onclick="deleteB('${param.imgno}')"> 
	    <input type='button' value='답변' onclick="replyB('${param.imgno}')">
	</DIV>

</body>
<!-- *********************************************** -->
</html>

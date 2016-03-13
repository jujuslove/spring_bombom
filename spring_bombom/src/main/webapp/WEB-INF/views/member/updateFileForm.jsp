<%@ page contentType="text/html; charset=UTF-8" %>
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
//입력 값 검사 후 서버로 전송
function inputCheck(){
	var f=document.frm;
	
	if(f.fnameMF.value==""){
		alert("변경할 파일을 입력해 주세요")
		f.fnameMF.focus();
		return false;
	}
	
	return true;
}
</script>
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
 
<DIV class="title">사진 수정</DIV>
 
<FORM name='frm'
method='POST'
action='./updateFile'
encType="multipart/form-data"
onsubmit="return inputCheck(this)">

  <input type="hidden" name="id" value="${param.id}"/> 
  <input type="hidden" name="oldfile" value="${param.oldfile}"/>
   
  <TABLE class='table'>
    <TR>
      <TH>원본파일</TH>
      <TD>
       <img src="${pageContext.request.contextPath}/storage/${param.oldfile}">
       원본파일명:${param.oldfile}
      </TD>
    </TR>
    <TR>
      <TH>변경파일</TH>
      <TD>
       <input type="file" name="fnameMF">
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 </body>
<!-- *********************************************** -->
</html>
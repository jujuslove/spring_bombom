<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>답변</title> 
<style type="text/css"> 
*{ 
  font-family: 돋움체; 
  font-size: 24px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css"> 
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** --> 
<DIV class="title">답변</DIV> 
 
<FORM name='frm' method='post' action='./reply'> 
  <input type='hidden' name='bbsno' value='${param.bbsno}'> 
  <input type='hidden' name='grpno' value='${dto.grpno}'> 
  <input type='hidden' name='indent' value='${dto.indent}'> 
  <input type='hidden' name='ansnum' value='${dto.ansnum}'>
  <input type='hidden' name='col' size='30' value='${param.col}'>
  <input type='hidden' name='word' size='30' value='${param.word}'>
  <input type='hidden' name='nowPage' size='30' value='${param.nowPage}'>
   
  <TABLE align='center'> 
    <TR> 
      <TH>제목</TH> 
      <TD><input type='text' name='title' value='${dto.title}' size='50'></TD> 
    </TR> 
    <TR> 
      <TH>내용</TH> 
      <TD><TEXTAREA name='content' rows='10' cols='60'>답변 테스트</TEXTAREA></TD> 
    </TR> 
    <TR> 
      <TH width='15%'>성명</TH> 
      <TD width='85%'><input type='text' name='wname' value='홍길동' size='50'></TD> 
    </TR> 
    <TR> 
      <TH>패스워드</TH> 
      <TD><input type='password' name='passwd' value='1234' size='50'></TD> 
    </TR> 
 
  </TABLE> 
 
  <DIV class='bottom'> 
    <input type='submit' value='등록'> 
    <input type='button' value='취소' onclick="location.href='./list.do'">  
  </DIV> 
</FORM> 
</body>
<!-- *********************************************** --> 
</html> 
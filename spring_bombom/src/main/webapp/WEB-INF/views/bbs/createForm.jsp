<%@ page contentType="text/html; charset=UTF-8" %> 
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
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
 </script>
</head> 
<body>
<!-- *********************************************** -->
 
<DIV class="title">등록</DIV>
 
<Form name='frm' method='POST' action='./create'>
  <TABLE width='50%' class='table'>
    <TR>
      <TH>성명</TH>
      <TD><input type='text' name='wname' size='40' value='화요일'></TD>
    </TR>  
    <TR>
      <TH>제목</TH>
      <TD><input type='text' name='title' size='40' value='화요일'></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><TEXTAREA name='content' rows='10' cols='40'>SQL 수업</TEXTAREA></TD>
    </TR>
    <TR>
      <TH>패스워드</TH>
      <TD><input type='password' name='passwd' size='40' value='123'></TD>
    </TR>    
  </TABLE>
 
  <DIV class='bottom'>
    <input type='submit' value='전송'>
    <input type='button' value='취소' onclick="history.back();"> 
  </DIV>  
</Form>
 
</body>
<!-- *********************************************** -->
</html> 

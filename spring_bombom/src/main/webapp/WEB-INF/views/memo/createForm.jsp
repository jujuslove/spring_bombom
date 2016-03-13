<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 

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
</head> 
<body>
 
<DIV style='text-align: center; margin-top: 20px; margin-bottom: 20px; '>등록</DIV>
 
<Form name='frm' method='POST' action='./createProc.do'>
  <TABLE width='50%' align='center' border='1'>
    <TR>
      <TH>제목</TH>
      <TD><input type='text' name='title' size='30' value='화요일'></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><TEXTAREA name='content' rows='10' cols='30'>SQL 수업</TEXTAREA></TD>
    </TR>
  </TABLE>
 
  <DIV style='text-align: center; margin-top: 20px; margin-bottom: 20px;'>
    <input type='submit' value='전송'>
  </DIV>  
</Form>


</body> 
</html> 

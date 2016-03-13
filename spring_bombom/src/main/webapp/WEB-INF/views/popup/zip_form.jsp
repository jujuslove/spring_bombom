<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html"> 
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
 
<link href='../css/style.css' rel='Stylesheet' type='text/css'>
 
</head>
<body>
<DIV class='title'>우편번호 검색</DIV>
 
<DIV class='content'>
  동리를 입력해주세요. 예) 간석4동
</DIV>
 
<FORM name='frm' method='post' action='./zipCheck'>
  <TABLE align='center'>
    <TR>
      <TH>동리</TH>
      <TD><input type='text' name='dongli' size='30'> </TD>
    </TR>
  </TABLE>
  
  <DIV class="bottom">
    <input type='submit' value='주소 확인'>
    <input type='button' value='취소' onclick="window.close();">    
  </DIV>
</FORM>
 
 
</body>
</html>
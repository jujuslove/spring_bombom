<%@ page contentType="text/html; charset=UTF-8" %>
<% 
String id=(String)session.getAttribute("id");
String grade=(String)session.getAttribute("grade"); 

%>
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
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">

<DIV class="title">회원탈퇴</DIV>
 
<FORM name='frm' method='POST' action='./delete'>
  <input type="hidden" name="id" value="${id}">
  <input type="hidden" name="oldfile" value="${oldfile}">
<%
if( id.equals("admin") || grade.equals("A")){
%>  
  <div class="content">
   admin계정과 "A"등급은 탈퇴가 불가능합니다.<br>
  </div>
    <DIV class='bottom'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
<%
}else{
%>  

<div class="content">
   탈퇴를 하시면 더이상 컨텐트를 제공받을 수 없습니다.<br>
   그래도 탈퇴를 원하시면 아래 탈퇴버튼을 클릭하세요.
  </div>
    <DIV class='bottom'>
    <input type='submit' value='탈퇴'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
  
<%
}
%>

</FORM>
 
 
</body>
<!-- *********************************************** -->
</html> 
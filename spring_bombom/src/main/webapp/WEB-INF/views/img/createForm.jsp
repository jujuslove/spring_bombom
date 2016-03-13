<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css"> 
<script type="text/javascript">
function inputCheck(f){
// 	var f = document.frm; // <FORM>태그 객체 
	if(f.wname.value==''){
		alert("이름을 입력하세요");
		f.wname.focus();
		return false;
	}
	if(f.title.value==''){
		alert("제목을 입력하세요");
		f.title.focus();
		return false;
	}
	if(f.content.value==''){
		alert("내용을 입력하세요");
		f.content.focus();
		return false;
	}
	if(f.passwd.value==''){
		alert("비번을 입력하세요");
		f.passwd.focus();
		return false;
	}
	if(f.filenameMF.value==''){
		alert("파일을 선택하세요");
		f.filenameMF.focus();
		return false;
	}else{
	   var fvalue = f.filenameMF.value;
	   var ext = fvalue.slice(fvalue.lastIndexOf(".")+1).toLowerCase();
	   if(!(ext =="gif" || ext =="jpg" || ext == "png")){
		  alert("이미지 파일만 업로드 가능합니다.");
		  f.filenameMF.focus();
		  return false
	   }
	}
	f.submit(); 
}
</script>
</head> 
<body leftmargin="0" topmargin="0">

<DIV class="title">이미지 등록</DIV>
<Form name='frm' 
	method='POST' 
	action='./create'
	enctype='multipart/form-data'
    onsubmit="return inputCheck(this)">
    
  <TABLE width='50%' class='table'>
    <TR>
      <TH>글쓴이</TH>
      <TD><input type='text' name='wname' size='40' value=''></TD>
    </TR>  
    <TR>
      <TH>제목</TH>
      <TD><input type='text' name='title' size='40' value=''></TD>
    </TR>
    <TR>
      <TH>내 용</TH>
      <TD><TEXTAREA name='content' rows='5' cols='40'></TEXTAREA></TD>
    </TR>
    <tr> 
       <th>이미지</th> 
       <td><input type='file' name='filenameMF'  size='40'>
       <br>jpg, png형식의 파일만 가능합니다.
       </td> 
        
     </tr>
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
</html>
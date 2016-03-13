<%@ page contentType="text/html; charset=UTF-8" %> 
 
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
function input(f){
	
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
		alert("변경할 업로드 파일을 선택하세요");
		f.filenameMF.focus();
		return false;
	}else{	   
	   var ext = fvalue.slice(fvalue.lastIndexOf(".")+1).toLowerCase();
	   if(!(ext =="gif" || ext =="jpg" || ext == "png")){
		  alert("이미지 파일만 업로드 가능합니다.");
		  f.filenameMF.focus();
		  return false
	   }
	}
}
</script>
</head> 
<body leftmargin="0" topmargin="0">

<DIV class='title'>수정</DIV>
	
<FORM  name='frm' method='POST' action='./update' 
	 enctype="multipart/form-data" 
	 onsubmit="return input(this)">
	 
  <input type='hidden' name='imgno' size='30' value='${param.imgno}'>
  <input type='hidden' name='col' size='30' value='${param.col}'>
  <input type='hidden' name='word' size='30' value='${param.word}'>
  <input type='hidden' name='nowPage' size='30' value='${param.nowPage}'>
  <input type="hidden" name="oldfile" value="${dto.filename}"/>
  <TABLE width='50%' class='table'>
    <TR>
      <TH>제목</TH>
      <TD><input type='text' name='title' size='40' value='${dto.title}'></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><TEXTAREA name='content' rows='10' cols='40'>${dto.content}</TEXTAREA></TD>
    </TR>
    <TR>
      <TH>성명</TH>
      <TD><input type='text' name='wname' size='40' value='${dto.wname}'></TD>
    </TR>       
     <TR>
      <TH>원본파일</TH>
      <TD>
       <img src="${request.getContextPath()}/storage/${dto.filename}">
       원본파일명:${dto.filename}
      </TD>
    </TR>
    <TR>
      <TH>변경파일</TH>
      <TD>
       <input type="file" name="filenameMF">
       <br>이미지 형식의 파일만 가능합니다.
      </TD>
    </TR>
    <TR>
      <TH>패스워드</TH>
      <TD><input type='password' name='passwd' size='40' value=''></TD>
    </TR>    
  </TABLE>
 
  <DIV style='text-align: center; margin-top: 20px; margin-bottom: 20px;'>
    <input type='submit' value='전송'>
    <input type='button' value='취소' onclick="history.back();"> 
  </DIV>  
</Form>
 
</body>

</html> 
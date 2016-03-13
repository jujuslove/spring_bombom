<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<title>패스워드 변경</title> 
<style type="text/css"> 
*{ 
  font-family: 돋움체; 
  font-size: 22px; 
} 
</style> 
<link href="../css/style.css" rel="stylesheet" type="text/css"> 
<script language="javascript"> 
  // 입력 값 검사후 서버로 전송 
  function inputCheck(){ 
      var f = document.frm; 
       
    if(f.passwd.value == ""){ 
        alert("비밀번호를 입력해 주세요."); 
        f.passwd.focus(); 
        return false; 
    } 
    if(f.repasswd.value == ""){ 
        alert("비밀번호를 확인해 주세요"); 
        f.repasswd.focus(); 
        return false; 
    }
    //비밀번호가 일치하는지 검사 
    if(f.passwd.value != f.repasswd.value){ 
        alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요."); 
        f.repasswd.focus(); 
        return false; 
    } 
     
    return true; 
  } 
 
</script> 
 
</head> 
<!-- *********************************************** --> 
<body leftmargin="0" topmargin="0"> 

<form name="frm" method="post" action="./updatePasswd" 
      onsubmit="return inputCheck()"> 
       
      <input type='hidden' name='id' value='${param.id}'> 
      <br> 
      <div style='text-align:center'> 
          패스워드 수정 (* 필수 입력) 
      </div> 
      <br> 
       
      <table  width="60%" border="1" cellspacing="0" cellpadding="2"  align="center"> 
         <tr>  
            <th>*패스워드</th> 
            <td> <input type="password" name="passwd" size="15" value=''> </td> 
            <td>패스워드를 적어주세요.</td> 
          </tr> 
          <tr>  
            <th>*패스워드 확인</th> 
            <td> <input type="password" name="repasswd" size="15" value=''> </td> 
            <td>패스워드를 확인합니다.</td> 
          </tr> 
      </table> 
    <div style="text-align: center"> 
        <input type="submit" value="패스워드 수정" >  
    </div> 
</form> 
 
</body> 
<!-- *********************************************** --> 
</html> 
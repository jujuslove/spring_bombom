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
</head> 
<body>
<DIV style='text-align: center; margin-top: 20px; margin-bottom: 20px; '>삭제 확인</DIV>
 
<Form name='frm' method='POST' action='./deleteProc.do'>
  <input type='hidden' name='memono' size='30' value='${param.memono}'>
  
  <DIV style='text-align: center; margin-top: 20px; margin-bottom: 20px;'>
    삭제를 하면 복구 될 수 없습니다.<br><br>
    삭제하시려면 삭제 처리 버튼을 클릭하세요.<br><br>
    취소는 '목록' 버튼을 누르세요.
    <br><br>
    <input type='submit' value='삭제 처리'>
    <input type='button' value='목록' onclick="location.href='./list.do'">
  </DIV>  
</Form>
</body> 
</html> 

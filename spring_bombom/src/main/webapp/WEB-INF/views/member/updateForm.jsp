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
// 입력 값 검사후 서버로 전송 
function inputCheck(){ 
      var f = document.frm; 
       
    if(f.mname.value == ""){ 
        alert("이름을 입력해 주세요."); 
        f.mname.focus(); 
        return false; 
    } 
 
    if(f.job.value == "0"){ 
        alert("직업을 선택해 주세요."); 
        f.job.focus(); 
        return false; 
    } 
    // Form onsubmit 이벤트일경우 
    // return false; 
     
    return true; 
} 
 
// 중복 이메일을 검사합니다. 
function emailCheck(email){ 
  if(email == ""){ 
    window.alert("이메일을 입력해 주세요."); 
    f.email.focus(); 
  }else{ 
    url="email_proc.do?email=" + email;  // GET 
    // http://localhost:8000/jsp_member/member/id_proc.jsp?id=user1 
    wr = window.open(url,"이메일검색","width=450,height=400"); 
    wr.moveTo((window.screen.width-450)/2, (window.screen.height - 400)/2);// x, y 
  } 
} 
 
// 우편번호 검색 
function zipCheck(){ 
  url="./zip_form.do"; 
  // http://localhost:8000/jsp_member/member/zip_proc.jsp?area3=간석4동 
  wr = window.open(url,"우편번호 검색","width=550 ,height=450"); 
  wr.moveTo((window.screen.width-550)/2, (window.screen.height - 450)/2);// x, y 
} 
</script> 

</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
 
<DIV class="title">정보수정</DIV>
 
<FORM name='frm' 
 method='POST' 
 action='./update'
 onsubmit="return inputCheck()">
  <input type="hidden" name="id" value="${dto.id}"/>
  <TABLE class='table'>
      <tr>  
            <th width="20%">*아이디</th> 
            <td colspan='2'>  
               ${dto.id} 
            </td> 
          </tr> 
          <tr>  
            <th>*이름</th> 
            <td> <input type="text" name="mname" size="15" value='${dto.mname}'> </td> 
            <td>고객실명을 적어주세요.</td> 
          </tr> 
          <tr>  
            <th>전화번호</th> 
            <td><input type="text" name="tel" value="${dto.tel}"></td> 
            <td> </td> 
          </tr>           
          <tr>  
            <th>이메일</th> 
            <td> 
               <input type="text" name="email" size="27"  value='${dto.email}'> 
                <input type="button" value="Email 중복확인"  
                        onclick="javascript:emailCheck(document.frm.email.value)"> 
             
            </td> 
            <td>이메일을 적어주세요.</td> 
          </tr> 
          <tr>   
            <th>우편번호</th> 
            <td> 
<%--  org ver           <input type="text" name="zipcode" size="10" value='${dto.zipcode}'>  --%>
<!--                  <input type="button" name="btnPost" value="우편번호찾기"   -->
<!--                        onclick="zipCheck()"> -->
				<input type="text" id="sample5_postcode" name="zipcode" size="7" placeholder="우편번호">
				<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
            </td> 
            <td>우편번호를 검색 하세요.</td> 
          </tr> 
          <tr>   
            <th>주소</th> 
            <td> 
<%--             <input type="text" name="address1" size="45" value='${dto.address1}'><br/>  --%>
<%--             <input type="text" name="address2" size="45" value='${dto.address2}'>  --%>
            <input type="text" id="sample5_address" name="address1" size="40" placeholder="주소"><br>
			<input type="text" id="sample5_address2"  name="address2" size="40" placeholder="상세주소">
			<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div> 
            </td> 
            <td>주소를 적어 주세요.</td> 
          </tr> 
          <tr>   
            <th>직업</th> 
            <td> 
              <SELECT name='job'> 
               <option value="0">선택하세요.</option> 
               <option value="A01">회사원</option> 
               <option value="A03">전산관련직</option> 
               <option value="A05">연구전문직</option> 
               <option value="A07">각종학교학생</option> 
               <option value="A09">일반자영업</option> 
               <option value="A11">공무원</option> 
               <option value="A13">의료인</option> 
               <option value="A15">법조인</option> 
               <option value="A17">종교.언론/예술인</option> 
               <option value="A19">농업</option> 
               <option value="A23">축산업</option> 
               <option value="A25">수산업</option> 
               <option value="A27">광업</option> 
               <option value="A30">주부</option> 
               <option value="A32">무직</option> 
               <option value="A99">기타</option> 
              </SELECT> 
              <script type="text/javascript">
               document.frm.job.value='${dto.job}';
              </script>              
            </td> 
            <td>직업을 선택 하세요.</td> 
          </tr> 
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='정보수정'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=9c8fd36477d889686a3a1e27dbb806b5&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };
 
    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });
 
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
      
                // 주소로 좌표를 검색
                geocoder.addr2coord(data.address, function(status, result) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
               
                // 우편번호 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_postcode").value = data.zonecode;
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = fullAddr;
                // 상세주소 필드에 focus 넣는다.
                document.getElementById("sample5_address2").focus();
 
            }
        }).open();
    }
</script>  
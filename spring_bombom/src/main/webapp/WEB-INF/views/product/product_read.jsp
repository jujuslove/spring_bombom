<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 14px; 
} 
.tdsize{width:500pt;}
</style> 

<style type="text/css">
	
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	$(function(){
		$("ul.panel li:not("+$("ul.tab li a.selected").attr("href")+")").hide()
		$("ul.tab li a").click(function(){
			$("ul.tab li a").removeClass("selected");
			$(this).addClass("selected");
			$("ul.panel li").hide();
			$($(this).attr("href")).show();
			return false;
		});
	});
</script>
<script type="text/javascript">
function update(product_no){
	var url = "update?product_no="+product_no;
	
	location.href = url;
}

function order(product_no,product_name){
if(confirm("정말탈퇴 하겠습니까?")){
	var url = "order";
	url = url +"?product_no="+product_no;
	url = url +"&product_name="+product_name;
	 
	location.href=url;
}
 
function basket(product_no){
var url ="basket"
url = url + "?product_no="+product_no;
 
location.href=url;
}
	
</script>
</head> 

<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
 
<DIV class="title">${dto.product_name}의 상품정보</DIV>
 
  <TABLE class='table'>
   <form name="frm">
<table border="1" cellpadding="1" cellspacing="1" style="width: 1000px;">
	<tbody>
		<tr>
			<td class="tdsize">
				<img alt="" src="${pageContext.request.contextPath}/product_images/1084_shop1_943011.jpg" style="width: 500px; height: 500px;" />
			</td>
			<td><p>2016 헬로 코코 먼슬리 다이어리</p>
상품명      2016 헬로 코코 먼슬리 다이어리 <br>
영문상품명  2016 Hello COCO Monthly Diary<br>
판매가격  4,220원 <br>
<p>소비자가  <em><s>6,500원</s></em></p>
적립금    200원 (5%)<br>
디자인- <select name="check_cate">
	<option selected="selected" value="0">[필수]옵션 선택</option>
	<option value="블루랜드">블루랜드</option>
	<option value="아일랜드">아일랜드</option>
	<option value="피크닉">피크닉</option>
	<option value="네이비">네이비</option>
	</select><br>
(최소주문수량 1개 이상)<br>

 위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.<br>

상품명<br>
상품수<br>
가격<br>
 수량증가수량감소 <br>

 총 상품금액(수량) : 0 (0개)  <br>
</td>
		</tr>
		<tr>
			<td>
			<table border="1" cellpadding="1" cellspacing="1" style="width: 500px;">
				<tbody>
					<tr>
						<td><img alt="" src="${pageContext.request.contextPath}/product_images/1084_shop1_943011.jpg" style="width: 100px; height: 100px;" /></td>
						<td><img alt="" src="${pageContext.request.contextPath}/product_images/1084_shop1_132343.jpg" style="width: 100px; height: 100px;" /></td>
						<td><img alt="" src="${pageContext.request.contextPath}/product_images/1084_shop1_233427.jpg" style="width: 100px; height: 100px;" /></td>
						<td><img alt="" src="${pageContext.request.contextPath}/product_images/1084_shop1_571799.jpg" style="width: 100px; height: 100px;" /></td>
						<td><img alt="" src="${pageContext.request.contextPath}/product_images/1084_shop1_943011.jpg" style="width: 100px; height: 100px;" /></td>
					</tr>
				</tbody>
			</table>

			<p>&nbsp;</p>
			</td>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
</form>
<from>
<div id="container">
	<ul class="tab">
		<li><a href="#tab1" class="selected">관련상품</a></li>
		<li><a href="#tab2">상품상세정보</a></li>
		<li><a href="#tab3">상품사용후기</a></li>
		<li><a href="#tab4">상품Q&A</a></li>
		<li><a href="#tab5">배송정보</a></li>
		<li><a href="#tab6">교환 및 반품정보</a></li>
	</ul>
	<ul class="panel">
		<li id="tab1">
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse congue elit eu mauris sollicitudin dictum. Phasellus nec felis ut arcu placerat tincidunt. Vestibulum luctus mauris ac ante molestie eleifend. Quisque dapibus nulla ac purus volutpat posuere a quis nisl. Nam condimentum purus vitae nibh feugiat imperdiet. Cras purus mi, egestas vitae imperdiet volutpat, suscipit nec odio. Maecenas elementum aliquam metus nec ultrices. Suspendisse potenti. Praesent lobortis gravida massa in volutpat. Nunc id mauris id orci congue malesuada. Aliquam vel mauris risus, sit amet laoreet sapien. Maecenas varius gravida purus vel pharetra. Sed quis leo id mi laoreet accumsan. Vestibulum ac mauris purus, nec rutrum sem. Sed euismod magna a lacus consectetur in mattis quam suscipit. Phasellus nec enim libero. Donec sit amet justo diam. In hac habitasse platea dictumst. Sed nibh libero, iaculis eget aliquet eu, rhoncus nec ligula.
		</li>
		<li id="tab2">
Nam cursus molestie erat, a sodales erat sollicitudin ut. Maecenas nec urna mi, eu congue turpis. Duis vitae volutpat lorem. Ut vulputate tempor elit, vitae iaculis elit sollicitudin at. Ut gravida fermentum tempor. Mauris metus ante, volutpat et porta a, malesuada vel purus. In lobortis ullamcorper lorem eu malesuada. Nullam sollicitudin, urna eu euismod suscipit, eros sapien adipiscing arcu, sit amet ultricies lacus elit sed urna. Nam scelerisque, nulla eu mollis elementum, ipsum tortor ullamcorper felis, eget laoreet diam turpis dignissim metus. In eget lectus sit amet mi pretium pellentesque varius vitae augue. Integer mattis, elit nec adipiscing rhoncus, elit tellus congue sapien, et auctor mi nisi in purus. Curabitur commodo, neque sed ornare porta, purus magna rhoncus eros, quis consectetur ipsum erat ac mi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce sed turpis tortor, quis euismod enim. Integer faucibus venenatis egestas. Etiam eu metus et sem bibendum fermentum. Sed dui ante, sollicitudin at tincidunt at, pretium sit amet diam. Nunc porttitor tristique est sed pulvinar. Fusce eu ligula vitae orci venenatis sagittis sed quis ipsum.
		</li>
		<li id="tab3">
Pellentesque in metus leo. Praesent porta, dolor nec mattis ullamcorper, velit purus mollis enim, nec tincidunt magna massa ornare elit. In ipsum enim, pellentesque vitae gravida ultrices, aliquet nec ante. Mauris sed nunc ut ligula dictum convallis vel et nunc. Aenean eget enim vitae nulla lacinia consequat. Quisque blandit, ante vel sodales sollicitudin, neque ante elementum leo, ut consequat dui risus ut purus. Vestibulum viverra lacus at felis dignissim bibendum. Maecenas interdum nisl eu metus porta luctus. Suspendisse nulla neque, ultricies nec facilisis nec, mollis id sapien. Donec nec quam et felis pulvinar fringilla a non orci. Maecenas tincidunt magna a sem faucibus eu interdum magna aliquam. Suspendisse a diam lorem, nec malesuada sapien. Nam a scelerisque velit. Integer commodo malesuada odio, sit amet rutrum ante viverra ut. In egestas, arcu id pretium tempus, ligula nibh interdum enim, non bibendum velit felis sed augue. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent augue eros, posuere pharetra pharetra eu, feugiat eu velit.
		</li>
		<li id="tab4">
Vestibulum a quam scelerisque odio ultricies mollis eget a leo. Morbi dictum, velit lobortis hendrerit tincidunt, lacus nisl rhoncus felis, commodo sollicitudin magna augue non est. Nunc in felis quis purus dignissim blandit vel ut erat. In hac habitasse platea dictumst. Nullam euismod auctor rhoncus. Proin et sem ac neque placerat vulputate. Nullam consequat purus eget libero posuere pulvinar. Aenean luctus luctus leo nec vehicula. Praesent eleifend nibh sed neque vestibulum hendrerit. Nulla suscipit vehicula sem, quis congue ligula gravida vel. Aliquam risus urna, pretium eget porttitor hendrerit, gravida at libero. Curabitur nec luctus risus. Etiam ullamcorper fringilla nisl hendrerit convallis. Duis in nibh tellus. Donec porta nibh id purus mollis sodales. Nam eget libero vel metus congue ultricies ut vitae nibh. Sed ac justo ac eros luctus ullamcorper ut tincidunt nibh. Fusce dapibus bibendum urna, id tempor turpis sodales sed. Nam dui purus, posuere vel placerat eu, posuere non magna.
		</li>
		<li id="tab5">
			<br>
배송정보<br>
배송 방법 : 택배<br>
배송 지역 : 전국지역<br>
배송 비용 : 2,500원<br>
배송 기간 : 2일 ~ 5일<br>
배송 안내 : - 12월 20일 이벤트 기간 한시적 4만원이상 무료 배송 <br>
- 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br>
특히 아르디움 대형 우드 제품은 별도의 운송업체를 통하여 직배송하므로 지역별 차등요금이 부과됩니다. 자세한 내용은 제품 상세페이지 및 고객센터를 통해서 알려드리고 있습니다.<br>
- 고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.<br>
<br>
		</li>
		<li id="tab6">
			<br>
교환  및 반품정보<br>
<br>
<br>
교환 및 반품이 가능한 경우<br>
- 받으신 상품이 내용과 다를 경우에는 제품을 받은 날로부터 3일 이내. 단, 패킹 제품의 경우 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.<br>
<br>
- 받으신 상품 및 제품의 내용이 표시/광고 내용과 다르거나 다르게 이행된 경우에는 공급받은 날로부터 7일 이내.<br>
<br>
- 원단불량/부자재불량/봉제불량 발견시:<br>
      구입일로부터 30일 이내 교환 / 30일 이후 1년 미만은 수리 후 발송(제품 상태에 따른 추가 비용 발생 가능)<br>
<br>
<br>
교환 및 반품이 불가능한 경우<br>
- 원단불량/부자재불량/봉제불량 발견시:<br>
      자연적인 마모현상이나 사용자의 부주의에 의한 손상은 30일이 경과하지 않아도 교환이 불가<br>
- 사이즈 부정확 및 디자인/색상불만:<br>
     구입일로 14일 이내에 제품에 손상이 없을 시에 교환(최초 패키지 상태 유지시)<br>
     ※ 고객의 변심을 통한 교환, 반품을 하실 경우 상품 반송 비용은 고객께서 부담하셔야 합니다.(색상 교환, 사이즈 교환 등 포함)<br>
<br>
- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우<br>
<br>
- 복제가 가능한 상품등의 포장을 훼손한 경우<br>
  (자세한 내용은 고객만족센터 1:1 E-MAIL상담을 이용해 주시기 바랍니다.)<br>
<br>
품질 보증 및 제품 수리<br>
- 품질 보증 기간 : 구입 후 1년 <br>
<br>
- 고객 부주의에 의한 제품 훼손 및 세탁 부주의에 의한 변형, 자연적인 마모현상은 제품의 상태에 따라 차등 비용 부과( 당사로 제품 입고 후 비용 여부 결정 )<br>
<br>
		</li>
	</ul>
</div>
</from>
<br>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='상품상세정보수정' onclick="location.href='update?id=${dto.product_no}'">
    <input type='button' value='상품구매' onclick="order('${dto.product_no}','${dto.product_name}')">
    <input type='button' value='장바구니' onclick="basket('${dto.product_no}')">
  </DIV>
 
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
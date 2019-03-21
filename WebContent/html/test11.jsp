<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
	function fimg(csrc) {
		window.document.images["img1"].src = csrc;
	}
	
	function textCopy() {
		var cvalue = window.document.myForm.chk.checked;
		if(cvalue==true){
			document.myForm.client2.value = document.myForm.client1.value;
		}else{
			document.myForm.client2.value = "";
		}
	}
	
	function fcheckAll(){
		var clength = window.document.myForm["sul"].length;
		for(var i=0; i<clength;i++){
			document.myForm["sul"][i].checked=true;
		}
	}
	
	function fcheckdel(){
		var clength = window.document.myForm["sul"].length;
		for(var i=0; i<clength;i++){
			document.myForm["sul"][i].checked=false;
		}
	}
	
	function bestpoll(){
		var clength = document.myForm.bestsul.length;
		for(var i=0; i<clength; i++){
			if(document.myForm.bestsul[i].checked==true){
				
				alert(document.myForm.bestsul[i].value+"가 좋다!");
				return;
			}
		}
		
		window.alert("술 싫어하나요?");
	}
	
	function emailCheck() {
		
		var f = document.myForm;
		var clength = f.emailSel.options.length;
		var cvalue = f.emailSel.selectedIndex;
		
		f.email2.value ="";
		
		if(cvalue==(clength-1)){
			f.email2.readOnly = false;
		}
		else{
			f.email2.value = f.emailSel.options[cvalue].value;
			f.email2.readOnly = true;
		}
		
	}

	
</script>

</head>
<body>

<img alt="" src="./image/13798939b.jpg" width="300" height="300" name="img1"/><br/>

<img alt="" src="./image/13798939b.jpg" width="80" height="80" border="1" 
style="cursor: hand;" onmouseover="fimg('./image/13798939b.jpg')"/>

<img alt="" src="./image/13798939c.jpg" width="80" height="80" border="1" 
style="cursor: hand;" onmouseover="fimg('./image/13798939c.jpg')"/>

<img alt="" src="./image/13798939e.jpg" width="80" height="80" border="1" 
style="cursor: hand;" onmouseover="fimg('./image/13798939e.jpg')"/>

<img alt="" src="./image/13798939f.jpg" width="80" height="80" border="1" 
style="cursor: hand;" onmouseover="fimg('./image/13798939f.jpg')"/>

<br/><br/><br/><hr/>

<form action="" name="myForm">
주문고객정보- 주소 <input type="text" size="40" name="client1"/>
<input type="checkbox" name="chk" onclick="textCopy();"/> 배송장소가 위와 동일 <br/> 
배송장소정보- 주소 <input type="text" size="40" name="client2"/>

<br/><br/><br/><hr/>

좋아하는 술 종류 <br/>
<a href="javascript:fcheckAll();">전체선택</a>/
<a href="javascript:fcheckdel();">전체해제</a><br/>
<input type="checkbox" name="sul"/>흑맥주<br/>
<input type="checkbox" name="sul"/>보드카<br/>
<input type="checkbox" name="sul"/>위스키<br/>
<input type="checkbox" name="sul"/>소주<br/>
<input type="checkbox" name="sul"/>칵테일<br/>
<input type="checkbox" name="sul"/>막걸리<br/>
<input type="checkbox" name="sul"/>와인<br/>

<br/><br/><br/><hr/>

가장 좋아하는 술 종류 <br/>
<input type="radio" name="bestsul" value="흑맥주"/>흑맥주<br/>
<input type="radio" name="bestsul" value="보드카"/>보드카<br/>
<input type="radio" name="bestsul" value="위스키"/>위스키<br/>
<input type="radio" name="bestsul" value="소주"/>소주<br/>
<input type="radio" name="bestsul" value="칵테일"/>칵테일<br/>
<input type="radio" name="bestsul" value="막걸리"/>막걸리<br/>
<input type="radio" name="bestsul" value="와인"/>와인<br/>

<a href="javascript:bestpoll();"><img src="./image/btn_poll01.gif" height="25"></a>


email주소
<input type="text" name="email1">
@
<input type="text" name="email2" readonly="readonly">
<select name="emailSel" onchange="emailCheck();">
	<option value="">선택</option>
	<option value="naver.com">네이버</option>
	<option value="daum.net">다음</option>
	<option value="gmail.com">구글</option>
	<option value="nate.com">네이트</option>
	<option value="">직접입력</option>
</select>


</form>
</body>
</html>
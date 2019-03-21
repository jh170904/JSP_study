<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 스타일시트 -->
<style type="text/css">

body{
	font-size: 10pt;
}
.itemBtn{
	font-size: 9pt;
	color: rgb(0,0,0);
	background-color: rgb(240,240,240);
	width: 30pt;
}

.btn{
	font-size: 9pt;
	color: rgb(0,0,0);
	background-color: rgb(240,240,240);
}
.itemList{
	font-size: 9pt;
	width: 100pt;
}

</style>

<!-- 자바스크립트 -->
<script type="text/javascript">

	function itemAdd() {
		var f = document.myForm;
		var leftItem = f.leftItem;
		leftItem[0] = new Option('배수지','배수지');/* 보이는 값(text), value값 순서(인덱스에 해당) */
		leftItem[1] = new Option('전지현','전지현');/*dto.getName()으로 반복문 돌리면 DB에 있는 이름을 한번에! */
		leftItem[2] = new Option('이하나','이하나');
		leftItem[3] = new Option('천송이','천송이');
		leftItem[4] = new Option('한가인','한가인');
		leftItem[5] = new Option('이윤성','이윤성');
		leftItem[6] = new Option('배슬기','배슬기');
	}

	
	function itemMove(val){
		var f = document.myForm;		
		var source,target;
		if(val=="left"){
			source = f.rightItem;
			target = f.leftItem;
		}else{
			source = f.leftItem;
			target = f.rightItem;
		}
		var n,i;
		n = target.length;
		
		for(i=source.length-1;i>=0;i--){
			if(source.options[i].selected){
				target[n++] = new Option(source.options[i].text,source.options[i].value);
				source[i] = null; /* 이동전 데이터 초기화 */
			}
		}
	}
	
	function sendIt() {
		var f = document.myForm;
		
		if(f.rightItem.val==""){ //f.rightItem.length==0
			alert("쪽지 보낼 사람을 선택하세요.");
			f.rightItem.focus();
			return;
		}
		if(!f.msg.value){
			alert("쪽지 내용을 입력하세요.");
			f.msg.focus();
			return;
		}
		
		for(var i=0;i<f.rightItem.length;i++){
			f.rightItem[i].selected = true;
			/* f.rightItem.options[i].selected = true; 상동. 선택하지 않더라도 rightItem에 있으면 메세지 전송하기 위함 */
		}
		
		f.action = "listTest_ok.jsp";
		f.submit();/* 모든 조건문을 실행한 뒤 submit 실행. action으로 찾아가는 경로. */
	}
	
	
</script>

</head>
<body onload="itemAdd()"><!--초기화할때 많이 사용하는 방법-->

<form method="post" name="myForm">
<!--폼에 name을 주는 이유는 자바스크립트에서 변수를 호출해서 사용하기 위함  -->
<table border="0" style="font-size: 10pt;">
<tr align="left">
	<td width="150">전체리스트</td>
	<td width="70">&nbsp;</td>
	<td width="150">받는사람</td>
</tr>
<tr align="center">
	<td width="150">
		<select name="leftItem" multiple="multiple" size="7"  class="itemList">
			<!-- <option value="배수지">배수지</option> 이렇게 옵션으로 잡을 경우 이동해야되는데 기존 데이터가 안사라짐 코딩으로 작성해야 함-->
		</select>
	</td>
	<td width="70">
		<input type="button" value="&gt;" onclick="itemMove('right');" class="itemBtn"/><br/>
		<br/><br/><br/>
		<input type="button" value="&lt;" onclick="itemMove('left');" class="itemBtn"/><br/>		
	</td>
	<td width="150">
		<select name="rightItem" multiple="multiple" size="7" class="itemList">
			<!-- <option value="배수지">배수지</option> -->
		</select>
	</td>
</tr>
<tr>
	<td colspan="3">
		<br/>메세지<br/>
		<textarea rows="5" cols="50" name="msg"></textarea>
	</td>
</tr>
<tr align="center">
	<td colspan="3" align="right">
		<input type="button" value="쪽지보내기" onclick="sendIt();" class="btn" />
		<!--여기서는 submit을 안쓰고 button을 사용함. submit으로 되어 있을 경우 함수호출 되어서 실행될때 조건문 있어도 끝날때 action찾아감.button은 메소드찾아감. -->
	</td>
</tr>
</table>


</form>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 페이지</title>

<script type="text/javascript">

	function sendIt(){
		
		var f = document.myForm; //window. 맨앞에 생략
		if(!f.userId.value){
			alert("아이디를 입력!!");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value){
			alert("패스워드를 입력하세요");
			f.userPwd.focus();
			return;
		}
		
		alert("회원가입 성공!!");
	}
	
	function onlyNum(){

		if(event.keyCode<48||event.keyCode>57){//숫자 아스키코드
			event.returnValue=false;			
		}
		
	}
	
	function hangul(){
		
		if(event.keyCode<12592||event.keyCode>12687){//한글 유니코드
			event.returnValue=false;			
		}
		
	}
</script>

</head>
<body>

<form action="" name="myForm" method="post">

아이디 : <input type="text" name="userId"><br/> <!-- name에 들어가는 값은 변수가 되므로 대소문자 구분에 주의  -->
패스워드 : <input type="password" name="userPwd"><br/>
이름 : <input type="text" name="userName" onkeypress="hangul();"><br/> <!-- 이름 입력할때마다 메소드 호출  -->
성별 : <input type="radio" name="gender" value="M" checked="checked"> 남자 
<input type="radio" name="gender" value="" checked="checked"> 여자<br/>
전화 : 
<select name="tel1">
	<option value="">선택</option>
	<option value="011">011</option>
	<option value="010" selected="selected">010</option><!--기본 디폴트로 010 selected -->
	<option value="070">070</option>
</select>
<input type="text" name="tel2" onkeypress="onlyNum();" />
-<input type="text" name="tel3" onkeypress="onlyNum();" /><br/>
동의합니까? <input type="checkbox" name="chk" value="y"/><br/>
메모 : <br/>
<textarea rows="5" cols="20" name="memo"></textarea><br/>
<input type="button" value="회원가입" onclick="sendIt()"/>
<input type="reset" value="다시입력"/>
<input type="button" value="취소"/>
</form>

</body>
</html>
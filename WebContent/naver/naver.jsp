<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style type="text/css">

.qna{	
	font-size:10pt;
	width: 325pt; 
	height: 15pt;
}
</style>

<script>

	function infcheck(){
		var f = document.myForm;
		
        if(f.name.value==""){
			alert("이름을 입력하세요!");
			f.name.focus();
			return;
		}
        
		if(f.id.value==""){
			alert("아이디를 입력하세요!");
			f.id.focus();
			return;
		}
		
        if(f.nickname.value==""){
			alert("별명을 입력하세요!");
			f.id.focus();
			return;
		}
        
		if(f.pwd1.value=="" || f.pwd2.value==""){
			alert("패스워드를 입력하세요!");
			f.pwd1.focus();
			return;
		}
		
		if(f.pwd1.value!=f.pwd2.value){
			alert("패스워드가 일치하지 않습니다!");
			f.pwd1.focus();
			return;
		}
		
        if(f.ans.value=="" ||(f.qnasel.value==""&&f.selfq.value=="")){
       
			alert("비밀번호 발급 수단(비밀번호 질문/답)을 입력하세요!");
			f.qnasel.focus();
			return;
            
		}
		if(f.email1.value=="" && f.chkemail.checked==false){
			alert("비밀번호 발급 수단(이메일)을 입력하세요!");
			f.email1.focus();
			return;
		}
		if(f.phone1.value=="" && f.chkphone.checked==false){
			alert("비밀번호 발급 수단(핸드폰번호)을 입력하세요!");
			f.phone1.focus();
			return;
		}
		
        if(f.chksosik.value==null){
        	f.chksosik.value = "no";
		}
        
        f.submit();
			
	}
    
    function idcheck(){
    
    	f.action = "idcheck.jsp?id="+document.myForm.id.value ;
    	f.submit();
		return;
    }
    
    function notemail() {
    	
		var cvalue = window.document.myForm.chkemail.checked;
		
		if(cvalue==true){
			
			document.myForm.email1.value = "";
    		document.myForm.email1.readOnly = true;
            document.myForm.email2.value = "";
            document.myForm.email2.readOnly = true;
            
		}else{
            document.myForm.emailid.readOnly = false;   	
        }
	}
    
    function notphone() {
		var cvalue = window.document.myForm.chkphone.checked;
		if(cvalue==true){
        	document.myForm.phone1.readOnly = true;
            document.myForm.phone2.value = "";
            document.myForm.phone2.readOnly = true;
            document.myForm.phone3.value = "";
            document.myForm.phone3.readOnly = true;
		}else{
        	
        }
	}
    
    function emailCheck() {
		
		var f = document.myForm;
		var clength = f.emailaddr.options.length;
		var cvalue = f.emailaddr.selectedIndex;
		   
		//f.email2.value ="";
		if(cvalue==(clength-1)){
			f.email2.readOnly = false;
		}else{
			f.email2.value = f.emailaddr.options[cvalue].value;
			f.email2.readOnly = true;
		}
	}
    
    function qnaCheck() {
		
		var f = document.myForm;
		var clength = f.qnasel.options.length;
		var cvalue = f.qnasel.selectedIndex;
		
		if(cvalue==(clength-1)){
			f.selfq.readOnly = false;
            f.selfq.value="";
            
		}else{
			f.selfq.value = f.qnasel.options[cvalue].value;
			f.selfq.readOnly = true;

		}
	}
    
    function sosik() {
    	
    	var f = document.myForm.chksosik.checked;
   
	   if(f==false){
		   document.myForm.chksosik.value = "no";
	   }else{
		   document.myForm.chksosik.value = "yes";
	   }

	}
    
</script>

</head>
<body>
<form name="myForm" action="naver_ok.jsp" method="post">
<table width="750" height="600" style="font-size: 10pt; font-family: 돋움" cellpadding="5" cellspacing="1" >
<tr>
	<td colspan="2">
	<table width="750" style="font-size: 10pt; font-family: 돋움" cellpadding="1">
	<tr>
		<td><b>회원정보입력</b></td>
	</tr>
	<tr height="5pt">
		<td colspan="2" bgcolor="#dad6d7"></td>
	</tr>
	<tr>
		<td><font size="1" color="gray"><b>회원정보는 개인정보취급방침에 따라 안전하게 보호되며 회원님의 명백한 동의없이 공개 또는 제3자에게 제공되지않습니다</b></font></td>
		<td><font size="2"><a href="">개인정보취급방침</a></font></td>
	</tr>
	</table>
</td>
</tr>
<tr>
	<td colspan="2" align="right"><img src="./image/check.png"/><font size="2">표시 필수 입력사항  </font></td>
</tr>
<tr>
	<td bgcolor="#F6F6F6" width="150"><img src="./image/check.png"/><b>이름</b></td>
    <td><input type="text" name="name"/></td>
</tr>
<tr>
	<td bgcolor="#F6F6F6"><img src="./image/check.png"/><b>아이디</b></td>
    <td><input type="text" name="id"/> @naver.com <a href="javascript:idcheck();"><input type="button" value="중복확인"></a>
	<br/><font size="2" color="gray">입력하신 아이디로 네이버 이메일 주소가 생성됩니다.</font>
	</td>
</tr>
<tr>
	<td bgcolor="#F6F6F6"><img src="./image/check.png"/><b>별  명</b></td>
    <td><input type="text"  name="nickname"/></td>
</tr>
<tr>
	<td bgcolor="#F6F6F6"><img src="./image/check.png"/><b>비밀번호</b></td>
    <td><input type="password" name="pwd1"/><font size="2"><a href=""> 비밀번호 도움말</a></font></td>
</tr>
<tr>
	<td bgcolor="#F6F6F6"><img src="./image/check.png"/><b>비밀번호 확인</b></td>
    <td><input type="password" name="pwd2"/></td>
</tr>
<tr>
	<td bgcolor="#F6F6F6" ><img src="./image/check.png" /><b>비밀번호 발급수단</b></td>
	<td><font size="2" color="#4C0B5F">
		아래 항목은 아이디확인, 임시비밀번호발급 시 반드시 필요한 정보입니다<br>
		정확한 정보를 입력한 후 꼭 기억해주세요.</font>
		<table bgcolor="#F8E0E6" cellpadding="4" cellspacing="1" width="600" style="font-size: 10pt; font-family: 돋움">
		<tr>
			<td colspan="2"><b>1. 비밀번호 질문/답</b></td>
		</tr>
		<tr>
			<td width="40" align="center">질  문</td>
			<td colspan="2" > 
				<select name="qnasel" onchange="qnaCheck()" class="qna">
					<option value="가장 기억에 남는 장소는?" >가장 기억에 남는 장소는?</option>
					<option value="가장 좋아하는 가수는?">가장 좋아하는 가수는?</option>
					<option value="좋아하는 노래?">좋아하는 노래?</option>
					<option value="태어난 곳?">태어난 곳?</option>	
                    <option value="">질문,답변 직접 입력</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="40" align="center"></td>
			<td>
				<input type="text" name= "selfq"  
                value="질문에서 직접입력을 선택하면 기입 가능합니다." class="qna" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td width="40" align="center">답  변</td>
			<td colspan="2"><input type="text" class="qna" name="ans"/></td>
		</tr>
		<tr>
			<td colspan="2"><b>2. 이메일 주소</b></td>
		</tr>
		<tr>
			<td colspan="2"><input type="text" size="10" name="email1"/> @ 
                <input type="text" name="email2" readonly="readonly">
                <select style="height:15pt;" name="emailaddr" onchange="emailCheck();">
                    <option value="">선택하세요</option>
                    <option value="naver.com">네이버</option>
                    <option value="daum.net">다음</option>
                    <option value="gmail.com">구글</option>
                    <option value="nate.com">네이트</option>
                    <option value="">직접입력</option>
                </select>
                
				<input type="checkbox" name="chkemail" onclick="notemail()"/>등록 안 함
			</td>
		</tr>
				<tr>
			<td colspan="2"><b>3. 핸드폰 번호</b></td>
		</tr>
		<tr>
			<td colspan="2">
				<select style="height:15pt;" name="phone1">
					<option value="">선택하세요</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
                    <option value="017">017</option>
				</select> 
				- 
				<input type="text" size="4" name="phone2"/> - <input type="text" size="4" name="phone3"/>	
				<input type="checkbox" name="chkphone" onclick="notphone()"/>등록 안 함</td>
		</tr>
		</table>	
	</td>
</tr>
<tr>
	<td bgcolor="#F6F6F6"><b>소식지 수신</b></td>
	<td>
	<input type="checkbox" name="chksosik" onclick="sosik();"> 메일로 네이버 소식지를 수신합니다.
	</td>
</tr>
<tr height="35" >
	<td align="center" colspan="2">
	<input type="button" class="btn" value="회원가입" onclick="infcheck()"/>
	<input type="button" class="btn" value="리스트조회" onclick="javascript:location.href='<%=cp %>/naver/list.jsp';">
	</td>
</tr>
<tr height="1">
	<td colspan="2" bgcolor="#dad6d7"></td>
</tr>
<tr>
	<td colspan="2" align="center" > Copyright ⓒ <b>HOHO Corp.</b> All Rights Reserved </td>
</tr>

</table>


</form>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>
$(function(){
	
	$.("#btn_submit").click(function(){
		
		var userid= $.trim($("#userid").val());
		var pass= $.trim($("#pass").val());
		if( userid == "" ){
			alert("Please Enter your ID");
			$("#userid").focus();
			return false;
		}
		if( pass == "" ){
			alert("Please Enter your P/W");
			$("#pass").focus();
			return false;
		}
		
		$.ajax({
			
			/* 전송 전 세팅 */
			type:"POST",
			data:"userid="+userid+"&pass="+pass,  // json(전송)타입
			url:"loginWriteSub.do",
			dataType:"text", // 리턴타입
			
			/*전송후 세팅*/
			success: function(result){ // controller -> "ok"
				if(result == "ok"){
					alert(userid+="user, LOGIN SUCCESS");
					location="boardList.do";
				} else {
					alert("LGOIN FAIL")
				}
			},
			error: function(){ // 오류발생
				alert("Error");
			}
			
		});
		
	});
	
});

</script>

</head>
<style>
body{
	font-size:9pt;
	font-color:#333333;
	font-family:맑은고딕;
}
a{
	text-decoration:none;
}
table{
	width:600px;
	border-collapse:collapse;
}
th,td{
	border:1px solid #cccccc;
	padding:3px;
	line-height:2.0;
}
caption{
	font-size:15pt;
	font-weight:bold;
	margin-top:10px;
}
.div_button {
	width:600px;
	text-align:center;
	margin-to:5px;
}
</style>
<body>
<form name="frm" id="frm">
<table>
	<caption>LOGIN</caption>
	<tr>
		<th><label for="userid">ID</label></th>
		<td>
		<input type="text" name="userid" id="userid" placeholder="Please enter your ID">
		</td>
	</tr>
	<tr>
		<th><label for="pass">P/W</label></th>
		<td>
		<input type="password" name="pass" id="pass">
		</td>
	</tr>
</table>
<div class="div_button">
	<button type="button" id="btn_submit">LOGIN</button>
	<button type="reset">RESET</button>
</div>
</form>

</body>
</html>
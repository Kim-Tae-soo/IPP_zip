<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <script src="/KTS_eGovFrame_Project/script/jquery.js"></script>
<script src="/KTS_eGovFrame_Project/script/jquery-ui.js"></script> -->

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>
$( function() {
  $( "#birth" ).datepicker({
    changeMonth: true,
    changeYear: true
  });
  /*
  우편주소
  */
  $("#btn_zipcode").click(function(){
	 
	  var w = 500;
	  var h = 100;
	  var url = "post1.do";
	  window.open(url,'zipcode','width='+w+",height="+h);
	  
  });
  
  /*
  ID중복체크 버튼 
  */
  $("#btn_idcheck").click(function(){
	 
	  var userid = $.trim($("#userid").val()); // 현재 창에 입력된 값
	  if(userid == ""){
		  alert("Plaes Enter your ID");
		  $("#userid").focus();
		  return false;
	  }
	  // idcheck.do 로 data 전송
	  $.ajax({
		  type:"POST",
			data:"userid="+userid,
			url:"idcheck.do",
			dataType:"text", // 리턴타입
			
			/*전송후 세팅*/
			success: function(result){ // controller -> "ok"
				if(result == "ok"){
					alert("Username is available.");
				} else {
					alert("This is a duplicate ID.");
				}
			},
			error: function(){ // 오류발생
				alert("Error");
			}
	  });
  });
  
  
  $("#btn_submit").click(function(){
	  
	  var userid = $("#userid").val();
	  var pass = $("#pass").val();
	  var name = $("#name").val();
	  userid = $.trim(userid);
	  pass = $.trim(pass);
	  name = $.trim(name);
	  
	  if(userid ==""){
		  alert("Please your enter ID")
		  $("#userid").focus();
		  return false;
	  }
	  if(pass ==""){
		  alert("Please your enter P/W")
		  $("#pass").focus();
		  return false;
	  }
	  if(name ==""){
		  alert("Please your enter Name")
		  $("#name").focus();
		  return false;
	  }
	  $("#userid").val(userid);
	  $("#pass").val(pass);
	  $("#name").val(name);
	  
	  
	  var formData = $("#frm").serialize();
	  
		// ajax : 비동기 전송방식의 기능을 가지고 있는 J-Query의 함수
		$.ajax({
			type:"POST",
			data:formData,
			url:"memberWriteSave.do",
			dataType:"text", // 리턴타입
			
			/*전송후 세팅*/
			success: function(result){ // controller -> "ok"
				if(result == "ok"){
					alert("JOIN SUCCESS");
					location="loginWrtie.do";
				} else {
					alert("JOIN FAIL")
				}
			},
			error: function(){ // 오류발생
				alert("Error");
			}
			
		});
	  
	  
  });
  
} );
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
<%@include file="../include/topmenu.jsp" %>
<form name="frm" id="frm">
<table>
	<caption>JOIN</caption>
	<tr>
		<th><label for="userid">ID</label></th>
		<td>
		<input type="text" name="userid" id="userid" placeholder="Please enter your ID">
		<button type="button" id="btn_idcheck">Check</button>
		</td>
	</tr>
	<tr>
		<th><label for="pass">P/W</label></th>
		<td>
		<input type="password" name="pass" id="pass">
		</td>
	</tr>
	<tr>
		<th><label for="name">Name</label></th>
		<td>
		<input type="text" name="name" id="name">
		</td>
	</tr>
	<tr>
		<th><label for="gender">Gender</label></th>
		<td>
		<input type="radio" name="gender" id="gender" value="M">M
		<input type="radio" name="gender" id="gender" value="F">F
		</td>
	</tr>
	<tr>
		<th><label for="birth">Birth</label></th>
		<td>
		<input type="text" name="birth" id="birth">
		</td>
	</tr>
	<tr>
		<th><label for="phone">Phone</label></th>
		<td>
		<input type="text" name="phone" id="phone"> (ex : 010-1234-5678)
		</td>
	</tr>
	<tr>
		<th><label for="zipcode">zipcode</label></th>
		<td>
		<input type="text" name="zipcode" id="zipcode">
		<button type="button" id="btn_zipcode">zipcode Search</button>
		<br>
		<input type="text" name="address" id="address">
		</td>
	</tr>
</table>
<div class="div_button">
	<button type="button" id="btn_submit">SAVE</button>
	<button type="reset">RESET</button>
</div>
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록 화면</title>

<script src="/KTS_eGovFrame_Project/script/jquery.js"></script>
<script src="/KTS_eGovFrame_Project/script/jquery-ui.js"></script>

</head> 

<style>

body{
	font-size:9pt;
}
/* body 사용 시 전체적으로 적용이되나 버튼은 적용이 안됌 */
button {
	font-size:9pt;
}

table {
	width:600px;
	border-collapse:collapse;
}

th,td{
	border:1px solid #cccccc;
	padding:3px
}

.input1 {
	width : 98%;
}
.textarea {
	width:98%;
	height:70px;
}

</style>

<script>

//초깃값
$(function (){
	
	$("#title").val("Please enter title..");
	$("#name").val("Please enter your name..");
	$("#content").val("Please enter content..");
	
});

function fn_submit(){
	
	// trim() --> 앞뒤 공백 제거 , java , jsp
	
/* 
 자바 스크립트 명령어
 if(document.frm.title.value==""){
		alert("제목을 입력해주세요.");
		document.frm.title.focus();
		return false;
	}
	
	if(document.frm.pass.value==""){
		alert("암호를 입력해주세요.");
		document.frm.pass.focus();
		return false;
	}	 
	
	 document.frm.submit(); // 동기전송방식. 
	
	*/
	
	/* J-Query 코드*/
	if( $.trim($("#title").val() ) ==""){
		alert("Please enter the TITLE");
		$("#title").focus();
		return false;
	}
	$("#title").val( $.trim($("#title").val()) );
	 
	if( $.trim($("#pass").val() ) ==""){
		alert("Please enter the P/W..");
		$("#pass").focus();
		return false;
	}
	$("#pass").val( $.trim($("#pass").val()) );
	
	var formData = $("#frm").serialize();
	
	// ajax : 비동기 전송방식의 기능을 가지고 있는 J-Query의 함수
	$.ajax({
		type:"POST",
		data:formData,
		url:"boardWriteSave.do",
		dataType:"text", // 리턴타입
		success: function(data){ // controller -> "ok"
			if(data == "ok"){
				alert("SAVE SUCCESS");
				location="boardList.do";
			} else {
				alert("SAVE FAIL")
			}
		},
		error: function(){ // 오류발생
			alert("Error");
		}
		
	});
	
	
}
 
</script>

<body>
<form id="frm">
<table>
	<caption>Post Registration</caption>
	<tr>
		<th width="20%"><label for="title">TITLE</label></th>
		<td width="80%"><input type = "text" name="title" id="title" class="input1"></td>
	</tr>
	<tr>
		<th>P/W</th>
		<td><input type = "password" name="pass" id="pass"></td>
	</tr>
	<tr>
		<th>WRITER</th>
		<td><input type = "text" name="name" id="name"></td>
	</tr>
	<tr>
		<th>CONTENT</th>
		<td><textarea name="content" id="content" class="textarea"></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="submit" onclick="fn_submit();return false;">SAVE</button>
			<button type="button" onclick="location='boardList.do'">RESET</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>
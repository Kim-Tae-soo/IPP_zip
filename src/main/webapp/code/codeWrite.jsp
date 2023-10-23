<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	table {
		width:600px;
		border-collapse:collapse; /*cell 사이의 간격 없앰*/
	}
	
	th,td {
		border:1px solid #cccccc;
		padding : 5px;
	}
</style>

<script>
function fn_submit(){
	
	if(document.frm.name.value ==""){
		alert("Please enter the CODE NAME..");
		document.frm.name.focus();
		return false;
	}
	document.frm.submit();
}

function fn_reset(){
	location = "codeList.do";
}
</script>
<body>

<form name ="frm" method ="post" action="codeWriteSave.do">
<table>
	<tr>
		<th>DIVISION</th>
		<td>
			<select name="gid">
				<option value="1">JOB</option>
				<option value="2">HOBBY</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>CODE NAME</th>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="submit" onclick="fn_submit(); return false;">SAVE</button>
			<button type="reset" onclick="fn_reset()">RESET</button>
		</th>
	</tr>
</table>

</form>

</body>
</html>
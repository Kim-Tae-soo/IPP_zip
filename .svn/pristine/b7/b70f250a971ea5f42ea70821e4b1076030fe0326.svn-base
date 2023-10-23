<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/KTS_eGovFrame_Project/script/jquery.js"></script>
<script src="/KTS_eGovFrame_Project/script/jquery-ui.js"></script>

<script>
$(function(){
	
	$("#delBtn").click(function(){
		
		var pass = $("#pass").val();
		pass = $.trim(pass);
		if(pass == ""){
			alert("Please enter the P/W..");
			$("pass").focus();
			return false;
		}
		
		var sendData = "unq=${unq}&pass="+pass;
		
		$.ajax({
			type:"POST",
			data:sendData,
			url:"boardDelete.do",
			dataType:"text", // 리턴타입
			
			// 전송후 세팅
			success: function(result){ // controller -> "1"
				if(result == "1"){
					alert("SUCCESS");
					location="boardList.do";
				} else if(result == "-1"){
					alert("Passwords do not match..")
				}
				else {
					alert("Delete failed.\n Contact the administrator.")
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
<body>
	<table>
		<tr>
			<th>Enter the P/W</th>
			<td><input type="password" id="pass"></td>
			<td><button type="button" id="delBtn">DELETE</button></td>
		</tr>
	</table>

</body>
</html>
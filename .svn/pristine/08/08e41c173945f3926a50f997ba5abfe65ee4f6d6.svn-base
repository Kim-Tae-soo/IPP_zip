<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<% pageContext.setAttribute("newline","\n"); %>

<c:set var="content" value="${fn:replace(boardVO.content,newline,'<br>') }"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 화면</title>

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
	
	$("#title").val("제목입력");
	
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
		alert("Please enter the TITLE..");
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
	<caption>BOARD DETAIL</caption>
	<tr>
		<th width="20%">TITLE</th>
		<td width="80%">${boardVO.title }</td>
	</tr>
	<tr>
		<th>WRITER</th>
		<td>
		<c:out value="${boardVO.name }"/></td>
	</tr>
	<tr>
		<th>CONTENT</th>
		<td height="50">
		${boardVO.content }
		</td>
	</tr>
	<tr>
		<th>RDATE</th>
		<td>${boardVO.rdate }</td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="button" onclick="location='boardList.do'">LIST</button>
			<button type="button" onclick="location='boardModifyWrite.do?unq=${boardVO.unq}'">MODIFY</button>
			<button type="button" onclick="location='passWrite.do?unq=${boardVO.unq}'">DELETE</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>
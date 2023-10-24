<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String USERID = (String) session.getAttribute("SessionUserID");

%>

<table>
	<tr>
		<th width="20%"><a href="/KTS_eGovFrame_Project/KTS_egovSampleList.do">eGov Board</th>
		<th width="20%"><a href="/KTS_eGovFrame_Project/boardList.do">BOARD</th>
		<th width="20%"><a href="/KTS_eGovFrame_Project/codeList.do">CODE LIST</th>
		<%
		if( USERID == null){
		%>
		
		<th width="20%"><a href="/KTS_eGovFrame_Project/memberWrite.do">JOIN</th>
		<th width="20%"><a href="/KTS_eGovFrame_Project/loginWrite.do">LOGIN</th>
		<%
		} else {
		%>
			<th width="20%"><a href="/KTS_eGovFrame_Project/memberModify.do">INFORMATION</th>
			<th width="20%"><a href="/KTS_eGovFrame_Project/logout.do">LOGOUT</th>
		<%
		}
		%>
	
	</tr>
</table>
</body>
</html>
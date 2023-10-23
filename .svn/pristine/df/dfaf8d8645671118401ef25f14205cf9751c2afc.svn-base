<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODE LIST</title>
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

<script language="javascript">

function fn_delete(code){
	if(confirm("Are you sure you want to delete the code?")){
		location = "codeDelete.do?code="+code;
	}
}

function fn_update(code){
	location = "codeModifyWrite.do?code="+code;
}

function fn_insertCode(){
	location = "codeWrite.do";
}

</script>

<body>
<table>
	<caption>
	<div>CODE LIST</div> <br>
	<div style="width:600%; text-align:left;">Total CODE : ${resultTotal} </div> 
	<div style="text-align:left;"><button type="button" onclick="fn_insertCode()">ADD CODE</button></div> <br>

	</caption> 
	<colgroup>
		<col width ="14%"/>
		<col width ="22%"/>
		<col width ="30%"/>
		<col width ="34%"/>
	</colgroup>
	<tr>
		<th>UNQ</th>
		<th>GROUP NAME</th>
		<th>CODE NAME</th>
		<th>DIVISION<th>
	</tr>
	<c:set var="count" value="1"/>
	<c:forEach var="list" items="${resultList}">
	<tr align="center">
		<td><c:out value ="${count}"/></td>
		<td><c:out value ="${list.gid}"/></td>
		<td>${list.name}</td>
		<td>
		<button type = "button" onclick="fn_update('${list.code}')">MODIFY</button>
		<button type = "button" onclick="fn_delete('${list.code}')">DELETE</button>
		</td>
	</tr>
	
	<c:set var="count" value="${count+1}"/>
	
	</c:forEach>
</table>

</body>
</html>
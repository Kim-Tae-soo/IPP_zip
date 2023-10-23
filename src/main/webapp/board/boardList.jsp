<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.div1{
	width:600px;
	text-align:center;
	font-size:15pt;
}
.div2{
	width:600px;
	text-align:left;
	fontsize:8pt;
}



</style>

<body>
<!-- 번호 , 제목 , 글쓴이 , 등록일 , 조회수 -->
<table>
		<div class="div1">Board List</div>
		<div class="div2">Total Board : ${total } </div>
		<br>
		<div class="div2">
		<form name="searchFrm" method="post" action="boardList.do">
			<select name="searchGubun" id="searchGubun">
				<option value="title">TITLE</option>
				<option value="name">WRITER</option>
				<option value="content">CONTENT</option>
			</select>
			<input type="text" name="searchText" id="searchText">
			<button type="submit">Search</button>
		</form>
		</div>
		<br>
	<tr>
		<th width="15%">UNQ</th>
		<th width="40%">TITLE</th>
		<th width="15%">WRITER</th>
		<th width="15%">RDATE</th>
		<th width="15%">HITS</th>
	</tr>
	
	<c:set var="cnt" value="${rowNumber }"/>
	
	<c:forEach var="result" items="${resultList }">
	
	<tr align="center">
		<td><c:out value="${cnt }"/></td>
		<td align="left">
			<a href="boardDetail.do?unq=${result.unq }"><c:out value="${result.title }"/></a>
		</td>
		<td><c:out value="${result.name }"/></td>
		<td><c:out value="${result.rdate }"/></td>
		<td><c:out value="${result.hits }"/></td>
	</tr>
	
		<c:set var="cnt" value="${cnt-1 }"/>
	
	</c:forEach>
</table>

<br>
<div style="width:600px; maring-top:5px; text-align:center;">
	<c:forEach var="i" begin="1" end="${totalPage }">
	
		<a href="boardList.do?viewPage=${i }">${i }</a>
		
	</c:forEach>
</div>

<div style="width:600px; maring-top:5px; text-align:right;">
	<button type="button" onclick="location = 'boardWrite.do'">WRITE</button>
</div>

</body>
</html>
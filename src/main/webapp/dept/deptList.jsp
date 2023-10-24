<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서목록</title>
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

<table>
	<caption>부서목록</caption>
	<tr>
		<th>부서번호</th>
		<th>부서이름</th>
		<th>부서위치</th>
	</tr>
	
	<c:forEach var="result" items="${resultList}" varStatus="status">
		<tr>
			<td>${result.deptno }</td>
			<td><a href="deptDetail.do?deptno=${result.deptno }">${result.dname }</a></td>
			<td>${result.loc }</td>
		</tr>
	</c:forEach> 
</table>

</body>
</html>
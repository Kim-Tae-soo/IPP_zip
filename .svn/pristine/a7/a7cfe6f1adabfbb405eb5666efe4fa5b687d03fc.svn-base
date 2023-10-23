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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>

<script>

$(function(){
	$("#btn_send").click(function(){
		var addr = $("#address").val();
		// var addr = "[****]대전광역시 중구 태평동";
		var addr_array = addr.split(" ");
		var zipcode = addr_array[0].substring(1,addr_array[0].length-1);
		var address = addr.replace(addr_array[0],""); 
		address = $.trim(address);
		/* 
		alert(zipcode);
		alert(address);
		 ▼▼▼▼▼ 위 내용이 아래로 변경 ▼▼▼▼▼ */
		 opener.document.frm.zipcode.value = zipcode;
		 opener.document.frm.address.value = address;		
		 
		 self.close(); // 화면 닫힘
	});
});


</script>
<body>
<div style="width:100%; text-align:center;">
<select name="address" id="address">

	<c:forEach var="result" items="${resultList }">
	
	<option value="${result.addr}">${result.addr}</option>
	
	</c:forEach>

</select>

<button type="button" id="btn_send">Apply</button>
</div>
</body>
</html>
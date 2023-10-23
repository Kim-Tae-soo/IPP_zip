<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
  /**
  * @Class Name : KTS_egovSampleFileUpload.jsp
  * @Description : Sample File Upload 화면
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sample File Upload</title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/KTS_egovframework/sample.css'/>"/>
    <script type="text/javaScript" language="javascript" defer="defer">
        <!--
        /* 글 상세보기 화면 function */
        function fn_egov_detail(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/viewSample.do'/>";
           	document.listForm.submit();
        }
        
        /* 파일 업로드 화면 function */
        function fn_egov_fileUploadView() {
           	document.listForm.action = "<c:url value='/fileUploadSample.do'/>";
           	document.listForm.submit();
        }
        
        //-->
    </script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<form:form modelAttribute="KTS_searchVO" id="listForm" name="listForm" method="post" enctype="multipart/form-data">
	<input type="hidden" name="selectedId" />
	<div id="content_pop">
	    <!-- 타이틀 -->
	    <div id="title">
	        <ul>
	            <li>
	                <img src="<c:url value='/images/KTS_egovframework/KTS_example/title_dot.gif'/>" alt=""/>
	                File Upload
	            </li>
	        </ul>
	    </div>
	    <!-- // 타이틀 -->
	    <div id="table">
	        <table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
	            <colgroup>
	                <col width="150"/>
	                <col width="?"/>
	            </colgroup>
	            <!-- Add the file upload field -->
	            <tr>
	                <td class="tbtd_caption">File Upload</td>
	                <td class="tbtd_content">
	                    <form:input type="file" path="file" id="file" />
	                </td>
	            </tr>
	            <!-- Add other fields as needed -->
	        </table>
	    </div>
	    <div id="sysbtn">
	        <ul>
	            <li>
	                <span class="btn_blue_l">
	                    <a href="<c:url value='/KTS_egovSampleList.do'/>">List</a>
	                    <img src="<c:url value='/images/KTS_egovframework/KTS_example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
	                </span>
	            </li>
	                <!-- Add the File Upload button -->
	            <li>
	                <span class="btn_blue_l">
	                    <a href="javascript:fn_egov_fileUploadView()">
	                        File Upload
	                    </a>
	                    <img src="<c:url value='/images/KTS_egovframework/KTS_example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
	                </span>
	            </li>
	        </ul>
	    </div>
	</div>
</form:form>

</body>
</html>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%
  /**
  * @Class Name : KTS_egovSampleDetail.jsp
  * @Description : Sample Detail 화면
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sample Detail</title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/KTS_egovframework/sample.css'/>"/>
    <script type="text/javaScript" language="javascript" defer="defer">
        <!--
        /* 글 수정 화면 function */
        function fn_egov_select(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/updateSampleView.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 상세보기 화면 function */
        function fn_egov_detail(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/viewSample.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 등록 화면 function */
        function fn_egov_addView() {
           	document.listForm.action = "<c:url value='/addSample.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	document.listForm.action = "<c:url value='/KTS_egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/KTS_egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        //-->
    </script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<form:form modelAttribute="KTS_searchVO" id="listForm" name="listForm" method="post">
	<input type="hidden" name="selectedId" />
	<div id="content_pop">
	    <!-- 타이틀 -->
	    <div id="title">
	        <ul>
	            <li>
	                <img src="<c:url value='/images/KTS_egovframework/KTS_example/title_dot.gif'/>" alt=""/>
	                상세내용
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
	            <tr>
	                <td class="tbtd_caption"><spring:message code="title.sample.id" /></td>
	                <td class="tbtd_content">${KTS_sampleVO.id}</td>
	            </tr>
	            <tr>
	                <td class="tbtd_caption"><spring:message code="title.sample.name" /></td>
	                <td class="tbtd_content">${KTS_sampleVO.name}</td>
	            </tr>
	            <tr>
	                <td class="tbtd_caption"><spring:message code="title.sample.useYn" /></td>
	                <td class="tbtd_content">${KTS_sampleVO.useYn == 'Y' ? 'Yes' : 'No'}</td>
	            </tr>
	            <tr>
	                <td class="tbtd_caption"><spring:message code="title.sample.description" /></td>
	                <td class="tbtd_content">${KTS_sampleVO.description}</td>
	            </tr>
	            <tr>
	                <td class="tbtd_caption"><spring:message code="title.sample.regUser" /></td>
	                <td class="tbtd_content">${KTS_sampleVO.regUser}</td>
	            </tr>
	            <tr>
    				 <td class="tbtd_caption"><spring:message code="title.smaple.uploadfile" /></td>
                    <td class="tbtd_content">
                        <a href="<c:url value='/downloadFile.do'/>?filename=${KTS_sampleVO.filename}">${KTS_sampleVO.filename}</a>
                        <!-- ${KTS_sampleVO.filename} -->
                    </td>
</tr>
	            <!-- Add other fields as needed -->
	        </table>
	    </div>
	    <div id="sysbtn">
	        <ul>
	            <li>
	                <span class="btn_blue_l">
                    <a href="<c:url value='/KTS_egovSampleList.do'/>">목록</a>
	                    <img src="<c:url value='/images/KTS_egovframework/KTS_example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
	                </span>
	            </li>
	                <!-- Add the Modify button if the registerFlag is 'modify' -->
	            <li>
	                <span class="btn_blue_l">
	                    <a href="javascript:fn_egov_select('<c:out value="${KTS_sampleVO.id}"/>')">
	                       <spring:message code="button.modify" />
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

<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <!-- 필요한 CSS 및 JavaScript 파일을 링크합니다 -->
</head>
<body>
    <h1>회원가입</h1>
    
    <form action="<c:url value='/registerProcess.do'/>" method="post">
        <label for="username">사용자 이름:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <!-- 비밀번호 확인 필드를 추가합니다 -->
        <label for="confirmPassword">비밀번호 확인:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br><br>
        
        <!-- 생년월일 필드를 추가합니다 -->
        <label for="birthdate">생년월일:</label>
        <input type="date" id="birthdate" name="birthdate" required><br><br>
        
        <!-- 성별 선택 옵션을 추가합니다 -->
        <label for="gender">성별:</label>
        <select id="gender" name="gender">
            <option value="male">남성</option>
            <option value="female">여성</option>
        </select><br><br>
        
        <input type="submit" value="회원가입">
    </form>
</body>
</html>

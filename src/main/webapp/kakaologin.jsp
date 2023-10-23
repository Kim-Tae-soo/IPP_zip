<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kakao Login</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<img src="/KTS_eGovFrame_Project/images/kakao_login_medium_narrow.png"
		alt="카카오 로그인" onclick="loginWithKakao()" style="cursor: pointer;">
	<br>
	<button onclick="logoutFromKakao()">카카오 계정 로그아웃</button>
	<div id="user-info">
		<h2>사용자 정보</h2>
		<p>E-mail : <span id="email"></span></p>
		<p>Username : <span id="nickname"></span></p>
		<p>API Key : <span id="api-key"></span></p>
		<p>Profile Image<br><br> <img id="profile-image" src="" alt="Loading.."style="width: 100px; height: 100px;"></p>
	</div>
	<script>
		// 카카오 초기화
		Kakao.init('837f472cfad93f3adba0d24a1d2bc7b2');

		// 카카오 로그인 함수
		function loginWithKakao() {
			Kakao.Auth.login({
				success : function(authObj) {
				// 로그인 성공 -> 사용자 정보 
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							if (response.kakao_account&& response.kakao_account.email) {
								var email = response.kakao_account.email;
								var nickname = response.properties.nickname;
								var profile_image = response.kakao_account.profile.profile_image_url;
                        		var api_key = authObj.access_token; // API Key 값
                        		document.getElementById("email").textContent = email;
								document.getElementById("nickname").textContent = nickname;
                        		document.getElementById("api-key").textContent = api_key; // API Key를 표시
								document.getElementById("profile-image").src = profile_image;
                        		}
							else {
								console.log("사용자 이메일이 없습니다.");
								}
							},
							fail : function(error) {
								console.log("사용자 정보 가져오기 실패: " + JSON.stringify(error));
								}
					});
				},
			fail : function(err) {
				console.log("로그인 실패: " + err);
			}
		});
	}
	// 로그아웃
	function logoutFromKakao() {
		Kakao.Auth.logout(function() {
			console.log("카카오 계정 로그아웃 성공");
			// 초기화
			document.getElementById("email").textContent = "";
			document.getElementById("nickname").textContent = "";
        	document.getElementById("api-key").textContent = ""; // API Key 초기화
			document.getElementById("profile-image").src = "";
	});
}
	</script>
</body>
</html>

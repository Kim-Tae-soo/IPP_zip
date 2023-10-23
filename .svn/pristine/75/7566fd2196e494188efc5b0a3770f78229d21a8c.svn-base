<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KTS_LOGIN</title>
    <!-- 네이버, 카카오 SDK 스크립트 추가 -->
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    
    <style>
        #naverIdLogin_loginButton img {
            width: 150px;
            height: 45px;
        }
    </style>
</head>
<body>
    <div>
    		<!-- 로그인(네이버이미지 사용) 로그아웃 버튼 설정  -->
        <a id="naverIdLogin_loginButton" href="javascript:void(0)">
            <img src="https://static.nid.naver.com/oauth/small_g_in.PNG" alt="네이버 로그인" onclick="loginWithNaver()" style="cursor: pointer;">
        </a>
        <br>
        <a href="javascript:void(0)" onclick="naverLogout();">
            <button><span>네이버 계정 로그아웃</span></button><br>
        </a>
    </div>
        <!-- 사용자 정보를 출력할 div -->
    <div id="naverUserInfo">
        <h2>네이버 사용자 정보</h2>
        <p>Email : <span id="naverUserEmail"></span></p>
        <p>Name : <span id="naverUserName"></span></p>
        <p>API Key : <span id="apiKey"></span></p>
        <p>Birth: <span id="naverUserBirthdate"></span></p>
        <p>Gender : <span id="naverUserGender"></span></p>
        <p>Profile Image : <br><br><img id="naverUserProfileImage" src="" alt="프로필 이미지"></p>
    </div>
    <br>
    <hr>
    <br>
    <div>
        <!-- 로그인(카카오이미지 사용) 로그아웃 버튼 설정  -->
        <img src="/KTS_eGovFrame_Project/images/kakao_login_medium_narrow.png" alt="카카오 로그인" onclick="loginWithKakao()" style="cursor: pointer;">
        <br>
        <button onclick="logoutFromKakao()">카카오 계정 로그아웃</button>
    </div>

    <div id="kakaoUserInfo">
        <h2>카카오 사용자 정보</h2>
        <p>Email : <span id="kakaoUserEmail"></span></p>
        <p>Username : <span id="kakaoUserNickname"></span></p>
    	<p>API Key : <span id="api-key"></span></p>
        <p>Profile Image<br><br> <img id="kakaoUserProfileImage" src="" alt="프로필 이미지" style="width: 100px; height: 100px;"></p>
    </div>
   
    <script>
        
        var naverLogin = new naver.LoginWithNaverId(
            {
                clientId: "CdxUcqOXOcCZh1avY95m",
                callbackUrl: "http://localhost:8080/KTS_eGovFrame_Project/KTS_Login.jsp",
                isPopup: false, 
                callbackHandle: true
            }
        );    
        function loginWithNaver() {
            naverLogin.getLoginStatus(function (status) {
                if (status) {
                    var email = naverLogin.user.getEmail();
                    var name = naverLogin.user.getName();
                    var birthdate = naverLogin.user.getBirthday();
                    var birthYear = naverLogin.user.getBirthyear(); 
                    var profileImage = naverLogin.user.getProfileImage(); 
                    var gender = naverLogin.user.getGender(); 
                    var apiKey = "";

                    console.log(naverLogin.user);
                    
                    // 현재 페이지의 URL을 가져옴
                    var currentURL = window.location.href;

                    // URL을 & 문자로 분할하여 파라미터 추출
                    var urlParams = currentURL.split('&');

                    // 파라미터에서 access_token 추출
                    for (var i = 0; i < urlParams.length; i++) {
                        var param = urlParams[i];
                        if (param.indexOf('access_token=') !== -1) {
                            apiKey = param.split('=')[1];
                            break; // access_token을 찾았으므로 루프 종료
                        }
                    }


                    if (email == undefined || email == null) {
                        alert("이메일은 필수 정보입니다. 정보 제공을 동의해주세요.");
                        naverLogin.reprompt();
                        return;
                    }

                    document.getElementById("naverUserEmail").textContent = email;
                    document.getElementById("naverUserName").textContent = name;
                    document.getElementById("naverUserBirthdate").textContent = " " + birthYear  + " " +  birthdate + "";
                    document.getElementById("naverUserGender").textContent = gender; 
                    document.getElementById("naverUserProfileImage").src = profileImage; 
                    document.getElementById("apiKey").textContent = apiKey; 

                } else {
                    console.log("네이버 로그인 상태가 아닙니다.");
                }
            });
            
        }

        function naverLogout() {
            naverLogin.logout();
            document.getElementById("naverUserEmail").textContent = "";
            document.getElementById("naverUserName").textContent = "";
            document.getElementById("naverUserBirthdate").textContent = ""; 
            document.getElementById("naverUserProfileImage").src = ""; 
            document.getElementById("apiKey").textContent = ""; 

            naverLogin.init();	
        }
        

        Kakao.init('837f472cfad93f3adba0d24a1d2bc7b2');

        function loginWithKakao() {
            Kakao.Auth.login({
                success: function (authObj) {
                    Kakao.API.request({
                        url: '/v2/user/me',
                        success: function (response) {
                            if (response.kakao_account && response.kakao_account.email) {
                                var email = response.kakao_account.email;
                                var nickname = response.properties.nickname;
                                var profile_image = response.kakao_account.profile.profile_image_url;
                                var api_key = authObj.access_token; // API Key 값

                                document.getElementById("kakaoUserEmail").textContent = email;
                                document.getElementById("kakaoUserNickname").textContent = nickname;
                                document.getElementById("kakaoUserProfileImage").src = profile_image;
                                document.getElementById("api-key").textContent = api_key; // API Key를 표시
  												

                            } else {
                                console.log("카카오 사용자 이메일이 없습니다.");
                            }
                        },
                        fail: function (error) {
                            console.log("카카오 사용자 정보 가져오기 실패: " + JSON.stringify(error));
                        }
                    });
                },
                fail: function (err) {
                    console.log("카카오 로그인 실패: " + err);
                }
            });
        }

        function logoutFromKakao() {
            Kakao.Auth.logout(function () {
                console.log("카카오 계정 로그아웃 성공");
                document.getElementById("kakaoUserEmail").textContent = "";
                document.getElementById("kakaoUserNickname").textContent = "";
        		document.getElementById("api-key").textContent = ""; // API Key 초기화
                document.getElementById("kakaoUserProfileImage").src = "";
            });
        }
    </script>
</body>
</html>

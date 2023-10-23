<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Naver Login </title>
    <style>
        #naverIdLogin_loginButton img {
            width: 150px; 
            height: 45px;
        }
    </style>
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
</head>
<body>
    <a id="naverIdLogin_loginButton" href="javascript:void(0)">
        <img src="https://static.nid.naver.com/oauth/small_g_in.PNG" alt="네이버 로그인">
    </a>
    <br>
    <a href="javascript:void(0)" onclick="naverLogout();">
        <button><span>네이버 계정 로그아웃</span></button>
    </a>
    <div id="userInfo">
        <p>Email : <span id="userEmail"></span></p>
        <p>Name : <span id="userName"></span></p>
        <p>API Key : <span id="apiKey"></span></p>
        <p>Birthdate: <span id="userBirthdate"></span></p>
        <p>Gender : <span id="userGender"></span></p>
        <p>Profile Image : <br><br><img id="userProfileImage" src="" alt="프로필 이미지"></p>
    </div>
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

    <script>
        var naverLogin = new naver.LoginWithNaverId(
            {
                clientId: "CdxUcqOXOcCZh1avY95m",
                callbackUrl: "http://localhost:8080/KTS_eGovFrame_Project/naverlogin.jsp",
                isPopup: false, 
                callbackHandle: true
            }
        );

        naverLogin.init();

        window.addEventListener('load', function () {
            naverLogin.getLoginStatus(function (status) {
                if (status) {
                    // 사용자 정보 가져오려고 사용
                    var email = naverLogin.user.getEmail();
                    var name = naverLogin.user.getName();
                    var birthdate = naverLogin.user.getBirthday(); 
                    var birthYear = naverLogin.user.getBirthyear(); 
                    var profileImage = naverLogin.user.getProfileImage(); 
                    var gender = naverLogin.user.getGender(); 
                    var apiKey = "";

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

                    document.getElementById("userEmail").textContent = email;
                    document.getElementById("userName").textContent = name;
                    document.getElementById("userBirthdate").textContent = " " + birthYear  + " " +  birthdate + "";
                    document.getElementById("userGender").textContent = gender; 
                    document.getElementById("userProfileImage").src = profileImage; 
                    document.getElementById("apiKey").textContent = apiKey; 
                } else {
                    console.log("callback 처리에 실패하였습니다.");
                }
            });
        });


        function naverLogout() {
            // Naver에서 로그아웃 처리
            naverLogin.logout();

            // 사용자 정보 초기화
            document.getElementById("userEmail").textContent = "";
            document.getElementById("userName").textContent = "";
            document.getElementById("userBirthdate").textContent = "";
            document.getElementById("userProfileImage").src = ""; 
            document.getElementById("apiKey").textContent = ""; 
            // 현재 URL에서 토큰 제거 후 페이지 초기화 과정
            if (window.location.hash) {
                window.location.hash = '';
            }
            sessionStorage.removeItem('access_token'); 
            location.reload();
        }
    </script>
</body>
</html>

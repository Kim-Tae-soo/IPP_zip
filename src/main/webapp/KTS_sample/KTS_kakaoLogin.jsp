<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
    <title>Login Demo - Kakao & Naver JavaScript SDK</title>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
</head>
<body>
    <div>
        <!-- 카카오 로그인 버튼 -->
        <a id="kakao-login-btn"></a>
    </div>
    <div>
        <!-- 네이버 로그인 버튼 -->
        <div id="naverIdLogin"></div>
    </div>
    <div>
        <!-- 로그아웃 링크 -->
        <a href="http://developers.kakao.com/logout">Logout</a>
    </div>
    <script type='text/javascript'>
        // 카카오 로그인 설정 및 초기화
        Kakao.init('837f472cfad93f3adba0d24a1d2bc7b2');
        Kakao.Auth.createLoginButton({
            container: '#kakao-login-btn',
            success: function (authObj) {
                alert(JSON.stringify(authObj));
            },
            fail: function (err) {
                alert(JSON.stringify(err));
            }
        });

        // 네이버 로그인 설정 및 초기화
        var naverLogin = new naver.LoginWithNaverId({
            clientId: "네이버_클라이언트_ID",
            callbackUrl: "로그인_콜백_URL",
            isPopup: false,
            loginButton: { color: "green", type: 1, height: 40 }
        });
        naverLogin.init();
    </script>
</body>
</html>

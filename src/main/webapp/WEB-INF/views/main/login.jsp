<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모래사장 | 로그인</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
        @font-face {
            font-family: 'KorailRoundGothicBold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KorailRoundGothicBold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }
        @font-face {
            font-family: 'KorailRoundGothicMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KorailRoundGothicMedium.woff2') format('woff2');
            font-weight: 500;
            font-style: normal;
        }
        @font-face {
            font-family: 'KorailRoundGothicLight';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KorailRoundGothicLight.woff2') format('woff2');
            font-weight: 300;
            font-style: normal;
        }
        
        *{margin:0; padding:0;}
        li{list-style: none;}
        a{text-decoration: none;}
        img{border:none; display: block;}
        h1, h2, h3, h4, h5, h6{font-family: 'KorailRoundGothicBold', sans-serif; font-size:16px; color:#212732;}
        body, header, section, footer, div, ul, li, p, a, span, input{font-family: 'KorailRoundGothicMedium', sans-serif; font-size:16px; color:#212732;}

        #header{position:fixed; left:0; top:0; width:100%; height:100px; border-bottom: 1px solid #dedede;}
        #header .headerInner{position:relative; width:80%; height:100px; margin:0 auto;}
        #header .headerInner .logo{position:absolute; width:180px; left:0; top:26px;}
        #header .headerInner .logo img{width:100%;}
        #header .headerInner .util{position:absolute; width:142px; right:0; top:28px;}
        #header .headerInner .util li{position:relative; float:left; width:44px; margin-left: 5px;}
        #header .headerInner .util li:first-child{margin-left:0px;}
        #header .headerInner .util li a img{width:100%;}

        #login{position:relative; margin-top:100px;}
        #login .loginInner{width:80%; height:500px; margin:0 auto; padding-top:100px;}
        #login .loginInner h2{text-align: center; font-size:38px; margin-bottom: 50px;}
        #login .loginInner .loginBox{width:330px; margin:0 auto;}
        #login .loginInner .loginBox .textBox{margin-bottom: 15px;}
        #login .loginInner .loginBox .textBox p{font-size:18px; margin-bottom: 5px;}
        #login .loginInner .loginBox .textBox input{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
        #login .loginInner .loginBox .textBox .pw{font-family: 'Malgun Gothic';}
        #login .loginInner .loginBox .textBox input:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
        #login .loginInner .loginBox .textBox input:focus::placeholder{color: transparent;}
        #login .loginInner .loginBox .btnBox{width:330px;}
        #login .loginInner .loginBox .btnBox input{width:100%; height:50px; margin:10px 0 15px 0; line-height: 50px; letter-spacing: 2px; font-size:20px; background-color: #FFBC38; color:#fff; border: none; border-radius: 5px; cursor: pointer;}
        #login .loginInner .loginBox .btnBox input:hover{border:1px solid #FFBC38; background: none; color:#FFBC38; transition:0.5s;}
        #login .loginInner .loginBox .btnBox .detailBtn{width:231px; height:15px; margin: 0 auto;}
        #login .loginInner .loginBox .btnBox .detailBtn li{float:left; color:#888; font-size:14px;}
    </style>
</head>
<body>
<header id="header">
        <div class="headerInner">
            <h1 class="logo"><a href="main"><img src="resources/img/logo.png" alt="모래사장"></a></h1>
            <ul class="util">
                <li><a href="javascript:"><img src="resources/img/Notification.png" alt="알림"></a></li>
                <li><a href="javascript:"><img src="resources/img/msg.png" alt="메세지 알림"></a></li>
                <li><a href="javascript:"><img src="resources/img/my.png" alt="마이페이지"></a></li>
            </ul>
        </div>
    </header>
    <section id="login">
    	<form action="login" method="post">
        <div class="loginInner">
            <h2>로그인</h2>
            <div class="loginBox">
                <div class="textBox">
                    <p>아이디</p>
                    <input type="text" placeholder="아이디를 입력하세요." value="" class="id" name="id"/>
                </div>
                <div class="textBox">
                    <p>비밀번호</p>
                    <input type="password" placeholder="비밀번호를 입력하세요." value="" class="pw" name="pw"/>
                </div>
                <div class="btnBox">
                    <input type="submit" value="로그인"/>
                    <ul class="detailBtn">
                        <a href="findIdForm"><li>아이디 찾기 |</li></a>
                        <a href="findPwForm"><li>&nbsp;비밀번호 찾기 |</li></a>
                        <a href="javascript:"><li>&nbsp;회원가입</li></a>
                    </ul>
                </div>
            </div>
        </div>
        </form>
    </section>
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
</script>
</html>
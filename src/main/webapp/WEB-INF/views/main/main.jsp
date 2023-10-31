<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모래사장</title>
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

        #main{position:relative; margin-top:100px;}
        #main .mainInner{width:80%; height:500px; margin:0 auto; padding-top:200px;}
        #main .mainInner .innerText{text-align: center; margin-bottom: 50px;}
        #main .mainInner .innerText span{font-family: 'KorailRoundGothicBold'; font-size:28px; color: #486284;}
        #main .mainInner .innerText h2{font-size:60px; color: #486284; margin:10px 0 20px 0;}
        #main .mainInner .innerText p{font-size:20px; color: #8CA2C0; line-height: 32px;}
        #main .mainInner .innerBtn{width:300px; height:50px; margin:0 auto;}
        #main .mainInner .innerBtn a li{font-family: 'KorailRoundGothicBold'; width:45%; height:50px; background-color: #FFBC38; color:#fff; float:left; border-radius: 5px; text-align: center; line-height: 50px; letter-spacing: 1px; border:1px solid #FFBC38; box-sizing: border-box;}
        #main .mainInner .innerBtn a:first-child li{margin-right: 10%;}
        #main .mainInner .innerBtn a li:hover{border:1px solid #FFBC38; background: none; color:#FFBC38; transition:0.5s;}
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
    <section id="main">
        <div class="mainInner">
            <div class="innerText">
                <span>Label goes here</span>
                <h2>Best burger in town</h2>
                <p>Welcome to Burger Bliss, where we take your cravings to a<br/>whole new level! Our mouthwatering burgers are made<br/>from 100% beef and are served on freshly baked buns.</p>
            </div>
            <ul class="innerBtn">
                <a href="loginForm"><li>로그인</li></a>
                <a href="javascript:"><li>회원가입</li></a>
            </ul>
        </div>
    </section>
</body>
<script>
</script>
</html>






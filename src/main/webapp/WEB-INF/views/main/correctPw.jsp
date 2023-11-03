<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모래사장 | 비밀번호 재설정</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
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

        #correctPw{position:relative; margin-top:100px;}
        #correctPw .correctPwInner{width:80%; height:500px; margin: 0 auto; padding-top:100px;}
        #correctPw .correctPwInner h2{text-align: center; font-size:38px; margin-bottom: 10px;}
        #correctPw .correctPwInner>p{text-align: center; color:#888; margin-bottom: 50px;}
        #correctPw .correctPwInner .correctPwBox{width:330px; margin:0 auto;}
        #correctPw .correctPwInner .correctPwBox .textBox{margin-bottom: 15px;}
        #correctPw .correctPwInner .correctPwBox .textBox p{font-size:18px; margin-bottom: 5px; letter-spacing: 1px;}
        #correctPw .correctPwInner .correctPwBox .textBox input{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
        #correctPw .correctPwInner .correctPwBox .textBox input.pass{font-family : 'Malgun Gothic';}
        #correctPw .correctPwInner .correctPwBox .textBox input:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
        #correctPw .correctPwInner .correctPwBox .textBox input:focus::placeholder{color:transparent}
        #correctPw .correctPwInner .correctPwBox .btnBox{width:330px;}
        #correctPw .correctPwInner .correctPwBox .btnBox input{width:100%; height:50px; margin:10px 0 15px 0; line-height: 50px; letter-spacing: 2px; font-size:20px; background-color: #FFBC38; color:#fff; border: none; border-radius: 5px; cursor: pointer;}
        #correctPw .correctPwInner .correctPwBox .btnBox input:hover{border:1px solid #FFBC38; background: none; color:#FFBC38; transition:0.5s;}
        #correctPw .correctPwInner .correctPwBox .checkTextBox{position:relative; width:100%; height:20px;}
        #correctPw .correctPwInner .correctPwBox .checkTextBox .checkText{position:absolute;}
        #correctPw .correctPwInner .correctPwBox .checkTextBox .checkText span{font-size:12px; position:relative; top:-2px;}
        #correctPw .correctPwInner .correctPwBox .checkTextBox .checkText{display: none;}
        #correctPw .correctPwInner .correctPwBox .checkTextBox .checkText.match span{color:green;}
        #correctPw .correctPwInner .correctPwBox .checkTextBox .checkText.noMatch span{color:red;}
</style>
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
    <section id="correctPw">
   	 	<form action="newPw" method="post">
        <div class="correctPwInner">
            <h2>비밀번호 재설정</h2>
            <p>새로운 비밀번호를 입력해주세요.</p>
            <div class="correctPwBox">
                <div class="textBox">
                    <p>새로운 비밀번호</p>
                    <input type="password" class="pass"placeholder="새로운 비밀번호를 입력해주세요." value="" id="newPw"/>
                </div>
                <div class="textBox">
                    <p>새로운 비밀번호 확인</p>
                    <input type="password" class="pass" placeholder="새로운 비밀번호를 입력해주세요." value="" id="checkPw"/>
                </div>
                <div class="checkTextBox">
                    <div class="checkText match">
                        <span>&nbsp;&nbsp;* 비밀번호가 일치합니다. </span><svg width="13" height="13" viewBox="0 0 22 22" xmlns="http://www.w3.org/2000/svg">
                            <path fill="currentColor" color="green" d="m10.6 16.6l7.05-7.05l-1.4-1.4l-5.65 5.65l-2.85-2.85l-1.4 1.4l4.25 4.25ZM12 22q-2.075 0-3.9-.788t-3.175-2.137q-1.35-1.35-2.137-3.175T2 12q0-2.075.788-3.9t2.137-3.175q1.35-1.35 3.175-2.137T12 2q2.075 0 3.9.788t3.175 2.137q1.35 1.35 2.138 3.175T22 12q0 2.075-.788 3.9t-2.137 3.175q-1.35 1.35-3.175 2.138T12 22Zm0-2q3.35 0 5.675-2.325T20 12q0-3.35-2.325-5.675T12 4Q8.65 4 6.325 6.325T4 12q0 3.35 2.325 5.675T12 20Zm0-8Z"/>
                        </svg>
                    </div>
                    <div class="checkText noMatch">
                        <span>&nbsp;&nbsp;* 비밀번호가 일치하지 않습니다. </span><svg width="13" height="13" viewBox="0 0 22 22" xmlns="http://www.w3.org/2000/svg">
                            <path fill="none" color="red" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 21a9 9 0 0 0 9-9a9 9 0 0 0-9-9a9 9 0 0 0-9 9a9 9 0 0 0 9 9zM9 8l6 8m0-8l-6 8"/>
                        </svg>
                    </div>
                </div>
                <div class="btnBox">
                    <input type="submit" value="확인"/>
                </div>
            </div>
        </div>
      </form>
    </section>
</body>
<script>
	var msg = '${msg}';
	if(msg != ''){
		alert(msg);
	}
	
	// 비밀번호 확인 유효성 검사
	$('#checkPw').on('keyup',function(){
		if($(this).val() == ""){
			$('.checkText').css('display','none');
		}else if($(this).val() == $('#newPw').val()){
			$('.match').css('display','block');
			$('.noMatch').css('display','none');
		}else if($(this).val() != $('#newPw').val()){
			$('.noMatch').css('display','block');
			$('.match').css('display','none');
		}
	});
</script>
</html>
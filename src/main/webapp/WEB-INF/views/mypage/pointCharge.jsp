<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모래사장 | 포인트 충전</title>
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
        body, header, section, footer, div, ul, li, p, a, span, input, select, option{font-family: 'KorailRoundGothicMedium', sans-serif; font-size:16px; color:#212732;}

        #header{position:fixed; left:0; top:0; width:100%; height:100px; border-bottom: 1px solid #dedede;}
        #header .headerInner{position:relative; width:80%; height:100px; margin:0 auto;}
        #header .headerInner .logo{position:absolute; width:180px; left:0; top:26px;}
        #header .headerInner .logo img{width:100%;}
        #header .headerInner .util{position:absolute; width:142px; right:0; top:28px;}
        #header .headerInner .util li{position:relative; float:left; width:44px; margin-left: 5px;}
        #header .headerInner .util li:first-child{margin-left:0px;}
        #header .headerInner .util li a img{width:100%;}

        #pointCharge{position:relative; margin-top:100px;}
        #pointCharge .correctPwInner{width:80%; height:500px; margin: 0 auto; padding-top:50px;}
        #pointCharge .correctPwInner h2{text-align: center; font-size:38px; margin-bottom: 10px;}
        #pointCharge .correctPwInner>p{text-align: center; color:#888; margin-bottom: 50px;}
        #pointCharge .correctPwInner .correctPwBox{width:330px; margin:0 auto;}
        #pointCharge .correctPwInner .correctPwBox .textBox{position: relative; margin-bottom: 15px;}
        #pointCharge .correctPwInner .correctPwBox .textBox p{font-size:18px; margin-bottom: 5px; letter-spacing: 1px;}
        #pointCharge .correctPwInner .correctPwBox .textBox input{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
        #pointCharge .correctPwInner .correctPwBox .textBox input:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
        #pointCharge .correctPwInner .correctPwBox .textBox input:focus::placeholder{color:transparent}
        #pointCharge .correctPwInner .correctPwBox .textBox select{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
        #pointCharge .correctPwInner .correctPwBox .textBox select:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
        #pointCharge .correctPwInner .correctPwBox .textBox div p{font-size:22px; padding:5px 0; letter-spacing: 0; color:#000; text-decoration: underline;}
        #pointCharge .correctPwInner .correctPwBox .textBox div span{font-size:12px; color: #888;}
        #pointCharge .correctPwInner .correctPwBox .pointBox{height:110px;}
        #pointCharge .correctPwInner .correctPwBox .pointBox .myPoint{position:absolute; right:0; bottom: 0;}
        #pointCharge .correctPwInner .correctPwBox .pointBox .myPoint span{font-size:14px; font-family: 'KorailRoundGothicBold'; color: #212732; letter-spacing: 0;}
        #pointCharge .correctPwInner .correctPwBox .btnBox{width:330px; margin-bottom: 5px;}
        #pointCharge .correctPwInner .correctPwBox .btnBox input{width:100%; height:50px; margin:10px 0 15px 0; line-height: 50px; letter-spacing: 2px; font-size:20px; background-color: #FFBC38; color:#fff; border: none; border-radius: 5px; cursor: pointer;}
        #pointCharge .correctPwInner .correctPwBox .btnBox input:hover{border:1px solid #FFBC38; background: none; color:#FFBC38; transition:0.5s;}
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
    <section id="pointCharge">
    	<form action="chargeGo" method="post" name="chargeForm">
        <div class="correctPwInner">
            <h2>포인트 충전</h2>
            <p>미리 충전하고 더욱 편리하게!</p>
            <div class="correctPwBox">
                <div class="textBox pointBox">
                    <p>충전할 금액</p>
                    <select name = "chargePrice">
                        <option value="0">충전할 금액을 선택해주세요.</option>
                        <option value="10000">10,000원</option>
                        <option value="20000">20,000원</option>
                        <option value="30000">30,000원</option>
                        <option value="40000">40,000원</option>
                        <option value="50000">50,000원</option>
                    </select>
                    <div class="myPoint">
                        <span id = "point"></span>
                    </div>
                </div>
                <div class="textBox">
                    <p>결제방법</p>
                    <select name = "payWay">
                        <option value="0">결제방법을 선택해주세요.</option>
                        <option value="1">무통장 입금</option>
                    </select>
                </div>
                <div class="textBox">
                    <p>입금자명</p>
                    <input type="text" placeholder="입금자명을 입력해주세요." value="" name="name"/>
                </div>
                <div class="textBox">
                    <p>입금계좌</p>
                    <div>
                        <p>신한은행 123 - 456 - 78910</p>
                        <span>* 위 계좌로 충전금액을 입금해주세요.</span>
                    </div>
                </div>
                <div class="btnBox">
                    <input type="submit" value="충전하기" onclick="return check()"/>
                </div>
            </div>
        </div>
       </form>
    </section>
</body>
<script>

$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: 'myPoint.ajax',
		dataType: 'json',
		success:function(data){
			var point = data.point;
			$('#point').html("보유금액 : "+point+"원");
		},
		error:function(e){
			console.log(e);
		}
	});
});


var msg = '${msg}';
if(msg != ''){
	alert(msg);
}

function check(){
	if(chargeForm.chargePrice.value == 0){
		alert("충전금액을 선택해주세요.");
		chargeForm.chargePrice.focus(); //
		return false;
	}
	
	if(chargeForm.payWay.value == 0){
		alert("결제방법을 선택해주세요.");
		chargeForm.payWay.focus();
		return false;
	}
	
	if(chargeForm.name.value == 0){
		alert("입금자명을 입력해주세요.");
		chargeForm.name.focus(); 
		return false;
	}
}
</script>
</html>
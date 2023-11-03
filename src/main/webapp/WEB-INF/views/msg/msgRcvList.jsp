<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모래사장 | 받은 쪽지함</title>
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
        body, header, section, footer, div, ul, li, p, a, span, input, textarea{font-family: 'KorailRoundGothicMedium', sans-serif; font-size:16px; color:#212732;}
        body{background-color: #f0f0f0;}

        #header{position:fixed; left:0; top:0; width:100%; height:100px; border-bottom: 1px solid #dedede; background-color: #fff; z-index:999;}
        #header .headerInner{position:relative; width:80%; height:100px; margin:0 auto;}
        #header .headerInner .logo{position:absolute; width:180px; left:0; top:26px;}
        #header .headerInner .logo img{width:100%;}
        #header .headerInner .util{position:absolute; width:142px; right:0; top:28px;}
        #header .headerInner .util li{position:relative; float:left; width:44px; margin-left: 5px;}
        #header .headerInner .util li:first-child{margin-left:0px;}
        #header .headerInner .util li a img{width:100%;}

        #msgList{position:relative; margin-top:150px; overflow: hidden;}
        #lnb{position: fixed; left:0; top:100px; width:300px; height:100%; background-color: #dedede; z-index: 99;}
        #lnb li{height:50px; text-align: center; line-height: 50px; border:1px solid #888; box-sizing: border-box;}
        #msgList .msgListInner{position:relative; left:300px;}
        #msgList .msgListInner .pagingArea{position: relative; width:400px; height: 36px; border: 1px solid #b7b7b7; margin:0 32%;}
        #msgList .msgListInner .msgListInnerBox{position:relative; width:700px; height:680px; margin:0 25%;}
        #msgList .msgListInner .msgListInnerBox h2{text-align: center; font-size:38px; margin-bottom: 40px;}
        #msgList .msgListInner .msgListInnerBox p{font-size:30px;}
        #msgList .msgListInner .msgListInnerBox .msgListBox{position: relative; width:700px; height:600px; margin:20px auto;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.rcvMsg{position:relative; height:110px; border-bottom: 1px solid #ccc;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.rcvMsg:nth-child(5n+1){border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.rcvMsg .msgForm{position:relative; width: 600px; height:110px; margin:0 auto;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.rcvMsg .msgForm>div{position:relative; float:left;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.rcvMsg .msgForm .leftArea{width:20%;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.rcvMsg .msgForm .centerArea{width:50%; cursor: pointer;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.rcvMsg .msgForm .centerArea:hover{text-decoration:underline;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.rcvMsg .msgForm .rightArea{width:30%;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.rcvMsg .msgForm .leftArea .profileImg{position:relative; top:15px;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.rcvMsg .msgForm .centerArea .nickName{position:relative; top:20px;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.rcvMsg .msgForm .centerArea .msgContent{position:relative; top:40px; font-size:16px; color:#888;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.rcvMsg .msgForm .rightArea .rcvDate{position:absolute; top:15px; right:0; font-size:16px;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.rcvMsg .msgForm .rightArea .read{position:absolute; top:70px; right:40px; font-size:16px; font-family: 'KorailRoundGothicBold'; display: none;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.rcvMsg .msgForm .rightArea .notRead{position:absolute; top:70px; right:40px; font-size:16px; font-family: 'KorailRoundGothicBold'; color:#FFBC38; animation: blinking 1s linear infinite;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.rcvMsg .msgForm .rightArea .delImg{position: absolute; top:67px; right:0; cursor: pointer;}
        #msgList .msgListInner .msgListInnerBox .noMsg{text-align: center; display: none;}
        #msgList .msgListInner .msgListInnerBox .noMsg p{font-size:22px; color:#888; margin-top: 150px;}

        @keyframes blinking {
            0% { color: #FFBC38; }
            50% { color: #FFFFFF; }
            100% { color: #FFBC38; }
        }
</style>
</head>
<body>
<header id="header">
        <div class="headerInner">
            <h1 class="logo"><a href="main.html"><img src="resources/img/logo.png" alt="모래사장"></a></h1>
            <ul class="util">
                <li><a href="javascript:"><img src="resources/img/Notification.png" alt="알림"></a></li>
                <li><a href="javascript:"><img src="resources/img/msg.png" alt="메세지 알림"></a></li>
                <li><a href="javascript:"><img src="resources/img/my.png" alt="마이페이지"></a></li>
            </ul>
        </div>
    </header>
    <div id="lnb">
        <ul>
            <a href="javascript:"><li>받은 쪽지</li></a>
            <a href="javascript:"><li>보낸 쪽지</li></a>
            <a href="javascript:"><li>쪽지 보내기</li></a>
        </ul>
    </div>
    <section id="msgList">
        <div class="msgListInner">
            <div class="msgListInnerBox">
                <h2>받은 쪽지</h2>
                <div class="noMsg">
                    <p>받은 쪽지가 없습니다.</p>
                    <svg width="200" height="200" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path fill="none" stroke="currentColor" color="#fad996" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 9h8m-8 4h6m-.5 6.5L12 21l-3-3H6a3 3 0 0 1-3-3V7a3 3 0 0 1 3-3h12a3 3 0 0 1 3 3v6m1 9l-5-5m0 5l5-5"/>
                    </svg>
                </div>
                <ul class="msgListBox">
                    <li class="rcvMsg">
                        <div class="msgForm">
                            <div class="leftArea">
                                <svg width="80" height="80" viewBox="0 0 66 63" fill="none" xmlns="http://www.w3.org/2000/svg" class="profileImg">
                                <path d="M66 31C66 48.1208 51.2254 62 33 62C14.7746 62 0 48.1208 0 31C0 13.8792 14.7746 0 33 0C51.2254 0 66 13.8792 66 31Z" fill="#EDEDED"/>
                                <path d="M33.491 33.625C35.836 33.625 38.0851 32.6965 39.7433 31.0439C41.4015 29.3912 42.3331 27.1497 42.3331 24.8125C42.3331 22.4753 41.4015 20.2338 39.7433 18.5811C38.0851 16.9285 35.836 16 33.491 16C31.1459 16 28.8969 16.9285 27.2386 18.5811C25.5804 20.2338 24.6488 22.4753 24.6488 24.8125C24.6488 27.1497 25.5804 29.3912 27.2386 31.0439C28.8969 32.6965 31.1459 33.625 33.491 33.625ZM14.2299 52.6982C13.9563 53.427 13.9261 54.2245 14.1438 54.9718C14.3615 55.7191 14.8156 56.3764 15.4383 56.8459C20.6001 60.844 26.9536 63.0098 33.491 63C40.2994 63 46.5714 60.697 51.5613 56.8312C52.8287 55.853 53.3415 54.1787 52.7638 52.6893C51.2673 48.806 48.6244 45.4663 45.1841 43.1108C41.7438 40.7554 37.6677 39.4949 33.4938 39.4959C29.3199 39.4969 25.2444 40.7591 21.8052 43.1162C18.366 45.4732 15.7247 48.8142 14.2299 52.6982Z" fill="#DCBB7C"/>
                                </svg>
                            </div>
                            <div class="centerArea">
                                <p class="nickName">홍길동</p>
                                <p class="msgContent">안녕하세요 잘부탁합니다 감사합니다 안...</p>
                            </div>
                            <div class="rightArea">
                                <p class="rcvDate">2023-10-23 16:33</p>
                                <p class="read">읽음</p>
                                <p class="notRead">안읽음</p>
                                <svg width="22" height="22" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="delImg">
                                    <path fill="currentColor" d="M7 21q-.825 0-1.413-.588T5 19V6H4V4h5V3h6v1h5v2h-1v13q0 .825-.588 1.413T17 21H7ZM17 6H7v13h10V6ZM9 17h2V8H9v9Zm4 0h2V8h-2v9ZM7 6v13V6Z"/>
                                </svg>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="pagingArea"></div>
        </div>
    </section>
</body>
<script>

var showPage = 1;

msgListCall(showPage);

	function msgListCall(page){
		$.ajax({
			type: 'get',
			url: 'msgListCall.ajax',
			data: {'page':page},
			dataType: 'json',
			success:function(data){
				console.log(data);
				drawMsgRcvList(data);
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	function drawMsgRcvList(obj){
		var content = '';
		obj.list.forEach(function(item, idx){
			content += 
		});
	}

</script>
</html>
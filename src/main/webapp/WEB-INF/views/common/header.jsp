<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="icon" href="<c:url value='/resources/img/favicon.ico'/>" type="image/x-icon">
<meta charset="UTF-8">
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
        #header .headerInner .utilBefore{position:absolute; width:160px; right:0; top:40px;}
        #header .headerInner .utilAfter{position:absolute; width:142px; right:0; top:28px;}
        #header .headerInner .utilBefore>li{position:relative; float:left; width:49%; margin-left: 2%;}
        #header .headerInner .utilAfter>li{position:relative; float:left; width:44px; margin-left: 5px;}
        #header .headerInner .util li:first-child{margin-left:0px;}
        #header .headerInner .utilBefore>li a{font-size:18px; font-family: 'KorailRoundGothicBold'; color:#222;}
        #header .headerInner .util li a img{width:100%;}
    </style>
</head>
<body>
	<%!
	    HttpSession session;
	%>
	<%
	    // 세션에 userInfo 속성이 있는지 확인
	    session = request.getSession();
	    Object userInfo = session.getAttribute("userInfo");
	%>
	<%
	    // 세션에 userInfo가 있는지 여부에 따라 다른 헤더 출력
	    if (userInfo != null) {
	%>
	
    <header id="header">
        <div class="headerInner">
            <h1 class="logo"><a href="<c:url value='/main'/>"><img src="<c:url value='/resources/img/logo.png'/>" alt="모래사장"></a></h1>
            <ul class="util utilAfter">
                <li><a href="javascript:"><img src="<c:url value='/resources/img/Notification.png'/>" alt="알림"></a></li>
                <li><a href="<c:url value='/message/rcvList'/>"><img src="<c:url value='/resources/img/msg.png'/>" alt="메세지 알림"  id="msgAlram"></a></li>
                <li><a href="<c:url value='/mypage'/>"><img src="<c:url value='/resources/img/my.png'/>" alt="마이페이지"></a></li>
            </ul>
        </div>
    </header>
    <%
	    } else {
	%>
    <header id="header">
        <div class="headerInner">
            <h1 class="logo"><a href="<c:url value='/main'/>"><img src="<c:url value='/resources/img/logo.png'/>" alt="모래사장"></a></h1>
            <ul class="util utilBefore">
                <li><a href="user/login">로그인</a></li>
                <li><a href="user/register">회원가입</a></li>
            </ul>
        </div>
    </header>
    <%
	    }
	%>
</body>
<script>
msgAlram();

var setMsgAlram = setInterval(function() {
	msgAlram();
	}, 1000);
	
	
function msgAlram(){
	$.ajax({
		type: 'post',
		url: 'alram.ajax',
		dataType: 'json',
		success:function(data){
			console.log("cnt값"+data.cnt);
			if(data.cnt>0){
				$('#msgAlram').attr('src','<c:url value="/resources/img/msg_on.png"/>');
			}else{
				$('#msgAlram').attr('src','<c:url value="/resources/img/msg.png"/>');
			}
		},
		error:function(e){
			console.log(e);
		}
	});
}
</script>
</html>
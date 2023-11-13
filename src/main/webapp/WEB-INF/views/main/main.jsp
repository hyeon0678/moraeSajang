<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모래사장</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script> 
<style>
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
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <section id="main">
        <div class="mainInner">
            <div class="innerText">
                <span>Label goes here</span>
                <h2>Best burger in town</h2>
                <p>Welcome to Burger Bliss, where we take your cravings to a<br/>whole new level! Our mouthwatering burgers are made<br/>from 100% beef and are served on freshly baked buns.</p>
            </div>
            <ul class="innerBtn">
                <a href="<c:url value='/user/login'/>"><li>로그인</li></a>
                <a href="<c:url value='/user/register'/>"><li>회원가입</li></a>
            </ul>
        </div>
    </section>
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
</script>
</html>






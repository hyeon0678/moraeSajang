<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

        #header{position:fixed; left:0; top:0; width:100%; height:100px; border-bottom: 1px solid #dedede; background-color:#fff; z-index:9999;}
        #header .headerInner{position:relative; width:80%; height:100px; margin:0 auto;}
        #header .headerInner .logo{position:absolute; width:180px; left:0; top:6px;}
        #header .headerInner .logo img{width:100%;}
        #header .headerInner .utilBefore{position:absolute; width:160px; right:0; top:40px; padding:0;}
        #header .headerInner .utilAfter{position:absolute; width:142px; right:0; top:28px; padding:0;}
        #header .headerInner .utilBefore>li{position:relative; float:left; width:49%; margin-left: 2%;}
        #header .headerInner .utilAfter>li{position:relative; float:left; width:44px; margin-left: 5px;}
        #header .headerInner .util li:first-child{margin-left:0px;}
        #header .headerInner .utilBefore>li a{font-size:18px; font-family: 'KorailRoundGothicBold'; color:#222;}
        #header .headerInner .util li a img{width:100%;}
        


    </style>
</head>
<body>

    <header id="header">
        <div class="headerInner">
            <h1 class="logo admin"><a href="<c:url value='/admin/analysis'/>"><img src="<c:url value='/resources/img/logo.png'/>" alt="모래사장"></a></h1>
           
        </div>
    </header>
</body>
<script>
</script>
</html>
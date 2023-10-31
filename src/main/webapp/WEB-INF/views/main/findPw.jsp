<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�𷡻��� | ��й�ȣã��</title>
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

        #findPw{position:relative; margin-top:100px;}
        #findPw .findPwInner{width:80%; height:500px; margin: 0 auto; padding-top:50px;}
        #findPw .findPwInner h2{text-align: center; font-size:38px; margin-bottom: 10px;}
        #findPw .findPwInner>p{text-align: center; color:#888; margin-bottom: 50px;}
        #findPw .findPwInner .findPwBox{width:330px; margin:0 auto;}
        #findPw .findPwInner .findPwBox .textBox{margin-bottom: 15px;}
        #findPw .findPwInner .findPwBox .textBox p{font-size:18px; margin-bottom: 5px; letter-spacing: 1px;}
        #findPw .findPwInner .findPwBox .textBox input{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
        #findPw .findPwInner .findPwBox .textBox input:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
        #findPw .findPwInner .findPwBox .textBox input:focus::placeholder{color:transparent}
        #findPw .findPwInner .findPwBox .textBox select{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
        #findPw .findPwInner .findPwBox .textBox select:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
        #findPw .findPwInner .findPwBox .btnBox{width:330px; margin-bottom: 5px;}
        #findPw .findPwInner .findPwBox .btnBox input{width:100%; height:50px; margin:10px 0 15px 0; line-height: 50px; letter-spacing: 2px; font-size:20px; background-color: #FFBC38; color:#fff; border: none; border-radius: 5px; cursor: pointer;}
        #findPw .findPwInner .findPwBox .btnBox input:hover{border:1px solid #FFBC38; background: none; color:#FFBC38; transition:0.5s;}
        #findPw .findPwInner .findPwBox .idFind{width:267px; margin:0 auto;}
        #findPw .findPwInner .findPwBox .idFind span{font-size:14px; color:#888;}
        #findPw .findPwInner .findPwBox .idFind a{color:#FFBC38;}
    </style>
</head>
<body>
<header id="header">
        <div class="headerInner">
            <h1 class="logo"><a href="main"><img src="resources/img/logo.png" alt="�𷡻���"></a></h1>
            <ul class="util">
                <li><a href="javascript:"><img src="resources/img/Notification.png" alt="�˸�"></a></li>
                <li><a href="javascript:"><img src="resources/img/msg.png" alt="�޼��� �˸�"></a></li>
                <li><a href="javascript:"><img src="resources/img/my.png" alt="����������"></a></li>
            </ul>
        </div>
    </header>
<section id="findPw">
        <div class="findPwInner">
            <h2>��й�ȣ ã��</h2>
            <p>��й�ȣ ���� �� �Է��Ͻ� ��Ʈ�� ã���� �� �ֽ��ϴ�.</p>
            <div class="findPwBox">
                <div class="textBox">
                    <p>���̵�</p>
                    <input type="text" placeholder="���̵� �Է����ּ���." name="id" value=""/>
                </div>
                <div class="textBox">
                    <p>�̸�</p>
                    <input type="text" placeholder="�̸��� �Է����ּ���." name="name" value=""/>
                </div>
                <div class="textBox">
                    <p>�̸���</p>
                    <input type="text" placeholder="�̸����� �Է����ּ���." name="email" value=""/>
                </div>
                <div class="textBox">
                    <p>��й�ȣ ��Ʈ</p>
                    <select id="selector" name="question">
                        <option value="0">������ �ּ���.</option>
                        <option value="1">���� ��� �ʵ��б���?</option>
                        <option value="2">���� �����ϴ� ĳ���ʹ�?</option>
                        <option value="3">�ٽ� �¾�� �ǰ� ���� ����?</option>
                        <option value="4">���� �����ϴ� ������?</option>
                        <option value="5">���� ��� ������?</option>
                    </select>
                </div>
                <div class="textBox">
                    <p>��й�ȣ ����</p>
                    <input type="text" placeholder="������ �Է����ּ���." name="answer" value=""/>
                </div>
                <div class="btnBox">
                    <input type="button" id="findPwBtn" value="Ȯ��"/>
                </div>
                <div class="idFind">
                    <span>���̵� ��ﳪ�� �ʴ´ٸ�? &nbsp;&nbsp;</span><a href="findIdForm">���̵� ã��</a>
                </div>
            </div>
        </div>
    </section>
</body>
<script>
	
</script>
</html>
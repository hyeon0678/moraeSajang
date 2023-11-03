<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�𷡻��� | ���̵�ã��</title>
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

        #findId{position:relative; margin-top:100px;}
        #findId .findIdInner{width:80%; height:500px; margin: 0 auto; padding-top:100px;}
        #findId .findIdInner h2{text-align: center; font-size:38px; margin-bottom: 10px;}
        #findId .findIdInner>p{text-align: center; color:#888; margin-bottom: 50px;}
        #findId .findIdInner .findIdBox{width:330px; margin:0 auto;}
        #findId .findIdInner .findIdBox .textBox{margin-bottom: 15px;}
        #findId .findIdInner .findIdBox .textBox p{font-size:18px; margin-bottom: 5px; letter-spacing: 1px;}
        #findId .findIdInner .findIdBox .textBox input{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
        #findId .findIdInner .findIdBox .textBox input:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
        #findId .findIdInner .findIdBox .textBox input:focus::placeholder{color:transparent}
        #findId .findIdInner .findIdBox .btnBox{width:330px;}
        #findId .findIdInner .findIdBox .btnBox input{width:100%; height:50px; margin:10px 0 15px 0; line-height: 50px; letter-spacing: 2px; font-size:20px; background-color: #FFBC38; color:#fff; border: none; border-radius: 5px; cursor: pointer;}
        #findId .findIdInner .findIdBox .btnBox input:hover{border:1px solid #FFBC38; background: none; color:#FFBC38; transition:0.5s;}
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
    <section id="findId">
        <div class="findIdInner">
            <h2>���̵� ã��</h2>
            <p>���̵�� ���Խ� �Է��Ͻ� �̸��Ϸ� ã���� �� �ֽ��ϴ�.</p>
            <div class="findIdBox">
                <div class="textBox">
                    <p>�̸�</p>
                    <input type="text" placeholder="�̸��� �Է����ּ���." name="name" value=""/>
                </div>
                <div class="textBox">
                    <p>�̸���</p>
                    <input type="text" placeholder="�̸����� �Է����ּ���." name="email" value=""/>
                </div>
                <div class="btnBox">
                    <input type="button" id="findIdBtn" value="Ȯ��"/>
                </div>
            </div>
        </div>
    </section>
</body>
<script>
	$("#findIdBtn").on('click',function(){
		var $name = $('input[name = "name"]');
		var $email = $('input[name = "email"]');
		
		if($name.val() == ''){
			alert("�̸��� �Է����ּ���.");
			$name.focus();
		}else if($email.val() == ''){
			alert("�̸����� �Է����ּ���.")
			$email.focus();
		}else{
			var param = {};
			param.name = $name.val();
			var regex = new RegExp('^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$');
			var match = regex.test($email.val());
			if(!match){
				alert("�̸��� �������� �Է����ּ���.")
				return false;
			}
			param.email = $email.val();
			
			// console.log(param); �Ķ��� Ȯ��
			
			$.ajax({
				type: 'post',
				url: 'findId',
				data:param,
				dataType:'json',
				success:function(data){
					if(data.foundId != null){
						alert('ȸ�����Խ� ����� ���̵�� '+data.foundId+'�Դϴ�.')
					}else{
						alert('��ġ�ϴ� ȸ�������� �����ϴ�. �ٽ� Ȯ�����ּ���.')
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	});
</script>
</html>
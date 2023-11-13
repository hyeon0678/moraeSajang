<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
   
</head>
<style>

.review {
     
    
    float: left;
    margin-top: 5%;
    margin-right: -100px;
    margin-bottom: 20px;
    margin-left: 340px;
    text-align : center;
    width: 300px;
    height: 80px;
    box-sizing: border-box;
    border:3px solid #FFBC38;
    background-color:white; 
    border-radius: 7px; 
    line-height: 80px;  
    font-family: 'KorailRoundGothicBold';
    font-size: 20px;
}

.review:hover {
	color: white;
	background-color: #FFBC38;
	cursor: pointer;
}





.active{background-color:gold;}

.rat{
   margin-top:15%;
    margin-right: 10px;
    margin-bottom: 30px;
    margin-left: 120px;
    text-align : center;
    font-size:38px
}

#ratin{
   margin-top:5%;
    margin-right: 30px;
    margin-bottom: 30px;
    margin-left: 49%;
    text-align : center;
     width: 150px;
    height: 50px;
    border:3px solid #FFBC38;
     border-radius: 7px; 
     background-color: #FFBC38;
     font-family: 'KorailRoundGothicBold';
     color: white;
     font-size: 20px;
   }
   

#myPoint {
   margin-top: 30px;
   margin-right: 120px;
   float: right;
}

#myPoint #sumPoint {
   float: right;
   padding-left: 10px;
}
        #pointHistory{position:relative; margin-top:150px; overflow: hidden;}
        #lnb{position: fixed; left:0; top:100px; width:300px; height:100%; background-color: #f9f9f9; z-index: 99;}
        #lnb ul{margin-top:20px;}
        #lnb ul li{width:280px; height:60px; line-height: 60px; box-sizing: border-box; border-radius: 10px; margin:10px auto; padding-left:40px; font-family: 'KorailRoundGothicBold';}
        #lnb ul li.on{background-color: #fcdfa0; color:#fff;}
        #lnb a:hover{text-decoration:none;}   
</style>
<body>



 <%@ include file="/WEB-INF/views/common/header.jsp" %>
   
   
      
       <h2 class="rat"> 모집자 평가 </h3> 
       
       
    <div id="lnb">
      <ul>
         <a href="./"><li>내 프로필</li></a>
         <a href="mypage/groupBuy/gbList"><li>내 공구 현황</li></a>
         <a href="my/point/history"><li>포인트 내역</li></a>
         <a href="my/point/charge"><li>포인트 충전</li></a>
      </ul>
   </div>
    

      <div class="review" value="1">또 거래하고 싶어요</div>      
      <div class="review" value="2" >그냥 그래요</div>
      <div class="review" value="3">별로에요</div>      

      <input type="button" id="ratin" value="등록하기"/>
		
</body>
<script>



// div 클릭시 색상 변경
$('.review').click(function(){
	  $('.review').removeClass("active");
	  $(this).addClass("active");
	});	
			
	

	
	var reviewNo;
	
	$('.review').on('click',function(e){
		ratings = $(this).attr('value');
		console.log(ratings);
			
	});
	
	$('#ratin').on('click',function(){
		$.ajax({
			type: 'post',
			url: 'Rating',
			data: {"ratings":ratings},
			dataType: 'json',
			success: function(data){
				if(data.rat >0){
					//돌아가기
					console.log("평가 완료");
					location.href="./gbList";
				}
				
			},
			error: function(e){
				console.log(e)
			}
		});
	
		
	});

</script>
</html>
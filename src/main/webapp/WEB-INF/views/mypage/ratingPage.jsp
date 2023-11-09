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




div{ height:50px; width:100px; margin:50px;  text-align : center;}


.review {
  
    float: left;
    width:25%;
    box-sizing: border-box;
    border:5px double;
	
}


.zero{ border:5px solid;  
		margin-left: auto;
		margin-right: auto; 
}








    #trting{
        width:100px;
        margin:auto;
        display:block;
       
    }



div{background-color:white;}
.active{background-color:gold;}

</style>
<body>

	
 		<h3> 모집자 평가 </h3> 
 
 	<a id="transaction" name="ratings">
 		<div class="review" value="1">또 거래하고 싶어요</div>
		<div class="review" value="2" >그냥 그래요</div>
		<div class="review" value="3">별로에요</div>
	</a>
		<input type="submit"  id="ratin" value="등록하기" />
	


 

 
		
		
</body>
<script>



// div 클릭시 색상 변경
$('div').click(function(){
	  $('div').removeClass("active");
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	div{
	    border: 1px solid black;
	    border-collapse: collapse;
	    padding: 2px 2px 0px 2px;
	    margin: 2px;
	    font-size: 15px;
	}
	
	div.sideber ul {
	  list-style-type: none;
	  padding: 0px;
	  margin: 0px;
	  width: 200px;
	  background: green;
	  height: 100%;
	  overflow: auto;
	  position: fixed;
	  float: left;
	}
	
	li a {
	  text-decoration: none;
	  padding: 10px;
	  display: block;
	  color: #000;
	  font-weight: bold;
	}
	
	li a:hover {
	  background: #333;
	  color: #fff;
	}
	
	li h3.page {
	  background : blue;
	  color: red;
	}
	
	.main {
	  margin-left: 220px;
	}
	span{
		list-style-type: disc;
		margin: 10px;
	}
</style>
</head>
<body>
	<div class="sideber">
	<ul>
	  <li><h3 class="page">관리자 페이지</h3></li>
	  <li><a href="#">통계</a></li>
	  <li><a href="#">신고 관리</a></li>
	  <li><a href="#">포인트 관리</a></li>
	  <li><a href="#">게시판 관리</a></li>
	</ul>
	</div>

	<div style="width: 900px; float: left; margin: 0px 0px 0px 300px;">
		<div class="profil" style="float: left; overflow: auto; width: 350px; height: 300px;margin: 0px 0px 0px 50px">
			<img src="/morae/resources/img/profil.png" width="300px" height="300px">	
		</div>
		<div class="info" style="float: right; overflow: auto; width: 400px; height: 300px;margin: 0px 50px 0px 10px" >
			<p style="font-weight: bold;" >회원 상세 정보</p>
			<span style="list-style-type: disc;" >아이디 : ${info.userId}</span><br/>
			<span style="list-style-type: disc;" >닉네임 : ${info.nickname}</span><br/>
			<span style="list-style-type: disc;" >이름 : ${info.name}</span><br/>
			<span style="list-style-type: disc;" >나이 : ${info.age}</span> / <span>성별 : ${info.gender}</span><br/>
			<span style="list-style-type: disc;" >이메일 : ${info.email}</span><br/>
			<span style="list-style-type: disc;" >가입날짜 : ${info.reg_date}</span>
			<p style="list-style-type: disc; margin: 10px;" >주소 : ${info.addr}</p>
			<span style="list-style-type: disc;" >상태 : ${state}</span><br/>
			<span style="list-style-type: disc;" >회원권한 : ${auth}</span>
		</div>
	</div>
	<div class="auth" style="width: 900px; float: left; margin: 0px 0px 0px 300px;" id="auth">
		<span>회원권한수정</span>		
	</div>
	<div class="history" style="width: 900px; float: left; margin: 0px 0px 0px 300px;">
		<span>회원상태수정 / 히스토리</span>
	</div>
		
</body>
<script>
	
// var $userId = ${info.userId};
histroycall();
console.log("권한 콜 시작");

function histroycall($userId){
	
	var userId = "${info.userId}";    	
	
	$.ajax({
		type:'post',
		url:'userDetail.ajax/detail',
		data:{'userId':userId},
		dataType:'JSON',
		success:function(obj){			
			console.log(obj);
			drawlist(obj);
		},
		error:function(e){
			console.log(e);
		}	
	});//		
	// drawlist();
	// $("textarea[name = content]").val('');
	
}//
	
	
	
function drawlist(obj){	
	
	var $state = "${state}"; // 차단 미차단
	var $auth = "${auth}"; //회원 상태
	var gardid = "obj.gardid";
	var logstate = obj.logstate;
	console.log(obj);
	console.log(gardid);
	console.log(logstate);	
	if(logstate == 1){	
		console.log("최고 관리자");		}
	var content ='';
	// '+obj.list[i].+'  '+obj.list[i].reportProcessNo+'
	// for (var i = 0; i < obj.size; i++) {
		/* content += '<div style="width: 990px;">'; */
		/* $('+''input[type=radio][name=flexRadioDefault]:checked  ').val() // $('input[type=radio][name=flexRadioDefault]:checked').val()*/
		/* 최고 관리자 여부 확인 = session 으로 확인 */		
		if(logstate == 1){	
			console.log("최고 관리자");	
		
		content += '<div class="profil" style="float: right; overflow: auto; width: 400px; height:80px; margin: 0px 50px 0px 10px">';
		content += '<p style="font-weight: bold;" >회원 권한 수정</p>';		
		content += '<input class="form-check-input" type="radio" name="Radioauth" id="flexRadioDefault1" style="margin: 0px 0px 0px 10px" value="관리자"/>';
		content += '<label class="form-check-label" for="flexRadioDefault1"> 관리자 </label>	';	  
		content += '<input class="form-check-input" type="radio" name="Radioauth" id="flexRadioDefault2" style="margin: 0px 0px 0px 10px" value="일반회원" checked/>';
		content += '<label class="form-check-label" for="flexRadioDefault2"> 일반 회원 </label>';
		content += '<input type="button" value="권한 저장" style="margin: 0px 0px 0px 50px" onclick="authsave()"/>';			
		content += '</div>';				
		
		}		
		/* 회원 상태 수정 */
		
		content += '<div class="profil" style="float: right; overflow: auto; width: 400px; height:200px; margin: 3px 50px 0px 10px">';		
		content += '<p style="font-weight: bold;" >회원 상태 수정</p>';
		content += '<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" style="margin: 0px 0px 0px 10px" value="관리자"/>';
		content += '<label class="form-check-label" for="flexRadioDefault1"> 차단 </label>';		  
		content += '<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" style="margin: 0px 0px 0px 10px" value="일반회원" checked/>';
		content += '<label class="form-check-label" for="flexRadioDefault2"> 미차단 </label><br/><br/>';
		content += '<textarea type="text" id = "reporthistory" value="" placeholder="내용을 입력 해 주세요" style="height: 100px; width: 270px; resize: none;"></textarea>';
		content += '<input type="button" value="권한 저장" style="margin: 0px 0px 0px 10px" onclick="statesave()"/>';		
		content += '</div>';
		$('#auth').append(content);
	// }	
}//

	function authsave(){
	
	console.log("회원권한 수정");
	var auth = $('input[type=radio][name=flexRadioDefault]:checked').val();	
	console.log(auth);	
	
}
	functionstatesave(){
		console.log("회원상태 수정");		
		var state = $('input[type=radio][name=flexRadioDefault]:checked').val();	
		
		console.log(state);	
	}

















/*
		 차단 히스토리  
		content += '<div class="rehis" style="float: right; overflow: auto; width: 400px; height:200px; margin: 0px 50px 0px 10px">';		
		content += '<div style="width: 390px;">';
		content += '<div style="width: 380px; height: 35px;">';
		content += '<div style="width: 150px; float: left; height: 20px;"><span>처리번호 : </span></div>';
		content += '<div style="width: 150px; float: left; height: 20px;"><span>처리자 : </span></div>';
		content += '</div>';	 
		content += '<div style="width: 380px; height: 70px;">';
		content += '<span>1234</span>/<span>1234</span>';
		content += '</div>';	 
		content += '</div>';
		content += '</div>';
*/

</script>
</html>
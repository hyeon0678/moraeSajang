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
    padding: 5px 5px 0px 5px;
    margin: 5px;
    font-size: 15px;
}


</style>
</head>
<body>
	<button onclick="gotolist()">리스트로 돌아가기</button>
	<div style="width: 1000px; height: 40px; padding-top: 20px;">
		<div style="width: 475px; float: left; height: 20px;"><span style="font-weight: 600;">신고 상세보기</span></div>
		<div style="width: 475px; float: left; height: 20px;"><span style="text-align: right;">신고 번호 : ${report.reportNo}</span></div>
	</div>	
	<div style="width: 1000px; height: 40px;">
		<div style="width: 970px; float: left;height: 20px;"><span>신고자 아이디 : ${report.userId}</span>  /  
		<span>피신고자 아이디 : ${report.reportuser}</span></div>
	</div>
	<div style="width: 1000px; height: 40px;">
		<div style="width: 475px; float: left;height: 20px;"><span onclick="">글/댓글 번호 : ${useruniqueNo}</span>  /  
		<span>글/댓글 상태 : ${userstate}</span></div>
		<div style="width: 475px; float: left;height: 20px;"><span>${report.reportRegDate}</span></div>
	</div>
	<div style="width: 1000px; height: 300px;">
		<div style="width: 970px; float: left;height: 270px;"><span>신고사유 : ${report.reportContent}</span></div>
	</div>		
	
	<!-- 신고 히스토리 // insert -->
	<h5>신고 히스토리</h5>
    <div style="width: 1000px; height: 80px;">
        <textarea style="height:70px; width:850px; resize: none; float: left;" placeholder="내용을 입력 해 주세요." value="" name="content"></textarea>        
        <!-- <input type="text" id = "reporthistory" value="" placeholder="내용을 입력 해 주세요"></div> -->
     <div style="width: 100px; height:25px; float:right;"><input type="checkbox" value="처리완료" name="hisstate">처리완료</div>
     <div style="width: 100px; height:25px; float:right;"><button onclick="historyput()">저장</button></div>	
    </div>
    <div style="width: 1000px; float: left;">
        <span>신고 히스토리 댓글내용 아작스로 그려주기</span>        
    </div>	 
</body>
<script>
    var showpage =1;
    
	function gotolist(){
		location.href='./adminReport';		
	}//historycall

	function historyput(){
		var $state = $("input[type=checkbox][name=hisstate]:checked").val();
		var $content = $("textarea[name = content]").val();
		console.log($state);
		console.log($content);
		
		
		
		
		$.ajax({
			type:'post',
			url:'ReportDetail.ajax/historyput',
			data:{'hisstate':$state,'content':$content},
			dataType:'JSON',
			success:function(obj){			
				console.log(obj);			
				
			},
			error:function(e){
				console.log(e);
			}	
		});//
		
		
		
		
		
		
	};//


















</script>
</html>

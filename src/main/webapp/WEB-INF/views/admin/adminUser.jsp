<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap : 디자인을 위한 프레임워크 페이지의 모양을 위한 부분 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- jpuery : 는 사용하는 프러그인과 다른 라이브러리 와의 충돌여부를 확인 해야 한다.  -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<!-- 페이징 처리를 위한 라이브러리 -->  
<script src="<c:url value='/resources/js/jquery.twbsPagination.js'/>" type="text/javascript"></script>

<style>
table, th,td{
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;	
}
table{
	width: 500px;
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

	<div class="main">
	<h3>회원 관리 리스트</h3>
	 
	<input type="text" name="userId" value="" placeholder="아이디를 입력해주세요."/>
	<input type="button" id="reserch" value="검색"/>
	<input type="button" id="return" value="전체 리스트로 돌아가기"/>
	</br>
		<table>
			<thead>
				<tr>
				<th>아이디</th>
				<th>회원상태</th>
				<th>회원권한</th>
				<th>닉네임</th>			
				<th>가입 날짜</th>	
				</tr>
			</thead>
			<tbody id="list">
			<!-- 여기 그려 주면 된다.  -->			
			</tbody>
			<tr>
			<td colspan="5" id="paging">	
				<!-- 	플러그인 사용	(twbsPagination)	 이렇게 사용하라고 tutorial에서 제공-->
				<div class="container">									
					<nav aria-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>					
				</div>
			</td>
		</tr>
		</table>	
	</div>
</body>
<script>

var showpage =1;
	console.log("페이지 읽기 시작");
	listcall(showpage);
	console.log("페이지 읽기 끝");	

$('#return').on('click',function(){
	listcall(showpage);
});

/* 검색 */
$('#reserch').on('click',function(){
	$('#pagination').twbsPagination('destroy');	
	showpage =1;	
	var userId = $('input[name="userId"]').val();
	var page= JSON.stringify(showpage);
	console.log(userId);
	console.log(page);
	$.ajax({
		type:'post',
		url:'userMgmt.ajax/reserch', 
		data:{'page':showpage, 'userId':userId},
		dataType:'JSON',
		success:function(obj){			
			console.log(obj);			
			//drawlist(data);	
			var content = '';
			$('#list').empty();
			for (var i = 0; i < obj.size; i++) {
				var state = "미차단";
				var auth = "";
				if(obj.list[i].authType == '최고 관리자'){auth="최고관리자";}
				else if(obj.list[i].authType == '관리자'){auth="관리자";}
				else {auth="일반회원";}
				if(obj.list[i].state != null){state = "차단";};
				 	 content = '<tr>';
					 content += '<td><a href="adminUserDetail?userid='+obj.list[i].userId+'&&state='+state+'&&auth='+auth+'">' + obj.list[i].userId + '</td>';
					 content += '<td>' + state + '</td>';
					 content += '<td>' + auth + '</td>';
					 content += '<td>' + obj.list[i].nickname + '</td>';
					 var date = new Date(obj.list[i].reg_date);
					 var dateStr = date.toLocaleDateString("ko-KR");
					 content += '<td>' + dateStr + '</td>';					 	
					 content += '</tr>';				
		            $('#list').append(content);
			};
		},
		error:function(e){
			console.log(e);
		}
		});//	
		$('input[name="userId"]').val('');	
	
})//




/* 페이지 리스트 */
function listcall(page){
	console.log("리스트 호출");
	$.ajax({
		type:'post',
		url:'userMgmt.ajax/list', 
		data:{'page':page},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			console.log("리스트 호출 뿌려주기");
			/* if (data.success == -1) {
				alert('이 페이지의 권한이 없습니다');
				location.href='./';
			}else {} */		
			drawlist(data);			
		},
		error:function(e){
			console.log(e);
		}
		});//	
}

		/* 리스트 그리기 */
		function drawlist(obj){
			console.log(obj);			
			
			var content = '';
			$('#list').empty();
			for (var i = 0; i < obj.size; i++) {
				var state = "미차단";
				var auth = "";
				if(obj.list[i].authType == '최고 관리자'){auth="최고관리자";}
				else if(obj.list[i].authType == '관리자'){auth="관리자";}
				else {auth="일반회원";}
				if(obj.list[i].state != null){state = "차단";};
				 	 content = '<tr>';
					 content += '<td><a href="adminUserDetail?userid='+obj.list[i].userId+'&&state='+state+'&&auth='+auth+'">' + obj.list[i].userId + '</td>';
					 content += '<td>' + state + '</td>';
					 content += '<td>' + auth + '</td>';
					 content += '<td>' + obj.list[i].nickname + '</td>';
					 var date = new Date(obj.list[i].reg_date);
					 var dateStr = date.toLocaleDateString("ko-KR");
					 content += '<td>' + dateStr + '</td>';					 	
					 content += '</tr>';				
		            $('#list').append(content);
			};
			
			$('#pagination').twbsPagination({
				startPage:obj.currpage // 보여줄페이지>> 
				,totalPages:obj.pages // 총 페이지 수(총갯수 / 페이지당 보여줄 게시물수):서버에서 계산해서 가져오기
				,visiblePages:5// 페이지 넘버 얼마나 보여 줄것인지 (이것은 거의 고정이다. ): 
				,onPageClick:function(e,page){// 번호클릭시 실행할 내용
					//console.log(e);
					if(showpage != page){
					  	console.log(page);
					  	showpage = page; // 클릭해서 다른 페이지를 보여주게 되면  현재 보고 있는 페이지 번호도 바꿔준다. 
					  	listcall(page);
						
					}		
				}
				
			});//
			
			
			
			
			
			
			
			
		}
	
	
	
	
	
	


</script>
</html>
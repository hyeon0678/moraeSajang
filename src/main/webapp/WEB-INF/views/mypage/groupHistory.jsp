<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모래사장 | 포인트 충전</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script src="<c:url value='/resources/js/paging.js'/>" type="text/javascript"></script>
<link href="<c:url value='/resources/css/paging.css'/>" rel="stylesheet">
<style type="text/css">
	.current{
		background-color: #FFBC38;
	}
	button.list-btn{
	width: 100px;
	height: 50px;
	border-style: none;
	padding:0px;
	margin:0;
	border-radius:10px;
}
th, td, tr{
	border: 1px solid black;
}
body{
 margin: 110px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/headerPg.jsp" %>
	<div>
		<button class="list-btn current" value="recruit">모집</button>
		<button class="list-btn" value="join">참여</button>
	</div>
	<div>
		<table>
			<thead>
			</thead>
			<tbody>
			
			</tbody>
		</table>
	</div>
	<div class="container">
                <nav aria-label="Page navigation" style="text-align:center">
                <ul class="pagination" id="pagination"></ul>
                </nav>
        </div> 
</body>
<script>
let showPage = 1;
let listType = 'recruit'
$(document).ready(function(){
	console.log("firstListcall");
	myGbListCall(showPage);

});
function myGbListCall(page){
	console.log('firstUrl'+'myGbList.ajax?page='+page+'&&listType='+listType);
	$.ajax({
		type: 'get',
		url: 'gbList.ajax?page='+page+'&&listType='+listType,
		dataType: 'json',
		success:function(data){
			if(data.listType == 'recruit'){
				console.log(data);
				drawRecruitGbList(data);
			}else{
				drawJoinGbList(data);
			}
		},
		error:function(e){
			console.log(e);
		}
	});
}
function drawRecruitGbList(data){
	let list = data.myGbList;
	console.log(list);
	$('thead').empty();
	let tbody = '';
	let thead = '<tr>'
		thead += '<th>카테고리 종류</th>'
		thead += '<th>제목</th>'
		thead += '<th>모집기간</th>'
		thead += '<th>인원수</th>'
		thead += '<th>거래 가격</th>'
		thead += '<th>공구상태</th></tr>'
		$('thead').append(thead);
		$('tbody').empty();
	if(list.length == 0){
		tbody = '<tr><td colspan="6">모집한 공구글이 없습니다.</td></tr>'
		$('tbody').append(tbody);
	}else{
		console.log(list);
		for(let gb of list){
			tbody += '<tr>'
				tbody += '<td>'+gb.categoryType+'</td>'
				tbody += '<td>'+gb.title+'</td>'
				let startDate = formatDateFromTimestamp(gb.startDate);
				let finishDate = formatDateFromTimestamp(gb.finishDate);
				tbody += '<td>'+ startDate +' ~ '+ finishDate+'</td>'
				tbody += '<td>'+gb.joinPeople +'/'+ gb.recruitPeople+'</td>'
				tbody += '<td>'+gb.joinPrice+'</td>'
				tbody += '<td>'+gb.gbState+'</td></tr>'
		}
		$('tbody').append(tbody);
	}
	pagnation(data.currPage, data.totalPage);
}

function drawJoinGbList(data){
	let list = data.myGbList;
	console.log(list);
	$('thead').empty();
	let tbody = '';
	let thead = '<tr>'
		thead += '<th>카테고리 종류</th>'
		thead += '<th>제목</th>'
		thead += '<th>모집기간</th>'
		thead += '<th>인원수</th>'
		thead += '<th>거래 가격</th>'
		thead += '<th>공구상태</th>'
		thead += '<th>완료/평가</th></tr>'
		$('thead').append(thead);
		$('tbody').empty();
		
	if(list.length == 0){
		tbody = '<tr><td colspan="7">모집한 공구글이 없습니다.</td></tr>'
		$('tbody').append(tbody);
	}else{
		console.log(list);
		for(let gb of list){
			tbody += '<tr>'
			tbody += '<td>'+gb.categoryType+'</td>'
			tbody += '<td>'+gb.title+'</td>'
			let startDate = formatDateFromTimestamp(gb.startDate);
			let finishDate = formatDateFromTimestamp(gb.finishDate);
			tbody += '<td>'+ startDate +' ~ '+ finishDate+'</td>'
			tbody += '<td>'+gb.joinPeople +'/'+ gb.recruitPeople+'</td>'
			tbody += '<td>'+gb.joinPrice+'</td>'
			tbody += '<td>'+gb.gbState+'</td>'
			if(gb.gbState == '완료' && gb.isReview == 0){
				tbody += '<td><button class="complete" disabled>완료'+gb.isReview+'</button><button class="review current" value="'+gb.gbNo+'">평가</button></td></tr>'
			}else if(gb.gbState == '진행' && gb.joinState == 'N'){
				tbody += '<td><button class="complete current" value="'+gb.gbNo+'">완료'+gb.isReview+'</button><button class="review" disabled>평가</button></td></tr>'
			}else if(gb.gbState == '진행' && gb.joinState == 'Y' && gb.isReview == 0){
				tbody += '<td><button class="complete" disabled>완료'+gb.isReview+'</button><button class="review current" value="'+gb.gbNo+'">평가</button></td></tr>'	
			}else if(gb.isReview >0){
				tbody += '<td><button class="complete" disabled >완료</button><button class="review" disabled >평가</button></td></tr>'
			}else{
				tbody += '<td><button class="complete" disabled >완료'+gb.isReview+'</button><button class="review" disabled >평가</button></td></tr>'
			}
		}
		$('tbody').append(tbody);
	}
	pagnation(data.currPage, data.totalPage);
	completeClick();
	reviewClick()
}

function pagnation(currPage, totalPage){
$('#pagination').twbsPagination({
	startPage:showPage, // 보여줄 페이지
	totalPages:totalPage,// 총 페이지 수(총갯수/페이지당보여줄게시물수) : 서버에서 계산해서 가져와야함
	visiblePages:10,//[1][2][3][4][5]
	onPageClick:function(e,page){
		if(showPage != page){
			console.log(page);
			showPage = page; // 클릭해서 다른 페이지를 보여주게 되면 현재 보고 있는 페이지 번호도 변경해 준다.
			console.log("showPage : "+showPage)
			console.log("Page : "+page)
			myGbListCall(page);
		}
	}
});	
}

function formatDateFromTimestamp(timestamp) {
    var date = new Date(timestamp);
    var year = date.getFullYear(); // 연도를 4자리로 가져옵니다.
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);
    return year + '-' + month + '-' + day;
}

$(".list-btn").on('click', function(){
	listType = $(this).val();
	$('#pagination').twbsPagination('destroy');
	$(this).addClass("current");
	$(this).next().removeClass("current");
	$(this).prev().removeClass("current");
	myGbListCall(1);
})

function completeClick(){
	$(".complete").on('click', function(){
		let gbNo = $(this).val();
		console.log("gbNo:"+$(this).val());
		$.ajax({
			type: 'get',
			url: 'gbComplete.ajax?gbNo='+gbNo,
			dataType: 'json',
			success:function(data){
				if(data.isComplete == 'success'){
					alert('공구완료에 성공했습니다.');
					$(this).removeClass("current");
					$(this).next().addClass("current");
					 myGbListCall(showPage);
				}else{
					alert('공구완료에 실패했습니다.');
				}
				
			},
			error:function(e){
				console.log(e);
				alert('공구완료에 실패했습니다.');
			}
		});	
	});
}

function reviewClick(){
	$(".review").on('click', function(){
		console.log($(this).val());
		let gbNo = $(this).val();
		location.href = 'review?gbNo='+gbNo+'&&listType='+listType+'&&page='+showPage;
		
	});
	
	$(this).removeClass("current");
	
}
</script>
</html>
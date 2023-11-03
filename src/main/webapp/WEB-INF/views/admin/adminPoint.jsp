<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="<c:url value='/resources/js/jquery.twbsPagination.js'/>" type="text/javascript"></script>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 5px 10px;
        }

        select {
            margin: 5px 0px;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
<th>
    <input type="button" id="chargePoint" value="사용자 충전 내역" />
    <input type="button" id="pointHistory" value="사용자 거래 내역" />
    <label for="date">날짜를 선택하세요:
        <input type="date" id="firstsearchdate" value="" />
        ~
        <input type="date" id="lastsearchdate" value="" />
        <input type="button" id="searchButton" value="검색" />
    </label>
</th>
<table id="pointChargeTable">
    <thead>
        <tr>
            <th>충전 번호</th>
            <th>사용자 아이디</th>
            <th>금액</th>
            <th id="mm">날짜</th>
            <th>입금자 명</th>
        </tr>
    </thead>
    <tbody id="list">
    </tbody>
</table>
<div id="contentContainer"class="hidden">
<table>
    <thead>
        <tr>
            <th>포인트 번호</th>
            <th>식별 번호</th>
            <th>제목</th>
            <th>사용자 ID</th>
            <th>금액</th>
            <th>거래사유</th>
            <th id="mm">날짜</th>
        </tr>
    </thead>
    <tbody id="list">
    </tbody>
</table>
</div>
<script>
function formatDateFromTimestamp(timestamp) {
	var date = new Date(timestamp);
    var year = date.getFullYear(); // 연도를 4자리로 가져옵니다.
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);
    return year + '-' + month + '-' + day;
}

// 예시: "1694358000000"을 "yy-MM-dd" 형식으로 변환
var timestamp = 1694358000000;
var formattedDate = formatDateFromTimestamp(timestamp);

var showPage = 1;
var ascendingOrder = true; // 초기 정렬 방향을 오름차순으로 설정
var firstSearchDateValue= "";
var lastSearchDateValue= "";
var searchResults = null;
var firstpage = true;
listCall(showPage, ascendingOrder);


$('#mm').on('click', function () {
    // 정렬 방향을 토글하고 적절한 함수 호출
    ascendingOrder = !ascendingOrder;
    listCall(showPage, ascendingOrder);
});


function listCall(page, ascending) {
	if (searchResults) {
        // 검색 결과가 있을 경우, 검색 결과 표시
        if (ascendingOrder) {
        	adminPointChargeSearchDesc(page,firstSearchDateValue,lastSearchDateValue);
        } else {
        	adminPointChargeSearchAsc(page,firstSearchDateValue,lastSearchDateValue);
        }
    } else {
        if (ascendingOrder) {
        	adminPointChargeDesc(page);
        } else {
        	adminPointChargeAsc(page);
        }
    }
}
function adminPointChargeDesc(page){
	$.ajax({
		type:'get',
		url:'point/charge/desc',
		data:{'page':page},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.list.length==0){
            	alert('검색결과가 없습니다.');
            }else{                    	
			drawList(data);
            }
		},
		error:function(e){
			console.log(e);
		}
	});
}	
function adminPointChargeAsc(page){
	$.ajax({
		type:'get',
		url:'point/charge/asc',
		data:{'page':page},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.list.length==0){
            	alert('검색결과가 없습니다.');
            }else{                    	
			drawList(data);
            }			
		},
		error:function(e){
			console.log(e);
		}
	});
}

$('#searchButton').on('click', function () {
	showPage = 1;
	$('#pagination').twbsPagination({
	    startPage: '1'
	});
    if($('#firstsearchdate').val() && $('#lastsearchdate').val()){
    firstSearchDateValue = $('#firstsearchdate').val();
    lastSearchDateValue = $('#lastsearchdate').val();
    console.log(firstpage);
    	if(firstpage){
    		adminPointChargeSearchDesc(showPage, firstSearchDateValue, lastSearchDateValue);    	    	
    	}else{
    		adminPointHistorySearchDesc(showPage, firstSearchDateValue, lastSearchDateValue);
    	}
    }else{
    	alert('날짜를 모두 선택해 주세요.');
    }
});
function adminPointChargeSearchDesc(page, firstSearchDateValue, lastSearchDateValue) {
    $.ajax({
        type: 'get',
        url: 'point/charge/search/desc',
        data: {
            'page': page,
            'firstSearchDateValue': firstSearchDateValue,
            'lastSearchDateValue': lastSearchDateValue
        },
        dataType: 'json',
        success: function (data) {
            searchResults = data; // 검색 결과 업데이트
            if(data.list.length==0){
            	alert('검색결과가 없습니다.');
            }else{                    	
            drawList(data);
            }
        },
        error: function (e) {
            console.log(e);
        }
    });
}
function adminPointChargeSearchAsc(page, firstSearchDateValue, lastSearchDateValue) {
    $.ajax({
        type: 'get',
        url: 'point/charge/search/asc',
        data: {
            'page': page,
            'firstSearchDateValue': firstSearchDateValue,
            'lastSearchDateValue': lastSearchDateValue
        },
        dataType: 'json',
        success: function (data) {
            searchResults = data; // 검색 결과 업데이트
            if(data.list.length==0){
            	alert('검색결과가 없습니다.');
            }else{                    	
            drawList(data);
            }
        },
        error: function (e) {
            console.log(e);
        }
    });
}

function drawList(obj){
	var content ='';
	var pp ='';
	
	obj.list.forEach(function(item, idx){
		content +='<tr>';
		content +='<td>'+item.chargeNo+'</td>';
		content +='<td>'+item.userId+'</td>';
		content +='<td>'+item.chargePrice+'</td>';
		var formattedDate = formatDateFromTimestamp(item.chargeDate);
		content +='<td>'+formattedDate+'</td>';
		content +='<td>'+item.depositor+'</td>';
		content +='</tr>';
	});
		pp +='<tr>';
		pp +='<td colspan="6" id="paging">';
		pp +='<div class="container">';
		pp +='<nav aria-label="Page navigation" style="text-align:center">';
		pp +='<ul class="pagination" id="pagination"></ul>';
		pp +='</nav>';
		pp +='</div>';
		pp +='</td>';
		pp +='</tr>';
	$('#list').empty();
	$('#list').append(content);
	$('#list').append(pp);
	$('#pagination').twbsPagination({
	    startPage: showPage, // 현재 페이지 번호를 설정
	    totalPages: obj.pages,
	    visiblePages: 5,
	    onPageClick: function (e, page) {
	        if (showPage !== page) {
	            showPage = page;
	            if (searchResults) {
	                // 검색 결과가 있을 경우, 검색 결과 표시
	                if (ascendingOrder) {
	                	adminPointChargeSearchDesc(page,firstSearchDateValue,lastSearchDateValue);
	                } else {
	                	adminPointChargeSearchAsc(page,firstSearchDateValue,lastSearchDateValue);
	                }
	            } else {
	                if (ascendingOrder) {
	                	adminPointChargeDesc(page);
	                } else {
	                	adminPointChargeAsc(page);
	                }
	            }
	        }
	    }
	});
}

$('#chargePoint').on('click', function () {
    $('#contentContainer').addClass('hidden');
    $('#pointChargeTable').removeClass('hidden');
    $('#firstsearchdate').val('');
    $('#lastsearchdate').val('');
    firstpage = true;
});

$('#pointHistory').on('click', function () {
	$('#pointChargeTable').addClass('hidden');
    $('#contentContainer').removeClass('hidden');
    $('#firstsearchdate').val('');
    $('#lastsearchdate').val('');
    firstpage = false;
    showPage = 1;
    ascendingOrder = true; // 초기 정렬 방향을 오름차순으로 설정
    firstSearchDateValue= "";
    lastSearchDateValue= "";
    searchResults = null;
	pointHistoryListCall(showPage,ascendingOrder);
});
$('#contentContainer #mm').on('click', function () {
    // 정렬 방향을 토글하고 적절한 함수 호출
    ascendingOrder = !ascendingOrder;
    pointHistoryListCall(showPage, ascendingOrder);
});
function pointHistoryListCall(page, ascendingOrder) {
	if (searchResults) {
        // 검색 결과가 있을 경우, 검색 결과 표시
        if (ascendingOrder) {
        	adminPointHistorySearchDesc(page,firstSearchDateValue,lastSearchDateValue);
        } else {
        	adminPointHistorySearchAsc(page,firstSearchDateValue,lastSearchDateValue);
        }
    } else {
        if (ascendingOrder) {
        	adminPointHistoryDesc(page);
        } else {
        	adminPointHistoryAsc(page);
        }
    }
}
function adminPointHistoryDesc(page){
	$.ajax({
		type:'get',
		url:'point/history/desc',
		data:{'page':page},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.list.length==0){
            	alert('검색결과가 없습니다.');
            }else{                    	
			drawHistoryList(data);
            }
		},
		error:function(e){
			console.log(e);
		}
	});
}
function adminPointHistoryAsc(page){
	$.ajax({
		type:'get',
		url:'point/history/asc',
		data:{'page':page},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.list.length==0){
            	alert('검색결과가 없습니다.');
            }else{                    	
			drawHistoryList(data);
            }
		},
		error:function(e){
			console.log(e);
		}
	});
}

function adminPointHistorySearchDesc(page, firstSearchDateValue, lastSearchDateValue) {
    $.ajax({
        type: 'get',
        url: 'point/history/search/desc',
        data: {
            'page': page,
            'firstSearchDateValue': firstSearchDateValue,
            'lastSearchDateValue': lastSearchDateValue
        },
        dataType: 'json',
        success: function (data) {
            searchResults = data; // 검색 결과 업데이트
            if(data.list.length==0){
            	alert('검색결과가 없습니다.');
            }else{                    	
            drawHistoryList(data);
            }
        },
        error: function (e) {
            console.log(e);
        }
    });
}

function adminPointHistorySearchAsc(page, firstSearchDateValue, lastSearchDateValue) {
    $.ajax({
        type: 'get',
        url: ' point/history/search/asc',
        data: {
            'page': page,
            'firstSearchDateValue': firstSearchDateValue,
            'lastSearchDateValue': lastSearchDateValue
        },
        dataType: 'json',
        success: function (data) {
            searchResults = data; // 검색 결과 업데이트
            if(data.list.length==0){
            	alert('검색결과가 없습니다.');
            }else{                    	
            drawHistoryList(data);
            }
        },
        error: function (e) {
            console.log(e);
        }
    });
}

function drawHistoryList(obj){
	var content ='';
	var pp = '';
	obj.list.forEach(function(item, idx){
		content +='<tr>';
		content +='<td>'+item.pointNo+'</td>';
		content +='<td>'+item.gbNo+'</td>';
		content +='<td>'+item.title+'</td>';
		content +='<td>'+item.userId+'</td>';
		content +='<td>'+item.pointMonney+'</td>';
		content +='<td>'+item.pointReason+'</td>';
		var formattedDate = formatDateFromTimestamp(item.pointDate);
		content +='<td>'+formattedDate+'</td>';
		content +='</tr>';
	});
	pp +='<tr>';
	pp +='<td colspan="7" id="paging">';
	pp +='<div class="container">';
	pp +='<nav aria-label="Page navigation" style="text-align:center">';
	pp +='<ul class="pagination" id="pagination"></ul>';
	pp +='</nav>';
	pp +='</div>';
	pp +='</td>';
	pp +='</tr>';
	$('#contentContainer #list').empty();
	$('#contentContainer #list').append(content);
	$('#contentContainer #list').append(pp);
	
	$('#contentContainer #pagination').twbsPagination({
	    startPage: showPage, // 현재 페이지 번호를 설정
	    totalPages: obj.pages,
	    visiblePages: 5,
	    onPageClick: function (e, page) {
	        if (showPage !== page) {
	            showPage = page;
	            if (searchResults) {
	                // 검색 결과가 있을 경우, 검색 결과 표시
	                if (ascendingOrder) {
	                	adminPointHistorySearchDesc(page,firstSearchDateValue,lastSearchDateValue);
	                } else {
	                	adminPointHistorySearchAsc(page,firstSearchDateValue,lastSearchDateValue);
	                }
	            } else {
	                if (ascendingOrder) {
	                	adminPointHistoryDesc(page);
	                } else {
	                	adminPointHistoryAsc(page);
	                }
	            }
	        }
	    }
	});
}



</script>
</body>
</html>
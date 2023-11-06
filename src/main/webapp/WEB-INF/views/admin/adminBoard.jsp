<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap: 디자인을 위한 프레임워크 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 합니다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 처리를 위한 라이브러리 -->
<script src="<c:url value='/resources/js/jquery.twbsPagination.js'/>" type="text/javascript"></script>
<style>
.container-row-spacing {
        margin-bottom: 80px; /* 원하는 간격(px)을 설정 */
    }

p {
  font-size: 15px;
}
.card:hover {
  transform: scale(1.05);
}
#all {
  width: 100%;
  height: 100%;
}
#cc{
	margin-left:15px;
	width: 20px;
	height: 20px;	
}
#z{
	
	margin-right:67%;
	font-size: 20px;
	float: right;
}
.card {
  border-radius: 20px;
  border: solid black 1px;
  height: 450px;
  width: 250px;
  background-color: white;
  position: relative;
  box-shadow: 10px 5px 5px black;
  left: 80px;
  float: left;
  transition: all 0, 2s linear;
  margin-right: 3%;
  margin-top: 60px;
}


#name {
  color: orange;
}

#content {
  margin-top: 50px;
  margin-left: 10px;
}

#sinsun {
position: absolute;
  width: 100px;
  background-color: orange;
  height: 40px;
  border-radius: 20px;
  left: 140px;
  bottom: 10px;
  text-align: center;
  line-height: 40px;
}

#p1 {
  top: 750px;
  left: 300px;
}

#check {
  top: 750px;
  left: 350px;
  width: 30px;
  height: 30px;
  color: yellow;
}

#photoroom {
  width: 100%;
  border-radius: 20px;
  height: 130px;
  top: 120px;
  left: 50px;
  display: flex;
  justify-content: center;
  text-align: center;
}

#imgge {
  width: 100%;
  height: 100px;
  object-fit: cover;
}

#icon {
  position: absolute;
  right: 20px;
  bottom: 100px;
}

#price {
  font-size: 30px;
}
</style>
</head>
<body>
<th>
	<input type="text" id="searchadmingblist" placeholder="아이디 입력"/>
	<input type="button" id="searchpoingblist" value="아이디 검색"/>
    <input type="button" id="alladmingblist" value="전체" />
    <input type="button" id="sucadmingblist" value="완료" />
    <input type="button" id="failadmingblist" value="취소" />
    <label for="date">날짜를 선택하세요:
        <input type="date" id="firstsearchdate" value="" />
        ~
        <input type="date" id="lastsearchdate" value="" />
        <input type="button" id="searchButton" value="검색" />
    </label>
</th>
    <div class="container container-row-spacing">
        <div class="row" id="list">
            <!-- 데이터가 여기에 삽입됩니다. -->
        

</body>
    <script>
    function formatDateFromTimestamp(timestamp) {
        var date = new Date(timestamp);
        var year = date.getFullYear(); // 연도를 4자리로 가져옵니다.
        var month = ('0' + (date.getMonth() + 1)).slice(-2);
        var day = ('0' + date.getDate()).slice(-2);
        return year + '-' + month + '-' + day;
    }

    var showPage = 1;
	var searchblock ="all";
       var seruser = '';
       var searchResults = null;
       var firstpage = true;
       var serint = null;
    adminGroupBuyList(showPage,searchblock);

    function adminGroupBuyList(page,searchblock) {
        $.ajax({
            type: 'get',
            url: 'groupBuy/list.ajax',
            data: { 'page': page, 'searchblock':searchblock },
            dataType: 'json',
            success: function (data) {
                console.log(data.list.length);
                if(data.list.length==0){
                	alert('검색결과가 없습니다.')
                }else{                    	
                drawList(data);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function drawList(obj) {
        var content = '';
		var pp = '';
        var itemPerRow = 4; // 한 행당 4개의 아이템을 표시

        obj.list.forEach(function (item, idx) {
        	content += '<div id="all" >'; // 한 행 시작
            content += '<div class="card ' + idx + '" id="' + item.gbNo + '">';
            content += '<div id="photoroom">';
            content += '<img id="image" src="../../images/logo1.png"></img>';
            content += '</div>';
            content += '<div id="content">';
            content += '<h3>' + item.title + '</h3>';
            content += '<p id="name">' + item.userId + '</p>';
            content += '<p>모집 기간</p>';
            var startDate = formatDateFromTimestamp(item.startDate);
            var finishDate = formatDateFromTimestamp(item.finishDate);
            content += '<p>' + startDate + ' ~ ' + finishDate + '</p>';
            content += '<br />';
            content += '<p>모집 인원 ' + item.joinPeople + '/' + item.recruitPeople + '</p>';
            content += '<h1>' + item.joinPrice + '원</h1>';
            content += '<p id="icon">아이콘</p>';
            content += '<p id="sinsun">' + item.categoryType + '</p>';
            content += '</div>';
            content += '</div>';
            content += '</div>'; // 한 행 종료
            content += '</div>'; 
            content += '</div>'; 
        });
        pp += '<div class="container">';
        pp += '<nav aria-label="Page navigation" style="text-align:center">';
        pp += '<ul class="pagination" id="pagination"></ul>';
        pp += '</nav>';
        pp += '</div>';

        $('#list').empty();
        $('#list').append(content);
        $('#list').append(pp);

        	console.log(showPage);
        // 페이징 처리 UI 그리기(플러그인 사용)
        $('#pagination').twbsPagination({
        	startPage: showPage, // 현재 페이지 번호를 설정
    	    totalPages: obj.pages,
    	    visiblePages: 5,
    	    onPageClick: function (e, page) {
    	        if (showPage !== page) {
    	            showPage = page; // 클릭해서 다른 페이지를 보여주게 되면 현재 보고 있는 페이지 번호도 변경해 준다.
    	            if(serint){
    	            	if(firstpage){
    	                	adminGroupBuyIntList(showPage,searchblock,firstSearchDateValue,lastSearchDateValue);		
    	            	}else{
    	            		adminGroupBuySerUserIntList(showPage, searchblock, seruser,firstSearchDateValue,lastSearchDateValue);       		
    	            	}
    	            }else{        	            	
    	            if(searchResults){
    	        		adminGroupBuySerUserList(showPage, searchblock, seruser)		
    	        	}else{
    	        		adminGroupBuyList(showPage,searchblock);        		
    	        	}
    	            }
                }
            }
        });
    }
    $('#alladmingblist').on('click',function(){
    	showPage = 1;
    	searchblock = "all";
    	seruser= null;
    	searchResults=null;
    	adminGroupBuyList(showPage,searchblock);
    	console.log(showPage);
    	firstpage = true;
    	 $('#searchadmingblist').val('');
    });
    $('#sucadmingblist').on('click',function(){
    	showPage= 1;
    	searchblock = "N";
    	if(serint){
        	if(firstpage){
            	adminGroupBuyIntList(showPage,searchblock,firstSearchDateValue,lastSearchDateValue);		
        	}else{
        		adminGroupBuySerUserIntList(showPage, searchblock, seruser,firstSearchDateValue,lastSearchDateValue);       		
        	}
        }else{        	            	
        if(searchResults){
    		adminGroupBuySerUserList(showPage, searchblock, seruser)		
    	}else{
    		adminGroupBuyList(showPage,searchblock);        		
    	}
        }
    	console.log(showPage);
    });
    $('#failadmingblist').on('click',function(){
    	showPage= 1;
    	searchblock = "Y";
    	if(serint){
        	if(firstpage){
            	adminGroupBuyIntList(showPage,searchblock,firstSearchDateValue,lastSearchDateValue);		
        	}else{
        		adminGroupBuySerUserIntList(showPage, searchblock, seruser,firstSearchDateValue,lastSearchDateValue);       		
        	}
        }else{        	            	
        if(searchResults){
    		adminGroupBuySerUserList(showPage, searchblock, seruser)		
    	}else{
    		adminGroupBuyList(showPage,searchblock);        		
    	}
        }
    		console.log(showPage);
    });

    $('#searchpoingblist').on('click',function(){
    	showPage=1;
    	searchblock = "all";
    	seruser= null;
    	firstpage = false;
        var inputElement = document.getElementById("searchadmingblist");
        seruser = inputElement.value;
        adminGroupBuySerUserList(showPage, searchblock, seruser);
    })
    function adminGroupBuySerUserList(page, searchblock, seruser) {
        $.ajax({
            type: 'get',
            url: 'groupBuy/ser/user/list.ajax',
            data: { 'page': page,'searchblock':searchblock , 'seruser':seruser },
            dataType: 'json',
            success: function (data) {
                console.log(data);
                searchResults = data;
                if(data.list.length==0){
                	alert('검색결과가 없습니다.')
                }else{    
                drawList(data);
                }
            },
            error: function (e) {
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
        	adminGroupBuyIntList(showPage,searchblock,firstSearchDateValue,lastSearchDateValue);		
    	}else{
    		adminGroupBuySerUserIntList(showPage, searchblock, seruser,firstSearchDateValue,lastSearchDateValue);       		
    	}
        }else{
        	alert('날짜를 모두 선택해 주세요.');
        }
    });
    function adminGroupBuyIntList(page, searchblock,firstSearchDateValue,lastSearchDateValue) {
        $.ajax({
            type: 'get',
            url: 'groupBuy/int/list.ajax',
            data: { 'page': page,'searchblock':searchblock ,'firstSearchDateValue':firstSearchDateValue,'lastSearchDateValue':lastSearchDateValue},
            dataType: 'json',
            success: function (data) {
                console.log(data);
                serint=data;
                if(data.list.length==0){
                	alert('검색결과가 없습니다.')
                }else{                    	
                drawList(data);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
    function adminGroupBuySerUserIntList(page, searchblock, seruser,firstSearchDateValue,lastSearchDateValue) {
        $.ajax({
            type: 'get',
            url: 'groupBuy/ser/user/int/list.ajax',
            data: { 'page': page,'searchblock':searchblock , 'seruser':seruser,'firstSearchDateValue':firstSearchDateValue,'lastSearchDateValue':lastSearchDateValue},
            dataType: 'json',
            success: function (data) {
                console.log(data);
                serint=data;
                if(data.list.length==0){
                	alert('검색결과가 없습니다.')
                }else{                    	
                drawList(data);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
    $(document).on('click', '.card', function() {
    	var gbNo = $(this).attr('id');
        console.log('클릭한 카드의 id: ' + gbNo);
        location.href= 'gbdetail?gbNo='+gbNo;
    });
    
    </script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="<c:url value='/resources/css/img_slider.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/gbDetail.css'/>">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<c:url value='/resources/js/jquery.twbsPagination.js'/>"></script>
</head>
<body>
	<div class="elem-container">
    <div id="productsInfo" class="section">
        <div id="productImgBox" class="products">
        	<div class="slider-2">
			     <div class="side-btns">
			        <div><span><i class="fas fa-caret-left"></i><</i></span></div>
			        <div><span><i class="fas fa-caret-right"></i>></span></div>
			    </div>
    
			    <div class="slides">
			    	<c:choose>
			    		<c:when test="${fn:length(PhotoNames)==0}">
			    		<div class="active slide-img" style="background-image:url(/photo/default/default.png?auto=compress,format);"></div>
			    		</c:when>
			    		<c:otherwise>
			    		<c:forEach items="${PhotoNames}" var="newName" varStatus="status">
					    <c:if test="${status.index eq 0}">
					    <div class="active slide-img" style="background-image:url(/photo/gbImg/${newName}?auto=compress,format);"></div>
					    </c:if>
					    <c:if test="${status.index ne 0}">
					    <div class="slide-img" style="background-image:url(/photo/gbImg/${newName}?auto=compress,format);"></div>
					    </c:if>
					    </c:forEach>
			    		</c:otherwise>
			    	</c:choose>
				    
			    </div>
            </div>
        </div>
        <div class="products">
            <div 모집인원 class="smallInfo">
                <label for="recruitPeople" class="info-label">인원수</label>
	                <span>
	                ${GroupBuyDto.joinPeople}/${GroupBuyDto.recruitPeople}
	                </span>
                <span>
                <c:if test="${GroupBuyDto.joinPeople ne 0}">
                <fmt:formatNumber var="oc" type="number" maxFractionDigits="0"  value="${GroupBuyDto.joinPeople/GroupBuyDto.recruitPeople*100}" />
                </c:if>
                <c:choose>
                	<c:when test="${GroupBuyDto.joinPeople eq 0}">
                	<img class="detail-joinicon" src="/photo/icon/1.png"/>
                	</c:when>
                	<c:when test="${oc ge 0 && oc le 25}">
                	<img class="detail-joinicon" src="/photo/icon/1.png" />
                	</c:when>
                	<c:when test="${oc ge 26 && oc le 50}">
                	<img class="detail-joinicon" src="/photo/icon/2.png" />
                	</c:when>
                	<c:when test="${oc ge 51 && oc le 75}">
                	<img class="detail-joinicon" src="/photo/icon/3.png" />
                	</c:when>
                	<c:when test="${oc ge 76 && oc le 99}">
                	<img class="detail-joinicon" src="/photo/icon/4.png" />
                	</c:when>
                	<c:when test="${oc eq 100}">
                	<img class="detail-joinicon" src="/photo/icon/5.png" />
                	</c:when>
                </c:choose>
                </span>
            </div>
            <p id ="gbNo">글 번호: ${gbNo}</p>
            <fieldset>
 <div>
 	<label>글 상태</label>
 	<div>
    <p>정상<input type="radio" id="blockN" name="blockState" value="N"/></p>
    <p>블라인드<input type="radio" id="blockY" name="blockState" value="Y"/></p>
    <input type ="button" id="blockbut" value="저장"/>
 	</div>
 </div>
</fieldset>
            <div 모집기간 class="smallInfo">
                <label>모집기간</label>
                <span>
                    <input type="text" id="startDate" name="startDate" value="${GroupBuyDto.startDate}"/>
                    ~
                    <input type="text" id="finishDate" name="finishDate" value="${GroupBuyDto.startDate}"/>
                </span>
            </div>
            <div>
                <label for="recruitRegion">지역</label>
                <span>
                    <input type="text" id="recruitRegion" name="recruitRegion" value="${GroupBuyDto.gbDetailAddress}"/>
                </span>
            </div>
            <div 모집장소 class="smallInfo">
                <label for="recruitLocation">모집장소</label>
                <span>
                    <input type="text" id="recruitLocation" name="recruitLocation" value="${GroupBuyDto.place}" readonly/>
                </span>
            </div>
            <div 모집장소 class="smallInfo">
                <label for="userId">아이디</label>
                <span>
                    <input type="text" id="userId" name="userId" value="${GroupBuyDto.userId}" readonly/>
                </span>
                <label for="recruiter">작성자</label>
                <span>
                    <input type="text" id="recruiter" name="recruiter" value="${GroupBuyDto.nickname}" readonly/>
                </span>
            </div>
            <div 모집장소 class="smallInfo">
                <label for="user">사용자 평가</label>
                <span>
                    별로에요 : <input type="text" id="tradeAgainNum" value="${GroupBuyDto.tradeAgainNum}" readonly/>
                </span>
                <span>
                    그냥 그래요 : <input type="text" id="justOkayNum" value="${GroupBuyDto.justOkayNum}" readonly/>
                </span>
                <span>
                    또 거래하고싶어요 : <input type="text" id="notInterestedNum" value="${GroupBuyDto.notInterestedNum}" readonly/>
                </span>
            </div>
            <div 금액 class="smallInfo">
                <label for="joinPrice">금액</label>
                <span>
                	<fmt:formatNumber var="sm" value="${GroupBuyDto.joinPrice}" pattern="#,###" />
                    <input type="text" id="joinPrice" value="${sm}"/>
                </span>
            </div>
            <div 금액 class="smallInfo">
                <label for="category">카테고리</label>
                <span>
                    <input type="text" id="category" value="${GroupBuyDto.categoryType}"/>
                </span>
            </div>
        </div>
        
    </div>
    
    <div id="titleDiv">
        <div class="subContent">
            제목
            <input type="text" id="title" value="${GroupBuyDto.title}"/>
        </div>
        <div>
            내용
            <textarea id="gbContent" readonly>${GroupBuyDto.gbContent}</textarea>
        </div>
    </div>
    <hr>
    <h3>댓글</h3>
    <div id="comments">
	            
        </div>
        <div id="pp">

		</div>
    <hr>
</body>
<script>
function formatDateFromTimestamp(timestamp) {
    var date = new Date(timestamp);
    var year = date.getFullYear(); // 연도를 4자리로 가져옵니다.
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);
    return year + '-' + month + '-' + day;
}
var gbNo = ${gbNo};
admingbdetail()
function admingbdetail(){
    console.log(gbNo);
    $.ajax({
        type: 'get',
        url: 'Board/detail.ajax',
        data: {'gbNo':gbNo},
        dataType: 'json',
        success: function (data) {
            console.log(data);
            $('#title').val(data.GroupBuyDto.title);
            $('#gbContent').val(data.GroupBuyDto.gbContent);
            $('#info-label').val(data.GroupBuyDto.joinPeople);
            $('#info-label').val(data.GroupBuyDto.recruitPeople);
            $('#startDate').val(formatDateFromTimestamp(data.GroupBuyDto.startDate));
            $('#finishDate').val(formatDateFromTimestamp(data.GroupBuyDto.finishDate));
            $('#recruitRegion').val(data.GroupBuyDto.gbDetailAddress);
            $('#recruitLocation').val(data.GroupBuyDto.place);
            $('#recruiter').val(data.GroupBuyDto.nickname);
            $('#joinPrice').val(data.GroupBuyDto.joinPrice);
            $('#category').val(data.GroupBuyDto.categoryType);
            $('#userId').val(data.GroupBuyDto.userId);
            $('#tradeAgainNum').val(data.GroupBuyDto.tradeAgainNum);
            $('#justOkayNum').val(data.GroupBuyDto.justOkayNum);
            $('#notInterestedNum').val(data.GroupBuyDto.notInterestedNum);
            var blockStateValue = data.GroupBuyDto.blockState; 
            if (blockStateValue === 'N') {
                $('#blockN').prop('checked', true);
                $('#blockY').prop('checked', false);
            } else if (blockStateValue === 'Y') {
                $('#blockN').prop('checked', false);
                $('#blockY').prop('checked', true);
            }
            
            // PhotoNames 데이터 업데이트
            var photoNames = data.PhotoNames;
            var slides = $('.slides');
            slides.empty();

            if (photoNames.length === 0) {
                // 기본 이미지 표시
                slides.append('<div class="active slide-img" style="background-image:url(/photo/default/default.png?auto=compress,format);"></div>');
            } else {
                // 각 이미지 표시
                for (var i = 0; i < photoNames.length; i++) {
                    var imageClass = i === 0 ? 'active' : '';
                    var imageUrl = '/photo/gbImg/' + photoNames[i] + '?auto=compress,format';
                    slides.append('<div class="slide-img ' + imageClass + '" style="background-image:url(' + imageUrl + ');"></div>');
                }
            }

            // 사용자 평가 데이터 업데이트
            $('.detail-joinicon').attr('src', function (index) {
                var oc = data.GroupBuyDto.joinPeople / data.GroupBuyDto.recruitPeople * 100;
                if (oc >= 0 && oc <= 25) {
                    return '/photo/icon/1.png';
                } else if (oc >= 26 && oc <= 50) {
                    return '/photo/icon/2.png';
                } else if (oc >= 51 && oc <= 75) {
                    return '/photo/icon/3.png';
                } else if (oc >= 76 && oc <= 99) {
                    return '/photo/icon/4.png';
                } else if (oc === 100) {
                    return '/photo/icon/5.png';
                } else {
                    return ''; // 다른 경우
                }
            });
        },
        error: function (e) {
            console.log(e);
        }
    });    
}
var showPage = 1;
commentListCall(showPage,gbNo)
function commentListCall(page,gbNo){
	$.ajax({
        type: 'get',
        url: 'Board/detail/comment.ajax',
        data: { 'page': page,'gbNo':gbNo},
        dataType: 'json',
        success: function (data) {
            console.log(data);
            if(data.comments.length==0){
            	var comments ='';
            	comments += '<p>댓글이 없습니다.</p>';
            	$('#comments').empty();
            	$('#comments').append(comments);
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
	var comments ='';
	var pp ='';
	obj.comments.forEach(function(item, idx){
		comments += '<p style="display:none">'+item.commNo+'</p>';
		comments += '<div id="commentHead">';
		comments +=	'<span id="commentWriter">'+item.nickname+'</span>';
    	comments += '</div>';
		comments += '<div id="commentBody">';
		comments += '<div id="content"><textarea id="commentContent" class="inputValid" readonly>'+item.comment+'</textarea></div>';
        comments += '<div id="date">'
        
        comments += '<span><button class="delete" data-commno="${item.commNo}">삭제</button>';	
	});
	pp += '<div class="container">';
    pp += '<nav aria-label="Page navigation" style="text-align:center">';
    pp += '<ul class="pagination" id="pagination"></ul>';
    pp += '</nav>';
    pp += '</div>';
    $('#comments').empty();
    $('#pp').empty();
	$('#comments').append(comments);
	$('#pp').append(pp);
	$('#pagination').twbsPagination({
		startPage:showPage, // 보여줄 페이지
		totalPages:obj.totalPage,// 총 페이지 수(총갯수/페이지당보여줄게시물수) : 서버에서 계산해서 가져와야함
		visiblePages:5,//[1][2][3][4][5]
		onPageClick:function(e,page){ // 번호 클릭시 실행할 내용
			//console.log(e);
			if(showPage != page){
				console.log(page);
				showPage = page; // 클릭해서 다른 페이지를 보여주게 되면 현재 보고 있는 페이지 번호도 변경해 준다.
	            commentListCall(showPage, gbNo);
			}
		}
	});
	deleteBtn();
}
// 댓글 삭제 기능 만들기, 블라인드 상태 변경 버튼
function deleteBtn(){
	$('.delete').on('click', function(){
		let commNo= $(this).closest("div").prev().parent("div").prev().prev().html();
		console.log(commNo);
		console.log(gbNo); 
		$.ajax({
			type:'GET',
			url:'Board/comment/del.ajax',
			data: {'commNo':commNo,'gbNo':gbNo},
			dataType :'json',
			success:function(data){
				if(data.msg == "success"){
					showPage=1;
					commentListCall(showPage,gbNo);
					alert("댓글삭제를 성공했습니다.");
				}else{
					alert("댓글삭제에 실패했습니다.")
				}
			},
			error:function(error){
				console.error(error)
			}
					
		});
	});
}

$('#blockbut').on('click',function(){
	 var blockState = $("input[name='blockState']:checked").val();
	 console.log("선택한 블록 상태: " + blockState);
	 $.ajax({
			type:'GET',
			url:'Board/blockState.ajax',
			data: {'blockState':blockState,'gbNo':gbNo},
			dataType :'json',
			success:function(data){
				if(data.msg == "success"){
					admingbdetail()
					alert("상태변경에 성공했습니다.");
				}else{
					alert("상태변경에 실패했습니다.")
				}
			},
			error:function(error){
				console.error(error)
			}
					
		});
});
	


</script>
</html>
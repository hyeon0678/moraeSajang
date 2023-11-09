<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        #reportContent{
            width: 550px;
            height: 300px;
        }
        .nums{
        	visibility : hidden;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
    <form action="report" method="post">
    <div>
        <span id="h3">글쓰기</span>
        
        <hr>
        <div id="productImg" class="smallInfo">
            <textarea id="reportContent" name="reportContent" class="inputValid"></textarea>
        </div>
        <div class="validation">
            0/250
        </div>
        <div><button type="button" id="report">신고하기</button><button type="button" id="goGb">되돌아 가기</button></div>
    </div>
    </form>
    
</body>
<script>
let param = '${param}';
console.log(param);
//<input id="gbNo" name="gbNo" value="${param.gbNo}" class="nums"/>
//<input id="commNo" name="commNo" value="${param.commNo}" class="nums"></input>

$('#report').on('click', function(){
	if($('#reportContent').val() == ''){
		alert('신고 내용은 비워둘 수 없습니다.');
		return false;
	}
	$('form').submit();
});

$('#goGb').on('click', function(){
	let gbNo = get_cookie('gbNo')
	console.log(gbNo);
	//location.href = 'gbDetail?gbNo='+'${param.gbNo}';
});

function get_cookie(name) {
    var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    return value? value[2] : null;
}
</script>
<script type="text/javascript" src="<c:url value='/resources/js/inputValid.js'/>"></script>

</html>
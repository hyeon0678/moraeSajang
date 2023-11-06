/**
 * 글쓰기 250자 제한 함수
 */
 $('.inputValid').on('keydown', function(){
    let len = $(this).val().length;
            console.log($(this));
    if(len > 250){
        var over = len - 250;
        var x = $(this).val();
        console.log(x);
        x = x.replace(x.substr(250), "");
        console.log($(this).next());
        $(this).next().html('250/250 250자 까지 작성할 수 있습니다.');
    }else{
        $(this).next().html(len+'/250');
    }
}).on('keyup', function(){
    var y = $(this).val();
    if(y.length>250){
        $(this).next().html('250/250 250자 까지 작성할 수 있습니다.');
    }else{
    	$(this).next().html(y.length+'/250');
    }
    $(this).val($(this).val().replace(y.substr(250), ""));
});
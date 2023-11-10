<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
    table, th, td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
    }
</style>
</head>
<body>
     <table>
     
    	 <tr>
           <th>아이디</th>
             <th>
          <input type="text" name="id" class="id" id="id" value="${sessionScope.userInfo.userId}" readonly />
          </th>
          
        </tr> 
        
        <tr>
           <th>비밀번호</th>
             <th>
          <input type="password" name="pw" class="pw" id="password_1" placeholder="비밀번호를 입력해주세요"/>
          </th>
          
        </tr> 
       <tr>
          <th>비밀번호 재확인</th>
          <th>
          <input type="password" name="pwer" class="pw" id="password_2" placeholder="비밀번호를 재입력해주세요"  />
          <font id="checkPw" size ="2"></font>
          </th>
       </tr>
       
         <tr>
             <!--공백문자-->
             <th>이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
             <th>
                 <input type="text" name="name" placeholder="이름을 입력해주세요" value="${sessionScope.userInfo.name}" readonly/>
             </th>
         </tr>
  
         <tr>
             <th>닉네임</th>
             <th>
                 <input type="text" name="nickname" placeholder="닉네임을 입력해주세요" value="${sessionScope.userInfo.nickname}"/>
                 <input type="button" id="overnickname" value="nickname 체크"/>
             </th>
         </tr>   

      <tr class="form-group">
      <th>도로명</th>
      <th>
       <input class="form-control" "id="streetAddr" placeholder="도로 주소" name="addr1" type="text" readonly="readonly" value="${sessionScope.userInfo.streetAddress}"/>
      <button type="button" class="btn btn-default" onclick="execPostCode()"><i class="fa fa-search"></i> 주소 찾기</button>  
      </th>
      </tr>
            

     
      <tr class="form-group">
      <th>읍/면/동</th>
      <th>
      <input class="form-control" placeholder="읍/면/동" name="addr2" id="userdetailAddr" type="text" value="${sessionScope.userInfo.userDetailAddress}" />
      </th>      
      </tr> 
         
                
        
         <tr>
             <th colspan="2">
                 <input type="button" id="update" name="update" value="수정하기"/>
             </th>
         </tr>
         
         <tr>

         
         </tr>
     </table>
     
     
     
     
     
</body>
<script>




$('.pw').keyup(function(){
   let pass1 =$("#password_1").val();
   let pass2 =$("#password_2").val();
   
   if(pass1 != "" || pass2 !=""){
      if(pass1 == pass2){
         $("#checkPw").html("비밀번호가 일치합니다.");
         $("#checkPw").attr("color","green");
      }else{
         $("#checkPw").html("비밀번호가 불일치합니다.");
         $("#checkPw").attr("color","red");
      }
   }
})

                       
var overnicknameChk = false;



$('#update').on('click',function(){
   var $id = $('input[name="id"]');
   var $pw = $('input[name="pw"]');   
   var $pwer = $('input[name="pwer"]');
   var $name = $('input[name="name"]');
   var $nickname = $('input[name="nickname"]');
   var $addr1 = $('input[name="addr1"]');
   var $addr2 = $('input[name="addr2"]');
  
  
   
   if(overnicknameChk==0){
         
      if($pw.val() == ''){
         alert('비밀번호를 입력해 주세요');
         $pw.focus();
      }else if($pwer.val()==''){
         alert('비밀번호를 재확인해 주세요');
         $pwer.focus();      
      }else if($nickname.val()==''){
         alert('닉네임을 입력해 주세요');
         $nickname.focus();
      }else if($addr1.val()==''){
    	  alert('도로명 주소를 입력해 주세요');
          $addr1.focus(); 
      }else if($addr2.val()==''){
         alert('읍/면/동을 입력해 주세요');
         $addr2.focus();
      } else{     	  
         var param = {};   
       	 param.id = $id.val();
         param.pw = $pw.val();
         param.pwer = $pwer.val();
         param.nickname = $nickname.val();
         param.addr1 = $addr1.val();
         param.addr2 = $addr2.val();                                  
         console.log(param);
         
            
            $.ajax({
            type:'post',
            url:'update', 
            data:param,
            dataType:'JSON',
            success:function(data){
               console.log(data);
               if(data.success>0){
                  alert('수정하기에 성공 했습니다.');
                  location.href='./';  
               }else{
                  alert('수정하기에 실패 했습니다.');
               }               
            },
            error:function(e){
               console.log(e);
            }
         });      
   
      }
   }else {
      alert('중복 체크를 해 주세요!');
      
   }
   
});




//닉네임 중복체크
$('#overnickname').on('click',function(){
   var nickname = $('input[name="nickname"]').val();
   console.log('nickname='+nickname);
   
   
   $.ajax({
      type:'get', 
      url:'overnickname', 
      data:{'nickname':nickname}, 
      dataType:'JSON', 
      success:function(data){
         console.log(data);
         overnicknameChk = data;
         if(data==0){
            alert('사용 가능한 닉네임 입니다.');
         }else{
            alert('이미 사용중인 닉네임 입니다.');
            $('input[name="nickname"]').val('');
         }      
         
      },
      error:function(error){
         console.log(error);
      }, 
   });
   
   
});








//api
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
        
           var fullRoadAddr = data.roadAddress; 
           var extraRoadAddr = ''; 

           
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
          
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
          
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }


           $("[name=addr1]").val(fullRoadAddr); 
           $("[name=addr2]").val(data.bname);
           
       }
    }).open();
}






   


</script>
</html>











   
   


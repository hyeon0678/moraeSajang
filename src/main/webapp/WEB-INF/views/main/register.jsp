<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
  <%--  table, th, td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
        margin: auto; 
        text-align: center;

    } --%>
    
    

</style><!-- #F9DCA3 -->
</head>
<body>        
             <table>  
			 <h1 align="center">회원가입</h1>
				
			 <p align="center">아이디  
			 <div>
			 <input type="text" name="id" placeholder="아이디를 입력해주세요"/> 
			 <input type="button" id="overlay" value="ID 중복 체크" style="background-color:#FFBC38 ; border-color:#F9DCA3; color:white"/>
			 </div>
			 </p>
			 <p align="center">비밀번호 <input type="password" name="pw" class="pw" id="password_1" placeholder="비밀번호를 입력해주세요"/></p>	   
			 <p align="center">비밀번호 재확인 <input type="password" name="pwer" class="pw" id="password_2" placeholder="비밀번호를 재입력해주세요" /></p>	   
			 <font id="checkPw" size ="2" align="center"></font>				
             <p align="center">이름   <input type="text" name="name" placeholder="이름을 입력해주세요"/></p>
        	 <p align="center">나이   <input type="text" name="age" placeholder="나이를 입력해주세요"/> </p>
      		 <P align="center">이메일  <input type="text" name="email" placeholder="ex)abc@naver.com"/> <input type="button" id="overemail" value="email 체크" style="background-color:#FFBC38 ; border-color:#F9DCA3; color:white"/> </P>
             <p align="center">성별 <input type="radio" name="gender" value="남"/>남자
                    <input type="radio" name="gender" value="여"/>여자</p>   
         	 <p align="center">비밀번호 질문 <select id="hint" name="hint">
					       <option value="1">선택하세요</option>
					       <option value="2">나의 출신 초등학교는?</option>
					       <option value="3">내가 좋아하는 캐릭터는?</option>
					       <option value="4">다시 태어나면 되고 싶은 것은?</option>
					       <option value="5">가장 좋아하는 색깔은?</option>
					       <option value="6">나의 출신 고향은?</option>
					      </select> </p>
					      
			<p align="center">비밀번호 정답 <input type="text" name="pwanswer" placeholder="정답을 입력해주세요"/></p>	
			<p align="center">닉네임 <input type="text" name="nickname" placeholder="닉네임을 입력해주세요"/> <input type="button" id="overnickname" value="nickname 체크" style="background-color:#FFBC38 ; border-color:#F9DCA3; color:white"/> </p>	      
			<p class="form-group" align="center"> 도로명 <input class="form-control" "id="streetAddr" placeholder="도로 주소" name="addr1" type="text" readonly="readonly" />
      				<button type="button" class="btn btn-default" onclick="execPostCode()" style="background-color:#FFBC38 ; border-color:#F9DCA3; color:white"><i class="fa fa-search"></i> 주소 찾기</button> </p>		      
			<p class="form-group" align="center"> 읍/면/동 <input class="form-control" id="userDetailAddr" placeholder="읍/면/동" name="addr2" type="text" readonly="readonly"> </p>		      
			<p class="form-group" align="center"> 상세 주소 <input class="form-control" placeholder="상세주소" name="addr3" id="detailAddr" type="text" /> </p>
			<input type="button" id="register" name="register" value="회원가입" />

					
<%-- 
     <table>
         <tr>
             <th>아이디</th>
             <th>
                 <input type="text" name="id" placeholder="아이디를 입력해주세요"/>
                 <input type="button" id="overlay" value="ID 중복 체크" style="background-color:#FFBC38 ; border-color:#F9DCA3; color:white"/>
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
          <input type="password" name="pwer" class="pw" id="password_2" placeholder="비밀번호를 재입력해주세요" />
          <font id="checkPw" size ="2"></font>
          </th>
       </tr>
       
         <tr>
             <th>이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
             <th>
                 <input type="text" name="name" placeholder="이름을 입력해주세요"/>
             </th>
         </tr>
         
         <tr>
             <th>나이</th>
             <th>
                 <input type="text" name="age" placeholder="나이를 입력해주세요"/>
             </th>
         </tr>
         
         <tr>
             <th>이메일</th>
             <th>
                 <input type="text" name="email" placeholder="ex)abc@naver.com"/>
                 <input type="button" id="overemail" value="email 체크" style="background-color:#FFBC38 ; border-color:#F9DCA3; color:white"/>
             </th>
         </tr>
        
         <tr>
             <th>성별</th>
             <th>
                 <input type="radio" name="gender" value="남"/>남자
                 <input type="radio" name="gender" value="여"/>여자
             </th>
         </tr>
         
         <tr>
         <th>비밀번호 질문</th>
         <th>
         <select id="hint" name="hint">
         <option value="1">선택하세요</option>
         <option value="2">나의 출신 초등학교는?</option>
         <option value="3">내가 좋아하는 캐릭터는?</option>
         <option value="4">다시 태어나면 되고 싶은 것은?</option>
         <option value="5">가장 좋아하는 색깔은?</option>
         <option value="6">나의 출신 고향은?</option>
      	 </select>
     	 <th>
     	 </tr>
      
        <tr>
             <th>비밀번호 정답</th>
             <th>
                 <input type="text" name="pwanswer" placeholder="정답을 입력해주세요"/>
             </th>
         </tr>
         
         <tr>
             <th>닉네임</th>
             <th>
                 <input type="text" name="nickname" placeholder="닉네임을 입력해주세요"/>
                 <input type="button" id="overnickname" value="nickname 체크" style="background-color:#FFBC38 ; border-color:#F9DCA3; color:white"/>
             </th>
         </tr>   
      
      <tr class="form-group">
      <th>도로명</th>
      <th>
       <input class="form-control" "id="streetAddr" placeholder="도로 주소" name="addr1" type="text" readonly="readonly" />
      <button type="button" class="btn btn-default" onclick="execPostCode()" style="background-color:#FFBC38 ; border-color:#F9DCA3; color:white"><i class="fa fa-search"></i> 주소 찾기</button>  
      </th>
      </tr>
            
      <tr class="form-group">      
      <th>읍/면/동</th>      
      <th>
      <input class="form-control" id="userDetailAddr" placeholder="읍/면/동" name="addr2" type="text" readonly="readonly">
      </th>
      </tr>
     
     
     
      <tr class="form-group">
      <th>상세 주소</th>
      <th>
      <input class="form-control" placeholder="상세주소" name="addr3" id="detailAddr" type="text" />
      </th>      
      </tr> 
         
                
        
         <tr>
             <th colspan="2">
                 <input type="button" id="register" name="register" value="회원가입"/>
             </th>
         </tr>
     </table>
     --%>
     
     
     
     
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


              
            


var overlayChk = false;
var overemailChk = false;
var overnicknameChk = false;


$('#register').on('click',function(){
   var $id = $('input[name="id"]');
   var $pw = $('input[name="pw"]');
   var $name = $('input[name="name"]');
   var $age = $('input[name="age"]');
   var $gender = $('input[name="gender"]:checked');
   var $email = $('input[name="email"]');
   var $pwer = $('input[name="pwer"]');
   var $nickname = $('input[name="nickname"]');
   var $hint = $('select[name="hint"]');
   var $pwanswer = $('input[name="pwanswer"]');
   var $addr1 = $('input[name="addr1"]');
   var $addr2 = $('input[name="addr2"]');
   var $addr3 = $('input[name="addr3"]');
  
   
   if(overlayChk&&overemailChk&&overnicknameChk){
         
      if($id.val() == ''){
         alert('아이디를 입력해 주세요!');
         $id.focus();
      }else if($pw.val() == ''){
         alert('비밀번호를 입력해 주세요');
         $pw.focus();
      }else if($pwer.val()==''){
         alert('비밀번호를 재확인해 주세요');
         $pwer.focus();      
      }else if($name.val()==''){
         alert('이름을 입력해 주세요');
         $name.focus();
      }else if($age.val()==''){
         alert('나이를 입력해 주세요');
         $age.focus();
      }else if($email.val()==''){
         alert('이메일을 입력해 주세요');
         $email.focus();
      }else if($gender.val() == null){
         alert('성별을 입력해 주세요');
         $gender.focus();
      }else if($hint.val()== ''){
         alert('질문을 선택해 주세요');
         $hint.focus();
      }else if($pwanswer.val()==''){
         alert('정답을 입력해 주세요');
         $pwanswer.focus();
      }else if($nickname.val()==''){
         alert('닉네임을 입력해 주세요');
         $nickname.focus();
      }else if($addr1.val()==''){
    	  alert('도로명주소를 입력해 주세요');
          $addr1.focus(); 
      }else if($addr2.val()==''){
         alert('지번주소를 입력해 주세요');
         $addr2.focus();
      }else if($addr3.val()==''){
         alert('상세주소를 입력해 주세요');
         $addr3.focus();
      } else{         
         var param = {};
         param.id = $id.val();
         param.pw = $pw.val();
         param.name = $name.val();
         param.pwer = $pwer.val();
         param.nickname = $nickname.val();
         param.hint = $hint.val();
         param.pwanswer = $pwanswer.val();
         param.addr1 = $addr1.val();
         param.addr2 = $addr2.val();
         param.addr3 = $addr3.val(); 
         param.age = $age.val();         
         param.gender = $gender.val();
         param.email = $email.val();                           
         console.log(param);
         
         
         
         var regex = new RegExp('[a-zA-Zㄱ-ㅎ가-힣]');
         var match = regex.test($age.val()); 
         console.log("match : "+match);
         if(match){
            alert('나이에는 숫자만 넣어 주세요');
            return false;
         }
                  
         
         var regex = new RegExp('^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$');
            var match = regex.test($email.val());
            if(!match){
               alert("이메일 형식으로 입력해주세요.")
               return false;
            }
            
            $.ajax({
            type:'post',
            url:'register',
            data:param,
            dataType:'JSON',
            success:function(data){
               console.log(data);
               if(data.success>0){
                  alert('회원가입에 성공 했습니다.');
                  location.href='/morae/login'; 
               }else{
                  alert('회원가입에 실패 했습니다.');
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

//아이디 중복체크
$('#overlay').on('click',function(){
   var id = $('input[name="id"]').val();
   console.log('id='+id);
   
   
   $.ajax({
      type:'get', 
      url:'overlay', 
      data:{'id':id}, 
      dataType:'JSON', 
      success:function(data){
         console.log(data);
         overlayChk = data.use;
         if(data.use){
            alert('사용 가능한 아이디 입니다.');
         }else{
            alert('이미 사용중인 아이디 입니다.');
            $('input[name="id"]').val('');
         }      
         
      },
      error:function(error){
         console.log(error);
      }, 
   });
   
   
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
         overnicknameChk = data.use2;
         if(data.use2){
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


//이메일 중복체크
$('#overemail').on('click',function(){
   var email = $('input[name="email"]').val();
   console.log('email='+email);
   
   
   $.ajax({
      type:'get', 
      url:'overemail', 
      data:{'email':email}, 
      dataType:'JSON', 
      success:function(data){
         console.log(data);
         overemailChk = data.use1;
         console.log(data.use1);
         if(data.use1){
            alert('사용 가능한 이메일 입니다.');
         }else{
            alert('이미 사용중인 이메일 입니다.');
            $('input[name="email"]').val('');
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

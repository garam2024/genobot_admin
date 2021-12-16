$(document).ready(function(){
   $('#check').click(function(){
      if($('#userid').val()==0){
         $('#result').text('아이디를 입력하세요');
         return;
      }
      query = {userid:$('#userid').val()}
      $.ajax({
         url:'ajax_test.jsp',
         type:'post',
         data: query
      }).done(function(data){
         obj = JSON.parse(data);
         
         if(obj.result == 'ok'){
            $('#result').text(obj.username + "," + obj.email);
         }else {
            $('#result').text("존재하지 않는 사용자입니다.");
         }
         
      });
   });
});
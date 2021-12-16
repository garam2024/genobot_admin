let index = 0;

function updateData(){
    $.ajax({

      url: "",
      type:"post",
      cache : false,
      success: function(arr){ 
    console.log(arr)
	//innerHtml + = `<tr><td></td><td></td><td></td><td><button onclick="call_check(e)">처리완료</button></td></tr>`
      }
    });
// 2초 단위로 갱신 처리
}



setInterval(updateData,3000)







class Person {
	constructor (boardnum,user_name,phone_num,comment,call_status,reg_date,ck_date){
	console.log('constructor');
	this.boardnum =boardnum;
	this.user_name =user_name; 
	this.phone_num =phone_num; 
	this.comment =comment; 
	this.call_status =call_status; 
	this.reg_date =reg_date; 
	this.ck_date =ck_date; 
	}
}
let tablearr = [];

var tablelist = {
boardnum : "",
user_name :"",
phone_num : "",
comment : "",
call_status : "",
reg_date :"",
ck_date:""
}

let all_table_tr = document.getElementById("datable").querySelectorAll('tr')
//테이블 tr개수 == tablearr.length
console.log(all_table_tr)
for (var j=0; j<all_table_tr.length; j++){
for (var i=0; i<all_table_tr[j].children.length; i++){
tablelist[Object.keys(tablelist)[i]] = all_table_tr[j].children[i].innerText;
}
console.log(tablelist)
tablearr.push(new Person(tablelist.boardnum,tablelist.user_name,tablelist.phone_num,tablelist.comment,tablelist.call_status,tablelist.reg_date,tablelist.ck_date));
}

$(function (){
let container = $('#pagination');
container.pagination({
dataSource : tablearr,
callback : function (data, pagination){

var dataHtml ="";
                $.each(data, function (index, item) {
			
				
					dataHtml += '<tr>'
					for (var i of Object.values(item)){
				 dataHtml += '<td>' + i+'</td>';
				}
					dataHtml += '</tr>'
		
                   
                });

 	

                $("#inputdata").html(dataHtml);


}

})

})






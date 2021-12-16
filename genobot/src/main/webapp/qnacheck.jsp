<%@page import="genobot.qnaVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="genobot.qnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<META HTTP-EQUIV="refresh" CONTENT="15">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
	border: 1px solid black;
	border-collapse : collapse;
	width:100%;
	}
	th, td {
	border: 1px solid black;
	}
</style>
</head>
<body>
<div id="chatbotfiled">
	<table>
		<thead>
			<tr>
				<th>성함</th>
				<th>문의내용</th>
				<th>전화번호</th>
				<th>연락완료</th>
			</tr>
		</thead>
		<% 
		try {
		
	qnaDAO dao = new qnaDAO();
	ArrayList<qnaVO> arr = dao.select();
				
	for(int i=0;i<arr.size();i++){
		%>
		<tbody>
		<tr>	
			<td><%=arr.get(i).getUser_name()%></td>
			<td><%=arr.get(i).getComment()%></td>
			<td><%=arr.get(i).getPhone_num() %></td>			
			<td><%=arr.get(i).getCall_state()%><button>처리완료</button></td>
		</tr>
								
<%
	}
} catch (Exception e) {
e.printStackTrace();
}
%>
		</tbody>
	</table>
</div>
		
		
<script>
let btnsss = document.querySelectorAll('button')
for (var i of btnsss){
i.addEventListener('click',function(e){
const checktext = document.createTextNode('V');
e.target.parentNode.replaceChild(checktext,e.target)
})
}

</script>
</body>
</html>
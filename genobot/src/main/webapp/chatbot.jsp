<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<div id="chatbotfiled">
<form action = "InquireCon.do" method = "post">
    <input id="user_name" name = "user_name" type="text" placeholder="이름">
    <input id="comment" name = "comment" type="textarea" placeholder="문의내용">
    <input type="tel" id="phone_num" name="phone_num" placeholder="전화번호" 
    pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
    required>
    <button type="submit">보내기</button>
</form>
</div>
 <script src="jeno.js"></script>
</body>
</html>
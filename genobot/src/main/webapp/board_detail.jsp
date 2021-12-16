<!doctype html>
<%@page import="genobot.qnaVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="genobot.qnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.88.1">
  <title>Board Template · 상세</title>


  <!-- Bootstrap core CSS -->
  <link href="./assets/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./assets/css/contents.css" rel="stylesheet">
</head>

<body>
  <nav class="navbar navbar-dark bg-secondary flex-md-nowrap p-0 shadow header-nav">
    <div class="navbar-brand mr-0 px-3">
      <a href="#" class="logo-prd"><span class="sr-only">클리노믹스</span></a>
    </div>

    <ul class="navbar-nav px-4">
      <li class="nav-item name">
        <span>사용자명 : 홍길동</span>
      </li>
      <li class="nav-item">
        <a class="btn btn-dark btn-sm" href="#">로그아웃</a>
      </li>
    </ul>
  </nav>

  <div class="container-fluid">
    <div class="row">
      <!-- navigation -->
      <!-- <nav id="sidebarMenu" class="bg-light sidebar collapse show">
        <div class="sidebar-sticky pt-4">
          <h1 class="h5 title">상담 요청 정보 관리</h1>
          <ul class="nav flex-column">
            <li class="nav-item">
              <a class="nav-link on" href="#">상담 요청 정보</a>
              <ul class="sub-menu">
                <li class="nav-item">
                  <a class="nav-link on" href="#">상담 요청 목록</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">상담 완료 목록</a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </nav>  -->
      <!-- // navigation -->

      <main role="main" class="main px-4">
        <div class="container">
          <h1 class="h2 pt-4 pb-3">수정 화면 타이틀</h1>
		<%		
		qnaDAO dao = new qnaDAO();
		qnaVO result = (qnaVO)session.getAttribute("QnaOne");	
		%>
          <!-- bodyContent -->
          <form class="needs-validation" method ="post" novalidate>
            <div class="row">
              <div class="form-group col-6">
                <label for="field-id">번호</label>
                <input type="text" class="form-control" id="field-id" name="boardnum" placeholder="" value="<%=result.getBoardnum() %>" readonly>
                <!-- alert feedback -->
                <div class="invalid-feedback">
                  Valid first name is required.
                </div>
              </div>
              <div class="form-group col-6">
                <label for="field-id">처리상태</label>
                <input type="text" class="form-control" id="field-id" name="call_state" placeholder="" value="<%=result.getCall_state() %>" readonly>
                <!-- alert feedback -->
                <div class="invalid-feedback">
                  Valid first name is required.
                </div>
              </div>
            </div>
            <div class="row">
              <div class="form-group col-6">
                <label for="field-applicant">신청인</label>
                <input type="text" class="form-control" id="field-applicant" name="user_name" placeholder="" value="<%=result.getUser_name() %>" readonly>
                <!-- alert feedback -->
                <div class="invalid-feedback">
                  Valid first name is required.
                </div>
              </div>
              <div class="form-group col-6">
                <label for="field-phone">연락처</label>
                <input type="text" class="form-control" id="field-phone" name="phone_num" placeholder="" value="<%=result.getPhone_num() %>" readonly>
                <!-- alert feedback -->
                <div class="invalid-feedback">
                  Valid last name is required.
                </div>
              </div>
            </div>
            
             <div class="row">
              <div class="form-group col-6">
                <label for="field-time">문의시간</label>
                <input type="text" class="form-control" id="field-time" name="reg_date" value="<%=result.getReg_date() %>" readonly>
              </div>
              <div class="form-group col-6">
                <label for="field-statis">완료시간</label>
                <% if(result.getCk_date() == null){ %>              
                	 <input type="text" class="form-control" id="field-status" name="ck_date" value="-" readonly>
                <% }else { %>
                	<input type="text" class="form-control" id="field-status" name="ck_date" value="<%=result.getCk_date() %>" readonly>
                <% } %>
              </div>
            </div>
            <div class="form-group">
              <label for="field-textarea">상담 요청 내용</label>
              <textarea class="form-control" id="field-textarea" name="comment" rows="4" placeholder=""><%=result.getComment() %></textarea>              
              <!-- alert feedback -->
              <div class="invalid-feedback">
                Valid last name is required.  
              </div>
            </div>
            <div class="form-group">
              <label for="field-textarea">상담 처리 결과</label>
              <textarea class="form-control" id="field-textarea" name="call_result" rows="4" placeholder="">
              <%if(result.getCall_result() == null) { %>
              -
              <%}else{ %>
              <%=result.getCall_result() %>
              <%} %>
              </textarea>
              
              <!-- alert feedback -->
              <div class="invalid-feedback">
                Valid last name is required.  
              </div>
            </div>                

            <!-- 버튼 영역 
            <div class="d-flex justify-content-between">
              <div>
                <input type="submit" class="btn btn-danger" value="상담하기" formaction="updateCon.do" > 
              <div>
                <input type="submit" class="btn btn-primary ml-2" value = "상담완료" formaction = "updateCon.do">
                <button type="button" class="btn btn-secondary ml-2" onclick="location.href='board_list.jsp' ">목록으로</button>
              </div>-->
              
            <!-- 버튼 영역 -->
            <div class="d-flex justify-content-between">
              <div>
                 <input type="submit" class="btn btn-danger" value="상담하기" formaction="updateCon.do" > 
              </div>
              <div>
                <input type="submit" class="btn btn-primary ml-2" value = "상담완료" formaction = "updateCon.do">
                <a href="board_list.jsp" class="btn btn-secondary ml-2">목록으로</a>
              </div>
            </div>
            
          </form>

          <!-- //bodyContent -->
        </div>
      </main>
    </div>
  </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="./assets/js/vendor/jquery-3.6.0.min.js"><\/script>')</script>
  <script src="./assets/js/bootstrap.bundle.min.js"></script>

</body>

</html>
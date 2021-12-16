<%@page import="genobot.qnaVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="genobot.qnaDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.88.1">
  <title>Board Template · 목록</title>
  <!-- pagination 관련 js, css -->
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="./assets/js/pagination.js"></script>
  	<link href="./assets/css/pagination.css" rel="stylesheet">

  <!-- Bootstrap core CSS -->
  <link href="./assets/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./assets/css/contents.css" rel="stylesheet">

  <!-- chart -->
  <script src="./assets/js/chart.js"></script>

</head>

<body>
  <nav class="navbar navbar-dark bg-secondary flex-md-nowrap p-0 shadow header-nav">
    <div class="container">
      <div class="navbar-brand">
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
    </div>
  </nav>

  <div class="container-fluid">
    <div class="row">
      <main role="main" class="main px-4">
        <div class="container">
          <h1 class="h2 pt-4 pb-3">수정 화면 목록 타이틀</h1>
          <!-- bodyContent -->
          <div class="chart-holder">
            <div class="lft-chart">
              <canvas id="first-chart"></canvas>
              <script>
                const DATA_COUNT = 5;
                const NUMBER_CFG = {
                  count: DATA_COUNT,
                  min: 0,
                  max: 100
                };

                const dataChartFirst = {
                  labels: [
                    '상담대기',
                    '상담중',
                    '상담완료'
                  ],
                  datasets: [{
                    label: '상담처리상태',
                    data: [300, 50, 100],
                    backgroundColor: [
                      'rgb(255, 99, 132)',
                      'rgb(54, 162, 235)',
                      'rgb(255, 205, 86)'
                    ],
                    hoverOffset: 4
                  }]
                };

                const configChartFirst = {
                  type: 'pie',
                  data: dataChartFirst,
                  options: {
                    responsive: true,
                    plugins: {
                      legend: {
                        labels: {
                          font: {
                            size: 10,
                            color: '#404040'
                          },
                        },
                        position: 'bottom',
                      },
                      title: {
                        display: true,
                        color: '#404040',
                        text: '상담처리상태'
                      }
                    }
                  },
                };

                const ctxFirst = document.getElementById('first-chart').getContext('2d');
                const firstChart = new Chart(ctxFirst, configChartFirst);
              </script>
            </div>
            <!-- 라인형 차트 -->
            <div class="rgt-chart">
              <canvas id="second-chart"></canvas>
              <script>
                const dataChartSecond = {
                  labels: [1, 2, 3, 4, 5, 6],
                  datasets: [{
                    data: [65, 59, 80, 81, 56, 55, 40],
                    fill: false,
                    borderColor: '#00a69c',
                    borderWidth: 1.5,
                  }]
                };

                const configChartSecond = {
                  type: 'line',
                  data: dataChartSecond,
                  options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    elements:{
                      point:{
                        backgroundColor:'#00a69c',
                        radius:0,
                        hitRadius:1,
                        hoverWidth:1,
                        hoverBorderWidth: 1,
                      }
                    },
                    plugins: {
                      legend: {
                        display: false,
                      },
                      title: {
                        display: true,
                        color: '#404040',
                        text: '문의건수'
                      }
                    }
                  },
                };

                const ctxSecond = document.getElementById('second-chart').getContext('2d');
                const secondChart = new Chart(ctxSecond, configChartSecond);
              </script>
            </div>
          </div>
          <div class="d-flex justify-content-between mt-4 mb-2">
            <div class="btn-wrap btn-status">
            <form action="callState.jsp" method="post">
              <button type="submit" name = "state" value="전체" class="btn btn-secondary btn-sm selected">전체</button>
              <button type="submit" name ="state" value="상담대기" class="btn btn-secondary btn-sm">상담대기</button>
              <button type="submit" name = "state" value="상담중" class="btn btn-secondary btn-sm">상담중</button>
              <button type="submit" name = "state" value="상담완료" class="btn btn-secondary btn-sm">상담완료</button>
              </form>
            </div>
            <!-- 검색 -->
            <div class="search-wrap">
              <div class="input-group">
                <select class="custom-select custom-select-sm" id="select-search">
                  <option selected>선택</option>
                  <option value="1">통합검색</option>
                  <option value="2">신청인</option>
                  <option value="3">연락처</option>
                </select>
                <input type="text" class="form-control form-control-sm" placeholder="검색어를 입력해주세요">
                <div class="input-group-append">
                  <button type="button" class="btn btn-secondary btn-sm" id="inputGroupFileAddon04">검색</button>
                </div>
              </div>
            </div>
          </div>


          <!-- table -->
          <div class="table-responsive">
            <table class="table table-striped tbl-board">
              <thead>
                <tr>
                  <th class="text-center" style="width:80px">번호</th>
                  <th style="width:15%">신청인</th>
                  <th style="width:15%">연락처</th>
                  <th style="">상담 요청 내용</th>
                  <th style="width:15%">처리상태</th>
                  <th style="width:15%">문의시간</th>
                  <th style="width:15%">완료시간</th>
                </tr>
              </thead>
              <tbody id="datable" >
                 <% 

				try {
				
			qnaDAO dao = new qnaDAO();
			String state = (String)request.getAttribute("state");
			System.out.print("callstate?"+state);
			ArrayList<qnaVO> arr = dao.stateSelect(state);			
			for(int i=0;i<arr.size();i++){
			%>
                <tr onclick="location.href='detailCon.do?boardnum=<%=arr.get(i).getBoardnum()%>'">
                  <td class="text-center"><%=arr.get(i).getBoardnum()%></td>
                  <td><%=arr.get(i).getUser_name()%></td>
				  <td><%=arr.get(i).getPhone_num() %></td>
                  <td><%=arr.get(i).getComment()%></td>
                  <td><%=arr.get(i).getCall_state()%></td>
				  <td><%=arr.get(i).getReg_date()%></td>
				  <%if(arr.get(i).getCk_date() == null){ %>
				  	<td>-</td>
				  <%}else{ %>	
				  	<td><%=arr.get(i).getCk_date()%></td>
				  <%} %>
                </tr>
                
                <%
						}
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>  
               
              </tbody>
               <tbody id="inputdata">
               </tbody>
            </table>
          </div>
          <!-- paging -->
          <div id="pagination"></div>
          <!-- <nav aria-label="Page navigation">
            <ul class="pagination justify-content-end">
              <li class="page-item disabled">
                <a class="page-link">이전</a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item active"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#">다음</a>
              </li>
            </ul>
          </nav> -->
          <!-- //bodyContent -->
        </div>
      </main>
    </div>
  </div>

  <!-- lib -->
 <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <!--   <script>
    window.jQuery || document.write('<script src="./assets/js/vendor/jquery-3.6.0.min.js"><\/script>')
  </script>-->
  <script src="./assets/js/bootstrap.bundle.min.js"></script>
  <script src = "./assets/js/paginationControl.js"></script>

</body>

</html>
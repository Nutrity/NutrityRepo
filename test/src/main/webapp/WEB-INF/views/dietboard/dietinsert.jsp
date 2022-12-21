<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/datepicker/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/datepicker/css/rome.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/datepicker/css/bootstrap.min.css">
    <!-- Style -->
    <link rel="stylesheet" href="/datepicker/css/style.css">
<script>
	function foodFinder() {
		window.open("selectfood", "", "width=700 height=400")
	}
	
	var fdlistFoodcodes = []
	function getReturnObj(fdlist) {
		const listHeadr = [ '음식 이름', '카테고리', '칼로리', '탄수화물', '단백질', '지방', '당',
				'나트륨', '트랜스<br>지방', '칼슘', '비타민C', '철분' ]
		var str = '';
		str += "<div class='container'>";
		str += "<table data-aos='fade-up' class='table table-hover'>"
		str += "<thead>"
		str += "<tr>"
		str += "<th class='col-3'>"
		str += "</th>"
		for (let i = 0; i < 11; i++) {
			str += "<th class='col'></th>"
		}
		str += "</tr>"
		str += "</thead>"
		str += "<tbody data-aos='fade-up'>";
		$.each(JSON.parse(fdlist), function(key, val) {
			str += "<tr>";
			str += "<td class='col-3'>" + Object.values(val)[1] + '</td> ';
			for (let i = 2; i < 13; i++) {
				str += "<td class='col'>" + Object.values(val)[i] + "</td>"
			}
			str += '</tr>'; //row
		});
		str += '</tbody>'; //slide-up
		str += '</table>'; //list-text-content

		$("#resultFoodList").html(str);

		let j = 0;
		$('tr > th').each(function(index, item) {
			if (j < listHeadr.length) {
				$(this).append(listHeadr[j])
				j++
			} else {
				j = 0;
			}
		})
		var JSONfdlist = JSON.parse(fdlist)

		$.each(JSONfdlist, function(key, val) {
			fdlistFoodcodes.push(Object.values(val)[0])
		});

	}
	console.log(fdlistFoodcodes)
</script>

<main id="main">
	<div class="breadcrumbs">
		<div class="page-header d-flex align-items-center"
			style="background-image: url('../img/month-cal-bg-1.jpg');">
			<div class="container position-relative">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-6 text-center">
						<h2>Insert</h2>
						<p>안티티 티티 프레자일 프레자일 안티티 티티 프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티
							프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티 프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티
							프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티 프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티
							프레자일 후!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<sec:authorize access="isAuthenticated()">
		<div>
			<input type="hidden" id="num" value="${p.user.num}">
		</div>
	</sec:authorize>
  <div class="content">
    <div class="container text-left">
      <div class="row">
        <div class="col-md-10 text-center">
          <input type="text" class="form-control w-25 mx-auto mb-3" id="result" placeholder="Select date">
          <form class="row">
            <div class="col-md-12">
              <div id="inline_cal"></div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

	<div>
		<label>title</label> <input type="text" id="title">
	</div>

	<div>
		<label>foodlist</label>
		<div id="resultFoodList"></div>
		<button onclick="foodFinder()">검색</button>
	</div>

	<div>
		<label>memo</label>
		<textarea rows="5" cols="40" id="memo"></textarea>
	</div>

	<button type="button" id="dietInsertBtn">저장</button>    
	<script src="/datepicker/js/popper.min.js"></script>
    <script src="/datepicker/js/bootstrap.min.js"></script>
    <script src="/datepicker/js/rome.js"></script>
    <script src="/datepicker/js/main.js"></script>
</main>

    
    
<%@include file="../include/footer.jsp"%>
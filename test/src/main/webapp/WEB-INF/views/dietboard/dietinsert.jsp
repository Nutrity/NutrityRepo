<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<script>
	function foodFinder() {
		window.open("selectfood", "", "width=700 height=400")
	}
	
	var fdlistFoodcodes = []
	function getReturnObj(fdlist) {
		const listHeadr = [ '음식 이름', '카테고리', '칼로리(kcal)', '탄수화물(g)', '단백질(g)', '지방(g)', '당(g)',
				'나트륨(mg)', '트랜스<br>지방(g)', '칼슘(mg)', '비타민C(mg)', '철분(mg)' ]
		var str = '';
		str += "<div class='container'>";
		str += "<table data-aos='fade-up' class='table table-hover'>"
		str += "<thead>"
		str += "<tr>"
		str += "<th class='col-2'>"
		str += "</th>"
		for (let i = 0; i < 11; i++) {
			str += "<th class='col'></th>"
		}
		str += "</tr>"
		str += "</thead>"
		str += "<tbody data-aos='fade-up'>";
		$.each(JSON.parse(fdlist), function(key, val) {
			str += "<tr>";
			str += "<td class='col-2'>" + Object.values(val)[1] + '</td> ';
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
</script>

<main id="main">
	<div class="breadcrumbs">
		<div class="page-header d-flex align-items-center"
			style="background-image: url('../img/month-cal-bg-1.jpg');">
			<div class="container position-relative">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-6 text-center">
						<h2>식단 등록</h2>
						<p>식단 등록 창</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section>
	<sec:authorize access="isAuthenticated()">
		<div>
			<input type="hidden" id="num" value="${p.user.num}">
		</div>
	</sec:authorize>
	
	<div class="container">
	<div>
	<label>날짜</label> 
	<input type="date" class="form-control" id="regdate" placeholder="날짜를 선택해주세요"><br/>
	</div>
	
	<div>
		<label>제목</label> 
		<input type="text" class="form-control" id="title"><br/>
	</div>
	
	<div id = "FormSignin">
		<h3>음식 리스트</h3>
		<div id="resultFoodList"></div>
		<button class="btn btn-secondary" style="float: right;" onclick="foodFinder()">검색</button><br/>
	</div>	
<br><br><br>
	<div>
		<label>메모</label>
		<textarea class="form-control" rows="5" cols="40" id="memo"></textarea><br/>
	</div>
	

	<button type="button" class="btn btn-primary" style="float: right;" id="dietInsertBtn">저장</button>
	</div> 
	</section>   
</main>
    
<%@include file="../include/footer.jsp"%>
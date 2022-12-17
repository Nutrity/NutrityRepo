<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<script>
	function foodFinder() {
		window.open("selectfood", "", "width=700 height=400");
	}

	function getReturnObj(fdlist) {
		const listHeadr = [ '음식 이름', '카테고리', '칼로리', '탄수화물', '단백질', '지방', '당',
				'나트륨', '트랜스<br>지방', '칼슘', '비타민C', '철분' ]
		var str = '';
		str += "<div class='container'>";
		str += "<div data-aos='fade-up' class='list-text-header row'>"
		str += "<div class='col-3'></div>"
		for (let i = 0; i < 11; i++) {
			str += "<div class='col'></div>"
		}
		str += "</div>" //list-text-header row
		str += "<div data-aos='fade-up' class='list-text-content'>";
		str += "<div class='slide-up'>";
		$.each(fdlist, function(key, val) {
			str += "<div class='row'>";
			str += "<div class='col-3'>" + Object.values(val)[1] + '</div> ';
			for (let i = 2; i < 13; i++) {
				str += "<div class='col'>" + Object.values(val)[i] + "</div>"
			}
			str += '</div>'; //row
		});
		str += '</div>'; //slide-up
		str += '</div>'; //list-text-content
		$("#resultFoodList").html(str);
	}
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


	<div>
		<input type="text" id="foodname">
	</div>

	<div>
		<label>title</label> <input type="text" id="foodname">
	</div>

	<div>
		<label>foodlist</label>
		<div id="resultFoodList"></div>
		<button onclick="foodFinder()">검색</button>
	</div>

	<div>
		<label>memo</label>
		<textarea rows="5" cols="40"></textarea>
	</div>
</main>

<%@include file="../include/footer.jsp"%>
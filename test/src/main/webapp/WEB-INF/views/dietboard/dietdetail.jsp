<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	
	var kcal =0; //3
	var car = 0;//4
	var protein = 0;//5
	var fat = 0;//6
	var sugar = 0;//7
	var sodium = 0;//8
	
	var s_kcal =0; 
	var s_car = 0;
	var s_protein = 0;
	var s_fat = 0;
	var s_sugar = 0;
	var s_sodium = 0;
	
	$.ajax({
		type:'get',
		url :'/board/nGraph/${p.user.gender}',
	})//ajax
.done(function(resp){
	console.log("suggest : " + JSON.stringify(resp))
	s_kcal += Object.values(resp)[2]
	s_protein += Object.values(resp)[3]
	s_fat+= Object.values(resp)[4]
	s_car+= Object.values(resp)[5]
	s_sugar+= Object.values(resp)[6]
	s_sodium+= Object.values(resp)[10]
	
	
	
})
	console.log("kcal : " + s_kcal)
	
	$.ajax({
		type:'get',
		url : '/board/selectfood/'+$("#bnum").val(),
	})//ajax
	.done(function(resp){
		console.log(resp)
		const listHeadr = ['음식 이름', '카테고리', '칼로리', '탄수화물', '단백질', '지방', '당',
			'나트륨', '트랜스<br>지방', '칼슘', '비타민C', '철분']
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
		$.each(resp, function(key, val) {
		str += "<tr>";
			str += "<td class='col-3'>" + Object.values(val)[1] + '</td> ';
			for (let i = 2; i < 13; i++) {
				str += "<td class='col'>" + Object.values(val)[i] + "</td>"
			}
		});
		str += '</tr>'; //row
		str += '</tbody>'; //slide-up
		str += '</table>'; //list-text-content
		
		$("#selectedfoods").html(str);

		let j = 0;
		$('tr > th').each(function(index, item) {
			if (j < listHeadr.length) {
				$(this).append(listHeadr[j])
				j++
			} else {
				j = 0;
			}//if
		});//tr,th/each
		
			$.each(resp, function(key, val){
				for(let i=3; i<9; i++){
				switch(i){
				case 3 : kcal += Object.values(val)[i];
				case 4 : car += Object.values(val)[i];
				case 5 : protein += Object.values(val)[i];
				case 6 : fat += Object.values(val)[i];
				case 7 : sugar += Object.values(val)[i];
				default : sodium += Object.values(val)[i];
				break;
				}//switch
				}//for		
			})//each
		})//done

		
});//document


	
</script>




<main id="main">
	<div class="breadcrumbs">
		<div class="page-header d-flex align-items-center"
			style="background-image: url('/img/month-cal-bg-1.jpg');">
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
		<input type="hidden" value="${board.bnum}" id="bnum">
	</div>
	<div></div>
	<label>제목</label> <input type="text" value="${board.title}" id="title">
	<br> <label>작성일</label> <input type="text"
		value="${board.regdate}" id="regdate"><br> <label>메모</label>
	<textarea rows="5" cols="50" id="memo">${board.memo}</textarea>
	<br> <label>음식 리스트</label><br>
	<div id="selectedfoods"></div>


	<label>영양 그래프</label>
	<div class="progress">
		<div class="progress-bar" role="progressbar" aria-valuenow="100"
			aria-valuemin="0" aria-valuemax="" id="kcal"></div>
	</div>


</main>



<%@include file="../include/footer.jsp"%>
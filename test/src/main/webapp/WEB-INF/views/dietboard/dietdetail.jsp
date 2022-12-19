<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	
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
			
		});//done
		

	});//document
});
		
	
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
	<input type="text" value="${board.title}" id="title"> <input
		type="text" value="${board.regdate}" id="regdate">
	<textarea rows="5" cols="50" id="memo">${board.memo}</textarea>
	<textarea rows="5" cols="50" id="foodcode">${board.foodcode}</textarea>
	<div id="selectedfoods"></div>

</main>



<%@include file="../include/footer.jsp"%>
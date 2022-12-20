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
	
	var s_kcal =0; //2
	var s_protein = 0; //3
	var s_fat = 0; //4
	var s_car = 0; //5
	var s_sugar = 0; //6
	var s_sodium = 0; //10
	
	$.ajax({
		type:'get',
		url :'/board/nGraph/${p.user.gender}',
	})//ajax
.done(function(resp){
	
	var	str = "<label for='kcal'>칼로리(g)</label>"
		str += "<div class='progress' id='kcal'>";
		str += "<div class='progress-bar' role='progressbar' aria-valuenow='1' aria-valuemin='0' aria-valuemax='"+Object.values(resp)[2]+"' ></div>";
	str += "</div>";

	str += "<label for='car'>탄수화물(g)</label>"
	str += "<div class='progress' id='car'>";
		str += "<div class='progress-bar' role='progressbar' aria-valuenow='2' aria-valuemin='0' aria-valuemax='"+Object.values(resp)[5]+"' ></div>";
	str += "</div>";

	str += "<label for='protein'>단백질(g)</label>"
	str += "<div class='progress' id='protein'>";
		str += "<div class='progress-bar' role='progressbar' aria-valuenow='3' aria-valuemin='0' aria-valuemax='"+Object.values(resp)[3]+"'></div>";
	str += "</div>";

	str += "<label for='fat'>지방(g)</label>"
	str += "<div class='progress' id='fat'>";
		str += "<div class='progress-bar' role='progressbar' aria-valuenow='4' aria-valuemin='0' aria-valuemax='"+Object.values(resp)[4]+"'></div>";
	str += "</div>";

	str += "<label for='sugar'>당(g)</label>"
	str += "<div class='progress' id='sugar'>";
		str += "<div class='progress-bar' role='progressbar' aria-valuenow='5' aria-valuemin='0' aria-valuemax='"+Object.values(resp)[6]+"'></div>";
	str += "</div>";

	str += "<label for='sodium'>나트륨(mg)</label>"
	str += "<div class='progress' id='sodium'>";
		str += "<div class='progress-bar' role='progressbar' aria-valuenow='6' aria-valuemin='0' aria-valuemax='"+Object.values(resp)[10]+"'></div>";
	str += "</div>";
	
	$("#nutrents").html(str);
	
})//done
	
	$.ajax({
		type:'get',
		url : '/board/selectfood/'+$("#bnum").val(),
	})//ajax
	.done(function(resp){
		console.log(resp)
		
		const listHeadr = ['음식 이름', '카테고리', '칼로리(kcal)', '탄수화물(g)', '단백질(g)', '지방(g)', '당(g)',
			'나트륨(mg)', '트랜스<br>지방(g)', '칼슘(mg)', '비타민C(mg)', '철분(mg)']
		
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
							break;
						case 4 : car += Object.values(val)[i];
							break;
						case 5 : protein += Object.values(val)[i];
							break;
						case 6 : fat += Object.values(val)[i];
							break;
						case 7 : sugar += Object.values(val)[i];
							break;
						default : sodium += Object.values(val)[i];
							break;
					}//switch
				}//for		
			})//each
			
			$("#kcal > .progress-bar").attr("aria-valuenow", kcal);
			$("#car > .progress-bar").attr("aria-valuenow", car);
			$("#protein > .progress-bar").attr("aria-valuenow", protein);
			$("#fat > .progress-bar").attr("aria-valuenow", fat);
			$("#sugar > .progress-bar").attr("aria-valuenow", sugar);
			$("#sodium > .progress-bar").attr("aria-valuenow", sodium);
		
			let kcalwidth = Math.round($("#kcal > .progress-bar").attr("aria-valuenow") / $("#kcal > .progress-bar").attr("aria-valuemax") * 100) + "%"
			let carwidth = Math.round($("#car > .progress-bar").attr("aria-valuenow") / $("#car > .progress-bar").attr("aria-valuemax") * 100) + "%"
			let proteinwidth = Math.round($("#protein > .progress-bar").attr("aria-valuenow") / $("#protein > .progress-bar").attr("aria-valuemax") * 100) + "%"
			let fatwidth = Math.round($("#fat > .progress-bar").attr("aria-valuenow") / $("#fat > .progress-bar").attr("aria-valuemax") * 100) + "%"
			let sugarwidth = Math.round($("#sugar > .progress-bar").attr("aria-valuenow") / $("#sugar > .progress-bar").attr("aria-valuemax") * 100) + "%"
			let sodiumwidth = Math.round($("#sodium > .progress-bar").attr("aria-valuenow") / $("#sodium > .progress-bar").attr("aria-valuemax") * 100) + "%"
			
			$("#kcal > .progress-bar").css("width", kcalwidth);
			$("#car > .progress-bar").css("width", carwidth);
			$("#protein > .progress-bar").css("width", proteinwidth);
			$("#fat > .progress-bar").css("width", fatwidth);
			$("#sugar > .progress-bar").css("width", sugarwidth);
			$("#sodium > .progress-bar").css("width", sodiumwidth);
		})//done
		
});//document

function foodFinder() {
	window.open("/board/selectfood", "", "width=700 height=400");
}
var fdlistFoodcodes = []
function getReturnObj(fdlist) {
	var str = '';
	str += "<div class='container'>";
	str += "<table data-aos='fade-up' class='table table-hover'>"
	str += "<thead>"
	str += "<tr>"
	str += "<th class='col-3'>수정할 식단</th>"
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

	var JSONfdlist = JSON.parse(fdlist)
	
	$.each(JSONfdlist, function(key, val) {
		fdlistFoodcodes.push(Object.values(val)[0])
	});

}
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
	<br> <label>작성일</label>
	 <input type="text"	value="${board.regdate}" id="regdate"><br> <label>메모</label>
	<textarea rows="5" cols="50" id="memo">${board.memo}</textarea>
	<br> <label>음식 리스트</label><br>
	<div id="selectedfoods"></div>
	
	<div>
		<div id="resultFoodList"></div>
		<button onclick="foodFinder()">검색</button>
	</div>

	<label for="nutrents">영양 그래프</label>
	<div id="nutrents">
	</div>
	
	<div>
	<input type="button" id="dietUpdateBtn" value="수정">
	<input type="button" id="boardDeleteBtn" value="삭제">
	</div>
	
	<!-- 댓글 -->
	<div align = "center">
	<textarea rows = "3" cols = "50" id = "msg"></textarea>
	<button type = "button" class = "btn btn-secondary btn-sm" id = "comment">댓글쓰기</button>
	</div>
	<div id = "ResultComment"></div>
<script>
var init = function(){
	$.ajax({
		type : "get",
		url : "/comment/list/"+$("#bnum").val(),
	})
	.done(function(resp){
		var str = "<table class = 'table table-hover'>"
		$.each(resp, function(key, val){
			str += "<tr>"
			str += "<td>" + val.member.username + "</td>"
			str += "<td>" + val.content + "</td>"
			str += "<td>" + val.c_regdate + "</td>"
			str +="</tr>"
		})
		str +="</table>"
		$("#ResultComment").html(str)
	})	
}
$("#boardDeleteBtn").click(function(){
	$.ajax({
		type:"delete",
		url:"/board/delete/"+$("#bnum").val()
	})
	.done(function(resp){
		alert("삭제 완료")
		location.href='/board/list/'+${p.user.num}
	})
	
})


$("#dietUpdateBtn").click(function(){
	
	var data = {
			title: $("#title").val(),
			memo: $("#memo").val(),
			foodcode: fdlistFoodcodes
		}//data 
		
		console.log(JSON.stringify(data))
		$.ajax({
			type: "put",
			url: "/board/update/"+$("#bnum").val(),
			data: JSON.stringify(data),
			contentType: "application/json;charset=utf-8"
		})//ajax
		.done(function(resp) {
			if(resp=="success"){
				location.href = '/board/list/'+${p.user.num}
				} 
		})
	
});//function

$("#comment").click(function(){
	if($("#msg").val() == ""){
		alert("댓글을 입력해주세요.")
		return false;
	}
	data = {
			"content" : $("#msg").val(),
	}
	
	$.ajax({
		type : "post",
		url : "/comment/insert/"+$("#bnum").val(),
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data)
	})
	.done(function(resp){
		if(resp == "success"){
			alert("댓글이 삽입되었습니다.")
			init();
		}		
	})
	.fail(function(){
		alert("댓글이 삽입되지 않았습니다.")
	})
	
})
init();
</script>
</main>




<%@include file="../include/footer.jsp"%>
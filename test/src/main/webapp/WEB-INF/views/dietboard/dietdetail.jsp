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
		str += "<div data-aos='fade-right' class='progress-bar' role='progressbar' aria-valuenow='1' aria-valuemin='0' aria-valuemax='"+Object.values(resp)[2]+"' ></div>";
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
		const listHeadr = ['음식 이름', '카테고리', '칼로리(kcal)', '탄수화물(g)', '단백질(g)', '지방(g)', '당(g)',
			'나트륨(mg)', '트랜스<br>지방(g)', '칼슘(mg)', '비타민C(mg)', '철분(mg)']
		
		var str = '';
		str += "<div class='container'>";
		str += "<table data-aos='fade-up' class='table table-hover'>"
		str += "<thead>"
		str += "<tr id='tr1'>"
		str += "<th class='col-2'>"
		str += "</th>" 
		
		for (let i = 0; i < 11; i++) {
			str += "<th class='col'></th>"
		}
		
		str += "</tr>" 
		str += "</thead>" 
		str += "<tbody data-aos='fade-up'>";
		
		$.each(resp, function(key, val) {
		str += "<tr>";
			str += "<td class='col-2'>" + Object.values(val)[1] + '</td> ';
			for (let i = 2; i < 13; i++) {
				str += "<td class='col'>" + Object.values(val)[i] + "</td>"
			}
		});
		
		str += '</tr>'; //row
		str += '</tbody>'; //slide-up
		str += '</table>'; //list-text-content
		
		$("#selectedfoods").html(str);

		let j = 0;
		$('#tr1 > th').each(function(index, item) {
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
	
	const listHeadr = ['음식 이름', '카테고리', '칼로리(kcal)', '탄수화물(g)', '단백질(g)', '지방(g)', '당(g)',
		'나트륨(mg)', '트랜스<br>지방(g)', '칼슘(mg)', '비타민C(mg)', '철분(mg)']
	
	var str = '<br>';
	str += "<h3>추가할 음식 리스트</h3>"
	str += "<div class='container'>";
	str += "<table class='table table-hover' id='revalTable'>"
	str += "<thead>"
	str += "<tr id='tr2'>"
	str += "<th class='col-2'>"
	str += "</th>" 
	for (let i = 0; i < 11; i++) {
		str += "<th class='col'></th>"
	}
	
	str += "</tr>" 
	str += "</thead>" 
	str += "<tbody>";
	
	$.each(JSON.parse(fdlist), function(key, val) {
	str += "<tr>";
		str += "<td class='col-2'>" + Object.values(val)[1] + '</td> ';
		for (let i = 2; i < 13; i++) {
			str += "<td class='col-1'>" + Object.values(val)[i] + "</td>"
		}
		str += '</tr>'; //row
	});
	str += '</tbody>'; //slide-up
	str += '</table>'; //list-text-content
	str += '<br><br>'
	
	$("#resultFoodList").html(str);
	
	let j = 0;
	$('#tr2 > th').each(function(index, item) {
		if (j < listHeadr.length) {
			$(this).append(listHeadr[j])
			j++
		} else {
			j = 0;
		}//if
	});//tr,th/each

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
						<h2>식단 정보</h2>
						<p>식단 상세 정보</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section>
		<div>
			<input type="hidden" value="${board.bnum}" id="bnum">
		</div>
		<div class="container">
			<div data-aos="fade-up" class="mb-2">
				<h3>
					<fmt:formatDate value="${board.regdate}" pattern="yyyy년 MM월 dd일" />
				</h3>
			</div>
			<br> <br>
			<div data-aos="fade-up" data-aos-delay="100">
				<label>제목</label> <input class="form-control" type="text"
					value="${board.title}" id="title"> <br>
			</div>

			<div data-aos="fade-up" data-aos-delay="100">
				<label>메모</label>
				<textarea class="form-control" rows="5" cols="50" id="memo">${board.memo}</textarea>
				<br>
			</div>
			<br> <br>
			<div data-aos="fade-up" data-aos-delay="100">
				<h3>음식 리스트</h3>
				<div id="selectedfoods"></div>
			</div>
			<div id="FormSignup">
				<div id="resultFoodList"></div>
				<button class="btn btn-secondary" style="float: right;"
					onclick="foodFinder()">검색</button>
				<br> <br>
			</div>
			<br> <br>
			
			<div data-aos="fade-up">
				<h3>영양 그래프</h3>
				<div data-aos="fade-up" data-aos-delay="100" id="nutrents"></div>
			</div>
			<br> <br>
            <c:if test = "${p.user.num == board.member.num}">
			<div style="float: right;">
				<button type="button" id="dietUpdateBtn" class="btn btn-primary"
					style="margin-right: 5px;">수정</button>
				<button type="button" id="boardDeleteBtn" class="btn btn-danger">삭제</button>
			</div>
			</c:if>

			<div id="FormSignup" style="margin-top: 7em;">
				<sec:authorize access="hasAnyRole('EXPERT','SUBSCRIBE','ADMIN')">
					<div class="card mb-2">
						<div class="card-header bg-light">
							<i class="fa fa-comment fa"></i> REPLY
						</div>
						<div class="card-body">
							<ul class="list-group list-group-flush">
								<li class="list-group-item"><textarea class="form-control"
										id="msg" rows="3"></textarea>
									<button type="button" class="btn btn-dark mt-3" id="comment">댓글쓰기</button>
								</li>
							</ul>
						</div>
					</div>
					
					<div style="margin-top: 10px" id="ResultComment"></div>
				</sec:authorize>
			</div>
		</div>


	</section>
	<script>

function commentDel(cnum){
	$.ajax({
		type : "delete",
		url : "/comment/delete/"+cnum
	})
	.done(function(resp){
		alert(resp + "번 댓글이 삭제되었습니다.")
		location.href = "/board/detail/"+$("#bnum").val()
	})
	.fail(function(){
		alert("댓글 삭제에 실패하셨습니다.")
	})
}

var init = function(){
	$.ajax({
		type : "get",
		url : "/comment/list/"+$("#bnum").val(),
	})
	.done(function(resp){
		var str = "<hr>"
		str += "<table class = 'table' style='text-align: center;'>"
			str += "<tr>"
				str += "<th>ID</th>"
				str += "<th>내용</th>"
				str += "<th>작성일</th>"
				 str += "<th>삭제</th>"
				str += "</tr>"
		$.each(resp, function(key, val){
			str += "<input type = 'hidden' id = 'cnum' name ='cnum' value = '"+val.cnum+"'/>"			
				str += "<tr>"
					str += "<td>" + val.member.username + "</td>"
					str += "<td>" + val.content + "</td>"
					str += "<td>" + val.c_regdate + "</td>"
					str += "<td>"
					if(${p.user.num} == val.member.num){
					str += "<a href = 'javascript:commentDel("+val.cnum+")'>삭제</a>"
					}
					str += "</td>"
					str +="</tr>"			
		})
		str +="</table>"
		$("#ResultComment").html(str)
	})	
}

// 삭제
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

//업데이트
$("#dietUpdateBtn").click(function(){
	
	var data = {
			title: $("#title").val(),
			memo: $("#memo").val(),
			foodcode: fdlistFoodcodes
		}//data 
		
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

//댓글 
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
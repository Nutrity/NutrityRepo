<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<script>

</script>

<main id="main">
	<div class="breadcrumbs">
			<div class="page-header d-flex align-items-center"
			style="background-image: url('/img/month-cal-bg-2.jpg');">
			<div class="container position-relative">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-6 text-center">
						<h2>자격 요청 목록</h2>
						<p>전문가 요청 명단</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section>
	<div class="container">	
			<table class="table table-hover" style="text-align: center;">
			  <tr>
			    <th>num</th>
			    <th>realname</th>
			    <th>gender</th>
			    <th>birth</th>
			    <th>Job</th>
			    <th>Role</th>
			    <th>ip</th>
			    <th>수정</th>
			    <th>거절</th>
			  </tr>

			<c:forEach items="${request}" var="req">
			<input type = "hidden" id = "num" name = "num" value = "${req.num}"/>
				<tr>				
					<td>${req.num }</td>
					<td>${req.realname }</td>
					<td>${req.gender }</td>
					<td>${req.birth }</td>
					<td>${req.job.job}</td>
					<td id="role">${req.job.role}</td>
					<td>${req.ip }</td>
					<td><button id="BtnModiRole" class="btn btn-primary">확인</button></td>
					<td><button id="RejectBtn" class="btn btn-danger">거절</button></td>
				</tr>
			</c:forEach>
			</table>
		</div>
	</section>
</main>
<script>
$("#BtnModiRole").click(function(){
	$.ajax({
		type : "put",
		url : "/admin/modiRole/"+$("#num").val()
	})
	.done(function(resp){
		alert("승인이 완료되었습니다.");
		location.href = '/admin/requestQual'
	})
})

$("#RejectBtn").click(function(){
	$.ajax({
		type : 'put',
		url : "/admin/rejectRequest/"+$("#num").val()
	})
	.done(function(resp){
		if(resp=="success"){
		alert("거절하였습니다")
		location.href = '/admin/requestQual'
		}
	})
	
})




</script>
<%@include file="../include/footer.jsp"%>
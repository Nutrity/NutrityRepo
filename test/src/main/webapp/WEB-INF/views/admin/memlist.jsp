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
						<h2>Member List</h2>
						<p>숨 참고 러브 다이브~ 우 우 우우~ 나나 나나나나나~ 우 우 우우~ Oh perfect sacrifice~~~ YEAH~~~ 숨 참고 러브 다이브 숨 참고 러브 다이브~ 우 우 우우~ 나나 나나나나나~ 우 우 우우~ Oh perfect sacrifice~~~ YEAH~~~ 숨 참고 러브 다이브 숨 참고 러브 다이브~ 우 우 우우~ 나나 나나나나나~ 우 우 우우~ Oh perfect sacrifice~~~ YEAH~~~ 숨 참고 러브 다이브 </p>
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
			    <th>useremail</th>
			    <th>platform_type</th>
			    <th>realname</th>
			    <th>gender</th>
			    <th>phone</th>
			    <th>birth</th>
			    <th>user_regdate</th>
			    <th>role</th>
			    <th>ip</th>
			    <th>수정</th>
			    <th>삭제</th>
			  </tr>

			<c:forEach items="${member }" var="mem">
				<tr>
					<td>${mem.num }</td>
					<td>${mem.useremail }</td>
					<td>${mem.platform_type }</td>
					<td>${mem.realname }</td>
					<td>${mem.gender }</td>
					<td>${mem.phone }</td>
					<td>${mem.birth }</td>
					<td>${mem.user_regdate }</td>
					<td>${mem.job.role }</td>
					<td>${mem.ip }</td>
					<td><button id="BtnModiMember" class="btn btn-primary">수정</button></td>
					<td><button id="BtnDelMember" class="btn btn-danger">삭제</button></td>
				</tr>
			</c:forEach>
			</table>
		</div>
	</section>
</main>
<%@include file="../include/footer.jsp"%>
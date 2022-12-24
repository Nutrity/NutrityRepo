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
						<h2>구독자 목록</h2>
						<p>구독자 목록</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section>
	<div class="container">
	
			<table class="table table-hover" style="text-align: center;">
			  <tr>
			    <th>username</th>
			    <th>age</th>
			    <th>gender</th>
			    <th>count</th>
			  </tr>

			<c:forEach items="${member}" var="mem" varStatus="status">
				<tr>
<%-- 					<td><a href = "/expert/adviceList/${mem.num}">${mem.username}</a></td> --%>
					<td><a href = "/expert/adviceList/${mem.num}">${mem.username}</a></td>
					<td>${mem.age }</td>
					<td>${mem.gender }</td>
					<td>${cmpBoardCnt[status.index]}</td>
				</tr>
			</c:forEach>
			</table>
		</div>
	</section>	
</main>
<%@include file="../include/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<main id="main">
	<div class="breadcrumbs">
		<div class="page-header d-flex align-items-center"
			style="background-image: url('/img/month-cal-bg-1.jpg');">
			<div class="container position-relative">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-6 text-center">
						<h2>Calendar</h2>
						<p>안티티 티티 프레자일 프레자일 안티티 티티 프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티
							프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티 프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티
							프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티 프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티
							프레자일 후!</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 	카드를 만들고 그안에서 처리하게 부탁 -->
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">자격 인증</h5>
			<input type="file" id="qualify" placeholder="자격증을 업로드 해 주세요">
			<!-- 			본인인증 구현 예정 -->
			<!-- 				<button class="btn btn-danger" id="identiry">본인 인증</button> -->
			<!-- 			<div id="identify"></div> -->

			<button type="button" id="qualifyBtn"></button>
		</div>
	</div>

</main>
<%@include file="../include/footer.jsp"%>
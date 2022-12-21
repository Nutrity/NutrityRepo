<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>

<main id="main">
	<div class="breadcrumbs">
		<div class="page-header d-flex align-items-center"
			style="background-image: url('/img/month-cal-bg-1.jpg');">
			<div class="container position-relative">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-6 text-center">
						<h2>전문가 인증</h2>
						<p>너 전문가? 너너너 전문가? 혹시 아니면 돌아가~너 전문가? 너너너 전문가? 혹시 아니면 돌아가~너 전문가? 너너너 전문가? 혹시 아니면 돌아가~너 전문가? 너너너 전문가? 혹시 아니면 돌아가~</p>
					</div>
				</div>
			</div>
		</div>
	</div>

<section id="qualify">
	<div class="container">
	<!-- 	카드를 만들고 그안에서 처리하게 -->
		<div class="card">
			<div class="card-body">
				<form class="form-group" action="qual" method="post" enctype="multipart/form-data">
					<h5 class="card-title">자격 인증</h5>
					<div class="row">
						<div class="col-5">
							<input class="form-control" type="text" name="job" value="111">
						</div>
						<div class="col-5">
							<input class="form-control" type="file" name="upload" placeholder="자격증을 업로드 해 주세요">
						</div>
						<div class="col-2">
							<button class="form-control btn btn-primary">보내기</button>
						</div>
					</div>
			
			<!-- 			본인인증 구현 예정 -->
<!-- 							<button class="btn btn-danger" id="identiry">본인 인증</button> -->
<!-- 						<div id="identify"></div> -->

				</form>
			</div>
		</div>
	</div>
</section>
</main>


<%@include file="include/footer.jsp"%>
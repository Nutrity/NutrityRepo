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
						<p>전문가 인증 요청</p>
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
					<form class="form-group" action="qual" method="post"
						enctype="multipart/form-data">
						<h5 class="card-title">자격 인증</h5>
						<div class="row">
							<div class="col-3">
							<c:choose>
							  <c:when test="${not empty p.user.job.job}">
							    <select class="form-control" name="job" disabled>
									<option value="Doctor">의사</option>
									<option value="Nutritionist">영양사</option>
									<option value="Trainer">PT 트레이너</option>
								</select>
							  </c:when>
							<c:otherwise>
							    <select class="form-control" name="job">
									<option value="Doctor">의사</option>
									<option value="Nutritionist">영양사</option>
									<option value="Trainer">PT 트레이너</option>
								</select>
							</c:otherwise>
							</c:choose>
								
							</div>
							<div class="col-7">
							<c:choose>
							  <c:when test="${not empty p.user.job.qualName}">
							    <input class="form-control" type="file" name="upload"
									placeholder="자격증을 업로드 해 주세요" disabled>
							  </c:when>
							  <c:otherwise>
							    <input class="form-control" type="file" name="upload"
									placeholder="자격증을 업로드 해 주세요">
							  </c:otherwise>
							</c:choose>
								
							</div>
							<div class="col-2">
								<button class="form-control btn btn-primary">보내기</button>
							</div>
						</div>						
					</form>
				</div>
			</div>
			<c:if test="${not empty p.user.job.qualName}">
			<div style = " float: right;'">자격 인증이 진행 중입니다.</div>
			</c:if>
		</div>		
	</section>
</main>


<%@include file="include/footer.jsp"%>
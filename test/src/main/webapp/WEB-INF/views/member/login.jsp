<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>    

<main>
	<div class="breadcrumbs">
		<div class="page-header d-flex align-items-center"
			style="background-image: url('/img/month-cal-bg-2.jpg');">
			<div class="container position-relative">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-6 text-center">
						<h2 data-aos="fade-up">로그인</h2>
						<p data-aos="fade-up" data-aos-delay="100">어서오세요! 오늘도 Nutrity를 찾아주셔서 감사합니다!
						<br> 혹시 멤버가 아니신가요? <a href="/join">여기에서</a> Nutrity 멤버가 되어보세요!</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section>
		<div data-aos="fade-up" data-aos-delay="200" class="container">
			<form action = "/login" method = "post">
				<div>
					<label for="username">아이디</label>
					<input class="form-control" type = "text" id = "username" name = "username">
				</div>
				<br/>
				<div>
					<label for="password">비밀번호</label>
					<input class="form-control" type = "text" id = "password" name = "password">
				</div>
				<br/>
				<div class="row justify-content-end">
					<div class="col-10">
					</div>
					<div class="col">
						<input class="form-control btn btn-primary" type = "submit" id = "LoginBtn" value="로그인"></input>
					</div>
				</div>
			</form>
		</div>
	</section>
</main>

<script src="/js/login.js"></script>

<%@ include file = "../include/footer.jsp" %>
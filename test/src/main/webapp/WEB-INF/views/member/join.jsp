<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>

<main id="main">
	<div class="breadcrumbs">
		<div class="page-header d-flex align-items-center"
			style="background-image: url('/img/month-cal-bg-2.jpg');">
			<div class="container position-relative">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-6 text-center">
						<h2 data-aos="fade-up">회원 가입</h2>
						<p data-aos="fade-up" data-aos-delay="100">환영합니다! Nutrity의 새 멤버로 당신을 초대합니다!
						<br> 혹시 이미 멤버이신가요? <a href="/login">여기에서</a> 로그인 하세요!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section id="FormSignup">
		<div data-aos="fade-up" class="container">
				<div>
					<label for="username">아이디</label>
					<input class="form-control" type = "text" id = "username" name = "username" placeholder="아이디를 입력해주세요">
					<div class="invalid-feedback">
				    	올바른 아이디를 입력해주세요.
				    </div>
				</div>
				<br/>
				<div>
					<label for="realname">이름</label>
					<input class="form-control" type = "text" id = "realname" name = "realname" placeholder="이름을 입력해주세요">
					<div class="invalid-feedback">
				    	이름을 입력해주세요.
				    </div>
				</div>
				<br/>
				<div>
					<label for="useremail">이메일</label> 
					<div>
						<div class="input-group">
		  					<input type="text" class="form-control" placeholder="example" id="useremail" name="useremail">
		  					<span class="input-group-text">@</span>
		  					<input type="text" class="form-control" placeholder="example.example" id="server" name="server">
						</div>
						<div class="invalid-feedback">
					    	올바른 이메일을 입력해주세요.
					    </div>
					</div>
				</div>
				<br/>
				<div>
					<label for="password">비밀번호</label> 
					<input class="form-control" type = "password" id = "password" name = "password">
				</div>
				<br/>
				<div>
					<label for="birth">생일</label>
					<input class="form-control" type = "text" id = "birth" name = "birth">
				</div>
				<br/>
				<div>
					<label for="age">나이</label>
					<input class="form-control" type = "text" id = "age" name = "age">
				</div>
				<br/>
				<div>
					<label for="phone">휴대전화</label>
					<input class="form-control" type = "text" id = "phone" name = "phone">
				</div>
				<br/>
				<div>
					<label>주소</label>
					<div class="row">
						<div class="col">
							<input class="form-control" type="text" id="zipcode" name = "zipcode" placeholder="우편번호">
						</div>
						<div class="col-2">
							<input class="form-control btn btn-primary" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col">
							<input class="form-control" type="text" id="address1"  name = "address1" placeholder="도로명주소">
						</div>
						<div class="col" style="display: none;">
							<span class="form-control" id="guide" style="color:#999;display:none"></span>
						</div>
						<div class="col">
							<input class="form-control" type="text" id="address2"  name = "address2" placeholder="상세주소">
						</div>
					</div> 
				</div>
				<br>
				<div>
					<label>성별</label>
					<div class="row justify-content-between">
						<div class="col-4">
							남 : <input type = "radio" id = "gender" name = "gender" value = "man"/>
							여 : <input type = "radio" id = "gender" name = "gender" value = "woman" /><br/>
						</div>
						<div class="invalid-feedback">
					    	성별을 선택해주세요.
						</div>
						<div class="col-2">
							<input class="form-control btn btn-primary" type = "button" id = "JoinBtn" value="회원가입"></input>
						</div>
					</div>
				</div>
		</div>
	</section>
</main>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/join.js"></script>

<%@ include file = "../include/footer.jsp" %>
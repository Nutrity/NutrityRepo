<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<main id="main">
	<div class="breadcrumbs">
		<div class="page-header d-flex align-items-center"
			style="background-image: url('/img/month-cal-bg-2.jpg');">
			<div class="container position-relative">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-6 text-center">
						<h2 data-aos="fade-up">내 정보 수정</h2>
						<p data-aos="fade-up" data-aos-delay="100">내 정보 수정하기</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section id="UpdateForm">
		<div data-aos="fade-up" data-aos-delay="200" class="container">
			<input type="text" id = "num" name = "num" value = "${p.user.num}" readonly="readonly" style="display: none">
				<div>
					<label for="username">아이디</label>
					<input class="form-control" type = "text" id = "username" name = "username" value="${p.user.username}" readonly="readonly">
					<div class="invalid-feedback">
				    	올바른 아이디를 입력해주세요.
				    </div>
				</div>
				<br/>
				<div>
					<label for="realname">이름</label>
					<input class="form-control" type = "text" id = "realname" name = "realname" value="${p.user.realname}">
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
							<div class="invalid-feedback">
						    	올바른 이메일을 입력해주세요.
						    </div>
						</div>
					</div>
				</div>
				<br>
				<div>
					<label for="password">비밀번호</label> 
					<input class="form-control" type = "password" id = "password" name = "password" placeholder="비밀번호를 입력해주세요">
					<div class="invalid-feedback">
				    	비밀번호를 입력해주세요.
					</div>
				</div>
				<br>
				<div>
					<label for="password">비밀번호 확인</label> 
					<input class="form-control" type = "password" id = "ConfPassword" name = "ConfPassword" placeholder="동일한 비밀번호를 입력해주세요">
					<div id="ConfPwd-null" class="invalid-feedback" style="display: none;">
				    	비밀번호를 다시 한 번 입력해주세요.
					</div>
					<div id="ConfPwd-wrong" class="invalid-feedback" style="display: none;">
				    	비밀번호가 같은지 확인하세요.
					</div>
				</div>
				<br>
				<div>
					<label for="birth">생년월일</label>
					<input class="form-control" type = "date" id = "birth" name = "birth" value="${p.user.birth}">
					<div class="invalid-feedback">
				    	생년월일을 입력해주세요.
					</div>
				</div>
				<br/>
				<div>
					<label for="age">나이</label>
					<input class="form-control" type = "number" id = "age" name = "age" value="${p.user.age }">
					<div class="invalid-feedback">
				    	나이를 입력해주세요.
					</div>
				</div>
				<br>
				<div>
					<label for="phone">휴대전화</label>
					<input class="form-control" type = "number" id = "phone" name = "phone" value="${p.user.phone }">
					<div class="invalid-feedback">
				    	휴대전화를 입력해주세요.
					</div>
				</div>
				<br/>
				<div>
					<label>주소</label>
					<div class="row">
						<div class="col">
							<input class="form-control" type="text" id="zipcode" name = "zipcode" readonly="readonly" value="${p.user.address.zipcode}">
							<div class="invalid-feedback">
						    	우편번호를 입력해주세요.
							</div>
						</div>
						<div class="col-2">
							<input class="form-control btn btn-primary" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col">
							<input class="form-control" type="text" id="address1"  name = "address1" readonly="readonly" value="${p.user.address.address1 }">
							<div class="invalid-feedback">
						    	도로명 주소를 입력해주세요.
							</div>
						</div>
						<div class="col" style="display: none;">
							<span class="form-control" id="guide" style="color:#999;display:none"></span>
						</div>
						<div class="col">
							<input class="form-control" type="text" id="address2"  name = "address2" value="${p.user.address.address2 }" placeholder="상세주소">
						</div>
					</div> 
				</div>
				<br>
				<c:choose>
				<c:when test = "${p.user.gender == '남'}">
					<label>성별</label>
					<div class="row justify-content-between">
						<div class="col-4 row">
							<div class="col">
								남 : <input type = "radio" id = "gender" name = "gender" value = "man" checked="checked" onclick="return(false);"/>
							</div>
							<div class="col">
								여 : <input type = "radio" id = "gender" name = "gender" value = "woman" onclick="return(false)"/><br/>
							</div>
						</div>
						<div class="invalid-feedback">
					    	성별을 선택해주세요.
						</div>
						<div class="col-2">
							<input class="form-control btn btn-primary" type = "button" id = "JoinBtn" value="회원가입"></input>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<label>성별</label>
					<div class="row justify-content-between">
						<div class="col-4 row">
							<div class="col">
								남 : <input type = "radio" id = "gender" name = "gender" value = "man" checked="checked" onclick="return(false);"/>
							</div>
							<div class="col">
								여 : <input type = "radio" id = "gender" name = "gender" value = "woman" onclick="return(false)"/><br/>
							</div>
						</div>
						<div class="invalid-feedback">
					    	성별을 선택해주세요.
						</div>
						<div class="col-3 row">
							<div class="col">
								<button class="form-control btn btn-primary" id = "modifyBtn">수정</button>
							</div>
							<div class="col">
								<button class="form-control btn btn-danger" id = "delBtn">삭제</button>
							</div>
						</div>
					</div>
				</c:otherwise>
				</c:choose>		  
			<table>
				<tr>
					<td>이메일</td>
					<td><input type="text" id="useremail" name="useremail"
						value="${p.user.useremail}"></td>
				</tr>
			</table>

		</div>
	</section>
</main>

<script src="/js/update.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%@ include file="../include/footer.jsp"%>
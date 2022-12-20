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
			<form action = "join" method = "post" class="form-group">
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
				<div>
					<div>
						남 : <input type = "radio" id = "gender" name = "gender" value = "man"/>
						여 : <input type = "radio" id = "gender" name = "gender" value = "woman" /><br/>
					</div>
					<div>
						<button class="form-group btn btn-primary" type = "submit" id = "JoinBtn">회원가입</button>
					</div>       
				</div>
			</form>
		</div>
	</section>
</main>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$("#JoinBtn").click(function(){		
	if($("#username").val() == ""){
		$("#username").addClass("is-invalid");
		$("#username").attr("required");
		$("#username").focus()
		return false;
	} else {
		$("#username").removeClass("is-invalid")
		$("#username").addClass("is-valid");
		$("#username").removeAttr("required");
	}	
	if($("#realname").val() == ""){
		$("#realname").addClass("is-invalid");
		$("#realname").attr("required");
		$("#realname").focus()
		return false;
	} else {
		$("#realname").removeClass("is-invalid")
		$("#realname").addClass("is-valid");
		$("#realname").removeAttr("required");
	}	
	if($("#useremail").val() == ""){
		$("#useremail").addClass("is-invalid");
		$("#useremail").attr("required");
		$("#useremail").focus()
		return false;
	} else {
		$("#useremail").removeClass("is-invalid")
		$("#useremail").addClass("is-valid");
		$("#useremail").removeAttr("required");
	}
	if($("#server").val() == ""){
		$("#server").addClass("is-invalid");
		$("#server").attr("required");
		$("#server").focus()
		return false;
	} else {
		$("#server").removeClass("is-invalid")
		$("#server").addClass("is-valid");
		$("#server").removeAttr("required");
	}
	if($("#password").val() == ""){
		$("#password").addClass("is-invalid");
		$("#password").attr("required");
		$("#password").focus()
		return false;
	} else {
		$("#password").removeClass("is-invalid")
		$("#password").addClass("is-valid");
		$("#password").removeAttr("required");
	}
	if($("#birth").val() == ""){
		$("#birth").addClass("is-invalid");
		$("#birth").attr("required");
		$("#birth").focus()
		return false;
	} else {
		$("#birth").removeClass("is-invalid")
		$("#birth").addClass("is-valid");
		$("#birth").removeAttr("required");
	}
	if($("#age").val() == ""){
		$("#age").addClass("is-invalid");
		$("#age").attr("required");
		$("#age").focus()
		return false;
	} else {
		$("#age").removeClass("is-invalid")
		$("#age").addClass("is-valid");
		$("#age").removeAttr("required");
	}
	if($("#phone").val() == ""){
		$("#phone").addClass("is-invalid");
		$("#phone").attr("required");
		$("#phone").focus()
		return false;
	} else {
		$("#phone").removeClass("is-invalid")
		$("#phone").addClass("is-valid");
		$("#phone").removeAttr("required");
	}
	if($("#zipcode").val() == ""){
		$("#zipcode").addClass("is-invalid");
		$("#zipcode").attr("required");
		$("#zipcode").focus()
		return false;
	} else {
		$("#zipcode").removeClass("is-invalid")
		$("#zipcode").addClass("is-valid");
		$("#zipcode").removeAttr("required");
	}
	if($("#address1").val() == ""){
		$("#address1").addClass("is-invalid");
		$("#address1").attr("required");
		$("#address1").focus()
		return false;
	} else {
		$("#address1").removeClass("is-invalid")
		$("#address1").addClass("is-valid");
		$("#address1").removeAttr("required");
	}
	
	addr = {
			zipcode : $("#zipcode").val(),
			address1 : $("#address2").val(),
			address1 : $("#address2").val()
	}
	
	data = {
			phone : $("#phone").val(),
			age : $("#age").val(),
			birth : $("#birth").val(),
			useremail : $("#useremail").val()+"@"+$("#server").val(),
			realname : $("#realname").val(),
			password : $("#password").val(),
			username : $("#username").val(),
			gender : $("#gender").val(),
			address : addr			
	}
	
	$.ajax({
		type : "post",
		url : "/join",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data)
	})
	.done(function(resp){
		if(resp == "success"){
			location.href = "/"
		} else{
			alert("아이디가 중복됩니다.")
		}
	})
})
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = roadAddr;               
                
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                    guideTextBox.parentNode.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                    guideTextBox.parentNode.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                    guideTextBox.parentNode.style.display = 'none';
                }
            }
        }).open();      
    }
</script>

<%@ include file = "../include/footer.jsp" %>
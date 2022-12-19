<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<section id="hero" class="hero hero-bg-anime d-flex align-items-center">
    <div class="container">
      <div class="row gy-4 d-flex justify-content-between">
        <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
          <h2 data-aos="fade-up">나의 식단을
            <br>  
            더욱 건강하게!</h2>
          <p data-aos="fade-up" data-aos-delay="100">역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! </p>

          <form class="form-search d-flex align-items-stretch mb-3" data-aos="fade-up" data-aos-delay="200">
            <input type="text" class="form-control" placeholder="오늘 먹은 음식을 검색" id="foodname">
            <button type="button" class="btn btn-primary" id="foodBtn">Search</button>
          </form>
        </div>
      </div>
    </div>
  </section>
<div class = "container">
<input type="text" id = "num" name = "num" value = "${p.user.num}">
<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" id="username" name="username" value="${p.user.username}"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" id="useremail" name="useremail"
			value="${p.user.useremail}"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" id="realname" name="realname"
			value="${p.user.realname}" readonly="readonly"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" id="password" name="password">
		</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
		<c:choose>
		<c:when test = "${p.user.gender == '남'}">
		남 : <input type = "radio" id = "gender" name = "gender" value = "남" checked
		     onclick="return(false);"/>
        여 : <input type = "radio" id = "gender" name = "gender" value = "여" 
             onclick="return(false);"/>
		</c:when>
		<c:otherwise>
		남 : <input type = "radio" id = "gender" name = "gender" value = "남"
		     onclick="return(false);"/>
        여 : <input type = "radio" id = "gender" name = "gender" value = "여" checked
             onclick="return(false);"/>
		</c:otherwise>
		</c:choose>		  
		</td>
	</tr>
	<tr>
		<td>번호</td>
		<td><input type="text" id="phone" name="phone"
			value="${p.user.phone}"></td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td><input type="text" id="birth" name="birth"
			value="${p.user.birth}" readonly="readonly"></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><input type="text" id="zipcode" name="zipcode" placeholder="우편번호"
		     value = "${p.user.address.zipcode}"> 
		    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="address1" name="address1" placeholder="도로명주소"
		     value = "${p.user.address.address1}">
			<span id="guide" style="color: #999; display: none"></span> 
			<input type="text" id="address2" name="address2" placeholder="상세주소"
			 value = "${p.user.address.address2}">
			<br></td>
	</tr>	
</table>
<button id = "modifyBtn">수정</button>
<button id = "delBtn">삭제</button>
<script>

$("#modifyBtn").click(function(){

addr = {
		zipcode : $("#zipcode").val(),
		address1 : $("#address1").val(),
		address2 : $("#address2").val()
}
	
	
data = {	
		num : $("#num").val(),
		useremail : $("#useremail").val(),
		password : $("#password").val(),
		phone : $("#phone").val(),
		address : addr
}

console.log($("#zipcode").val())
$.ajax({
	type: 'put',
	url : 'modify',
	data : JSON.stringify(data),
	contentType : 'application/json;charset=utf-8' 
})
.done(function(resp){
	alert(resp)
})

})

$("#delBtn").click(function(){
	if(!confirm("정말 탈퇴하시겠습니까")){
		return false;
	}
	$.ajax({
		type : 'delete',
		url : "/userDelete/${p.user.num}"
	})
	.done(function(){
		alert("탈퇴가 완료되었습니다.")
		location.href = "/logout"
	})
	.fail(function(){
		alert("오류로 인하여 탈퇴 실패하셨습니다.")
	})
})

</script>



</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

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

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();      
}
</script>

<%@ include file="../include/footer.jsp"%>
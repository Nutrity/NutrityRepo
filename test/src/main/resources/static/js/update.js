/**
 * 
 */
 
 
$("#modifyBtn").click(function(){
	
	if ($("#username").val() == "") {
		$("#username").removeClass("is-valid")
		$("#username").addClass("is-invalid");
		$("#username").attr("required");
		$("#username").focus()
		return false;
	} else {
		$("#username").removeClass("is-invalid")
		$("#username").addClass("is-valid");
		$("#username").removeAttr("required");
	}
	if ($("#realname").val() == "") {
		$("#realname").removeClass("is-valid")
		$("#realname").addClass("is-invalid");
		$("#realname").attr("required");
		$("#realname").focus()
		return false;
	} else {
		$("#realname").removeClass("is-invalid")
		$("#realname").addClass("is-valid");
		$("#realname").removeAttr("required");
	}
	if ($("#useremail").val() == "") {
		$("#useremail").removeClass("is-valid")
		$("#useremail").addClass("is-invalid");
		$("#useremail").attr("required");
		$("#server").addClass("is-invalid");
		$("#server").attr("required");
		$("#useremail").focus()
		return false;
	} else {
		$("#useremail").removeClass("is-invalid")
		$("#useremail").addClass("is-valid");
		$("#server").removeClass("is-invalid")
		$("#useremail").removeAttr("required");
		$("#server").removeAttr("required");
	}
	if ($("#server").val() == "") {
		$("#server").removeClass("is-valid")
		$("#server").addClass("is-invalid");
		$("#server").attr("required");
		$("#useremail").addClass("is-invalid");
		$("#useremail").attr("required");
		$("#server").focus()
		return false;
	} else {
		$("#server").removeClass("is-invalid")
		$("#server").addClass("is-valid");
		$("#server").removeAttr("required");
		$("#useremail").removeClass("is-invalid")
		$("#useremail").removeAttr("required");
	}
	if ($("#password").val() == "") {
		$("#password").removeClass("is-valid")
		$("#password").addClass("is-invalid");
		$("#password").attr("required");
		$("#password").focus()
		return false;
	} else {
		$("#password").removeClass("is-invalid")
		$("#password").addClass("is-valid");
		$("#password").removeAttr("required");
	}
	if ($("#ConfPassword").val() == "") {
		$("#ConfPassword").removeClass("is-valid")
		$("#ConfPassword").addClass("is-invalid");
		$("#ConfPassword").attr("required");
		$("#ConfPwd-null").css("display", "block");
		$("#ConfPwd-wrong").css("display", "block");
		$("#ConfPassword").focus()
		return false;
	} else if ($("#ConfPassword").val() != $("#password").val()) {
		$("#ConfPassword").removeClass("is-valid")
		$("#ConfPassword").addClass("is-invalid");
		$("#ConfPassword").attr("required");
		$("#ConfPwd-null").css("display", "none");
		$("#ConfPwd-wrong").css("display", "block");
		$("#ConfPassword").focus()
		return false;
	} else {
		$("#ConfPassword").removeClass("is-invalid")
		$("#ConfPassword").addClass("is-valid");
		$("#ConfPwd-null").css("display", "none");
		$("#ConfPwd-wrong").css("display", "none");
		$("#ConfPassword").removeAttr("required");
	}
	if ($("#birth").val() == "") {
		$("#birth").removeClass("is-valid")
		$("#birth").addClass("is-invalid");
		$("#birth").attr("required");
		$("#birth").focus()
		return false;
	}  else {
		$("#birth").removeClass("is-invalid")
		$("#birth").addClass("is-valid");
		$("#birth").removeAttr("required");
	}
	if ($("#age").val() == "") {
		$("#age").removeClass("is-valid")
		$("#age").addClass("is-invalid");
		$("#age").attr("required");
		$("#age").focus()
		return false;
	} else {
		$("#age").removeClass("is-invalid")
		$("#age").addClass("is-valid");
		$("#age").removeAttr("required");
	}
	if ($("#phone").val() == "") {
		$("#phone").removeClass("is-valid")
		$("#phone").addClass("is-invalid");
		$("#phone").attr("required");
		$("#phone").focus()
		return false;
	} else {
		$("#phone").removeClass("is-invalid")
		$("#phone").addClass("is-valid");
		$("#phone").removeAttr("required");
	}
	if ($("#zipcode").val() == "") {
		$("#zipcode").removeClass("is-valid")
		$("#zipcode").addClass("is-invalid");
		$("#zipcode").attr("required");
		$("#zipcode").focus()
		return false;
	} else {
		$("#zipcode").removeClass("is-invalid")
		$("#zipcode").addClass("is-valid");
		$("#zipcode").removeAttr("required");
	}
	if ($("#address1").val() == "") {
		$("#address1").removeClass("is-valid")
		$("#address1").addClass("is-invalid");
		$("#address1").attr("required");
		$("#address1").focus()
		return false;
	} else {
		$("#address1").removeClass("is-invalid")
		$("#address1").addClass("is-valid");
		$("#address1").removeAttr("required");
	}
	if ($("input[name=gender]:radio:checked").length < 1) {
		alert("성별을 선택해주세요")
		return false;
	}
	//유효성 검사
	
	

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
	
	$.ajax({
		type: 'put',
		url : 'modify',
		data : JSON.stringify(data),
		contentType : 'application/json;charset=utf-8' 
	})
	.done(function(resp){
		location.href = "/logout"
	})

})

$("#delBtn").click(function(){
	if(!confirm("정말 탈퇴하시겠습니까")){
		return false;
	}
	$.ajax({
		type : 'delete',
		url : "/userDelete/"+$("#num").val()
	})
	.done(function(){
		alert("탈퇴가 완료되었습니다.")
		location.href = "/logout"
	})
	.fail(function(){
		alert("오류로 인하여 탈퇴 실패하셨습니다.")
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

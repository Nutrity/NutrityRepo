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
		alert("????????? ??????????????????")
		return false;
	}
	//????????? ??????
	
	

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
		alert("?????? ???????????????.")
		location.href = "/logout"
	})

})

$("#delBtn").click(function(){
	if(!confirm("?????? ????????????????????????")){
		return false;
	}
	$.ajax({
		type : 'delete',
		url : "/userDelete/"+$("#num").val()
	})
	.done(function(){
		alert("????????? ?????????????????????.")
		location.href = "/logout"
	})
	.fail(function(){
		alert("????????? ????????? ?????? ?????????????????????.")
	})
})

//??? ??????????????? ????????? ?????? ?????? ????????? ?????? ????????? ??????, ???????????? ???????????? ???????????? ????????? ????????? ???????????? ????????? ???????????????.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

            // ????????? ????????? ?????? ????????? ?????? ????????? ????????????.
            // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
            var roadAddr = data.roadAddress; // ????????? ?????? ??????
            var extraRoadAddr = ''; // ?????? ?????? ??????

            // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
            // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
            if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // ???????????? ??????, ??????????????? ?????? ????????????.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }

            // ??????????????? ?????? ????????? ?????? ????????? ?????????.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address1").value = roadAddr;               
            
            var guideTextBox = document.getElementById("guide");
            // ???????????? '?????? ??????'??? ????????? ??????, ?????? ???????????? ????????? ?????????.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(?????? ????????? ?????? : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(?????? ?????? ?????? : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();      
}

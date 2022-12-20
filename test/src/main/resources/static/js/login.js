/**
 * 
 */
 
 $("#LoginBtn").click(function(){	
	if($("#username").val() == ""){
		alert("아이디를 입력해주세요")
		return false;
	}
	
	if($("#password").val() == ""){
		alert("비밀번호를 입력해주세요")
		return false;
	}
})
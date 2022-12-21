/**
 * 
 */
 
 $("#LoginBtn").click(function(){	
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
})
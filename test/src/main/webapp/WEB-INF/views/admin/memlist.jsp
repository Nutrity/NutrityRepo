<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@include file="../include/header.jsp"%>

<script>

</script>

<main id="main">
	<div class="breadcrumbs">
			<div class="page-header d-flex align-items-center"
			style="background-image: url('/img/month-cal-bg-2.jpg');">
			<div class="container position-relative">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-6 text-center">
						<h2>회원 목록</h2>
						<p>회원 목록</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section>
	<div class="container">
	
			<table class="table table-hover" style="text-align: center;">
			  <tr>
			    <th>이메일</th>
			    <th>이름</th>
			    <th>성별</th>
			    <th>휴대전화</th>
			    <th>생년월일</th>
			    <th>가입일자</th>
			    <th>권한</th>
			    <th>ip</th>
			    <th>수정</th>
			    <th>삭제</th>
			  </tr>

			<c:forEach items="${member }" var="mem">
			<input type = "hidden" id = "num" name = "num" value = "${mem.num }"/>
				<tr>
					<td>${mem.useremail }</td>
					<td>${mem.realname }</td>
					<td>${mem.gender }</td>
					<td>${mem.phone }</td>
					<td>${mem.birth }</td>
					<td><fmt:formatDate value="${mem.user_regdate }" pattern="yyyy년 MM월 dd일" /></td>
					<td>
					   <select id = "role(${mem.num })" name = "role${mem.num }">
					   <option value = "ROLE_ADMIN" <c:if test="${mem.job.role eq 'ROLE_ADMIN'}">selected</c:if>>ROLE_ADMIN</option>
					   <option value = "ROLE_EXPERT" <c:if test="${mem.job.role eq 'ROLE_EXPERT'}">selected</c:if>>ROLE_EXPERT</option>
					   <option value = "ROLE_USER" <c:if test="${mem.job.role eq 'ROLE_USER'}">selected</c:if>>ROLE_USER</option>
					   <option value = "ROLE_SUBSCRIBE" <c:if test="${mem.job.role eq 'ROLE_SUBSCRIBE'}">selected</c:if>>ROLE_SUBSCRIBE</option>
					   </select>
				    </td>
					<td>${mem.ip }</td>
					<td><button type = "button" id="BtnModiMember" onclick='memUpdate(${mem.num }, $("select[name=role${mem.num }]").val())' class="btn btn-primary">수정</button></td>
					<td><button type = "button" id="BtnDelMember" onclick="memdel(${mem.num })" class="btn btn-danger">삭제</button></td>
				</tr>
			</c:forEach>
			</table>
		</div>
	</section>	
</main>
	<script>
	var selectVal = function(value){
		$("role").val(value);
	}
	
	var memdel = function(num){
		$.ajax({
			type : 'delete',
			url : '/admin/deleteuser/'+num
		})
		.done(function(resp){
			if(resp == "success"){
				alert("회원이 삭제 되었습니다.")
				location.href = "/admin/memlist"
			}						
		})
	}
	
	var memUpdate = function(num, role){
		
		data = {
				role : role
		}
		 
		$.ajax({
			type : "put",
			url : "/admin/updateuser/"+num,
			contentType : "application/json;charset=utf-8",
			data :JSON.stringify(data)
		})
		
		.done(function(resp){
			if(resp =="success"){
				alert("회원 정보가 수정되었습니다.")
				location.href = "/admin/memlist"
			}
		})
	}
	</script>
<%@include file="../include/footer.jsp"%>
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
						<h2>구독자 상세 정보</h2>
						<p>구독자 상세 정보</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section>
	<div class="container">
<%-- 	    <h3>${board[num].member.username}의 게시글</h3> --%>
			<table class="table table-hover" style="text-align: center;">
			  <tr>
			    <th>제목</th>
			    <th>작성날짜</th>
			    <th>메모</th>
			  </tr>
			<c:forEach items="${board}" var="b">
				<tr>
					<td><a href = "/board/detail/${b.bnum}">${b.title}</a></td>
					<td>${b.regdate}</td>
					<td>${b.memo}</td>
				</tr>
			</c:forEach>
			</table>
		</div>
	</section>	
</main>
<%@include file="../include/footer.jsp"%>
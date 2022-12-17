<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<script type="text/javascript">
function foodFinder() {
	window.open("selectfood", "", "width=700 height=400");
// 	window.showModalDialog("selectfood",  "", "status:false;dialogWith:700px; dialogHeight:400px");
}

function getReturnObj(foodObj) {
	$.ajax({
		type: 'post',
		url:'/board/foodlist',
		data : '',
		
		
		
	})
	
	
	alert(foodObj);
	
}
	
	
	
	
</script>

 <main id="main">
    <div class="breadcrumbs">
      <div class="page-header d-flex align-items-center" style="background-image: url('../img/month-cal-bg-1.jpg');">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div class="col-lg-6 text-center">
              <h2>Insert</h2>
              <p>안티티 티티 프레자일 프레자일 안티티 티티 프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티 프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티 프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티 프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티 프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티 프레자일 후! </p>
            </div>
          </div>
        </div>
       </div>
    </div>


<div>
<input type="text" id="foodname">
</div>

<div>
<label>title</label>
<input type="text" id="foodname">
</div>

<div>
<label>foodlist</label>
<div id="resultFoodList"></div>
<button onclick="foodFinder()">검색</button>
</div>

<div>
<label>memo</label>
<textarea rows="5" cols="40"></textarea>
</div>
</main>

<%@include file="../include/footer.jsp"%>
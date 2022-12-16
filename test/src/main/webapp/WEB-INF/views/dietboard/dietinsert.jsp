<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<script type="text/javascript">
function foodFinder() {
	window.open("selectfood", "", "width=700 height=400");
// 	window.showModalDialog("selectfood",  "", "status:false;dialogWith:700px; dialogHeight:400px");
}

function getReturnValue(returnValue) {
	  alert(returnValue);
	}
</script>

<div>
<input type="text" id="foodname">
</div>

<div>
<label>title</label>
<input type="text" id="foodname">
</div>

<div>
<label>foodlist</label>
<table>
<thead>
<tr>
<th>이름</th>
<th>분류</th>
<th>제조</th>
<th>칼로리</th>
</tr>
</thead>
<tr>
<td>??</td>
<td>??</td>
<td>??</td>
<td>??</td>
</tr>
</table>
<button onclick="foodFinder()">검색</button>
</div>

<div>
<label>memo</label>
<textarea rows="5" cols="40"></textarea>
</div>


<%@include file="../include/footer.jsp"%>
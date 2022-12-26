<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.0.0/index.global.min.js'></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {

		$.ajax({
			type:'get',
			url : '/board/calendar/'+${p.user.num},
		})//ajax
		.done(function(resp){
			if(resp==null){
				var Calendar = FullCalendar.Calendar;
				var calendarEl = document.getElementById('calendar');
			// initialize the calendar
			// -----------------------------------------------------------------
			var calendar = new Calendar(calendarEl, {
				headerToolbar : {
					
					left : 'today prev',
					center : 'title',
					right : 'next'
					
				},//headerToolbar
				navLinks: false,
				selectable: true,
				editable : false,
			    select: function(info) {
			      start: 'Date'
			      },//select
			      
			});//calendar
			
			calendar.render();
			
			}	//if
			
			else//!null
				{
			var list = resp;
			var Calendar = FullCalendar.Calendar;
			var calendarEl = document.getElementById('calendar');
			
			var events = list.map(function(diets){
			return{
				title : diets.title,
				start : diets.regdate,
				url : "/board/detail/"+diets.bnum
			}//return
			
		});//events
		
		// initialize the calendar
		// -----------------------------------------------------------------

		var calendar = new Calendar(calendarEl, {
			headerToolbar : {
				left : 'today prev',
				center : 'title',
				right : 'next'
			},//headerToolbar
			navLinks: false,
			selectable: true,
			editable : false,
		      select: function(info) {
		    	start: Date
		    	$.ajax({
		    		type : "get",
		    		url : "/board/sbmemo/"+${p.user.num}+"/"+info.startStr,
		    		
		    	})//ajax
		    	.done(function(resp){
		    		console.log( "resp:"+ resp)
		    		if(resp != ""){
		    		    var foodname = "";
		    		    var foodkcal = 0;
		    		
		    		    $.each(resp.flist, function(key, val) {
		    		        foodname += "<a>" + Object.values(val)[1] + '<a><br/>';
		    		        foodname += "<div style ='font-size:15px'>kcal : "+ Object.values(val)[3] +"</div>"
		    		        foodkcal += parseFloat(Object.values(val)[3]);
		    		    });//each
		    		                
		    		    $("#sd_date").html(resp.sideBoard.regdate);
		    		    $("#sd_diet").html(foodname);
		    		    $("#sd_kcal").html(foodkcal);
		    		    $("#sd_memo").html(resp.sideBoard.memo)
		    		    }else if(resp==""){
		    		    	 location.href = "/board/insert"
		    		    }
		    		})//in done
		      },//select
		      
              events: events
              
		    	})//calendar
		    	
		calendar.render();
				}//else
					
		});//1done
	})//document
	
</script>
<style>
</style>

<main id="main">
	<div class="breadcrumbs">
		<div class="page-header d-flex align-items-center"
			style="background-image: url('/img/month-cal-bg-1.jpg');">
			<div class="container position-relative">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-6 text-center">
						<h2>식단 리스트</h2>
						<p>식단 리스트</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section class="row">
		<div style="margin-left: 20px">
			<h3>${p.user.username}의캘린더</h3>
		</div>
		<div class="col col-10" style="float: left;" id='calendar-container'>
			<div id='calendar'></div>
		</div>
		<div class="col col-2" style="height: auto;; float: left;">
			<div class="h-auto p-3">
				날짜<br />
				<div id="sd_date"></div>
			</div>
			<div class="h-auto p-3">
				식단<br />
				<div id="sd_diet"></div>
			</div>
			<div class="h-auto p-3">
				칼로리(kcal)<br />
				<div id="sd_kcal"></div>
			</div>
			<div class="h-25 p-3">
				메모<br />
				<textarea id="sd_memo" rows="10" cols="25" readonly="readonly"></textarea>
			</div>
		</div>
	</section>
</main>

<%@ include file="../include/footer.jsp"%>
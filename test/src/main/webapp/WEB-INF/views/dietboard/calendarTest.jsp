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
		})
		.done(function(resp){
			if(resp==null){
				var Calendar = FullCalendar.Calendar;
				var calendarEl = document.getElementById('calendar');
				var events = list.map(function(diets){
					return{
						title : diets.title,
						start : diets.regdate,
						url : "/board/detail/"+diets.bnum
					}
					
				});

			// initialize the calendar
			// -----------------------------------------------------------------

			var calendar = new Calendar(calendarEl, {
				headerToolbar : {
					
					left : 'today prev',
					center : 'title',
					right : 'next'
				},
				navLinks: false,
				selectable: true,
				editable : false,
			      select: function(info) {
			       	start: 'Date'
			      },
			});

			calendar.render();

			}	
			else
				{
			var list = resp;
			console.log(list);

			var Calendar = FullCalendar.Calendar;
			var calendarEl = document.getElementById('calendar');
			var events = list.map(function(diets){
			return{
				title : diets.title,
				start : diets.regdate,
				url : "/board/detail/"+diets.bnum
			}
			
		});
		// initialize the calendar
		// -----------------------------------------------------------------

		var calendar = new Calendar(calendarEl, {
			headerToolbar : {
				left : 'today prev',
				center : 'title',
				right : 'next'
			},
			navLinks: false,
			selectable: true,
			editable : false,
		      select: function(info) {
		    	start: Date
		    	$.ajax({
		    		type : "get",
		    		url : "/boards/sbmemo",
		    		data : {
		    			regdate : Date
		    		}		            
		    	})
		    	.done(function(resp){
		    		console.log(resp)
		    	})
		      },
              events: events
		});
		
		calendar.render();
		}
	});
		});		

	
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
						<h2>Calendar</h2>
						<p>안티티 티티 프레자일 프레자일 안티티 티티 프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티
							프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티 프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티
							프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티 프레자일 후! 안티티 티티 프레자일 프레자일 안티티 티티
							프레자일 후!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section class="row">
		<h3>${p.user.username}의캘린더</h3>
		<div class="col col-10" style="float: left;" id='calendar-container'>
			<div id='calendar'></div>
		</div>
			<div class="col col-2" style="height:auto; ; float: left;"> 
			<div id ="sd_date" class = "h-auto p-3">날짜</div>
			<div id ="sd_diet" class="h-25 p-3">식단</div>
			<div id ="sd_kcal" class = "h-auto p-3">칼로리</div>
			<div id ="sd_memo" class = "h-25 p-3"><textarea rows="10" cols="25"></textarea></div>							    
		    </div>
	</section>
</main>

<%@ include file="../include/footer.jsp"%>
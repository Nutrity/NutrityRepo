<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
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

			// initialize the calendar
			// -----------------------------------------------------------------

			var calendar = new Calendar(calendarEl, {
				headerToolbar : {
					
					left : 'today prev',
					center : 'title',
					right : 'next'
				},
				navLinks: true,
				 navLinkDayClick: function(date, jsEvent) {
					 location.href= '/board/insert'
				 },
				 droppable: false,
				selectable: true,
				editable : true,
			      select: function(info) {
			       	start: 'Date'
			        location.href = "/board/insert"
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
			navLinks: true,
			 navLinkDayClick: function(date, jsEvent) {
				 location.href= '/board/insert'
			 },
			selectable: true,
			droppable: false,
			editable : true,
		      select: function(info) {
		    	start: Date,
		        location.href = "/board/insert"
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
	<section>
		<h3>${p.user.username}의캘린더</h3>
		<div id='calendar-container'>
			<div id='calendar'></div>
		</div>
	</section>
</main>
<%@ include file="include/footer.jsp"%>
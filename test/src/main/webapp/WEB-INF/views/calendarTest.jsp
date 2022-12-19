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
			var list = resp;
			console.log(list);
		
		var Calendar = FullCalendar.Calendar;
		var calendarEl = document.getElementById('calendar');
		var events = list.map(function(diets){
			return{
				title : diets.title,
				start : diets.regdate
			}
			
		});
		// initialize the calendar
		// -----------------------------------------------------------------

		var calendar = new Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth'
			},
			navLinks: true,
			 navLinkDayClick: function(date, jsEvent) {
				 location.href= '/board/detail'+{}
			 },
			selectable: true,
			editable : true,
		      select: function(info) {
		        alert('selected ' + info.startStr + ' to ' + info.endStr);
		        location.href = "detail"
		      },
              events: events
		});

		calendar.render();
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
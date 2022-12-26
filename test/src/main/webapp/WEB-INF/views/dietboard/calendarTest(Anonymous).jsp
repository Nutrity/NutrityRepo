<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.0.0/index.global.min.js'></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {

			var Calendar = FullCalendar.Calendar;
			var calendarEl = document.getElementById('calendar');

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
				 location.href= '/board/insert'
			 },
			selectable: true,
			editable : true,
		      select: function(info) {
		        location.href = "/board/insert"
		      },
		});

		calendar.render();

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
						<h2>식단 리스트</h2>
						<p>식단 리스트</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section>
		<div style="margin-left: 20px">
			<h3>식단 캘린더</h3>
		</div>
		<div id='calendar-container'>
			<div id='calendar'></div>
		</div>
	</section>
</main>
<%@ include file="../include/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "include/header.jsp"%>
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
<<<<<<< test
			 initialDate: '2020-09-12',
			navLinks: true,
			 navLinkDayClick: function(date, jsEvent) {
				 location.href= 'https://www.naver.com'
			 },
=======
>>>>>>> 1df620a calendar 수정
			selectable: true,
			editable : true,
		      select: function(info) {
		        alert('selected ' + info.startStr + ' to ' + info.endStr);
		        location.href = "https://www.naver.com"
		      }
		});

		calendar.render();
	});
</script>
<style>
html, body {
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}


#external-events {
	position: fixed;
	z-index: 2;
	top: 20px;
	left: 20px;
	width: 150px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
}

.demo-topbar+#external-events { /* will get stripped out */
	top: 60px;
}

#external-events .fc-event {
	cursor: move;
	margin: 3px 0;
}

#calendar-container {
	position: relative;
	z-index: 1;
	margin-left: 200px;
}

#calendar {
	max-width: 1100px;
	margin: 20px auto;
}
</style>

	<div id='calendar-container'>
		<div id='calendar'></div>
	</div>
<%@ include file = "include/footer.jsp"%>
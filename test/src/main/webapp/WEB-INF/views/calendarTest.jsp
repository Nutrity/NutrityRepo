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
			 initialDate: '2020-09-12',
			navLinks: true,
			 navLinkDayClick: function(date, jsEvent) {
				 location.href= 'https://www.naver.com'
			 },
			selectable: true,
			editable : true,
		      select: function(info) {
		        alert('selected ' + info.startStr + ' to ' + info.endStr);
		        location.href = "https://www.naver.com"
		      },
              events: [
                  {
                    title: '음식 이름',
                    start: '2020-09-03',
                    constraint: 'businessHours',
                    url : 'https://naver.com'
                  },
                  {
                    title: 'Meeting',
                    start: '2020-09-13T11:00:00',
                    constraint: 'availableForMeeting', // defined below
                    color: '#257e4a'
                  },
                  {
                    title: 'Conference',
                    start: '2020-09-18',
                    end: '2020-09-20'
                  },
                  {
                    title: 'Party',
                    start: '2020-09-29T20:00:00'
                  },

                  // areas where "Meeting" must be dropped
                  {
                    groupId: 'availableForMeeting',
                    start: '2020-09-11T10:00:00',
                    end: '2020-09-11T16:00:00',
                    display: 'background'
                  },
                  {
                    groupId: 'availableForMeeting',
                    start: '2020-09-13T10:00:00',
                    end: '2020-09-13T16:00:00',
                    display: 'background'
                  },

                  // red areas where no events can be dropped
                  {
                    start: '2020-09-24',
                    end: '2020-09-28',
                    overlap: false,
                    display: 'background',
                    color: '#ff9f89'
                  },
                  {
                    start: '2020-09-06',
                    end: '2020-09-08',
                    overlap: false,
                    display: 'background',
                    color: '#ff9f89'
                  }
                ]
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth'                
              },
              initialDate: '2020-09-12',
              navLinks: true, // can click day/week names to navigate views
              businessHours: true, // display business hours
              editable: true,
              selectable: true,
              events: [
                {
                  title: '음식 이름',
                  start: '2020-09-03',
                  constraint: 'businessHours'
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

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
  </head>
  <body>
  <h3>Calendar</h3>
    <div id='calendar'></div>
  </body>
</html>
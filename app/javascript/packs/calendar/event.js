//インストールしたファイルたちを呼び出します。
import { Calendar, sliceEvents, createPlugin } from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import monthGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import googleCalendarApi from '@fullcalendar/google-calendar';

//<div id='calendar'></div>のidからオブジェクトを定義してカレンダーを作っていきます。
document.addEventListener('turbolinks:load', function() {
    const calendarEl = document.getElementById('calendar');

    //カレンダーの中身を設定(月表示とか、クリックアクション起こしたいとか、googleCalendar使うととか)
    const calendar = new Calendar(calendarEl, {
        plugins: [ monthGridPlugin, timeGridPlugin, interactionPlugin, googleCalendarApi ],

        //細かな表示設定
        locale: 'ja',
        timeZone: 'Asia/Tokyo',
        firstDay: 1,
        headerToolbar: {
            start: 'dayGridMonth, timeGridWeek, timeGridDay',
            center: 'title',
            end: 'today prev,next' 
        },
        expandRows: true,
        stickyHeaderDates: true,
        buttonText: {
            today: '今日'
        }, 
        height: "auto",
        


        //GoogleカレンダーAPI用の設定
        eventSources:[
            {
                googleCalendarApiKey: ENV['GOOGLECALENDARAPI'],
                googleCalendarId: ENV['GOOGLECALENDARID'],
                //祝日を背景色のみの表示にする
                display: 'background',
                //背景色の指定
                backgroundColor: 'lightpink'
            }
        ]

        

    });
    //カレンダー表示
    calendar.render();
    

});
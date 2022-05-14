import 'package:certificate_pass/pages/exam/exam_router.dart';
import 'package:certificate_pass/resources/resources.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:certificate_pass/widgets/my_app_bar.dart';
import 'package:certificate_pass/widgets/my_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:lunar/calendar/Lunar.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage({Key? key}) : super(key: key);

  List<NeatCleanCalendarEvent> _eventList = [
    NeatCleanCalendarEvent(
      "大学英语六级",
      startTime: DateTime.parse("2022-12-18 15:00:00"),
      endTime: DateTime.parse("2022-12-18 17:25:00"),
      color: Colors.pink,
    )
  ];

  Widget _buildEventList() {
    NeatCleanCalendarEvent event = _eventList[0];
    Lunar lunar = Lunar.fromDate(event.startTime);

    return Column(
      children: [
        Row(
          children: [
            Text(
              (event.startTime.difference(DateTime.now()).inDays > 0)
                  ? "${event.startTime.difference(DateTime.now()).inDays}天后"
                  : "今天",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Gaps.hGap8,
            Text(
                "农历${lunar.getMonthXunKong()}月(${lunar.getMonthInChinese()}月)${lunar.getDayInChinese()}",
                style: TextStyle(color: Colors.grey, fontSize: 14))
          ],
        ),
        Gaps.vGap16,
        Row(
          children: [
            Text(
              "重要日",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Gaps.hGap32,
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: Colors.blue, width: 4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.summary,
                  ),
                  Text(
                      "${event.startTime.year}年${event.startTime.month}月${event.startTime.day}日",
                      style: TextStyle(color: Colors.grey, fontSize: 12))
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: "日历",
      ),
      body: MyScrollView(children: [
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 400,
              child: MyScrollView(children: [
                SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: Calendar(
                      startOnMonday: false,
                      weekDays: ['一', '二', '三', '四', '五', '六', '日'],
                      eventsList: _eventList,
                      isExpandable: true,
                      eventDoneColor: Colors.green,
                      selectedColor: Colors.pink,
                      selectedTodayColor: Colors.red,
                      todayColor: Colors.blue,
                      eventColor: null,
                      locale: 'zh-CN',
                      allDayEventText: '全天',
                      multiDayEndText: '重复',
                      isExpanded: true,
                      expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                      datePickerType: DatePickerType.date,
                      dayOfWeekStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 11),
                    ))
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: _buildEventList(),
            ),
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => NavigatorUtils.push(context, ExamRouter.countdownPage),
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

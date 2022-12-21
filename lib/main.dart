import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(const DateTimeDetails());

class DateTimeDetails extends StatelessWidget {
  const DateTimeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventCalendar(),
    );
  }
}

class EventCalendar extends StatefulWidget {
  const EventCalendar({super.key});

  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

List<String> colors = <String>[
  'Pink',
  'Blue',
  'Wall Brown',
  'Yellow',
  'Default'
];

class ScheduleExample extends State<EventCalendar> {
  final CalendarController _controller = CalendarController();
  String? _text='', _titleText='';
  Color? _headerColor, _viewHeaderColor, _calendarColor;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton<String>(
              icon: const Icon(Icons.color_lens),
              itemBuilder: (BuildContext context) {
                return colors.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
              onSelected: (String value) {
                setState(() {
                  if (value == 'Pink') {
                    _headerColor = const Color(0xFF09e8189);
                    _viewHeaderColor = const Color(0xFF0f3acb6);
                    _calendarColor = const Color(0xFF0ffe5d8);
                  } else if (value == 'Blue') {
                    _headerColor = const Color(0xFF0007eff);
                    _viewHeaderColor = const Color(0xFF03aa4f6);
                    _calendarColor = const Color(0xFF0bae5ff);
                  } else if (value == 'Wall Brown') {
                    _headerColor = const Color(0xFF0937c5d);
                    _viewHeaderColor = const Color(0xFF0e6d9b1);
                    _calendarColor = const Color(0xFF0d1d2d6);
                  } else if (value == 'Yellow') {
                    _headerColor = const Color(0xFF0f7ed53);
                    _viewHeaderColor = const Color(0xFF0fff77f);
                    _calendarColor = const Color(0xFF0f7f2cc);
                  } else if (value == 'Default') {
                    _headerColor = null;
                    _viewHeaderColor = null;
                    _calendarColor = null;
                  }
                });
              },
            ),
          ],
          backgroundColor: _headerColor,
        ),
        body: Column(
          children: [
            Expanded(
              child: SfCalendar(
                viewHeaderStyle:
                ViewHeaderStyle(backgroundColor: _viewHeaderColor),
                backgroundColor: _calendarColor,
                view: CalendarView.week,
                controller: _controller,
                allowedViews: const [
                  CalendarView.day,
                  CalendarView.week,
                  CalendarView.workWeek,
                  CalendarView.month,
                  CalendarView.timelineDay,
                  CalendarView.timelineWeek,
                  CalendarView.timelineWorkWeek
                ],
                onTap: calendarTapped,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.header) {
      _text = DateFormat('MMMM yyyy').format(details.date!).toString();
      _titleText = 'Header';
    } else if (details.targetElement == CalendarElement.viewHeader) {
      _text = DateFormat('EEEE dd, MMMM yyyy').format(details.date!).toString();
      _titleText = 'View Header';
    } else if (details.targetElement == CalendarElement.calendarCell) {
      _text = DateFormat('EEEE dd, MMMM yyyy').format(details.date!).toString();
      _titleText = 'Calendar cell';
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(child: Text(" $_titleText")),
            content: Container(child: Text(" $_text")),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('close'))
            ],
          );
        });
  }
}
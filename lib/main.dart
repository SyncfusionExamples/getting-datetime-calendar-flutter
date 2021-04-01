import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(DateTimeDetails());

class DateTimeDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventCalendar(),
    );
  }
}

class EventCalendar extends StatefulWidget {
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

List<String> views = <String>[
  'Day',
  'Week',
  'WorkWeek',
  'Month',
  'Timeline Day',
  'Timeline Week',
  'Timeline WorkWeek'
];

class ScheduleExample extends State<EventCalendar> {
  CalendarView _calendarView=CalendarView.week;
  String? _text, _titleText;
  Color? headerColor, viewHeaderColor, calendarColor, defaultColor;

  @override
  void initState() {
    _text='';
    _titleText='';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton<String>(
              icon: Icon(Icons.color_lens),
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
                    headerColor = const Color(0xFF09e8189);
                    viewHeaderColor = const Color(0xFF0f3acb6);
                    calendarColor = const Color(0xFF0ffe5d8);
                  } else if (value == 'Blue') {
                    headerColor = const Color(0xFF0007eff);
                    viewHeaderColor = const Color(0xFF03aa4f6);
                    calendarColor = const Color(0xFF0bae5ff);
                  } else if (value == 'Wall Brown') {
                    headerColor = const Color(0xFF0937c5d);
                    viewHeaderColor = const Color(0xFF0e6d9b1);
                    calendarColor = const Color(0xFF0d1d2d6);
                  } else if (value == 'Yellow') {
                    headerColor = const Color(0xFF0f7ed53);
                    viewHeaderColor = const Color(0xFF0fff77f);
                    calendarColor = const Color(0xFF0f7f2cc);
                  } else if (value == 'Default') {
                    headerColor = null;
                    viewHeaderColor = null;
                    calendarColor = null;
                  }
                });
              },
            ),
          ],
          backgroundColor: headerColor,
          centerTitle: true,
          titleSpacing: 60,
          leading: PopupMenuButton<String>(
            icon: Icon(Icons.calendar_today),
            itemBuilder: (BuildContext context) => views.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList(),
            onSelected: (String value) {
              setState(() {
                if (value == 'Day') {
                  _calendarView = CalendarView.day;
                } else if (value == 'Week') {
                  _calendarView = CalendarView.week;
                } else if (value == 'WorkWeek') {
                  _calendarView = CalendarView.workWeek;
                } else if (value == 'Month') {
                  _calendarView = CalendarView.month;
                } else if (value == 'Timeline Day') {
                  _calendarView = CalendarView.timelineDay;
                } else if (value == 'Timeline Week') {
                  _calendarView = CalendarView.timelineWeek;
                } else if (value == 'Timeline WorkWeek') {
                  _calendarView = CalendarView.timelineWorkWeek;
                }
              });
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: SfCalendar(
                viewHeaderStyle:
                ViewHeaderStyle(backgroundColor: viewHeaderColor),
                backgroundColor: calendarColor,
                view: _calendarView,
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
      _text = DateFormat('MMMM yyyy')
          .format(details.date!)
          .toString();
      _titleText='Header';
    }
    else if (details.targetElement == CalendarElement.viewHeader) {
      _text = DateFormat('EEEE dd, MMMM yyyy')
          .format(details.date!)
          .toString();
      _titleText='View Header';
    }
    else if (details.targetElement == CalendarElement.calendarCell) {
      _text = DateFormat('EEEE dd, MMMM yyyy')
          .format(details.date!)
          .toString();
      _titleText='Calendar cell';
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:Container(child: new Text(" $_titleText")),
            content:Container(child: new Text(" $_text")),
            actions: <Widget>[
              new FlatButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: new Text('close'))
            ],
          );
        });
  }
}
# Getting datetime details while tapping header, view header, agenda view and cells in Flutter event calendar.

In flutter event calendar, you can get the tapped `DateTime` details of header, view header and calendar cell using `OnTap` event of the calendar.

<img alt="Getting datetime details from calendar element"  src="https://github.com/SyncfusionExamples/getting-datetime-calendar-fluter/blob/master/screenshots/getting%20calendar%20element%20details.gif" width="250" height="400" />|

## Step 1
In initState(), set the default values such as view, alert dialog texts.
```xml
CalendarView _calendarView;
String _text, _titleText;

@override
void initState() {
  _calendarView = CalendarView.week;
  _text='';
  _titleText='';
  super.initState();
}
```
## Step 2
Trigger `onTap` callback of flutter calendar. Please find the following code for calendar.
```xml
Expanded(
  child: SfCalendar(
    viewHeaderStyle:
    ViewHeaderStyle(backgroundColor: viewHeaderColor),
    backgroundColor: calendarColor,
    view: _calendarView,
    onTap: calendarTapped,
  ),
 ),
```

## Step 3
Using `OnTap` event get the target tapped element details such as header, view header, time slots, agenda view and get the date time values from the callback and assign it to the content of the alert dialog widget.
```xml
void calendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.header) {
      _text = DateFormat('MMMM yyyy')
          .format(details.date)
          .toString();
      _titleText='Header';
    }
    else if (details.targetElement == CalendarElement.viewHeader) {
      _text = DateFormat('EEEE dd, MMMM yyyy')
          .format(details.date)
          .toString();
      _titleText='View Header';
    }
    else if (details.targetElement == CalendarElement.calendarCell) {
      _text = DateFormat('EEEE dd, MMMM yyyy')
          .format(details.date)
          .toString();
      _titleText='Time slots';
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
```
**[View document in Syncfusion Flutter Knowledge base](https://www.syncfusion.com/kb/10998/how-to-get-datetime-details-while-tapping-the-flutter-event-calendar-elements)**
**Screenshots**


<img alt="header"  src="https://github.com/SyncfusionExamples/getting-datetime-calendar-fluter/blob/master/screenshots/header.jpg" width="250" height="400" />|
<img alt="view header"  src="https://github.com/SyncfusionExamples/getting-datetime-calendar-fluter/blob/master/screenshots/view%20header.jpg" width="250" height="400" />|
<img alt="cells"  src="https://github.com/SyncfusionExamples/getting-datetime-calendar-fluter/blob/master/screenshots/cells.jpg" width="250" height="400" />|

import 'package:digicoach/src/features/calendar/bloc/utils.dart';
import 'package:digicoach/src/features/calendar/data/calendar_event_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

final calendarController =
    ChangeNotifierProvider<CalendarController>((_) => CalendarController());

class CalendarController extends ChangeNotifier {
  bool showCalendarBottomSheet = false;

  late ValueNotifier<List<Event>>? selectedEvents;
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date

  DateTime? rangeStart;
  DateTime? rangeEnd;

  ///define calander variable
  DateTime? selectedDay; //= DateTime.now();
  DateTime focusedDay = DateTime.now();

  //handling events in calendar
  Map<DateTime, List<dynamic>>? events;

  void initialized() {
    selectedDay = focusedDay;
    selectedEvents = ValueNotifier(getEventsForDay(selectedDay!));
  }

  List<Event> getEventsForDay(DateTime day) {
    showCalendarBottomSheet = false;
    final val = kEvents[day] ?? [];
    if (val.isNotEmpty) {
      showCalendarBottomSheet = true;
    }

    // Implementation example
    return val;
  }

  List<Event> getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ...getEventsForDay(d),
    ];
  }

  void onDaySelected(DateTime sDay, DateTime fday) {
    if (!isSameDay(selectedDay, sDay)) {
      selectedDay = sDay;
      focusedDay = fday;
      rangeStart = null; // Important to clean those
      rangeEnd = null;
      rangeSelectionMode = RangeSelectionMode.toggledOff;
      selectedEvents!.value = getEventsForDay(sDay);
      notifyListeners();
    }
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    selectedDay = null;
    focusedDay = focusedDay;
    rangeStart = start;
    rangeEnd = end;
    rangeSelectionMode = RangeSelectionMode.toggledOn;

    // `start` or `end` could be null
    if (start != null && end != null) {
      selectedEvents!.value = getEventsForRange(start, end);
    } else if (start != null) {
      selectedEvents!.value = getEventsForDay(start);
    } else if (end != null) {
      selectedEvents!.value = getEventsForDay(end);
    }
    notifyListeners();
  }

  //changeUI selected files
  void changeUserSelectedDate(DateTime selectDay, DateTime foucsDay) {
    selectedDay = selectDay;
    focusedDay = foucsDay;
    notifyListeners();
  }

  List<CalendarEventModel> calendarModelList = [
    CalendarEventModel(
      id: 1,
      coachName: 'Bessie Cooper',
      endTime: "12:00 PM",
      eventType: 'Yoga ',
      notification: true,
      startTime: "12:00 AM",
    ),
    CalendarEventModel(
      id: 1,
      coachName: 'Bessie Cooper',
      endTime: "12:00 PM",
      eventType: 'Yoga ',
      notification: false,
      startTime: "12:00 AM",
    ),
  ];
}

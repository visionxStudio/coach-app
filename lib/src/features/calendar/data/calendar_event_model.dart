class CalendarEventModel {
  final int id;
  final String eventType;
  final String coachName;
  final String startTime;
  final String endTime;
  final bool notification;

  CalendarEventModel({
    required this.id,
    required this.eventType,
    required this.coachName,
    required this.startTime,
    required this.endTime,
    required this.notification,
  });
}

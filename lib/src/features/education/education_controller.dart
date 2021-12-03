import 'package:digicoach/src/features/calendar/calendar_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final educationProvider =
    ChangeNotifierProvider<EducationProvider>((_) => EducationProvider());

class EducationProvider extends ChangeNotifier {
  ///check whether favirot tab is selected or not.
  bool isFavorisSelectTab = true;

  //Calendar informatioin
  CalendarController controller = CalendarController();
  Map<DateTime, List<dynamic>>? events = {};
  List<dynamic>? selectedEvents = [];
  TextEditingController? eventController = TextEditingController();
  //SharedPreferences prefs;

  void changeFavoritSelectTab() {
    isFavorisSelectTab = !isFavorisSelectTab;
    notifyListeners();
  }
}

import 'package:digicoach/src/features/booking/page/booking_checkout_page.dart';
import 'package:digicoach/src/features/booking/page/booking_date_page.dart';
import 'package:digicoach/src/features/booking/page/booking_payment_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookingProvider = ChangeNotifierProvider((_) => BookingProvider());

class BookingProvider extends ChangeNotifier {
  //display current page of the booking widget
  int bookingActivePageIndex = 0;

  ///identified current page
  PageController bookingPageController = PageController();
  List<Widget> bookingList = const [
    BookingPage0(),
    BookingPaymentPage(),
    BookingCheckoutPage(),
  ];

  void changeBookingPage(int page) {
    bookingActivePageIndex = page;
    notifyListeners();
  }
}

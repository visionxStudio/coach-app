// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i44;
import 'package:flutter/material.dart' as _i45;

import '../features/add_payment/add_payment_page.dart' as _i40;
import '../features/add_profile_method/add_profile_method_page.dart' as _i34;
import '../features/appointment/appointment_page.dart' as _i15;
import '../features/auth/avatar/avatar_page.dart' as _i9;
import '../features/auth/new_auth/connect_account/account_connect_page.dart'
    as _i5;
import '../features/auth/new_auth/connect_account_with_email/connect_account_with_email.dart'
    as _i27;
import '../features/auth/new_auth/details_page/details_page.dart' as _i7;
import '../features/auth/new_auth/mobile_number_page/mobile_number_page.dart'
    as _i3;
import '../features/auth/new_auth/otp_page/otp_page.dart' as _i4;
import '../features/auth/new_auth/select_profile_page/select_profile_page.dart'
    as _i6;
import '../features/auth/new_auth/welcome_page/welcome_page.dart' as _i2;
import '../features/avis/avis_page.dart' as _i12;
import '../features/bio/bio_page.dart' as _i30;
import '../features/booking/booking_page.dart' as _i10;
import '../features/change_mobile_number.dart/change_mobile_number.dart'
    as _i39;
import '../features/coach_details/coach_gender/coach_gender_page.dart' as _i23;
import '../features/coach_details/details_coach/details_coach_page.dart'
    as _i22;
import '../features/coach_documents/coach_documents_page.dart' as _i24;
import '../features/coach_profile/coach_profile_page.dart' as _i32;
import '../features/coach_statistics/coach_statistics_page.dart' as _i36;
import '../features/confirmpayment/confirm_payment_page.dart' as _i18;
import '../features/course/course_selection_page.dart' as _i21;
import '../features/course_type/course_type_page.dart' as _i26;
import '../features/finishedpayment/finished_payment_page.dart' as _i19;
import '../features/goal/goal_page.dart' as _i29;
import '../features/map/map_page.dart' as _i16;
import '../features/message/chat/chat_page.dart' as _i42;
import '../features/message/message_page.dart' as _i43;
import '../features/my_appointments/my_appointments.dart' as _i20;
import '../features/navbar/navbar.dart' as _i8;
import '../features/newpayment/newpayment_page.dart' as _i17;
import '../features/notifications/notification_page.dart' as _i14;
import '../features/otp_verification/otp_verification.dart' as _i38;
import '../features/payment_history/payment_history_page.dart' as _i13;
import '../features/profile_modify/profile_modify_page.dart' as _i28;
import '../features/profile_parameter/profile_parameter_page.dart' as _i11;
import '../features/profile_personal_information/profile_personal_information_page.dart'
    as _i33;
import '../features/rating/rating_page.dart' as _i37;
import '../features/redeem_digicoin/redeem_digicoin_page.dart' as _i35;
import '../features/select_course_preference/select_course_preference_page.dart'
    as _i25;
import '../features/setting_page/settings_page.dart' as _i41;
import '../features/splash/digi_splash.dart' as _i1;
import '../features/wellbeign/wellbeing_page.dart' as _i31;

class AppRouter extends _i44.RootStackRouter {
  AppRouter([_i45.GlobalKey<_i45.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i44.PageFactory> pagesMap = {
    DigiCoachSplashRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DigiCoachSplash());
    },
    WelcomePageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.WelcomePage());
    },
    MobileNumberPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MobileNumberPage());
    },
    OtpPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.OtpPage());
    },
    AccountConnectPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.AccountConnectPage());
    },
    SelectProfilePageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SelectProfilePage());
    },
    DetailsPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.DetailsPage());
    },
    NavBarRoute.name: (routeData) {
      final args = routeData.argsAs<NavBarRouteArgs>(
          orElse: () => const NavBarRouteArgs());
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.NavBar(key: args.key, activeNavPage: args.activeNavPage));
    },
    AvatarPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.AvatarPage());
    },
    BookingPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.BookingPage());
    },
    ProfileParameterPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ProfileParameterPage());
    },
    AvisPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.AvisPage());
    },
    PaymentHistoryPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.PaymentHistoryPage());
    },
    NotificationpageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.Notificationpage());
    },
    AppointmentPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.AppointmentPage());
    },
    MapPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.MapPage());
    },
    NewPaymentPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.NewPaymentPage());
    },
    ConfirmPaymentPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.ConfirmPaymentPage());
    },
    FinishedPaymentPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.FinishedPaymentPage());
    },
    MyAppointmentsPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.MyAppointmentsPage());
    },
    CourseSelectionPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.CourseSelectionPage());
    },
    DetailsCoachPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.DetailsCoachPage());
    },
    CoachGenderPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.CoachGenderPage());
    },
    CoachDocumentsPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.CoachDocumentsPage());
    },
    SelectCoursePreferencePageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.SelectCoursePreferencePage());
    },
    SelectCourseTypePageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i26.SelectCourseTypePage());
    },
    ConnectAccountWithEmailRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i27.ConnectAccountWithEmail());
    },
    ProfileModifyPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i28.ProfileModifyPage());
    },
    GoalPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i29.GoalPage());
    },
    BioPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i30.BioPage());
    },
    WellbeingPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i31.WellbeingPage());
    },
    CoachProfilePageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i32.CoachProfilePage());
    },
    ProfilePersonalInofrmationPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i33.ProfilePersonalInofrmationPage());
    },
    AddProfileMethodPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i34.AddProfileMethodPage());
    },
    RedeemDigicoinPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i35.RedeemDigicoinPage());
    },
    CoachStatisticsPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i36.CoachStatisticsPage());
    },
    RatingPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i37.RatingPage());
    },
    OtpVerificationPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i38.OtpVerificationPage());
    },
    ChangeMobileNumberPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i39.ChangeMobileNumberPage());
    },
    AddPaymentPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i40.AddPaymentPage());
    },
    SettingsPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i41.SettingsPage());
    },
    ChatPageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i42.ChatPage());
    },
    MessagePageRoute.name: (routeData) {
      return _i44.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i43.MessagePage());
    }
  };

  @override
  List<_i44.RouteConfig> get routes => [
        _i44.RouteConfig(DigiCoachSplashRoute.name, path: '/'),
        _i44.RouteConfig(WelcomePageRoute.name, path: '/welcome-page'),
        _i44.RouteConfig(MobileNumberPageRoute.name,
            path: '/mobile-number-page'),
        _i44.RouteConfig(OtpPageRoute.name, path: '/otp-page'),
        _i44.RouteConfig(AccountConnectPageRoute.name,
            path: '/account-connect-page'),
        _i44.RouteConfig(SelectProfilePageRoute.name,
            path: '/select-profile-page'),
        _i44.RouteConfig(DetailsPageRoute.name, path: '/details-page'),
        _i44.RouteConfig(NavBarRoute.name, path: '/nav-bar'),
        _i44.RouteConfig(AvatarPageRoute.name, path: '/avatar-page'),
        _i44.RouteConfig(BookingPageRoute.name, path: '/booking-page'),
        _i44.RouteConfig(ProfileParameterPageRoute.name,
            path: '/profile-parameter-page'),
        _i44.RouteConfig(AvisPageRoute.name, path: '/avis-page'),
        _i44.RouteConfig(PaymentHistoryPageRoute.name,
            path: '/payment-history-page'),
        _i44.RouteConfig(NotificationpageRoute.name, path: '/Notificationpage'),
        _i44.RouteConfig(AppointmentPageRoute.name, path: '/appointment-page'),
        _i44.RouteConfig(MapPageRoute.name, path: '/map-page'),
        _i44.RouteConfig(NewPaymentPageRoute.name, path: '/new-payment-page'),
        _i44.RouteConfig(ConfirmPaymentPageRoute.name,
            path: '/confirm-payment-page'),
        _i44.RouteConfig(FinishedPaymentPageRoute.name,
            path: '/finished-payment-page'),
        _i44.RouteConfig(MyAppointmentsPageRoute.name,
            path: '/my-appointments-page'),
        _i44.RouteConfig(CourseSelectionPageRoute.name,
            path: '/course-selection-page'),
        _i44.RouteConfig(DetailsCoachPageRoute.name,
            path: '/details-coach-page'),
        _i44.RouteConfig(CoachGenderPageRoute.name, path: '/coach-gender-page'),
        _i44.RouteConfig(CoachDocumentsPageRoute.name,
            path: '/coach-documents-page'),
        _i44.RouteConfig(SelectCoursePreferencePageRoute.name,
            path: '/select-course-preference-page'),
        _i44.RouteConfig(SelectCourseTypePageRoute.name,
            path: '/select-course-type-page'),
        _i44.RouteConfig(ConnectAccountWithEmailRoute.name,
            path: '/connect-account-with-email'),
        _i44.RouteConfig(ProfileModifyPageRoute.name,
            path: '/profile-modify-page'),
        _i44.RouteConfig(GoalPageRoute.name, path: '/goal-page'),
        _i44.RouteConfig(BioPageRoute.name, path: '/bio-page'),
        _i44.RouteConfig(WellbeingPageRoute.name, path: '/wellbeing-page'),
        _i44.RouteConfig(CoachProfilePageRoute.name,
            path: '/coach-profile-page'),
        _i44.RouteConfig(ProfilePersonalInofrmationPageRoute.name,
            path: '/profile-personal-inofrmation-page'),
        _i44.RouteConfig(AddProfileMethodPageRoute.name,
            path: '/add-profile-method-page'),
        _i44.RouteConfig(RedeemDigicoinPageRoute.name,
            path: '/redeem-digicoin-page'),
        _i44.RouteConfig(CoachStatisticsPageRoute.name,
            path: '/coach-statistics-page'),
        _i44.RouteConfig(RatingPageRoute.name, path: '/rating-page'),
        _i44.RouteConfig(OtpVerificationPageRoute.name,
            path: '/otp-verification-page'),
        _i44.RouteConfig(ChangeMobileNumberPageRoute.name,
            path: '/change-mobile-number-page'),
        _i44.RouteConfig(AddPaymentPageRoute.name, path: '/add-payment-page'),
        _i44.RouteConfig(SettingsPageRoute.name, path: '/settings-page'),
        _i44.RouteConfig(ChatPageRoute.name, path: '/chat-page'),
        _i44.RouteConfig(MessagePageRoute.name, path: '/message-page')
      ];
}

/// generated route for
/// [_i1.DigiCoachSplash]
class DigiCoachSplashRoute extends _i44.PageRouteInfo<void> {
  const DigiCoachSplashRoute() : super(DigiCoachSplashRoute.name, path: '/');

  static const String name = 'DigiCoachSplashRoute';
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomePageRoute extends _i44.PageRouteInfo<void> {
  const WelcomePageRoute()
      : super(WelcomePageRoute.name, path: '/welcome-page');

  static const String name = 'WelcomePageRoute';
}

/// generated route for
/// [_i3.MobileNumberPage]
class MobileNumberPageRoute extends _i44.PageRouteInfo<void> {
  const MobileNumberPageRoute()
      : super(MobileNumberPageRoute.name, path: '/mobile-number-page');

  static const String name = 'MobileNumberPageRoute';
}

/// generated route for
/// [_i4.OtpPage]
class OtpPageRoute extends _i44.PageRouteInfo<void> {
  const OtpPageRoute() : super(OtpPageRoute.name, path: '/otp-page');

  static const String name = 'OtpPageRoute';
}

/// generated route for
/// [_i5.AccountConnectPage]
class AccountConnectPageRoute extends _i44.PageRouteInfo<void> {
  const AccountConnectPageRoute()
      : super(AccountConnectPageRoute.name, path: '/account-connect-page');

  static const String name = 'AccountConnectPageRoute';
}

/// generated route for
/// [_i6.SelectProfilePage]
class SelectProfilePageRoute extends _i44.PageRouteInfo<void> {
  const SelectProfilePageRoute()
      : super(SelectProfilePageRoute.name, path: '/select-profile-page');

  static const String name = 'SelectProfilePageRoute';
}

/// generated route for
/// [_i7.DetailsPage]
class DetailsPageRoute extends _i44.PageRouteInfo<void> {
  const DetailsPageRoute()
      : super(DetailsPageRoute.name, path: '/details-page');

  static const String name = 'DetailsPageRoute';
}

/// generated route for
/// [_i8.NavBar]
class NavBarRoute extends _i44.PageRouteInfo<NavBarRouteArgs> {
  NavBarRoute(
      {_i45.Key? key, _i8.NavBarPage activeNavPage = _i8.NavBarPage.dashboard})
      : super(NavBarRoute.name,
            path: '/nav-bar',
            args: NavBarRouteArgs(key: key, activeNavPage: activeNavPage));

  static const String name = 'NavBarRoute';
}

class NavBarRouteArgs {
  const NavBarRouteArgs(
      {this.key, this.activeNavPage = _i8.NavBarPage.dashboard});

  final _i45.Key? key;

  final _i8.NavBarPage activeNavPage;

  @override
  String toString() {
    return 'NavBarRouteArgs{key: $key, activeNavPage: $activeNavPage}';
  }
}

/// generated route for
/// [_i9.AvatarPage]
class AvatarPageRoute extends _i44.PageRouteInfo<void> {
  const AvatarPageRoute() : super(AvatarPageRoute.name, path: '/avatar-page');

  static const String name = 'AvatarPageRoute';
}

/// generated route for
/// [_i10.BookingPage]
class BookingPageRoute extends _i44.PageRouteInfo<void> {
  const BookingPageRoute()
      : super(BookingPageRoute.name, path: '/booking-page');

  static const String name = 'BookingPageRoute';
}

/// generated route for
/// [_i11.ProfileParameterPage]
class ProfileParameterPageRoute extends _i44.PageRouteInfo<void> {
  const ProfileParameterPageRoute()
      : super(ProfileParameterPageRoute.name, path: '/profile-parameter-page');

  static const String name = 'ProfileParameterPageRoute';
}

/// generated route for
/// [_i12.AvisPage]
class AvisPageRoute extends _i44.PageRouteInfo<void> {
  const AvisPageRoute() : super(AvisPageRoute.name, path: '/avis-page');

  static const String name = 'AvisPageRoute';
}

/// generated route for
/// [_i13.PaymentHistoryPage]
class PaymentHistoryPageRoute extends _i44.PageRouteInfo<void> {
  const PaymentHistoryPageRoute()
      : super(PaymentHistoryPageRoute.name, path: '/payment-history-page');

  static const String name = 'PaymentHistoryPageRoute';
}

/// generated route for
/// [_i14.Notificationpage]
class NotificationpageRoute extends _i44.PageRouteInfo<void> {
  const NotificationpageRoute()
      : super(NotificationpageRoute.name, path: '/Notificationpage');

  static const String name = 'NotificationpageRoute';
}

/// generated route for
/// [_i15.AppointmentPage]
class AppointmentPageRoute extends _i44.PageRouteInfo<void> {
  const AppointmentPageRoute()
      : super(AppointmentPageRoute.name, path: '/appointment-page');

  static const String name = 'AppointmentPageRoute';
}

/// generated route for
/// [_i16.MapPage]
class MapPageRoute extends _i44.PageRouteInfo<void> {
  const MapPageRoute() : super(MapPageRoute.name, path: '/map-page');

  static const String name = 'MapPageRoute';
}

/// generated route for
/// [_i17.NewPaymentPage]
class NewPaymentPageRoute extends _i44.PageRouteInfo<void> {
  const NewPaymentPageRoute()
      : super(NewPaymentPageRoute.name, path: '/new-payment-page');

  static const String name = 'NewPaymentPageRoute';
}

/// generated route for
/// [_i18.ConfirmPaymentPage]
class ConfirmPaymentPageRoute extends _i44.PageRouteInfo<void> {
  const ConfirmPaymentPageRoute()
      : super(ConfirmPaymentPageRoute.name, path: '/confirm-payment-page');

  static const String name = 'ConfirmPaymentPageRoute';
}

/// generated route for
/// [_i19.FinishedPaymentPage]
class FinishedPaymentPageRoute extends _i44.PageRouteInfo<void> {
  const FinishedPaymentPageRoute()
      : super(FinishedPaymentPageRoute.name, path: '/finished-payment-page');

  static const String name = 'FinishedPaymentPageRoute';
}

/// generated route for
/// [_i20.MyAppointmentsPage]
class MyAppointmentsPageRoute extends _i44.PageRouteInfo<void> {
  const MyAppointmentsPageRoute()
      : super(MyAppointmentsPageRoute.name, path: '/my-appointments-page');

  static const String name = 'MyAppointmentsPageRoute';
}

/// generated route for
/// [_i21.CourseSelectionPage]
class CourseSelectionPageRoute extends _i44.PageRouteInfo<void> {
  const CourseSelectionPageRoute()
      : super(CourseSelectionPageRoute.name, path: '/course-selection-page');

  static const String name = 'CourseSelectionPageRoute';
}

/// generated route for
/// [_i22.DetailsCoachPage]
class DetailsCoachPageRoute extends _i44.PageRouteInfo<void> {
  const DetailsCoachPageRoute()
      : super(DetailsCoachPageRoute.name, path: '/details-coach-page');

  static const String name = 'DetailsCoachPageRoute';
}

/// generated route for
/// [_i23.CoachGenderPage]
class CoachGenderPageRoute extends _i44.PageRouteInfo<void> {
  const CoachGenderPageRoute()
      : super(CoachGenderPageRoute.name, path: '/coach-gender-page');

  static const String name = 'CoachGenderPageRoute';
}

/// generated route for
/// [_i24.CoachDocumentsPage]
class CoachDocumentsPageRoute extends _i44.PageRouteInfo<void> {
  const CoachDocumentsPageRoute()
      : super(CoachDocumentsPageRoute.name, path: '/coach-documents-page');

  static const String name = 'CoachDocumentsPageRoute';
}

/// generated route for
/// [_i25.SelectCoursePreferencePage]
class SelectCoursePreferencePageRoute extends _i44.PageRouteInfo<void> {
  const SelectCoursePreferencePageRoute()
      : super(SelectCoursePreferencePageRoute.name,
            path: '/select-course-preference-page');

  static const String name = 'SelectCoursePreferencePageRoute';
}

/// generated route for
/// [_i26.SelectCourseTypePage]
class SelectCourseTypePageRoute extends _i44.PageRouteInfo<void> {
  const SelectCourseTypePageRoute()
      : super(SelectCourseTypePageRoute.name, path: '/select-course-type-page');

  static const String name = 'SelectCourseTypePageRoute';
}

/// generated route for
/// [_i27.ConnectAccountWithEmail]
class ConnectAccountWithEmailRoute extends _i44.PageRouteInfo<void> {
  const ConnectAccountWithEmailRoute()
      : super(ConnectAccountWithEmailRoute.name,
            path: '/connect-account-with-email');

  static const String name = 'ConnectAccountWithEmailRoute';
}

/// generated route for
/// [_i28.ProfileModifyPage]
class ProfileModifyPageRoute extends _i44.PageRouteInfo<void> {
  const ProfileModifyPageRoute()
      : super(ProfileModifyPageRoute.name, path: '/profile-modify-page');

  static const String name = 'ProfileModifyPageRoute';
}

/// generated route for
/// [_i29.GoalPage]
class GoalPageRoute extends _i44.PageRouteInfo<void> {
  const GoalPageRoute() : super(GoalPageRoute.name, path: '/goal-page');

  static const String name = 'GoalPageRoute';
}

/// generated route for
/// [_i30.BioPage]
class BioPageRoute extends _i44.PageRouteInfo<void> {
  const BioPageRoute() : super(BioPageRoute.name, path: '/bio-page');

  static const String name = 'BioPageRoute';
}

/// generated route for
/// [_i31.WellbeingPage]
class WellbeingPageRoute extends _i44.PageRouteInfo<void> {
  const WellbeingPageRoute()
      : super(WellbeingPageRoute.name, path: '/wellbeing-page');

  static const String name = 'WellbeingPageRoute';
}

/// generated route for
/// [_i32.CoachProfilePage]
class CoachProfilePageRoute extends _i44.PageRouteInfo<void> {
  const CoachProfilePageRoute()
      : super(CoachProfilePageRoute.name, path: '/coach-profile-page');

  static const String name = 'CoachProfilePageRoute';
}

/// generated route for
/// [_i33.ProfilePersonalInofrmationPage]
class ProfilePersonalInofrmationPageRoute extends _i44.PageRouteInfo<void> {
  const ProfilePersonalInofrmationPageRoute()
      : super(ProfilePersonalInofrmationPageRoute.name,
            path: '/profile-personal-inofrmation-page');

  static const String name = 'ProfilePersonalInofrmationPageRoute';
}

/// generated route for
/// [_i34.AddProfileMethodPage]
class AddProfileMethodPageRoute extends _i44.PageRouteInfo<void> {
  const AddProfileMethodPageRoute()
      : super(AddProfileMethodPageRoute.name, path: '/add-profile-method-page');

  static const String name = 'AddProfileMethodPageRoute';
}

/// generated route for
/// [_i35.RedeemDigicoinPage]
class RedeemDigicoinPageRoute extends _i44.PageRouteInfo<void> {
  const RedeemDigicoinPageRoute()
      : super(RedeemDigicoinPageRoute.name, path: '/redeem-digicoin-page');

  static const String name = 'RedeemDigicoinPageRoute';
}

/// generated route for
/// [_i36.CoachStatisticsPage]
class CoachStatisticsPageRoute extends _i44.PageRouteInfo<void> {
  const CoachStatisticsPageRoute()
      : super(CoachStatisticsPageRoute.name, path: '/coach-statistics-page');

  static const String name = 'CoachStatisticsPageRoute';
}

/// generated route for
/// [_i37.RatingPage]
class RatingPageRoute extends _i44.PageRouteInfo<void> {
  const RatingPageRoute() : super(RatingPageRoute.name, path: '/rating-page');

  static const String name = 'RatingPageRoute';
}

/// generated route for
/// [_i38.OtpVerificationPage]
class OtpVerificationPageRoute extends _i44.PageRouteInfo<void> {
  const OtpVerificationPageRoute()
      : super(OtpVerificationPageRoute.name, path: '/otp-verification-page');

  static const String name = 'OtpVerificationPageRoute';
}

/// generated route for
/// [_i39.ChangeMobileNumberPage]
class ChangeMobileNumberPageRoute extends _i44.PageRouteInfo<void> {
  const ChangeMobileNumberPageRoute()
      : super(ChangeMobileNumberPageRoute.name,
            path: '/change-mobile-number-page');

  static const String name = 'ChangeMobileNumberPageRoute';
}

/// generated route for
/// [_i40.AddPaymentPage]
class AddPaymentPageRoute extends _i44.PageRouteInfo<void> {
  const AddPaymentPageRoute()
      : super(AddPaymentPageRoute.name, path: '/add-payment-page');

  static const String name = 'AddPaymentPageRoute';
}

/// generated route for
/// [_i41.SettingsPage]
class SettingsPageRoute extends _i44.PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(SettingsPageRoute.name, path: '/settings-page');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i42.ChatPage]
class ChatPageRoute extends _i44.PageRouteInfo<void> {
  const ChatPageRoute() : super(ChatPageRoute.name, path: '/chat-page');

  static const String name = 'ChatPageRoute';
}

/// generated route for
/// [_i43.MessagePage]
class MessagePageRoute extends _i44.PageRouteInfo<void> {
  const MessagePageRoute()
      : super(MessagePageRoute.name, path: '/message-page');

  static const String name = 'MessagePageRoute';
}

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i29;
import 'package:flutter/material.dart' as _i30;

import '../features/auth/avatar/avatar_page.dart' as _i18;
import '../features/auth/login/login_page.dart' as _i8;
import '../features/auth/new_auth/connect_account/account_connect_page.dart'
    as _i5;
import '../features/auth/new_auth/details_page/details_page.dart' as _i7;
import '../features/auth/new_auth/mobile_number_page/mobile_number_page.dart'
    as _i3;
import '../features/auth/new_auth/otp_page/otp_page.dart' as _i4;
import '../features/auth/new_auth/select_profile_page/select_profile_page.dart'
    as _i6;
import '../features/auth/new_auth/welcome_page/welcome_page.dart' as _i2;
import '../features/auth/onboarding/onboarding_main_page.dart' as _i9;
import '../features/auth/password_reset/otp/otp_page.dart' as _i16;
import '../features/auth/password_reset/pass_reset.dart' as _i11;
import '../features/auth/password_reset/pass_reset_number.dart' as _i10;
import '../features/auth/signup/personal_page.dart' as _i17;
import '../features/auth/signup/signup_page.dart' as _i12;
import '../features/avis/avis_page.dart' as _i25;
import '../features/booking/booking_page.dart' as _i19;
import '../features/main_dashboard_container/data/coach_student_detail_model.dart'
    as _i31;
import '../features/navbar/navbar.dart' as _i15;
import '../features/notifications/notification_page.dart' as _i28;
import '../features/parameter/parameter_page.dart' as _i27;
import '../features/payment_history/payment_history_page.dart' as _i26;
import '../features/profile/coach_profile_page.dart' as _i13;
import '../features/profile/student_profile_page.dart' as _i14;
import '../features/profile_modification/profile_setting_modification_page.dart'
    as _i23;
import '../features/profile_parameter/profile_parameter_page.dart' as _i24;
import '../features/profile_personal_information/profile_personal_information_page.dart'
    as _i22;
import '../features/profile_setting/coach_profile_setting_page.dart' as _i20;
import '../features/profile_setting/student_profile_setting_page.dart' as _i21;
import '../features/splash/digi_splash.dart' as _i1;

class AppRouter extends _i29.RootStackRouter {
  AppRouter([_i30.GlobalKey<_i30.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i29.PageFactory> pagesMap = {
    DigiCoachSplashRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DigiCoachSplash());
    },
    WelcomePageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.WelcomePage());
    },
    MobileNumberPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MobileNumberPage());
    },
    OtpPage2Route.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.OtpPage2());
    },
    AccountConnectPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.AccountConnectPage());
    },
    SelectProfilePageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SelectProfilePage());
    },
    DetailsPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.DetailsPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.LoginPage());
    },
    OnBoardingMainPageRoute.name: (routeData) {
      final args = routeData.argsAs<OnBoardingMainPageRouteArgs>(
          orElse: () => const OnBoardingMainPageRouteArgs());
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.OnBoardingMainPage(key: args.key));
    },
    PassResetNumberPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.PassResetNumberPage());
    },
    ResetPasswordPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ResetPasswordPage());
    },
    SignupPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.SignupPage());
    },
    CoachProfilePageRoute.name: (routeData) {
      final args = routeData.argsAs<CoachProfilePageRouteArgs>();
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.CoachProfilePage(key: args.key, model: args.model));
    },
    StudentProfilePageRoute.name: (routeData) {
      final args = routeData.argsAs<StudentProfilePageRouteArgs>();
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.StudentProfilePage(key: args.key, model: args.model));
    },
    NavBarRoute.name: (routeData) {
      final args = routeData.argsAs<NavBarRouteArgs>(
          orElse: () => const NavBarRouteArgs());
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i15.NavBar(key: args.key, activeNavPage: args.activeNavPage));
    },
    OTPPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.OTPPage());
    },
    PersonalInfoPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.PersonalInfoPage());
    },
    AvatarPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.AvatarPage());
    },
    BookingPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.BookingPage());
    },
    CoachProfileSettingPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.CoachProfileSettingPage());
    },
    StudentProfileSettingPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.StudentProfileSettingPage());
    },
    ProfilePersonalInformationPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i22.ProfilePersonalInformationPage());
    },
    ProfileModificationPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.ProfileModificationPage());
    },
    ProfileParameterPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.ProfileParameterPage());
    },
    AvisPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.AvisPage());
    },
    PaymentHistoryPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i26.PaymentHistoryPage());
    },
    ParameterPageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i27.ParameterPage());
    },
    NotificationpageRoute.name: (routeData) {
      return _i29.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i28.Notificationpage());
    }
  };

  @override
  List<_i29.RouteConfig> get routes => [
        _i29.RouteConfig(DigiCoachSplashRoute.name, path: '/'),
        _i29.RouteConfig(WelcomePageRoute.name, path: '/welcome-page'),
        _i29.RouteConfig(MobileNumberPageRoute.name,
            path: '/mobile-number-page'),
        _i29.RouteConfig(OtpPage2Route.name, path: '/otp-page2'),
        _i29.RouteConfig(AccountConnectPageRoute.name,
            path: '/account-connect-page'),
        _i29.RouteConfig(SelectProfilePageRoute.name,
            path: '/select-profile-page'),
        _i29.RouteConfig(DetailsPageRoute.name, path: '/details-page'),
        _i29.RouteConfig(LoginPageRoute.name, path: '/login-page'),
        _i29.RouteConfig(OnBoardingMainPageRoute.name,
            path: '/on-boarding-main-page'),
        _i29.RouteConfig(PassResetNumberPageRoute.name,
            path: '/pass-reset-number-page'),
        _i29.RouteConfig(ResetPasswordPageRoute.name,
            path: '/reset-password-page'),
        _i29.RouteConfig(SignupPageRoute.name, path: '/signup-page'),
        _i29.RouteConfig(CoachProfilePageRoute.name,
            path: '/coach-profile-page'),
        _i29.RouteConfig(StudentProfilePageRoute.name,
            path: '/student-profile-page'),
        _i29.RouteConfig(NavBarRoute.name, path: '/nav-bar'),
        _i29.RouteConfig(OTPPageRoute.name, path: '/o-tp-page'),
        _i29.RouteConfig(SignupPageRoute.name, path: '/signup-page'),
        _i29.RouteConfig(PersonalInfoPageRoute.name,
            path: '/personal-info-page'),
        _i29.RouteConfig(AvatarPageRoute.name, path: '/avatar-page'),
        _i29.RouteConfig(BookingPageRoute.name, path: '/booking-page'),
        _i29.RouteConfig(CoachProfileSettingPageRoute.name,
            path: '/coach-profile-setting-page'),
        _i29.RouteConfig(StudentProfileSettingPageRoute.name,
            path: '/student-profile-setting-page'),
        _i29.RouteConfig(ProfilePersonalInformationPageRoute.name,
            path: '/profile-personal-information-page'),
        _i29.RouteConfig(ProfileModificationPageRoute.name,
            path: '/profile-modification-page'),
        _i29.RouteConfig(ProfileParameterPageRoute.name,
            path: '/profile-parameter-page'),
        _i29.RouteConfig(AvisPageRoute.name, path: '/avis-page'),
        _i29.RouteConfig(PaymentHistoryPageRoute.name,
            path: '/payment-history-page'),
        _i29.RouteConfig(ParameterPageRoute.name, path: '/parameter-page'),
        _i29.RouteConfig(NotificationpageRoute.name, path: '/Notificationpage')
      ];
}

/// generated route for [_i1.DigiCoachSplash]
class DigiCoachSplashRoute extends _i29.PageRouteInfo<void> {
  const DigiCoachSplashRoute() : super(name, path: '/');

  static const String name = 'DigiCoachSplashRoute';
}

/// generated route for [_i2.WelcomePage]
class WelcomePageRoute extends _i29.PageRouteInfo<void> {
  const WelcomePageRoute() : super(name, path: '/welcome-page');

  static const String name = 'WelcomePageRoute';
}

/// generated route for [_i3.MobileNumberPage]
class MobileNumberPageRoute extends _i29.PageRouteInfo<void> {
  const MobileNumberPageRoute() : super(name, path: '/mobile-number-page');

  static const String name = 'MobileNumberPageRoute';
}

/// generated route for [_i4.OtpPage2]
class OtpPage2Route extends _i29.PageRouteInfo<void> {
  const OtpPage2Route() : super(name, path: '/otp-page2');

  static const String name = 'OtpPage2Route';
}

/// generated route for [_i5.AccountConnectPage]
class AccountConnectPageRoute extends _i29.PageRouteInfo<void> {
  const AccountConnectPageRoute() : super(name, path: '/account-connect-page');

  static const String name = 'AccountConnectPageRoute';
}

/// generated route for [_i6.SelectProfilePage]
class SelectProfilePageRoute extends _i29.PageRouteInfo<void> {
  const SelectProfilePageRoute() : super(name, path: '/select-profile-page');

  static const String name = 'SelectProfilePageRoute';
}

/// generated route for [_i7.DetailsPage]
class DetailsPageRoute extends _i29.PageRouteInfo<void> {
  const DetailsPageRoute() : super(name, path: '/details-page');

  static const String name = 'DetailsPageRoute';
}

/// generated route for [_i8.LoginPage]
class LoginPageRoute extends _i29.PageRouteInfo<void> {
  const LoginPageRoute() : super(name, path: '/login-page');

  static const String name = 'LoginPageRoute';
}

/// generated route for [_i9.OnBoardingMainPage]
class OnBoardingMainPageRoute
    extends _i29.PageRouteInfo<OnBoardingMainPageRouteArgs> {
  OnBoardingMainPageRoute({_i30.Key? key})
      : super(name,
            path: '/on-boarding-main-page',
            args: OnBoardingMainPageRouteArgs(key: key));

  static const String name = 'OnBoardingMainPageRoute';
}

class OnBoardingMainPageRouteArgs {
  const OnBoardingMainPageRouteArgs({this.key});

  final _i30.Key? key;

  @override
  String toString() {
    return 'OnBoardingMainPageRouteArgs{key: $key}';
  }
}

/// generated route for [_i10.PassResetNumberPage]
class PassResetNumberPageRoute extends _i29.PageRouteInfo<void> {
  const PassResetNumberPageRoute()
      : super(name, path: '/pass-reset-number-page');

  static const String name = 'PassResetNumberPageRoute';
}

/// generated route for [_i11.ResetPasswordPage]
class ResetPasswordPageRoute extends _i29.PageRouteInfo<void> {
  const ResetPasswordPageRoute() : super(name, path: '/reset-password-page');

  static const String name = 'ResetPasswordPageRoute';
}

/// generated route for [_i12.SignupPage]
class SignupPageRoute extends _i29.PageRouteInfo<void> {
  const SignupPageRoute() : super(name, path: '/signup-page');

  static const String name = 'SignupPageRoute';
}

/// generated route for [_i13.CoachProfilePage]
class CoachProfilePageRoute
    extends _i29.PageRouteInfo<CoachProfilePageRouteArgs> {
  CoachProfilePageRoute({_i30.Key? key, required _i31.CoachStudentModel model})
      : super(name,
            path: '/coach-profile-page',
            args: CoachProfilePageRouteArgs(key: key, model: model));

  static const String name = 'CoachProfilePageRoute';
}

class CoachProfilePageRouteArgs {
  const CoachProfilePageRouteArgs({this.key, required this.model});

  final _i30.Key? key;

  final _i31.CoachStudentModel model;

  @override
  String toString() {
    return 'CoachProfilePageRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for [_i14.StudentProfilePage]
class StudentProfilePageRoute
    extends _i29.PageRouteInfo<StudentProfilePageRouteArgs> {
  StudentProfilePageRoute(
      {_i30.Key? key, required _i31.CoachStudentModel model})
      : super(name,
            path: '/student-profile-page',
            args: StudentProfilePageRouteArgs(key: key, model: model));

  static const String name = 'StudentProfilePageRoute';
}

class StudentProfilePageRouteArgs {
  const StudentProfilePageRouteArgs({this.key, required this.model});

  final _i30.Key? key;

  final _i31.CoachStudentModel model;

  @override
  String toString() {
    return 'StudentProfilePageRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for [_i15.NavBar]
class NavBarRoute extends _i29.PageRouteInfo<NavBarRouteArgs> {
  NavBarRoute(
      {_i30.Key? key,
      _i15.NavBarPage activeNavPage = _i15.NavBarPage.dashboard})
      : super(name,
            path: '/nav-bar',
            args: NavBarRouteArgs(key: key, activeNavPage: activeNavPage));

  static const String name = 'NavBarRoute';
}

class NavBarRouteArgs {
  const NavBarRouteArgs(
      {this.key, this.activeNavPage = _i15.NavBarPage.dashboard});

  final _i30.Key? key;

  final _i15.NavBarPage activeNavPage;

  @override
  String toString() {
    return 'NavBarRouteArgs{key: $key, activeNavPage: $activeNavPage}';
  }
}

/// generated route for [_i16.OTPPage]
class OTPPageRoute extends _i29.PageRouteInfo<void> {
  const OTPPageRoute() : super(name, path: '/o-tp-page');

  static const String name = 'OTPPageRoute';
}

/// generated route for [_i17.PersonalInfoPage]
class PersonalInfoPageRoute extends _i29.PageRouteInfo<void> {
  const PersonalInfoPageRoute() : super(name, path: '/personal-info-page');

  static const String name = 'PersonalInfoPageRoute';
}

/// generated route for [_i18.AvatarPage]
class AvatarPageRoute extends _i29.PageRouteInfo<void> {
  const AvatarPageRoute() : super(name, path: '/avatar-page');

  static const String name = 'AvatarPageRoute';
}

/// generated route for [_i19.BookingPage]
class BookingPageRoute extends _i29.PageRouteInfo<void> {
  const BookingPageRoute() : super(name, path: '/booking-page');

  static const String name = 'BookingPageRoute';
}

/// generated route for [_i20.CoachProfileSettingPage]
class CoachProfileSettingPageRoute extends _i29.PageRouteInfo<void> {
  const CoachProfileSettingPageRoute()
      : super(name, path: '/coach-profile-setting-page');

  static const String name = 'CoachProfileSettingPageRoute';
}

/// generated route for [_i21.StudentProfileSettingPage]
class StudentProfileSettingPageRoute extends _i29.PageRouteInfo<void> {
  const StudentProfileSettingPageRoute()
      : super(name, path: '/student-profile-setting-page');

  static const String name = 'StudentProfileSettingPageRoute';
}

/// generated route for [_i22.ProfilePersonalInformationPage]
class ProfilePersonalInformationPageRoute extends _i29.PageRouteInfo<void> {
  const ProfilePersonalInformationPageRoute()
      : super(name, path: '/profile-personal-information-page');

  static const String name = 'ProfilePersonalInformationPageRoute';
}

/// generated route for [_i23.ProfileModificationPage]
class ProfileModificationPageRoute extends _i29.PageRouteInfo<void> {
  const ProfileModificationPageRoute()
      : super(name, path: '/profile-modification-page');

  static const String name = 'ProfileModificationPageRoute';
}

/// generated route for [_i24.ProfileParameterPage]
class ProfileParameterPageRoute extends _i29.PageRouteInfo<void> {
  const ProfileParameterPageRoute()
      : super(name, path: '/profile-parameter-page');

  static const String name = 'ProfileParameterPageRoute';
}

/// generated route for [_i25.AvisPage]
class AvisPageRoute extends _i29.PageRouteInfo<void> {
  const AvisPageRoute() : super(name, path: '/avis-page');

  static const String name = 'AvisPageRoute';
}

/// generated route for [_i26.PaymentHistoryPage]
class PaymentHistoryPageRoute extends _i29.PageRouteInfo<void> {
  const PaymentHistoryPageRoute() : super(name, path: '/payment-history-page');

  static const String name = 'PaymentHistoryPageRoute';
}

/// generated route for [_i27.ParameterPage]
class ParameterPageRoute extends _i29.PageRouteInfo<void> {
  const ParameterPageRoute() : super(name, path: '/parameter-page');

  static const String name = 'ParameterPageRoute';
}

/// generated route for [_i28.Notificationpage]
class NotificationpageRoute extends _i29.PageRouteInfo<void> {
  const NotificationpageRoute() : super(name, path: '/Notificationpage');

  static const String name = 'NotificationpageRoute';
}

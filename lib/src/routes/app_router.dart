import 'package:auto_route/auto_route.dart';
import 'package:digicoach/src/features/auth/avatar/avatar_page.dart';
import 'package:digicoach/src/features/auth/new_auth/connect_account/account_connect_page.dart';
import 'package:digicoach/src/features/auth/new_auth/details_page/details_page.dart';
import 'package:digicoach/src/features/auth/new_auth/mobile_number_page/mobile_number_page.dart';
import 'package:digicoach/src/features/auth/new_auth/otp_page/otp_page.dart';
import 'package:digicoach/src/features/auth/new_auth/select_profile_page/select_profile_page.dart';
import 'package:digicoach/src/features/auth/new_auth/welcome_page/welcome_page.dart';
import 'package:digicoach/src/features/auth/password_reset/otp/otp_page.dart';
import 'package:digicoach/src/features/auth/signup/personal_page.dart';
import 'package:digicoach/src/features/avis/avis_page.dart';
import 'package:digicoach/src/features/booking/booking_page.dart';
import 'package:digicoach/src/features/navbar/navbar.dart';
import 'package:digicoach/src/features/notifications/notification_page.dart';
import 'package:digicoach/src/features/parameter/parameter_page.dart';
import 'package:digicoach/src/features/payment_history/payment_history_page.dart';
import 'package:digicoach/src/features/profile/coach_profile_page.dart';
import 'package:digicoach/src/features/auth/login/login_page.dart';
import 'package:digicoach/src/features/auth/onboarding/onboarding_main_page.dart';
import 'package:digicoach/src/features/auth/password_reset/pass_reset.dart';
import 'package:digicoach/src/features/auth/password_reset/pass_reset_number.dart';
import 'package:digicoach/src/features/auth/signup/signup_page.dart';
import 'package:digicoach/src/features/profile/student_profile_page.dart';
import 'package:digicoach/src/features/profile_modification/profile_setting_modification_page.dart';
import 'package:digicoach/src/features/profile_parameter/profile_parameter_page.dart';
import 'package:digicoach/src/features/profile_personal_information/profile_personal_information_page.dart';
import 'package:digicoach/src/features/profile_setting/coach_profile_setting_page.dart';
import 'package:digicoach/src/features/profile_setting/student_profile_setting_page.dart';

import 'package:digicoach/src/features/splash/digi_splash.dart';

// flutter packages pub run build_runner watch --delete-conflicting-outputs
@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: DigiCoachSplash, initial: true),
    AutoRoute(page: WelcomePage),
    AutoRoute(page: MobileNumberPage),
    AutoRoute(page: OtpPage2),
    AutoRoute(page: AccountConnectPage),
    AutoRoute(page: SelectProfilePage),
    AutoRoute(page: DetailsPage),
    AutoRoute(page: LoginPage),
    AutoRoute(page: OnBoardingMainPage),
    AutoRoute(page: PassResetNumberPage),
    AutoRoute(page: ResetPasswordPage),
    AutoRoute(page: SignupPage),
    AutoRoute(page: CoachProfilePage),
    AutoRoute(page: StudentProfilePage),
    AutoRoute(page: NavBar),
    AutoRoute(page: OTPPage),
    AutoRoute(page: SignupPage),
    AutoRoute(page: PersonalInfoPage),
    AutoRoute(page: AvatarPage),
    AutoRoute(page: BookingPage),
    AutoRoute(page: CoachProfileSettingPage),
    AutoRoute(page: StudentProfileSettingPage),
    AutoRoute(page: ProfilePersonalInformationPage),
    AutoRoute(page: ProfileModificationPage),
    AutoRoute(page: ProfileParameterPage),
    AutoRoute(page: AvisPage),
    AutoRoute(page: PaymentHistoryPage),
    AutoRoute(page: ParameterPage),
    AutoRoute(page: Notificationpage),
    // CustomRoute(
    //   page: ProfileParameterPage,
    //   transitionsBuilder: TransitionsBuilders.slideLeft,
    //   durationInMilliseconds: 400),
  ],
)
class $AppRouter {}

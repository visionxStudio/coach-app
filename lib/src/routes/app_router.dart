import 'package:auto_route/auto_route.dart';
import 'package:digicoach/src/features/add_payment/add_payment_page.dart';
import 'package:digicoach/src/features/add_profile_method/add_profile_method_page.dart';
import 'package:digicoach/src/features/appointment/appointment_page.dart';
import 'package:digicoach/src/features/auth/avatar/avatar_page.dart';
import 'package:digicoach/src/features/auth/new_auth/connect_account/account_connect_page.dart';
import 'package:digicoach/src/features/auth/new_auth/connect_account_with_email/connect_account_with_email.dart';
import 'package:digicoach/src/features/auth/new_auth/details_page/details_page.dart';
import 'package:digicoach/src/features/auth/new_auth/mobile_number_page/mobile_number_page.dart';
import 'package:digicoach/src/features/auth/new_auth/otp_page/otp_page.dart';
import 'package:digicoach/src/features/auth/new_auth/select_profile_page/select_profile_page.dart';
import 'package:digicoach/src/features/auth/new_auth/welcome_page/welcome_page.dart';
import 'package:digicoach/src/features/avis/avis_page.dart';
import 'package:digicoach/src/features/bio/bio_page.dart';
import 'package:digicoach/src/features/booking/booking_page.dart';
import 'package:digicoach/src/features/coach_details/coach_gender/coach_gender_page.dart';
import 'package:digicoach/src/features/coach_details/details_coach/details_coach_page.dart';
import 'package:digicoach/src/features/coach_documents/coach_documents_page.dart';
import 'package:digicoach/src/features/coach_profile/coach_profile_page.dart';
import 'package:digicoach/src/features/change_mobile_number.dart/change_mobile_number.dart';
import 'package:digicoach/src/features/coach_statistics/coach_statistics_page.dart';
import 'package:digicoach/src/features/confirmpayment/confirm_payment_page.dart';
import 'package:digicoach/src/features/course/course_selection_page.dart';

import 'package:digicoach/src/features/course_type/course_type_page.dart';
import 'package:digicoach/src/features/finishedpayment/finished_payment_page.dart';
import 'package:digicoach/src/features/goal/goal_page.dart';
import 'package:digicoach/src/features/map/map_page.dart';
import 'package:digicoach/src/features/message/chat/chat_page.dart';
import 'package:digicoach/src/features/message/message_page.dart';
import 'package:digicoach/src/features/my_appointments/my_appointments.dart';
import 'package:digicoach/src/features/navbar/navbar.dart';
import 'package:digicoach/src/features/newpayment/newpayment_page.dart';
import 'package:digicoach/src/features/notifications/notification_page.dart';
import 'package:digicoach/src/features/otp_verification/otp_verification.dart';
import 'package:digicoach/src/features/payment_history/payment_history_page.dart';
import 'package:digicoach/src/features/profile_modify/profile_modify_page.dart';
import 'package:digicoach/src/features/profile_personal_information/profile_personal_information_page.dart';
import 'package:digicoach/src/features/select_course_preference/select_course_preference_page.dart';
import 'package:digicoach/src/features/profile_parameter/profile_parameter_page.dart';
import 'package:digicoach/src/features/rating/rating_page.dart';
import 'package:digicoach/src/features/redeem_digicoin/redeem_digicoin_page.dart';
import 'package:digicoach/src/features/setting_page/settings_page.dart';

import 'package:digicoach/src/features/splash/digi_splash.dart';
import 'package:digicoach/src/features/wellbeign/wellbeing_page.dart';

//  flutter packages pub run build_runner watch --delete-conflicting-outputs

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: DigiCoachSplash, initial: true),
    AutoRoute(page: WelcomePage),
    AutoRoute(page: MobileNumberPage),
    AutoRoute(page: OtpPage),
    AutoRoute(page: AccountConnectPage),
    AutoRoute(page: SelectProfilePage),
    AutoRoute(page: DetailsPage),
    AutoRoute(page: NavBar),
    AutoRoute(page: AvatarPage),
    AutoRoute(page: BookingPage),
    AutoRoute(page: ProfileParameterPage),
    AutoRoute(page: AvisPage),
    AutoRoute(page: PaymentHistoryPage),
    AutoRoute(page: Notificationpage),
    AutoRoute(page: AppointmentPage),
    AutoRoute(page: MapPage),
    AutoRoute(page: NewPaymentPage),
    AutoRoute(page: ConfirmPaymentPage),
    AutoRoute(page: FinishedPaymentPage),
    AutoRoute(page: MyAppointmentsPage),
    AutoRoute(page: CourseSelectionPage),
    AutoRoute(page: DetailsCoachPage),
    AutoRoute(page: CoachGenderPage),
    AutoRoute(page: CoachDocumentsPage),
    AutoRoute(page: SelectCoursePreferencePage),
    AutoRoute(page: SelectCourseTypePage),
    AutoRoute(page: ConnectAccountWithEmail),
    //profile setting
    AutoRoute(page: ProfileModifyPage),
    AutoRoute(page: GoalPage),
    AutoRoute(page: BioPage),
    AutoRoute(page: WellbeingPage),
    AutoRoute(page: CoachProfilePage),
    AutoRoute(page: ProfilePersonalInofrmationPage),
    AutoRoute(page: AddProfileMethodPage),
    AutoRoute(page: RedeemDigicoinPage),
    AutoRoute(page: CoachStatisticsPage),
    AutoRoute(page: RatingPage),
    AutoRoute(page: OtpVerificationPage),
    AutoRoute(page: ChangeMobileNumberPage),
    AutoRoute(page: AddPaymentPage),
    AutoRoute(page: SettingsPage),
    AutoRoute(page: ChatPage),
    AutoRoute(page: MessagePage),
  ],
)
class $AppRouter {}

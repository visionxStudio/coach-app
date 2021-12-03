import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/strings.dart';
import 'package:digicoach/src/common/utils/validators.dart';
import 'package:digicoach/src/common/widgets/custom_radio_widget.dart';
import 'package:digicoach/src/common/widgets/input_field/custom_regular_input_field.dart';
import 'package:digicoach/src/common/widgets/text/custom_heading.dart';
import 'package:digicoach/src/common/widgets/text/custom_subtitle.dart';
import 'package:digicoach/src/common/widgets/text/text_span.dart';
import 'package:digicoach/src/features/auth/bloc/auth_state_notifier.dart';
import 'package:digicoach/src/features/auth/bloc/login_sate_notifier.dart';
import 'package:digicoach/src/features/auth/bloc/login_state.dart';
import 'package:digicoach/src/features/auth/login/login_widget.dart';
import 'package:digicoach/src/features/auth/widgets/gradient_shader_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  Future<void> _launchInWebView(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(loginStateProvider, (previous, next) {
      if (next.status.isSubmissionFailure) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    ref.listen<AuthState>(authStateProvider, (previous, next) {
      next.maybeWhen(
        orElse: () {},
        authenticated: () => AutoRouter.of(context).replace(NavBarRoute()),
      );
    });

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 53,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const GradientShaderText(
                      text: "Bienvenue !",
                      fontSize: 38.0,
                      fontWeight: FontWeight.w600,
                    ),
                    const BuildSocialSignup(),
                    const CustomHeading(title: "Votre identifiant"),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Consumer(
                            builder: (context, ref, child) {
                              final state = ref.watch(loginStateProvider);
                              return CustomRegularInputField(
                                initialValue: 'test@yopmail.com',
                                validator: (value) =>
                                    Validators.isEmail(string: value),
                                hintText: "Email",
                                leadingIcon: IconAsset.mail,
                                errorText: state.email.invalid
                                    ? 'Invalid email'
                                    : null,
                                onChanged: ref
                                    .read(loginStateProvider.notifier)
                                    .emailChanged,
                              );
                            },
                          ),
                          // Consumer(
                          //   builder: (context, ref, child) {
                          //     final state = ref.watch(loginStateProvider);
                          //     return CustomRegularInputField(
                          //       validator: (value) =>
                          //           Validators.isEmpty(string: value),
                          //       hintText: "Nom",
                          //       leadingIcon: IconAsset.user,
                          //       errorText: state.email.invalid
                          //           ? 'Invalid email'
                          //           : null,
                          //     );
                          //   },
                          // ),
                          Consumer(
                            builder: (context, ref, child) {
                              final state = ref.watch(loginStateProvider);

                              return CustomRegularInputField(
                                initialValue: 'secret@123',
                                validator: (value) =>
                                    Validators.validatePassword(string: value),
                                hintText: "Mot de passe",
                                leadingIcon: IconAsset.password,
                                errorText: state.password.invalid
                                    ? 'Invalid password'
                                    : null,
                                onChanged: ref
                                    .read(loginStateProvider.notifier)
                                    .passwordChanged,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              children: [
                                const CustomRadioWidget(),
                                const SizedBox(width: 8.0),
                                const CustomSubtitle(
                                    text: "Se souvenir de moi"),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    context.router
                                        .push(const ResetPasswordPageRoute());
                                  },
                                  child: const Text(
                                    "Mot de passe oublié ?", // Meaning forgot password?
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1B2559),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () async {
                            ref.read(loginStateProvider.notifier).login();
                            // String value = deviceInfo.deviceData!['model'];

                            // if (value.isEmpty) {
                            //   value =
                            //       deviceInfo.deviceData!['utsname.machine:'];
                            // }
                            // if (value.isEmpty) {
                            //   value = "TestDevice";
                            // }
                            // bool login = await provider.loginUser(value);
                            // if (login) {
                            //   context.router.replace(NavBarRoute());
                            // } else {
                            //   ScaffoldMessenger.of(context)
                            //       .showSnackBar(SnackBar(
                            //     content: Text(provider.loginErrorMessage),
                            //   ));
                            // }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0, 0.5, 1],
                                colors: [
                                  Color(0xff0052D4),
                                  Color(0xff65C7F7),
                                  Color(0xff9CECFB),
                                ],
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Se connecter",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        GestureDetector(
                          onTap: () {
                            context.router.push(const SignupPageRoute());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: const Color(0xff1B2559)),
                            child: const Center(
                              child: Text(
                                "S’inscrire",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  customTextSpan(
                                    text: Strings.kTerms1,
                                    onTap: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                  customTextSpan(
                                    text: Strings.kTerms2,
                                    underLine: true,
                                    onTap: TapGestureRecognizer()
                                      ..onTap = () {
                                        _launchInWebView(
                                            "https://www.termsandcondiitionssample.com/");
                                      },
                                  ),
                                  customTextSpan(
                                    text: Strings.kTerms3,
                                    onTap: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                  customTextSpan(
                                    text: Strings.kTerms4,
                                    underLine: true,
                                    onTap: TapGestureRecognizer()
                                      ..onTap = () {
                                        _launchInWebView(
                                            "https://www.termsandcondiitionssample.com/");
                                      },
                                  ),
                                  customTextSpan(
                                    text: Strings.kTerms5,
                                    onTap: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/background_curve_clipper/background_curve_clipper.dart';
import 'package:digicoach/src/features/auth/bloc/auth_state_notifier.dart';
import 'package:digicoach/src/features/auth/new_auth/welcome_page/welcome_page.dart';
import 'package:digicoach/src/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DigiCoachSplash extends ConsumerStatefulWidget {
  const DigiCoachSplash({Key? key}) : super(key: key);

  @override
  _DigiCoachSplashState createState() => _DigiCoachSplashState();
}

class _DigiCoachSplashState extends ConsumerState<DigiCoachSplash>
    with TickerProviderStateMixin {
  // animation duration
  int duration = 1500;
  // Completer is used to await for splash animation complete then
  // preform required route change
  final Completer<bool> _completer = Completer();
  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: duration),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    // start animating the splash
    _controller.animateTo(1.0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // preloading app logo image for better app experience
    precacheImage(const AssetImage(ImageAsset.applogo), context);
    // when completed complete the completer
    _animation.addListener(() {
      if (_animation.isCompleted) {
        _completer.complete(true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authStateProvider, (previous, next) {
      next.when(
        authenticated: () async {
          // awaits for completer future (which is splash animation) the
          // only replaces with new route
          await _completer.future
              .then((value) => AutoRouter.of(context).replace(NavBarRoute()));
        },
        unauthenticated: () async {
          await _completer.future.then((value) =>
              AutoRouter.of(context).replace(const LoginPageRoute()));
          // AutoRouter.of(context).replace(const WelcomePageRoute()));
        },
        unknown: () async {},
      );
    });
    // TODO: why this is inside build method??
    SizeConfig().init(context);
    return Scaffold(
        body: FadeTransition(
      opacity: _animation,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              ImageAsset.applogo,
              width: width(250),
              fit: BoxFit.fitWidth,
            ),
          ),
          CustomPaint(
            size: const Size(214.0, 167.0),
            painter: CustomBackgroundCurveClipper(),
          ),
          CustomPaint(
            size: const Size(214.0, 167.0),
            painter: CustomBackgroundCurveClipper(),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: RotatedBox(
              quarterTurns: 2,
              child: CustomPaint(
                size: const Size(214.0, 127.0),
                painter: CustomBackgroundCurveClipper(),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

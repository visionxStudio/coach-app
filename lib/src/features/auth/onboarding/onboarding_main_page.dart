import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/background_curve_clipper/background_curve_clipper.dart';
import 'package:digicoach/src/common/widgets/button/custom_outlined_button.dart';
import 'package:digicoach/src/common/widgets/button/custom_text_button.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/profile/widget/coach_info_page_view_widget.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/onboarding_page_model.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);

class OnBoardingMainPage extends ConsumerWidget {
  OnBoardingMainPage({Key? key}) : super(key: key);

  //pageController
  final PageController _pageController = PageController();

  //list of page that going to be displayed in pagebuilder page
  final List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
      centerImage: ImageAsset.settingImage,
      description: 'Parmis une multitude de coachs',
      title: 'Trouvez votre coach',
      index: 0,
    ),
    OnboardingInfo(
      centerImage: ImageAsset.settingImage,
      description: 'En visio, à domicile ou suivez des lives',
      title: 'Plusieurs façon de vous faire coacher',
      index: 1,
    ),
    OnboardingInfo(
      centerImage: ImageAsset.mailbox,
      description:
          'Obtenez des badges et des réductions grâce au programme de fidélité',
      title: 'Gagnez des récompenses',
      index: 2,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider.notifier);
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: const Size(204.0, 167.0),
            painter: CustomBackgroundCurveClipper(),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingPages.length,
                  onPageChanged: (int index) {
                    // Change the current page index in here
                    currentIndex.update((state) => state = index);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const HeightWidget(100),
                              Center(
                                child: Image.asset(
                                  onboardingPages[index].centerImage,
                                  width: width(265),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              NormalText(
                                onboardingPages[index].title,
                                fontSize: 24,
                                isCentered: true,
                              ),
                              const HeightWidget(20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding / 1.2),
                                child: NormalText(
                                  onboardingPages[index].description,
                                  fontSize: 20,
                                  isCentered: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const HeightWidget(20),
              Consumer(
                builder: (context, ref, child) {
                  final counter = ref.watch(currentIndexProvider.state);
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < 3; i++)
                          if (i == counter.state) ...[circleBar(true)] else
                            circleBar(false),
                      ],
                    ),
                  );
                },
              ),
              const HeightWidget(5),
              SizedBox(
                width: width(200),
                child: CustomOutlinedButton(
                  label: "Voir plus",
                  onPressed: () {
                    if (currentIndex.state == 2) {
                      context.router.replace(NavBarRoute());
                    }
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.ease);
                  },
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: RotatedBox(
              quarterTurns: 2,
              child: CustomPaint(
                size: const Size(114.0, 127.0),
                painter: CustomBackgroundCurveClipper(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, right: kDefaultPadding),
            child: Align(
              alignment: Alignment.topRight,
              child: CustomTextButton(
                text: 'Passer',
                onPressed: () => {
                  _pageController.animateToPage(onboardingPages.length,
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.ease)
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

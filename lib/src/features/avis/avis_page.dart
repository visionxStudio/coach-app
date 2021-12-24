import 'package:animations/animations.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/custom_switch/bloc/custom_tab_switch_controller.dart';
import 'package:digicoach/src/common/widgets/custom_switch/custom_tab_switch.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/avis/tabs/comments_page.dart';
import 'package:digicoach/src/features/avis/tabs/receipts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_localization.dart';

class AvisPage extends ConsumerStatefulWidget {
  const AvisPage({Key? key}) : super(key: key);

  @override
  _AvisPageState createState() => _AvisPageState();
}

class _AvisPageState extends ConsumerState<AvisPage> {
  final screenList = [const ReceiptsPage(), const CommentsPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kWhiteColor,
        iconTheme: const IconThemeData(
          color: kBlackColor,
        ),
        title: NormalText(
          "avis_page.avis".tr(context),
          color: kPrimaryColor,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height(60.0),
                child: Center(
                  child: CustomTabSwitch(
                    tab1: "avis_page.tab1".tr(context),
                    tab2: "avis_page.tab2".tr(context),
                  ),
                ),
              ),
              Consumer(
                builder: (ctx, ref, child) {
                  final tabProvider = ref.watch(customTabControllerProvider);
                  return PageTransitionSwitcher(
                    transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                    ) {
                      return FadeThroughTransition(
                        fillColor: Theme.of(context).cardColor,
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        child: child,
                      );
                    },
                    duration: const Duration(milliseconds: 600),
                    child: screenList[tabProvider.index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

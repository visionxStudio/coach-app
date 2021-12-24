import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BioPage extends ConsumerStatefulWidget {
  const BioPage({Key? key}) : super(key: key);

  @override
  _BioPageState createState() => _BioPageState();
}

class _BioPageState extends ConsumerState<BioPage> {
  TextEditingController biotextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void loading() {
    // ref.listen<AuthState>(authStateProvider, (previous, next) {
    //   next.when(
    //     authenticated: () async {
    //       // awaits for completer future (which is splash animation) the
    //       // only replaces with new route
    //       await _completer.future
    //           .then((value) => AutoRouter.of(context).replace(NavBarRoute()));
    //     },
    //     unauthenticated: () async {
    //       await _completer.future.then((value) =>
    //           AutoRouter.of(context).replace(const WelcomePageRoute()));
    //       // AutoRouter.of(context).replace(NavBarRoute()));
    //     },
    //     unknown: () async {},
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            context.router.navigateBack();
          },
          color: kPrimaryColor,
        ),
        title: const NormalText(
          'bio_page.title',
          isBold: true,
          color: kPrimaryColor,
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: kWhiteColor,
        margin: const EdgeInsets.symmetric(vertical: kDefaultmargin / 2),
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: NormalText(
                  "Ma bio",
                  isBold: true,
                ),
              ),
              TextFormField(
                controller: biotextController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  hintText: 'bio_page.message'.tr(context),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  fillColor: kScafoldColor,
                  focusColor: kScafoldColor,
                  filled: true,
                  hintStyle: const TextStyle(
                    color: kDarkGrey,
                    fontSize: 16.0,
                    letterSpacing: -0.2,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                maxLines: 4,
              ),
              const HeightWidget(10),
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  color: kBottonColor,
                  constraints: const BoxConstraints(minHeight: 55),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const NormalText(
                    'bio_page.conform',
                    color: kWhiteColor,
                    isUpper: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

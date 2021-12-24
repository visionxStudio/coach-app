import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/input_field/minimal_input_field.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/course/bloc/course_provider.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SelectCoursePreferencePage extends ConsumerStatefulWidget {
  const SelectCoursePreferencePage({Key? key}) : super(key: key);

  @override
  _SelectCoursePreferencePageState createState() =>
      _SelectCoursePreferencePageState();
}

class _SelectCoursePreferencePageState
    extends ConsumerState<SelectCoursePreferencePage> {
  int typeIndex = 0;
  int hour = 1;
  int min = 00;
  final _formKey = GlobalKey<FormState>();

  void changeTypeIndex(int index) {
    setState(() {
      typeIndex = index;
    });
  }

  void increaseTime() {
    if (min >= 60) {
      min = 00;
      if (hour >= 24) {
        hour = 1;
      } else {
        hour++;
      }
    } else {
      min++;
    }

    setState(() {});
  }

  void decreaseTime() {
    if (min <= 00) {
      if (hour == 0) {
      } else {
        min = 60;
      }
      if (hour <= 1) {
        hour = 0;
      } else {
        hour--;
      }
    } else {
      min--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kScafoldColor,
        leading: BackButton(
          color: kPrimaryColor,
          onPressed: () {
            context.router.navigateBack();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: NormalText(
                  "course_preferece.thanks",
                  fontSize: kDefaultFontSize + 2,
                  isCentered: true,
                  color: kPrimaryColor,
                ),
              ),
              const NormalText(
                "course_preferece.choice",
                fontSize: kDefaultFontSize - 4,
                isCentered: true,
                color: ksearchText,
              ),
              const HeightWidget(30),
              const NormalText(
                "Type",
                fontSize: kDefaultFontSize - 4,
              ),
              const HeightWidget(10),
              Row(
                children: [
                  _TypeWidget(
                    ontap: () => changeTypeIndex(0),
                    index: 0,
                    selectedindex: typeIndex,
                    text: "course_preferece.ingroup",
                    bgcolor: kaudiobackgroundColor,
                    icon: IconAsset.audio,
                  ),
                  _TypeWidget(
                    ontap: () => changeTypeIndex(1),
                    index: 1,
                    selectedindex: typeIndex,
                    text: "course_preferece.visio",
                    bgcolor: kvideobackgroundColor,
                    icon: IconAsset.video,
                  ),
                  _TypeWidget(
                    ontap: () => changeTypeIndex(2),
                    index: 2,
                    selectedindex: typeIndex,
                    text: "course_preferece.home",
                    bgcolor: khomebackgroundColor,
                    icon: IconAsset.homeheart,
                  )
                ],
              ),
              const HeightWidget(30),
              const NormalText(
                "course_preferece.averageduration",
                fontSize: kDefaultFontSize - 4,
                isBold: true,
              ),
              const HeightWidget(30),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: kDefaultmargin / 2),
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultmargin / 2,
                    vertical: kDefaultmargin / 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kWhiteColor,
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kNavBarBackgroundColor),
                      child: IconButton(
                          color: kNavBarBackgroundColor,
                          onPressed: () => decreaseTime(),
                          icon: const Icon(
                            Icons.remove,
                            color: kPrimaryColorDark,
                          )),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NormalText(
                            hour.toString(),
                            color: khourText,
                          ),
                          const WidthWidget(4),
                          const NormalText(
                            "course_preferece.hour",
                            color: khourText,
                          ),
                          const WidthWidget(4),
                          NormalText(
                            min.toString(),
                            color: khourText,
                          ),
                          const WidthWidget(4),
                          const NormalText(
                            "course_preferece.min",
                            color: khourText,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kNavBarBackgroundColor),
                      child: IconButton(
                          color: kNavBarBackgroundColor,
                          onPressed: () => increaseTime(),
                          icon: const Icon(
                            Icons.add,
                            color: kPrimaryColorDark,
                          )),
                    ),
                  ],
                ),
              ),
              const HeightWidget(10),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Form(
                  key: _formKey,
                  child: MinimalInputField(
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Field is required";
                      }
                    },
                    hintText: "course_preferece.price".tr(context),
                    onChanged:
                        ref.read(courseStateProvider.notifier).priceChanged,
                    textInputType: TextInputType.number,
                  ),
                ),
              ),
              const HeightWidget(20),
              CustomElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref
                        .read(courseStateProvider.notifier)
                        .coursePreferenceChanged(
                          packageId: typeIndex,
                          duration: (hour * 60 + min).toString(),
                        );
                    context.router.push(const SelectCourseTypePageRoute());
                  } else {
                    return;
                  }
                },
                label: 'course_preferece.continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TypeWidget extends StatelessWidget {
  final VoidCallback? ontap;
  final String icon;
  final Color bgcolor;
  final String text;
  final int index;
  final int selectedindex;
  const _TypeWidget({
    Key? key,
    this.ontap,
    required this.bgcolor,
    required this.icon,
    required this.text,
    required this.index,
    required this.selectedindex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.all(kDefaultmargin / 4),
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultmargin, vertical: kDefaultmargin / 2),
        decoration: BoxDecoration(
            border: Border.all(
                color: selectedindex == index ? kBottonColor : kWhiteColor),
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.all(kDefaultmargin / 4),
                padding: const EdgeInsets.all(kDefaultmargin),
                decoration: BoxDecoration(
                    color: bgcolor, borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(icon)),
            const HeightWidget(10),
            NormalText(
              text,
              color: ksearchText,
              fontSize: kDefaultFontSize - 4,
            ),
          ],
        ),
      ),
    );
  }
}

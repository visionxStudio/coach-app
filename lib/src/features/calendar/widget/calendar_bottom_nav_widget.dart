import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/button/custom_gradient_button.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarBottomSheetWidget extends ConsumerWidget {
  const CalendarBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final controller = ref.watch(mainDashboardProvider);
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SizedBox(
            width: width(150),
            child: AspectRatio(
              aspectRatio: 8,
              child: Image.asset(
                ImageAsset.dropdown,
                height: 35.0,
                fit: BoxFit.fitHeight,
                color: kWhiteColor,
              ),
            ),
          ),
        ),
        const HeightWidget(10),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: kDefaultmargin / 2),
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: const BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: NormalText(
                    "RDV DU 01/08/2021\nMÉLISSANDRE PALME",
                    isCentered: true,
                  ),
                ),
                const HeightWidget(10),
                const NormalText(
                  "Options",
                  color: kOptionColor,
                  fontSize: kDefaultFontSize - 2,
                ),
                const HeightWidget(10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const OptionWidget(
                          item: "Voir la fiche du coach",
                          value: false,
                        ),
                        const OptionWidget(
                          item: "Annuler",
                          value: true,
                        ),
                        const OptionWidget(
                          item: "Envoyer un message",
                          value: true,
                        ),
                        const HeightWidget(10),
                        SizedBox(
                          width: width(200),
                          child: CustomGradentButton(
                              text: "Rejoindre la réunion", onTap: () {}),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OptionWidget extends StatelessWidget {
  final String item;
  final bool value;
  const OptionWidget({
    Key? key,
    required this.item,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NormalText(
          item,
          fontSize: kDefaultFontSize - 2,
          color: kBlackColor,
        ),
        const Spacer(),
        Radio(
          value: value,
          groupValue: "calendar",
          onChanged: (value) {},
        ),
      ],
    );
  }
}

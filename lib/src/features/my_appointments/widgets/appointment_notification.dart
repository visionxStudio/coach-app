import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/my_appointments/widgets/border_button.dart';
import 'package:digicoach/src/features/statistics/statistics_page.dart';
import 'package:flutter/material.dart';

class AppointmentNotification extends StatelessWidget {
  const AppointmentNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleAndInfoWidget(
              onTap: () {}, title: "Méditation en pleine conscience"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ImageAsset.avatar1,
                height: 45.0,
              ),
              const HeightWidget(8.0),
              const NormalText(
                "Mira Septimus",
                color: kLightBlueTextColor,
              ),
              const HeightWidget(8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: kunSelectedAddressBorder),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: const Center(
                      child: NormalText(
                        "Mardi 14 Jan, 2022, 13:30 • En ligne",
                        color: kscheduleTextColor,
                      ),
                    ),
                  ),
                ],
              ),
              const HeightWidget(8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  BorderButton(
                    label: "Annuler",
                    isSelected: false,
                    borderColor: kcancelBorderColor,
                    backgroundColor: kcancelBackgroundColor,
                    image: IconAsset.close,
                  ),
                  WidthWidget(8.0),
                  BorderButton(
                    label: "Annuler",
                    isSelected: false,
                    borderColor: kNotificationBorderColor,
                    backgroundColor: kNotificationBackgroundColor,
                    image: IconAsset.bell,
                  ),
                  WidthWidget(8.0),
                  BorderButton(
                    label: "Annuler",
                    isSelected: false,
                    borderColor: kDiscussionBorderColor,
                    backgroundColor: kDiscussionBackgroundColor,
                    image: IconAsset.chatHome,
                  ),
                ],
              ),
            ],
          ),
          CustomElevatedButton(
            label: "Commencer le coaching",
            onPressed: () {},
            disabled: true,
          ),
        ],
      ),
    );
  }
}

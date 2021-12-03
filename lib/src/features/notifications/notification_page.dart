import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/appbar/default_appbar.dart';
import 'package:digicoach/src/common/widgets/bottom_filter_sheet/coach_bottom_filter_sheet.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';

// TODO complete this page
class Notificationpage extends StatelessWidget {
  const Notificationpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: "notification_setting_page.notifications".tr(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NormalText(
                        "notification_setting_page.push_notifications"
                            .tr(context),
                        color: kPrimaryColor,
                        isBold: true,
                      ),
                      NormalText(
                        "notification_setting_page.appointment_remainder"
                            .tr(context),
                        color: ktextColor,
                        isBold: false,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Switch(
                    value: true,
                    onChanged: (bool value) {},
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ],
              ),
              ToggleWidget(
                title: AppLocalizations.of(context)
                    .translate('notification_setting_page.email'),
                fontSize: 18.0,
                isBold: true,
                state: true,
                change: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

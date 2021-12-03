import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/profile_setting/coach_profile_setting_page.dart';
import 'package:flutter/material.dart';

class ParameterLists extends StatelessWidget {
  const ParameterLists(
      {Key? key,
      required this.icon,
      required this.title,
      this.hasLeading = false})
      : super(key: key);
  final String title;
  final String icon;
  final bool hasLeading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NormalText(
            title,
            fontWeight: FontWeight.w400,
            fontSize: 22.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hasLeading
                  ? const NormalText(
                      // TODO Change the package name dynamically
                      "Beta 1",
                      fontSize: 20.0,
                      color: kLightGreyColor,
                    )
                  : const SizedBox(),
              const WidthWidget(4.0),
              SvgIcon(
                icon: icon,
                complete: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}

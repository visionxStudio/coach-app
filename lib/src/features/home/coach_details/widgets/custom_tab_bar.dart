import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key, required this.tabLabel, required this.isActive})
      : super(key: key);
  final String tabLabel;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        NormalText(
          tabLabel,
          fontSize: kDefaultFontSize - 4,
        ),
        const HeightWidget(4),
        isActive
            ? Container(
                height: 2.0,
                width: width(40),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(16.0),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

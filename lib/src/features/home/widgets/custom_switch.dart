import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    Key? key,
    required this.title,
    this.isActive = false,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        decoration: isActive
            ? BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(25.0),
              )
            : const BoxDecoration(),
        child: NormalText(
          title,
          color: isActive ? kBottonColor : kBlackColor,
          fontWeight: FontWeight.w400,
          fontSize: kDefaultFontSize - 6,
        ),
      ),
    );
  }
}

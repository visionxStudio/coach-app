import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    required this.title,
    this.isActive = false,
  }) : super(key: key);
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(
          color: kChipColor,
          borderRadius: BorderRadius.circular(10.0),
          border: isActive
              ? Border.all(color: kBottonColor)
              : Border.all(color: kChipColor, width: 0.0)),
      child: NormalText(
        title,
        fontSize: kDefaultFontSize - 6,
        color: isActive ? kBottonColor : kBlackColor,
      ),
    );
  }
}

import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectGenderWidget extends StatelessWidget {
  const SelectGenderWidget(
      {Key? key,
      required this.gender,
      required this.isSelected,
      required this.svgIcon,
      required this.onTap})
      : super(key: key);
  final String gender;
  final bool isSelected;
  final String svgIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100.0,
          padding: const EdgeInsets.only(top: 16.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.0,
              color: isSelected ? kBottonColor : kOutlineColor,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Expanded(
                  child: SvgPicture.asset(svgIcon),
                ),
                Expanded(
                  child: NormalText(
                    gender,
                    color: isSelected ? kBottonColor : kscheduleTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

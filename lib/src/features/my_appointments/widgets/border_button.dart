import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color borderColor;
  final Color backgroundColor;
  final String image;

  const BorderButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.borderColor,
    required this.backgroundColor,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 18.0,
            color: kscheduleTextColor,
          ),
          const WidthWidget(4.0),
          NormalText(
            label,
            color: kscheduleTextColor,
          )
        ],
      ),
    );
  }
}

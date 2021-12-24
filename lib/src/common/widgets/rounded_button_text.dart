import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';

class RoundedButtonAndText extends StatelessWidget {
  const RoundedButtonAndText({
    Key? key,
    required this.buttonText,
    required this.optionText,
    required this.buttonTap,
    required this.optionTap,
  }) : super(key: key);
  final String buttonText;
  final VoidCallback buttonTap;
  final String optionText;
  final VoidCallback optionTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomElevatedButton(
          label: buttonText,
          onPressed: buttonTap,
        ),
        GestureDetector(
          onTap: optionTap,
          child: NormalText(
            optionText,
            color: kBottonColor,
            fontSize: 16.0,
          ),
        )
      ],
    );
  }
}

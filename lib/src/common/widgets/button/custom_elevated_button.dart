import 'package:digicoach/src/common/constants/constants.dart';
import 'package:flutter/material.dart';

/// custom raised/elevated button widget
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.disabled = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding + 5),
      child: Container(
        constraints: const BoxConstraints(minHeight: 50),
        width: double.infinity,
        child: ElevatedButton(
          child: Text(
            label.trim(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          onPressed: disabled ? () {} : onPressed,
          style: !disabled
              ? ElevatedButton.styleFrom(
                  primary: backgroundColor, // background
                  onPrimary: textColor, // text color
                )
              : ElevatedButton.styleFrom(
                  primary: kLightGreyColor, // background
                  onPrimary: kWhiteColor, // text color
                ),
        ),
      ),
    );
  }
}

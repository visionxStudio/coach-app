import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';

/// custom raised/elevated button widget
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.disabled = false,
    this.fontsize = kDefaultFontSize,
    this.textColor,
    this.image,
    this.showImage = false,
    this.isUpper = false,
    this.height,
    this.imageHeight = 20.0,
  }) : super(key: key);

  final bool isUpper;

  final VoidCallback onPressed;
  final String label;
  final Color? backgroundColor;
  final bool disabled;
  final double fontsize;
  final Color? textColor;
  final String? image;
  final bool showImage;
  final double imageHeight;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding / 2),
      child: Container(
        constraints: BoxConstraints(minHeight: height ?? 55),
        width: double.infinity,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showImage
                  ? Image.asset(
                      image!,
                      height: imageHeight,
                    )
                  : const SizedBox(),
              showImage ? const WidthWidget(8.0) : const SizedBox(),
              NormalText(
                label.trim(),
                fontSize: fontsize,
                color: textColor ?? kWhiteColor,
                isUpper: true,
              ),
            ],
          ),
          onPressed: disabled ? () {} : onPressed,
          style: !disabled
              ? ElevatedButton.styleFrom(
                  primary: backgroundColor ?? kBottonColor,
                  onPrimary: textColor ?? kWhiteColor, // text color
                )
              : ElevatedButton.styleFrom(
                  primary: backgroundColor ?? kLightGreyColor, // background
                  onPrimary: kWhiteColor, // text color
                ),
        ),
      ),
    );
  }
}

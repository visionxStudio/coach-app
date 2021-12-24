import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isbold;

  const CustomTextButton(
      {Key? key, required this.text, this.isbold = false, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: onPressed,
      child: Text(
        AppLocalizations.of(context).translate(text),
        style: TextStyle(
            color: kPrimaryColor,
            fontWeight: !isbold ? FontWeight.normal : FontWeight.bold),
      ),
    );
  }
}

import 'package:digicoach/src/common/constants/constants.dart';
import 'package:flutter/material.dart';

class MinimalInputField extends StatefulWidget {
  const MinimalInputField({
    Key? key,
    required this.hintText,
    this.textInputType,
    this.focusNode,
    this.isPassword = false,
    this.textEditingController,
    this.autofocus,
    this.maxLines,
    this.onChanged,
    this.errorText,
    this.backgroundColor,
    this.validator,
    this.label,
  }) : super(key: key);
  final String hintText;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final bool? autofocus;
  final int? maxLines;
  final bool isPassword;
  final void Function(String)? onChanged;
  final String? errorText;
  final Color? backgroundColor;
  final String? Function(String?)? validator;

  final String? label;

  @override
  _MinimalInputFieldState createState() => _MinimalInputFieldState();
}

class _MinimalInputFieldState extends State<MinimalInputField> {
  final TextEditingController mobileTextController = TextEditingController();
  FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding - 5),
      child: TextFormField(
        focusNode: focusNode,
        validator: widget.validator,
        decoration: InputDecoration(
          labelText: widget.label,
          errorText: widget.errorText,
          errorMaxLines: 1,
          contentPadding: const EdgeInsets.all(16.0),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              color: ksearchText, fontWeight: FontWeight.normal),
          labelStyle: const TextStyle(
              color: ksearchText, fontWeight: FontWeight.normal),
          enabled: true,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
          fillColor: widget.backgroundColor ?? kWhiteColor,
          filled: true,
        ),
        onChanged: widget.onChanged,
        cursorColor: Colors.black,
        cursorHeight: 20.0,
        textInputAction: TextInputAction.next,
        keyboardType: widget.textInputType ?? TextInputType.emailAddress,
        onFieldSubmitted: (_) {},
      ),
    );
  }
}

final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(
    width: 0,
    style: BorderStyle.none,
  ),
);

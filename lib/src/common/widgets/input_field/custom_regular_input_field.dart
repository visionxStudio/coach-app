import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;

class CustomRegularInputField extends StatefulWidget {
  final String leadingIcon;
  final String hintText;
  final EdgeInsetsGeometry padding;
  final TextEditingController? controller;
  final dynamic validator;
  final String? errorText;
  final void Function(String)? onChanged;
  final String? initialValue;
  final bool iscomplete;
  final String? suffix;
  final bool svg;

  const CustomRegularInputField({
    Key? key,
    required this.hintText,
    required this.leadingIcon,
    this.suffix,
    this.controller,
    this.validator,
    this.errorText,
    this.svg = false,
    this.padding = const EdgeInsetsDirectional.fromSTEB(20, 4, 0, 0),
    this.onChanged,
    this.iscomplete = true,
    this.initialValue,
  }) : super(key: key);

  @override
  State<CustomRegularInputField> createState() =>
      _CustomRegularInputFieldState();
}

class _CustomRegularInputFieldState extends State<CustomRegularInputField> {
  bool complete = false;

  @override
  void initState() {
    complete = widget.iscomplete;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              initialValue: widget.initialValue,
              onChanged: widget.onChanged,
              validator: widget.validator,
              controller: widget.controller,
              obscureText: false,
              decoration: InputDecoration(
                suffix: complete
                    ? null
                    : const Icon(
                        Icons.priority_high,
                        color: Colors.red,
                      ),
                errorText: widget.errorText,
                hintText:
                    AppLocalizations.of(context).translate(widget.hintText),
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: widget.svg
                      ? ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) {
                            return ui.Gradient.linear(
                              const Offset(-4.0, 4.0),
                              const Offset(4.0, -4.0),
                              [kIconGradientColor2, kIconGradientColor1],
                            );
                          },
                          child: SvgPicture.asset(
                            widget.leadingIcon,
                            width: width(15),
                            height: height(15),
                            color: kPrimaryColor,
                            cacheColorFilter: true,
                          ),
                        )
                      : Image.asset(
                          widget.leadingIcon,
                          height: 10.0,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

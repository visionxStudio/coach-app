import 'package:digicoach/src/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// custom text input field widget
class InputField extends StatefulWidget {
  const InputField(
      {Key? key,
      this.label,
      this.hintText,
      this.obscureText = false,
      this.textInputType = TextInputType.text,
      this.icon,
      this.validator,
      this.onFieldSubmitted,
      this.onChanged,
      this.controller,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.disabled = false,
      this.onTap,
      this.focusNode,
      this.borderRadius,
      this.prefixText,
      this.suffixText,
      this.suffix,
      this.autofocus = false,
      this.textInputAction = TextInputAction.next,
      this.inputFormatters,
      this.backgroundColor,
      this.suffixTap,
      this.maxline = 1})
      : super(key: key);

  final Color? backgroundColor;
  final Icon? icon;
  final String? hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final String? label;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final bool disabled;
  final Function()? onTap;
  final String? prefixText;
  final double? borderRadius;
  final String? suffixText;
  final Widget? suffix;
  final bool autofocus;
  final int maxline;
  final VoidCallback? suffixTap;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  ///toggle status for passsword eye
  bool showPassword = false;

  /// toggle status for password field
  bool shownPassword = false;

  @override
  void initState() {
    super.initState();
    shownPassword = widget.obscureText;
  }

  /// toggle password view
  void togglePassword() {
    setState(() {
      showPassword = !showPassword;
      shownPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 40)),
      margin: const EdgeInsets.only(bottom: kDefaultPadding - 5),
      child: TextFormField(
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        onTap: widget.onTap,
        readOnly: widget.disabled,
        controller: widget.controller,
        autovalidateMode: widget.autovalidateMode,
        maxLines: widget.maxline,
        decoration: InputDecoration(
          hintStyle:
              const TextStyle(color: ksearchText, fontWeight: FontWeight.bold),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: widget.icon != null
              ? const EdgeInsets.fromLTRB(0, 13, kDefaultPadding, 0)
              : const EdgeInsets.fromLTRB(
                  kDefaultPadding, 0, kDefaultPadding, 0),
          prefixIcon: widget.icon,
          labelText: widget.label,
          hintText: widget.hintText,
          prefixText: widget.prefixText,
          suffixText: widget.suffixText,
          suffixIcon: widget.suffix != null
              ? InkWell(onTap: widget.suffixTap, child: widget.suffix!)
              : widget.obscureText
                  ? IconButton(
                      onPressed: () => togglePassword(),
                      icon: Icon(
                        showPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: kGreyColor,
                      ),
                      splashRadius: 0.1,
                    )
                  : null,
        ),
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        onChanged: widget.onChanged,
        obscureText: shownPassword,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        // ignore: prefer_if_null_operators
        inputFormatters: widget.inputFormatters != null
            ? widget.inputFormatters
            : widget.textInputType == TextInputType.number
                ? [
                    /// allow numbers, dot and upto 2 digits after dot
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ]
                : widget.textInputType == TextInputType.phone
                    ? [
                        /// allow numbers upto 10 digits after dot
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^(\d{0,10})'))
                      ]
                    : null,
      ),
    );
  }
}

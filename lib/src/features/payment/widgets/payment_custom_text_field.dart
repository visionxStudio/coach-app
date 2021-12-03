import 'package:flutter/material.dart';

class PaymentCustomTextField extends StatelessWidget {
  const PaymentCustomTextField(
      {Key? key,
      required this.hintText,
      this.controller,
      this.textInputType,
      this.maxLength})
      : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (String value) {},
      controller: controller,
      maxLength: maxLength ?? 16,
      obscureText: false,
      keyboardType: textInputType,
      decoration: InputDecoration(
        counterText: "",
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
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
        contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
      ),
    );
  }
}

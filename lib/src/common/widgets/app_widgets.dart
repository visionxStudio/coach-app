import 'package:flutter/material.dart';

// TODO: need to refactor
Widget buildFormTextField(
    {required String hintText,
    required String leadingIcon,
    EdgeInsetsGeometry padding =
        const EdgeInsetsDirectional.fromSTEB(20, 4, 0, 0)}) {
  return Padding(
    padding: padding,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TextFormField(
            obscureText: false,
            decoration: InputDecoration(
              hintText: hintText,
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
                child: Image.asset(
                  leadingIcon,
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

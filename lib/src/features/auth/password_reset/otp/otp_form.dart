import 'package:digicoach/src/common/constants/constants.dart';
import 'package:flutter/material.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();

  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  int index = 0;
  final double _width = 70.0;

  final pin1Controller = TextEditingController();
  final pin2Controller = TextEditingController();
  final pin3Controller = TextEditingController();
  final pin4Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();

    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();

    pin1Controller.dispose();
    pin2Controller.dispose();
    pin3Controller.dispose();
    pin4Controller.dispose();
  }

  // jumping to next field if otp is set
  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 55.0,
            width: 55.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: kWhiteColor,
              border: Border.all(
                color: kWhiteColor,
              ),
            ),
            child: TextFormField(
              controller: pin1Controller,
              maxLength: 1,
              autofocus: true,
              obscureText: false,
              style: const TextStyle(fontSize: 24),
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: otpInputDecoration,
              onChanged: (value) {
                nextField(value, pin2FocusNode);
                setState(() {
                  index = 1;
                });
              },
            ),
          ),
          Container(
            height: 55.0,
            width: 55.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: kWhiteColor,
              border: Border.all(
                color: kWhiteColor,
              ),
            ),
            child: TextFormField(
              focusNode: pin2FocusNode,
              controller: pin2Controller,
              obscureText: false,
              maxLength: 1,
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
              style: const TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: otpInputDecoration,
              onChanged: (value) {
                nextField(value, pin3FocusNode);
                setState(() {
                  index = 2;
                });
              },
            ),
          ),
          Container(
            height: 55.0,
            width: 55.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: kWhiteColor,
              border: Border.all(
                color: kWhiteColor,
              ),
            ),
            child: TextFormField(
              focusNode: pin3FocusNode,
              controller: pin3Controller,
              obscureText: false,
              maxLength: 1,
              onTap: () {
                setState(() {
                  index = 3;
                });
              },
              style: const TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: otpInputDecoration,
              onChanged: (value) {
                nextField(value, pin4FocusNode);
                setState(() {
                  index = 3;
                });
              },
            ),
          ),
          Container(
            height: 55.0,
            width: 55.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: kWhiteColor,
              border: Border.all(
                color: kWhiteColor,
              ),
            ),
            child: TextFormField(
              focusNode: pin4FocusNode,
              controller: pin4Controller,
              obscureText: false,
              maxLength: 1,
              onTap: () {
                setState(() {
                  index = 3;
                });
              },
              style: const TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: otpInputDecoration,
              onChanged: (value) {
                if (value.length == 1) {
                  pin4FocusNode!.unfocus();
                  setState(
                    () {
                      index = 4;
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

const otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: 15.0,
  ),
  counterText: "",
  counterStyle: TextStyle(
    height: double.minPositive,
  ),
  enabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  border: InputBorder.none,
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: kGreyColor),
  );
}

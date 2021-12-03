import 'package:digicoach/src/common/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomRadioWidget extends StatefulWidget {
  const CustomRadioWidget({Key? key}) : super(key: key);

  @override
  _CustomRadioWidgetState createState() => _CustomRadioWidgetState();
}

class _CustomRadioWidgetState extends State<CustomRadioWidget> {
  bool isChecked = true;
  final double _height = 25.0;
  final double _width = 25.0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isChecked = !isChecked;
          });
        },
        child: Stack(
          children: [
            Container(
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: isChecked ? Colors.transparent : kUncheckedRadioColor,
                  //   width: 2,
                  // ),
                  borderRadius: BorderRadius.circular(60)),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  gradient: isChecked
                      ? const LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [
                            Color(0xffFC00FF),
                            Color(0xff00DBDE),
                          ],
                        )
                      : LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [
                            kUncheckedRadioColor,
                            kUncheckedRadioColor,
                          ],
                        ),
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
            ),
            isChecked
                ? SizedBox(
                    height: _height,
                    width: _width,
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: kWhiteColor,
                        size: 22,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

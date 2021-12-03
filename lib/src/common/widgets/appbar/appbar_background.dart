import 'package:digicoach/src/common/constants/constants.dart';
import 'package:flutter/material.dart';

///it only contain appbar background and recieved child as parameter
class AppbarBackgroudWidget extends StatelessWidget {
  final Widget child;
  final bool shape;
  const AppbarBackgroudWidget({
    Key? key,
    this.shape = true,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 110.0,
          width: double.infinity,
          decoration: const BoxDecoration(color: kSecondaryColor),
          child: child,
        ),
        Container(
          height: 110.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: shape
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))
                : null,
            // borderRadius: BorderRadius.circular(50.0),
            gradient: const LinearGradient(
              end: Alignment.bottomLeft,
              begin: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFF65C7F7),
                Color(0xFF0052D4),
              ], // red to yellow
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: child,
        ),
      ],
    );
  }
}

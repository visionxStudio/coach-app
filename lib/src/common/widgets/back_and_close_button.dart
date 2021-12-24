import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ArrowbackAndCloseButton extends StatelessWidget {
  /// Sign up and sign in top bar back button and close buttom
  const ArrowbackAndCloseButton(
      {Key? key, required this.onBackTap, required this.onCloseTap})
      : super(key: key);

  final VoidCallback onCloseTap;
  final VoidCallback onBackTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => context.router.pop(),
          child: const Icon(
            Icons.arrow_back,
            size: 30.0,
          ),
        ),
        GestureDetector(
          onTap: onCloseTap,
          child: Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: const Color(0xff12121D).withOpacity(0.05),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.close,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

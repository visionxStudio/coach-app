import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';

class IconWithNumberWidget extends StatelessWidget {
  final String imageIcon;
  final String number;
  final VoidCallback? onTap;
  const IconWithNumberWidget({
    Key? key,
    this.onTap,
    required this.imageIcon,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            imageIcon,
            height: 16,
            fit: BoxFit.fitHeight,
          ),
          const HeightWidget(6),
          NormalText(number)
        ],
      ),
    );
  }
}

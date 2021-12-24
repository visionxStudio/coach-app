import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  const Courses({
    Key? key,
    required this.backgroundColor,
    required this.course,
    required this.image,
    required this.isSelected,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  final String course;
  final int price;
  final String image;
  final bool isSelected;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 130,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          decoration: BoxDecoration(
            color: klightBluecolor,
            // color: Colors.red,
            borderRadius: BorderRadius.circular(16.0),
            border: isSelected
                ? Border.all(
                    color: kBottonColor,
                  )
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Image.asset(
                  image,
                  height: 24.0,
                  width: 24.0,
                ),
              ),
              Flexible(
                child: NormalText(
                  course,
                  color: ksearchText,
                  isCentered: true,
                ),
              ),
              NormalText(
                price.toString() + "€",
                color: kNavBackgroundColor,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

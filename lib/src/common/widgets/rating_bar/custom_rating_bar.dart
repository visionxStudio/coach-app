import 'package:digicoach/src/common/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomRatingStar extends StatelessWidget {
  final double rating;
  final bool showFullStars;
  const CustomRatingStar(
      {Key? key, required this.rating, this.showFullStars = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showFullStars
        ? Row(
            children: [
              for (double i = rating; i > 0; i--)
                const Icon(
                  Icons.star,
                  size: kDefaultFontSize - 3,
                  color: kBottonColor,
                ),
              for (int i = 0; i < 5 - rating; i++)
                const Icon(
                  Icons.star,
                  color: klightStar,
                  size: kDefaultFontSize - 3,
                ),
            ],
          )
        : Row(
            children: [
              for (int i = 0; i < rating - 1; i++)
                const Icon(
                  Icons.star,
                  color: kBottonColor,
                  size: kDefaultFontSize - 3,
                ),
              if (rating % rating.toInt() == 0)
                const Icon(
                  Icons.star,
                  color: kBottonColor,
                  size: kDefaultFontSize - 3,
                ),
              if (rating % rating.toInt() != 0)
                const Icon(
                  Icons.star_half_rounded,
                  color: kBottonColor,
                  size: kDefaultFontSize - 3,
                ),
            ],
          );
  }
}

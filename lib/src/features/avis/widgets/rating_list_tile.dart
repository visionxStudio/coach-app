import 'package:digicoach/src/common/constants/constants.dart';
import 'package:flutter/material.dart';

class RatingListTile extends StatelessWidget {
  const RatingListTile({Key? key, required this.title, required this.rating})
      : super(key: key);
  final String title;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: kPureBlack,
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            rating,
            style: const TextStyle(
              color: kPureBlack,
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

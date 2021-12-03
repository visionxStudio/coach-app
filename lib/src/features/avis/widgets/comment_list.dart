import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';

class CommentList extends StatelessWidget {
  const CommentList(
      {Key? key,
      required this.image,
      required this.date,
      required this.rating,
      required this.name,
      required this.comment})
      : super(key: key);
  final String image;
  final String date;
  final String rating;
  final String name;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Person name and profile image
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset(
                image,
                height: 50.0,
                width: 50.0,
                fit: BoxFit.cover,
              ),
            ),
            const WidthWidget(8.0),
            NormalText(
              name,
              fontSize: 20.0,
              isBold: true,
            )
          ],
        ),
        const HeightWidget(16.0),

        NormalText(
          comment,
          fontWeight: FontWeight.w500,
        ),
        const HeightWidget(16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                NormalText(
                  rating,
                  fontSize: 18.0,
                  color: kPrimaryColor,
                ),
                Image.asset(
                  IconAsset.star,
                  height: 25.0,
                  width: 25.0,
                ),
              ],
            ),
            const WidthWidget(16.0),
            NormalText(
              date,
              fontSize: 18.0,
              color: kPrimaryColor,
            )
          ],
        ),
        const HeightWidget(8.0),
        const Divider(),
      ],
    );
  }
}

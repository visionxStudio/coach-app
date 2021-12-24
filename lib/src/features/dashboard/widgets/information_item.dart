import 'package:auto_size_text/auto_size_text.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:flutter/material.dart';

class InformationItem extends StatelessWidget {
  final String image;
  final double data;
  final String title;
  final VoidCallback onTap;
  const InformationItem({
    Key? key,
    required this.image,
    required this.data,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: kScafoldColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              title.toUpperCase(),
              maxFontSize: kDefaultFontSize - 6,
              minFontSize: 10,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: kBlackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Container(
                  height: 36.0,
                  width: 36.0,
                  decoration: BoxDecoration(
                    color: kNavBarBackgroundColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Center(
                    child: Image.asset(
                      image,
                      height: 25.0,
                      color: kBottonColor,
                      width: 25.0,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                AutoSizeText(
                  data.toString(),
                  maxFontSize: kDefaultFontSize + 2,
                  minFontSize: kDefaultFontSize,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

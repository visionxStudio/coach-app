import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/container/custom_container.dart';
import 'package:digicoach/src/common/widgets/rating_bar/custom_rating_bar.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/avis/data/rating_model.dart';
import 'package:flutter/material.dart';

import '../../../../app_localization.dart';

class ReceiptsPage extends StatelessWidget {
  const ReceiptsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kScafoldColor,
      child: Column(
        children: [
          CustomContainer(
            child: Column(
              children: [
                NormalText(
                  "avis_page.note".tr(context),
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
                const HeightWidget(16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: kBottonColor,
                      ),
                      child: Image.asset(
                        IconAsset.note,
                        height: 18.0,
                        color: kWhiteColor,
                      ),
                    ),
                    const WidthWidget(16.0),
                    const NormalText(
                      "3,5/5",
                      fontSize: 38.0,
                      color: kBottonColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NormalText(
                  "avis_page.avis".tr(context) + " (8)",
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
                const HeightWidget(16.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ratingsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final RatingModel rating = ratingsList[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NormalText(
                                rating.type,
                                fontSize: 20.0,
                                color: kPrimaryColor,
                              ),
                              const WidthWidget(16.0),
                              Expanded(
                                  child: CustomRatingStar(
                                rating: rating.rating,
                                showFullStars: true,
                              )),
                              NormalText(
                                rating.numberOfRatings.toString(),
                                fontSize: 24.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          const HeightWidget(8.0),
                          const Divider(),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

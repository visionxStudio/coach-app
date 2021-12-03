import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_subtitle.dart';
import 'package:digicoach/src/features/avis/widgets/rating_list_tile.dart';
import 'package:flutter/material.dart';

import '../../../../app_localization.dart';

class ReceiptsPage extends StatelessWidget {
  const ReceiptsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HeightWidget(20.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: kPureBlack.withOpacity(0.05),
                  offset: const Offset(0, 2),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  IconAsset.star,
                  height: 50.0,
                  width: 50.0,
                ),
                const WidthWidget(8.0),
                Column(
                  children: [
                    CustomSubtitle(
                      text: AppLocalizations.of(context)
                          .translate('avis_page.note'),
                      fontSize: 22.0,
                    ),
                    const HeightWidget(10.0),
                    const NormalText(
                      "3.5/5",
                      isBold: true,
                      fontSize: 28.0,
                    ),
                  ],
                )
              ],
            ),
          ),
          const HeightWidget(20.0),
          const NormalText(
            "8 avis",
            fontSize: 24.0,
          ),
          const HeightWidget(20.0),
          RatingListTile(
            title:
                AppLocalizations.of(context).translate("avis_page.excellent"),
            rating: "5",
          ),
          RatingListTile(
            title: AppLocalizations.of(context).translate("avis_page.well"),
            rating: "2",
          ),
          RatingListTile(
            title: AppLocalizations.of(context).translate("avis_page.correct"),
            rating: "1",
          ),
          RatingListTile(
            title: AppLocalizations.of(context)
                .translate("avis_page.disappointing"),
            rating: "0",
          ),
          RatingListTile(
            title: AppLocalizations.of(context).translate("avis_page.trash"),
            rating: "0",
          ),
        ],
      ),
    );
  }
}

import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/input_field/minimal_input_field.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kPrimaryColor),
        centerTitle: true,
        title: const NormalText(
          "Méditation en pleine conscience",
          fontWeight: FontWeight.bold,
          color: kPrimaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight * 0.9,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const HeightWidget(16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageAsset.avatar1,
                      height: 45.0,
                    ),
                    const HeightWidget(8.0),
                    const NormalText(
                      "Par Mira Septimus",
                      color: kLightBlueTextColor,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: const [
                    NormalText(
                      "Toutes nos\n félicitations",
                      fontSize: 38.0,
                      color: kPrimaryColor,
                      lineHight: 1.4,
                      isCentered: true,
                    ),
                    HeightWidget(8.0),
                    NormalText(
                      "Vous avez terminé le cours",
                      color: kDarkGrey,
                    ),
                  ],
                ),
                const HeightWidget(8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: kNotificationBackgroundColor,
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: kNotificationBorderColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.favorite_outline,
                            size: 16.0,
                            color: kscheduleTextColor,
                          ),
                          WidthWidget(4.0),
                          NormalText(
                            "Favourite",
                            color: kscheduleTextColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    const NormalText(
                      "Comment s'est passée votre expérience ?",
                      fontSize: 20.0,
                      color: kPrimaryColor,
                    ),
                    const HeightWidget(8.0),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      unratedColor: klightStar,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: kAddressborder,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
                const HeightWidget(30.0),
                Column(
                  children: [
                    const MinimalInputField(
                      hintText: "Ajouter un commentaire",
                      backgroundColor: kScaffoldBackgroundColor,
                    ),
                    const HeightWidget(16.0),
                    CustomElevatedButton(label: "Confirmer", onPressed: () {})
                  ],
                ),
                const Spacer(),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

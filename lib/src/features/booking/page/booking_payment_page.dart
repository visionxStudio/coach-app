import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';

class BookingPaymentPage extends StatelessWidget {
  const BookingPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NormalText("Selectionnez un moyen de paiement"),
            const HeightWidget(10),
            Container(
              height: height(215),
              width: width(135),
              color: kmasterCardColor,
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      ImageAsset.mastercard,
                      width: width(48),
                      height: height(32),
                    ),
                  ),
                  const Spacer(),
                  const NormalText(
                    "Master Card",
                    fontSize: kDefaultFontSize - 4,
                    color: ktextColor,
                  ),
                  const HeightWidget(5),
                  const NormalText(
                    "****1578",
                    color: kBottomSheetTitleColor,
                  ),
                ],
              ),
            ),
            const HeightWidget(10),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: kBlackColor),
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              margin: const EdgeInsets.all(kDefaultPadding * 2),
              child: const NormalText("Ajouter une adresse"),
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Divider(),
                    const HeightWidget(20),
                    Row(
                      children: const [
                        NormalText(
                          "Entrer un coupon de réduction",
                          color: kPrimaryColor,
                          fontSize: kDefaultFontSize - 2,
                        ),
                        Spacer(),
                        Icon(Icons.confirmation_num_outlined)
                      ],
                    ),
                    const HeightWidget(20),
                    const Divider(),
                  ],
                )),
            const HeightWidget(20),
            const NormalText(
              "Autre méthode de paiement",
              isBold: true,
              fontSize: kDefaultFontSize + 2,
            ),
            const HeightWidget(20),
            const NormalText("Paiement en plusieurs fois"),
            const HeightWidget(20),
            Row(
              children: [
                const NormalText(
                  "Partager la note",
                  fontSize: kDefaultFontSize - 2,
                  isBold: true,
                ),
                const Spacer(),
                Image.asset(
                  IconAsset.print,
                  width: kDefaultFontSize - 2,
                ),
              ],
            ),
            const HeightWidget(10),
            const Divider(),
            Row(
              children: const [
                NormalText(
                  "Total",
                  isBold: true,
                  fontSize: kDefaultFontSize - 2,
                ),
                Spacer(),
                NormalText(
                  "25€",
                  isBold: true,
                  fontSize: kDefaultFontSize - 2,
                ),
              ],
            ),
            const HeightWidget(30),
            const HeightWidget(30),
          ],
        ),
      ),
    );
  }
}

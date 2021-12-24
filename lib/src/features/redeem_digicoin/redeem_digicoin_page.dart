import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/container/custom_container.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/redeem_digicoin/data/redeem_offers.dart';
import 'package:digicoach/src/features/statistics/statistics_page.dart';
import 'package:flutter/material.dart';

class RedeemDigicoinPage extends StatelessWidget {
  const RedeemDigicoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: kWhiteColor,
        iconTheme: const IconThemeData(color: kBlackColor),
        title: Text(
          "redeem_page.program".tr(context),
          style: const TextStyle(
            color: kBlackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeightWidget(16.0),
            const DashboardDigicoinWidget(
              showButton: false,
            ),
            CustomContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NormalText(
                    "redeem_page.advantage".tr(context),
                    fontWeight: FontWeight.bold,
                    color: kAppBarColor,
                  ),
                  const HeightWidget(16.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: redeemLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      final RedeemOffersModel offer = redeemLists[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NormalText(
                                  offer.title,
                                  color: kBlackColor,
                                ),
                                NormalText(
                                  offer.percentage != null
                                      ? "-${offer.percentage}%"
                                      : "${offer.reductionAmount}€",
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500,
                                  color: kPrimaryColor,
                                ),
                              ],
                            ),
                            const HeightWidget(8.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: NormalText(
                                    offer.offer.tr(context),
                                    color: kLightBlueTextColor,
                                  ),
                                ),
                                InkWell(
                                  splashColor: kWhiteColor,
                                  onTap: () {},
                                  child: Container(
                                    height: 28.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: index < 2
                                          ? kBottonColor
                                          : kunSelectedAddressBorder,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: const Center(
                                      child: NormalText(
                                        "Débloquer",
                                        color: kWhiteColor,
                                      ),
                                    ),
                                  ),
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
      ),
    );
  }
}

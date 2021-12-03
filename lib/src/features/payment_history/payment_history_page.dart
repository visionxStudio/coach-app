import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/appbar/default_appbar.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/payment_history/model/payment_history_model.dart';
import 'package:flutter/material.dart';

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: "payment_history.paymentHistory".tr(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
          child: Column(
            children: [
              const HeightWidget(kDefaultmargin + 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_back,
                      color: kPrimaryColor,
                    ),
                  ),
                  Column(
                    children: [
                      NormalText(
                        "payment_history.invoices".tr(context),
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor,
                      ),
                      const NormalText(
                        "Avril/2021",
                        fontWeight: FontWeight.w500,
                        color: kLightGreyColor,
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_forward,
                      color: kLightGreyColor,
                    ),
                  ),
                ],
              ),
              const HeightWidget(kDefaultmargin + 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: paymentHistory.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final PaymentHistoryModel payment = paymentHistory[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          IconAsset.cash,
                          height: 40.0,
                          width: 40.0,
                        ),
                        const WidthWidget(16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NormalText(
                              payment.title.toUpperCase(),
                              color: kPrimaryColor,
                              isBold: true,
                            ),
                            const HeightWidget(8.0),
                            NormalText(
                              payment.date,
                              color: kBlackText,
                            ),
                          ],
                        ),
                        const Spacer(),
                        NormalText(
                          '${payment.amount.toInt()}€',
                          isBold: true,
                          fontSize: 20.0,
                          color: kPrimaryColor,
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

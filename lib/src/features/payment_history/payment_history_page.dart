import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            context.router.navigateBack();
          },
          color: kPrimaryColor,
        ),
        title: const NormalText(
          'payment_history.paymentHistory',
          isBold: true,
          color: kPrimaryColor,
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: kWhiteColor,
                  margin:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Column(
                    children: const [
                      PaymentHistoryAmountWidget(),
                      PaymentHistoryAmountWidget(),
                      PaymentHistoryAmountWidget(),
                      PaymentHistoryAmountWidget(),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentHistoryAmountWidget extends StatelessWidget {
  const PaymentHistoryAmountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding / 2,
        vertical: kDefaultmargin / 2,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        NormalText(
                          "#12563899402X",
                          color: kBottonColor,
                          fontSize: 14,
                        ),
                        WidthWidget(3),
                        NormalText(
                          "Total: 29€",
                          color: kBottonColor,
                          fontSize: 14,
                        )
                      ],
                    ),
                    const HeightWidget(5),
                    const NormalText(
                      "Méditation en pleine conscience",
                      fontSize: 12,
                      color: knavbarInactiveColor,
                    ),
                    const HeightWidget(4),
                    const NormalText(
                      "Placé le 24 nov. 2021 14:41:21",
                      fontSize: 10,
                      color: knavbarInactiveColor,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                    color: kProfileEditbuttonColor,
                    border: Border.all(color: kProfileEditbuttonColor),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: const [
                    Icon(Icons.download_outlined, size: 14),
                    WidthWidget(8),
                    NormalText(
                      "payment_history.invoices",
                      fontSize: 10,
                    )
                  ],
                ),
              )
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}

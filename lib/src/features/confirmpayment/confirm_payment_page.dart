import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class ConfirmPaymentPage extends StatelessWidget {
  const ConfirmPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kWhiteColor,
          leading: BackButton(
            color: kPrimaryColor,
            onPressed: () {
              context.router.navigateBack();
            },
          ),
          title: const NormalText("confirm_page.title"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NormalText(
                "confirm_page.oderinformation",
                fontSize: kDefaultFontSize - 4,
                isBold: true,
              ),
              const HeightWidget(20),
              const NormalText(
                "confirm_page.ordernumber",
                fontSize: kDefaultFontSize - 6,
                color: knavbarInactiveColor,
              ),
              const NormalText(
                "12563899402X",
                fontSize: kDefaultFontSize - 4,
              ),
              const HeightWidget(10),
              const NormalText(
                "confirm_page.course",
                fontSize: kDefaultFontSize - 6,
                color: knavbarInactiveColor,
              ),
              const NormalText(
                "12563899402X",
                fontSize: kDefaultFontSize - 4,
              ),
              const HeightWidget(10),
              const NormalText(
                "confirm_page.recieved",
                fontSize: kDefaultFontSize - 6,
                color: knavbarInactiveColor,
              ),
              const NormalText(
                "Cabrolié Joshua",
                fontSize: kDefaultFontSize - 4,
              ),
              const HeightWidget(10),
              const NormalText(
                "confirm_page.orderaddress",
                fontSize: kDefaultFontSize - 6,
                color: knavbarInactiveColor,
              ),
              const NormalText(
                "104 chemin de l’arbre blanc 39240",
                fontSize: kDefaultFontSize - 4,
              ),
              const HeightWidget(10),
              const NormalText(
                "confirm_page.methodofpayment",
                fontSize: kDefaultFontSize - 6,
                color: knavbarInactiveColor,
              ),
              const NormalText(
                "Mastercard qui termine en 1578",
                fontSize: kDefaultFontSize - 4,
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  NormalText(
                    "confirm_page.price",
                    fontSize: kDefaultFontSize - 4,
                  ),
                  NormalText("27,40€", fontSize: kDefaultFontSize - 4)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  NormalText("confirm_page.cost",
                      fontSize: kDefaultFontSize - 4),
                  NormalText("1,60€", fontSize: kDefaultFontSize - 4)
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  NormalText("confirm_page.total",
                      fontSize: kDefaultFontSize - 4),
                  NormalText(
                    "29,00€",
                    fontSize: kDefaultFontSize - 4,
                    isBold: true,
                  )
                ],
              ),
              const Divider(),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: CustomElevatedButton(
                    onPressed: () {
                      context.router.push(const FinishedPaymentPageRoute());
                    },
                    label: 'confirm_page.confirmpayment'),
              )
            ],
          ),
        ));
  }
}

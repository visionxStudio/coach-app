import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:auto_route/auto_route.dart';

class NewPaymentPage extends StatelessWidget {
  const NewPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "payment_page.title",
            fontSize: kDefaultFontSize - 4,
            isBold: true,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Dismissible(
                key: UniqueKey(),
                child: ListTile(
                  onTap: () {},
                  title: const NormalText(
                    "payment_page.applepay",
                    isBold: true,
                  ),
                  leading: SvgPicture.asset(IconAsset.applepay),
                  trailing: const NormalText("payment_page.default"),
                ),
              ),
              ListTile(
                onTap: () {},
                title: const NormalText(
                  "payment_page.strip",
                  isBold: true,
                ),
                leading: SvgPicture.asset(
                  IconAsset.strip,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                title: const NormalText(
                  "payment_page.savecard",
                  isBold: true,
                ),
              ),
              ListTile(
                onTap: () {},
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    NormalText(
                      "Joshua  Personal",
                      isBold: true,
                    ),
                    NormalText(
                      "**** **** **** 3582",
                      color: kDarkGrey,
                    ),
                  ],
                ),
                leading: SvgPicture.asset(IconAsset.mastercard),
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                onTap: () {},
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    NormalText(
                      "Joshua  Personal",
                      isBold: true,
                    ),
                    NormalText(
                      "**** **** **** 3582",
                      color: kDarkGrey,
                    ),
                  ],
                ),
                leading: SvgPicture.asset(IconAsset.visacard),
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                onTap: () {
                  context.router.push(const ConfirmPaymentPageRoute());
                },
                title: const NormalText(
                  "payment_page.addcard",
                  color: kAddressborder,
                ),
                leading: const Icon(
                  Icons.credit_card,
                  color: kAddressborder,
                ),
              ),
            ],
          ),
        ));
  }
}

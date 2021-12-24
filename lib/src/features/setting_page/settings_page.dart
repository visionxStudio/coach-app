import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/container/custom_container.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kPrimaryColor),
        backgroundColor: kWhiteColor,
        centerTitle: true,
        elevation: 0.0,
        title: const NormalText(
          "setting_page.title",
          color: kPrimaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeightWidget(16.0),
            CustomContainer(
              child: Column(
                children: [
                  Settingtile(
                    image: IconAsset.device,
                    title: "setting_page.changephoneno",
                    onTap: () {
                      context.router.push(const ChangeMobileNumberPageRoute());
                    },
                  ),
                  Settingtile(
                    image: IconAsset.star2,
                    title: "setting_page.rateapplication",
                    onTap: () {},
                  ),
                  Settingtile(
                    image: IconAsset.document,
                    title: "setting_page.termsandcondition",
                    onTap: () {},
                  ),
                  Settingtile(
                    image: IconAsset.shield,
                    onTap: () {},
                    title: "setting_page.dataprotection",
                  ),
                  Settingtile(
                    image: IconAsset.user2,
                    onTap: () {
                      showModalBottomSheet(
                          barrierColor: kLightGrey.withOpacity(0.6),
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          context: context,
                          builder: (context) {
                            return Container(
                              height: height(400),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding / 2,
                                  vertical: kDefaultPadding),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0)),
                                color: kWhiteColor,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const NormalText(
                                    "setting_page.deletemyaccount",
                                    fontSize: 14,
                                    isBold: true,
                                    color: kPrimaryColor,
                                  ),
                                  const HeightWidget(30),
                                  Center(
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: kiconColor,
                                        ),
                                        child: SvgPicture.asset(
                                            IconAsset.deleteaccount)),
                                  ),
                                  const HeightWidget(30),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: NormalText(
                                      "setting_page.deleteaccountwarning",
                                      isCentered: true,
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  const HeightWidget(8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      NormalText(
                                        "setting_page.loseyour",
                                        fontSize: 12,
                                        color: kDarkGrey,
                                      ),
                                      NormalText(
                                        "28 28 digicoins",
                                        fontSize: 12,
                                        color: kBottonColor,
                                      )
                                    ],
                                  ),
                                  const HeightWidget(15),
                                  Container(
                                    alignment: Alignment.center,
                                    width: SizeConfig.screenWidth,
                                    padding:
                                        const EdgeInsets.all(kDefaultPadding),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: kDefaultPadding / 2,
                                        horizontal: 3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: kborderRedColor)),
                                    child: const NormalText(
                                      "setting_page.yesdelete",
                                      color: kborderRedColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const HeightWidget(10),
                                  InkWell(
                                    onTap: () {
                                      context.router.navigateBack();
                                    },
                                    child: const NormalText(
                                      "setting_page.cancel",
                                      color: knavbarInactiveColor,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    title: "setting_page.deletemyaccount",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Settingtile extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  const Settingtile({
    Key? key,
    required this.image,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 20.0,
            ),
            const WidthWidget(14.0),
            Expanded(
              child: NormalText(
                title,
                color: kBlackColor,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

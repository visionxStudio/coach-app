import 'package:auto_route/auto_route.dart';
import 'package:digicoach/src/routes/router.dart';

import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/button/custom_text_button.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';

class FinishedPaymentPage extends StatelessWidget {
  const FinishedPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.router.navigateBack();
          },
          color: kPrimaryColor,
        ),
        elevation: 0,
        backgroundColor: kWhiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding / 2, vertical: kDefaultPadding),
        child: Column(
          children: [
            const HeightWidget(20),
            const Align(
              alignment: Alignment.center,
              child: NormalText(
                "finished_page.thanks",
                isBold: true,
                fontSize: kDefaultFontSize * 2,
                isCentered: true,
              ),
            ),
            const NormalText(
              "finished_page.appointment",
              fontSize: kDefaultFontSize - 2,
              color: kDarkGrey,
              isCentered: true,
            ),
            const HeightWidget(20),
            ListTile(
              title: Row(
                children: const [
                  NormalText(
                    "#12563899402X",
                    fontSize: kDefaultFontSize - 4,
                  ),
                  WidthWidget(20),
                  NormalText(
                    "Total: 29€",
                    fontSize: kDefaultFontSize - 4,
                    isBold: true,
                  ),
                ],
              ),
              isThreeLine: true,
              subtitle: Row(
                children: const [
                  NormalText(
                    "finished_page.placedon",
                    fontSize: kDefaultFontSize - 8,
                    color: kbioColor,
                  ),
                  NormalText(
                    "24 nov. 2021 14:41:21",
                    fontSize: kDefaultFontSize - 8,
                    color: kbioColor,
                  ),
                ],
              ),
              trailing: CustomIconButtonText(
                title: 'finished_page.bill',
                icon: Icons.download,
                onTap: () {},
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          ImageAsset.testprofile,
                        ),
                      ),
                      const WidthWidget(10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          NormalText(
                            "Méditation en pleine conscience",
                            fontSize: kDefaultFontSize - 6,
                            color: kBlackColor,
                          ),
                          NormalText(
                            "Par Mira Septimus",
                            fontSize: kDefaultFontSize - 6,
                            color: kLightBlueTextColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: kScheduleBorder),
                        ),
                        child: Row(
                          children: const [
                            NormalText(
                              "Tue Jan 14, 2022, 13:30",
                              fontSize: kDefaultFontSize - 6,
                              color: kscheduleTextColor,
                            ),
                            WidthWidget(10),
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: kBlackColor,
                            ),
                            WidthWidget(10),
                            NormalText(
                              "En ligne",
                              color: kscheduleTextColor,
                              fontSize: kDefaultFontSize - 6,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const NormalText(
                          "104 chemin de l’arbre blanc 39240",
                          fontSize: kDefaultFontSize - 6,
                          color: kPrimaryColor,
                        ),
                        CustomIconButtonText(
                          onTap: () {},
                          title: 'finished_page.todiscuss',
                          icon: Icons.message,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const HeightWidget(10),
            CustomElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const MyAppointmentsPageRoute());
              },
              label: 'VOIR MES RENDEZ-VOUS',
            ),
            CustomTextButton(
              text: "Revenir à la page principale",
              onPressed: () {
                context.router.push(const SelectCoursePreferencePageRoute());
              },
            )
          ],
        ),
      ),
    );
  }
}

class CustomIconButtonText extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const CustomIconButtonText({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width(90),
        height: height(35),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: kbilldownload,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: kbilldownload,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 15,
            ),
            const WidthWidget(10),
            NormalText(
              title,
              fontSize: kDefaultFontSize - 8,
            )
          ],
        ),
      ),
    );
  }
}

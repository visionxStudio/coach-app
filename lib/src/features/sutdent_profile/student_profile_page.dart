import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:auto_route/auto_route.dart';

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kScafoldColor,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0,
          title: const NormalText(
            'student_profile_page.title',
            isBold: true,
            color: kPrimaryColor,
            fontSize: 14,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const TopHeaderProfileDetailWidget(),
              Expanded(
                child: Container(
                  color: kWhiteColor,
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: kDefaultPadding / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const NormalText(
                        "student_profile_page.personalinfo",
                        fontSize: 14,
                        color: kPrimaryColor,
                      ),
                      const HeightWidget(10),
                      SingleChildScrollView(
                          child: Column(
                        children: [
                          OptionMenuItemsWidget(
                            onTap: () {
                              context.router
                                  .push(const CoachProfilePageRoute());
                            },
                            title: "student_profile_page.manageprofile",
                            icon: IconAsset.educationIcon1,
                            svg: false,
                            iscomplete: false,
                          ),
                          OptionMenuItemsWidget(
                            onTap: () {
                              context.router.push(
                                  const ProfilePersonalInofrmationPageRoute());
                            },
                            title: "student_profile_page.personalInformation",
                            icon: IconAsset.personalinfo,
                            iscomplete: false,
                          ),
                          OptionMenuItemsWidget(
                            onTap: () {
                              context.router
                                  .push(const NotificationpageRoute());
                            },
                            title: "student_profile_page.notifications",
                            icon: IconAsset.notification,
                          ),
                          OptionMenuItemsWidget(
                            onTap: () {
                              context.router
                                  .push(const AddProfileMethodPageRoute());
                            },
                            title: "student_profile_page.managepaymentmethod",
                            icon: IconAsset.cards,
                          ),
                          OptionMenuItemsWidget(
                            onTap: () {
                              context.router.push(const AvisPageRoute());
                            },
                            title: "student_profile_page.opinion",
                            icon: IconAsset.chats,
                          ),
                          OptionMenuItemsWidget(
                            onTap: () {
                              context.router
                                  .push(const PaymentHistoryPageRoute());
                            },
                            title: "student_profile_page.paymenthistory",
                            icon: IconAsset.paymenthistory,
                          ),
                          OptionMenuItemsWidget(
                            onTap: () {
                              context.router.push(const SettingsPageRoute());
                            },
                            title: "student_profile_page.setting",
                            icon: IconAsset.setting,
                          )
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class OptionMenuItemsWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String icon;
  final String title;
  final bool iscomplete;
  final bool svg;
  const OptionMenuItemsWidget({
    this.onTap,
    required this.icon,
    required this.title,
    this.iscomplete = true,
    this.svg = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          svg
              ? SvgPicture.asset(
                  icon,
                  width: 16,
                  height: 21,
                )
              : Image.asset(
                  icon,
                  width: 16,
                  height: 21,
                ),
          const WidthWidget(5),
          NormalText(
            title,
            fontSize: 14,
            color: kPrimaryColor,
          ),
          if (!iscomplete) const WidthWidget(5),
          if (!iscomplete)
            const CircleAvatar(
              backgroundColor: kunfinishedColor,
              radius: 5,
            )
        ],
      ),
    );
  }
}

class TopHeaderProfileDetailWidget extends StatelessWidget {
  const TopHeaderProfileDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      margin: const EdgeInsets.symmetric(vertical: kDefaultmargin / 2),
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding, horizontal: kDefaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: const [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(ImageAsset.testprofile),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                    radius: 12,
                    backgroundColor: kBottonColor,
                    child: Icon(
                      Icons.check,
                      color: kWhiteColor,
                      size: 14,
                    )),
              )
            ],
          ),
          const WidthWidget(10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NormalText(
                "Emery Saris",
                fontSize: kDefaultFontSize - 4,
              ),
              const HeightWidget(5),
              Row(
                children: const [
                  NormalText(
                    "9855072319",
                    fontSize: kDefaultFontSize - 6,
                    color: kLightBlueTextColor,
                  ),
                  VerticalDivider(
                    width: 10,
                  ),
                  NormalText(
                    "abc@gmail.com",
                    fontSize: kDefaultFontSize - 6,
                    color: kLightBlueTextColor,
                  ),
                ],
              ),
              const HeightWidget(5),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: kProfileEditbuttonColor)),
                    child: InkWell(
                      onTap: () {
                        context.router.push(const ProfileModifyPageRoute());
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.edit,
                            color: kscheduleTextColor,
                            size: 10,
                          ),
                          WidthWidget(5),
                          NormalText(
                            'student_profile_page.modify',
                            fontSize: 10,
                            color: kscheduleTextColor,
                            isBold: true,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

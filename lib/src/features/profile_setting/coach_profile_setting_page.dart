import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/payment/payment_page.dart';
import 'package:digicoach/src/features/profile_setting/widgets/setting_list.dart';
import 'package:digicoach/src/routes/app_router.gr.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:auto_route/auto_route.dart';

import 'package:flutter_svg/flutter_svg.dart';

class CoachProfileSettingPage extends StatelessWidget {
  const CoachProfileSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileSettingBackgroundWidget(
      title: 'coach_profile_setting_page.profile',
      body: Column(
        children: [
          const CoachInformationWidget(),
          ListTile(
              title: NormalText(
                AppLocalizations.of(context)
                    .translate('coach_profile_setting_page.manageprofile'),
                color: kBlackColor,
              ),
              trailing: const SvgIcon(
                icon: IconAsset.person,
              )),
          ListTile(
              onTap: () {
                context.router
                    .push(const ProfilePersonalInformationPageRoute());
              },
              title: NormalText(
                AppLocalizations.of(context).translate(
                    'coach_profile_setting_page.personalInformation'),
                color: kBlackColor,
              ),
              trailing: const SvgIcon(
                icon: IconAsset.person,
              )),
          ListTile(
              title: NormalText(
                AppLocalizations.of(context)
                    .translate('coach_profile_setting_page.manageprice'),
                color: kBlackColor,
              ),
              trailing: const SvgIcon(
                icon: IconAsset.tag,
              )),
          ListTile(
              title: NormalText(
                AppLocalizations.of(context)
                    .translate('coach_profile_setting_page.wallet'),
                color: kBlackColor,
              ),
              trailing: const SvgIcon(
                icon: IconAsset.wallet,
              )),
          SettingList(
            title: "coach_profile_setting_page.notifications".tr(context),
            icon: IconAsset.notification,
            onTap: () {
              context.router.push(const NotificationpageRoute());
            },
          ),
          SettingList(
            title: AppLocalizations.of(context)
                .translate('coach_profile_setting_page.managepaymentmethod'),
            icon: IconAsset.card,
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                barrierColor: kLightGrey.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                context: context,
                builder: (context) {
                  return const PaymentBottomSheet();
                },
              );
            },
          ),
          SettingList(
            title: AppLocalizations.of(context)
                .translate('coach_profile_setting_page.opinion'),
            icon: IconAsset.thought,
            onTap: () {
              context.router.push(const AvisPageRoute());
            },
          ),
          SettingList(
            title: "coach_profile_setting_page.transferhistory".tr(context),
            icon: IconAsset.history,
            onTap: () {
              context.router.push(const PaymentHistoryPageRoute());
            },
          ),
          SettingList(
            title: "coach_profile_setting_page.setting".tr(context),
            icon: IconAsset.setting,
            onTap: () {
              context.router.push(const ParameterPageRoute());
            },
          ),
          ListTile(
            title: NormalText(
              AppLocalizations.of(context)
                  .translate('coach_profile_setting_page.tongue'),
              color: kBlackColor,
            ),
          ),
          ListTile(
              title: NormalText(
                AppLocalizations.of(context)
                    .translate('coach_profile_setting_page.Sponsorship'),
                fontSize: kDefaultFontSize + 2,
                color: kBlackColor,
              ),
              trailing: const SvgIcon(
                icon: IconAsset.scholorship,
              )),
        ],
      ),
      footer: NormalText(
        AppLocalizations.of(context)
            .translate('coach_profile_setting_page._sponsorship'),
        fontSize: kDefaultFontSize + 2,
        color: kBlackColor,
      ),
    );
  }
}

class ProfileSettingBackgroundWidget extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? footer;
  const ProfileSettingBackgroundWidget({
    Key? key,
    required this.title,
    required this.body,
    this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          leading: InkWell(
            onTap: () {
              context.router.navigateBack();
            },
            child: const Padding(
              padding: EdgeInsets.all(kDefaultPadding - 5),
              child: CircleAvatar(
                backgroundColor: kPrimaryColor,
                child: Icon(
                  Icons.keyboard_backspace,
                  size: kDefaultFontSize - 3,
                ),
              ),
            ),
          ),
          title: NormalText(
            AppLocalizations.of(context).translate(title),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding),
                margin: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding / 2, vertical: kDefaultPadding),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kWhiteColor),
                child: SingleChildScrollView(
                  child: body,
                ),
              ),
            ),
            Container(
              color: kWhiteColor,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: height(60),
              child: InkWell(onTap: () {}, child: footer ?? Container()),
            )
          ],
        ));
  }
}

class SvgIcon extends StatelessWidget {
  final String icon;
  final bool complete;
  const SvgIcon({Key? key, required this.icon, this.complete = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(36),
      height: height(34),
      child: Stack(
        children: [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return ui.Gradient.linear(
                const Offset(-4.0, 4.0),
                const Offset(4.0, -4.0),
                [kIconGradientColor2, kIconGradientColor1],
              );
            },
            child: SvgPicture.asset(
              icon,
              width: width(26),
              height: height(24),
              color: kPrimaryColor,
              cacheColorFilter: true,
            ),
          ),
          if (!complete)
            const Positioned(
                right: 0,
                top: 0,
                child: Icon(
                  Icons.priority_high,
                  color: Colors.red,
                  size: 20,
                )),
        ],
      ),
    );
  }
}

class CoachInformationWidget extends StatelessWidget {
  const CoachInformationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: kDefaultRadius * 2,
          backgroundImage: AssetImage(ImageAsset.testprofile),
        ),
        const WidthWidget(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NormalText(
                "Bessie Cooper",
                fontSize: kDefaultFontSize + 8,
                isBold: true,
                color: kBlackColor,
              ),
              const WidthWidget(5),
              NormalText(
                AppLocalizations.of(context)
                    .translate('coach_profile_setting_page.Digicoach'),
                color: kBlackColor,
              ),
              const WidthWidget(5),
              NormalText(
                AppLocalizations.of(context)
                        .translate('coach_profile_setting_page.membernum') +
                    '  1239475605',
                color: kBlackColor,
              ),
              const WidthWidget(5),
              InkWell(
                onTap: () {
                  context.router.push(const ProfileModificationPageRoute());
                },
                child: NormalText(
                  AppLocalizations.of(context)
                      .translate('coach_profile_setting_page.modifyprofile'),
                  color: kBlackColor.withOpacity(.3),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

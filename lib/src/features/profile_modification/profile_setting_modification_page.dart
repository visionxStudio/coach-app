import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/profile_setting/coach_profile_setting_page.dart';
import 'package:flutter/material.dart';

class ProfileModificationPage extends StatelessWidget {
  const ProfileModificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileSettingBackgroundWidget(
        title: "modify_profile_page.title",
        body: Column(
          children: [
            ListTile(
                title: NormalText(
                  AppLocalizations.of(context)
                      .translate('modify_profile_page.profilepicture'),
                  color: kBlackColor,
                ),
                trailing: const SvgIcon(
                  icon: IconAsset.photo,
                )),
            ListTile(
                title: NormalText(
                  AppLocalizations.of(context)
                      .translate('modify_profile_page.goals'),
                  color: kBlackColor,
                ),
                trailing: const SvgIcon(
                  icon: IconAsset.arrow,
                )),
            ListTile(
                title: NormalText(
                  AppLocalizations.of(context)
                      .translate('modify_profile_page.bio'),
                  color: kBlackColor,
                ),
                trailing: const SvgIcon(
                  icon: IconAsset.chat,
                )),
            ListTile(
                title: NormalText(
                  AppLocalizations.of(context)
                      .translate('modify_profile_page.wellbinglevel'),
                  color: kBlackColor,
                ),
                trailing: const SvgIcon(
                  icon: IconAsset.network,
                )),
            ListTile(
                title: NormalText(
                  AppLocalizations.of(context)
                      .translate('modify_profile_page.physicalinformation'),
                  color: kBlackColor,
                ),
                trailing: const SvgIcon(
                  icon: IconAsset.network,
                )),
          ],
        ));
  }
}

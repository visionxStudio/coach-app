import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';

import '../coach_profile_setting_page.dart';

class SettingList extends StatelessWidget {
  const SettingList(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);
  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: NormalText(
          title,
          color: kBlackColor,
        ),
        trailing: SvgIcon(
          icon: icon,
        ),
      ),
    );
  }
}

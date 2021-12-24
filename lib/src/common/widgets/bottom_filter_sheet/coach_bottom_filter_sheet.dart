import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app_localization.dart';

class ShowCoachBottomFilterWidget extends ConsumerWidget {
  const ShowCoachBottomFilterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final coachFilterController = ref.watch(mainDashboardProvider);
    return Container(
      decoration: const BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultmargin / 2),
      margin: const EdgeInsets.symmetric(horizontal: kDefaultmargin / 2),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HeightWidget(8),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(ImageAsset.dropdown, height: height(16)),
            ),
            const HeightWidget(16),
            NormalText(
              AppLocalizations.of(context).translate('bottom_sheet.sort_by'),
            ),
            ToggleWidget(
              title: AppLocalizations.of(context)
                  .translate('bottom_sheet.lowestPrice'),
              state: true,
              change: (value) {},
            ),
            ToggleWidget(
              title: AppLocalizations.of(context)
                  .translate('bottom_sheet.highestPrice'),
              state: true,
              change: (value) {},
            ),
            ToggleWidget(
              title:
                  AppLocalizations.of(context).translate('bottom_sheet.near'),
              state: true,
              change: (value) {},
            ),
            const Divider(),
            Center(
              child: NormalText(
                AppLocalizations.of(context)
                    .translate('bottom_sheet.filter_by'),
              ),
            ),
            BottomSheetListWidget(
              title: AppLocalizations.of(context)
                  .translate('bottom_sheet.Localisation'),
              subtitle:
                  AppLocalizations.of(context).translate('bottom_sheet.world'),
              onTap: () {},
            ),
            BottomSheetListWidget(
              title: AppLocalizations.of(context)
                  .translate('bottom_sheet.category'),
              subtitle:
                  AppLocalizations.of(context).translate('bottom_sheet.all'),
              onTap: () {},
            ),
            BottomSheetListWidget(
              title: AppLocalizations.of(context)
                  .translate('bottom_sheet.courseType'),
              subtitle:
                  AppLocalizations.of(context).translate('bottom_sheet.inLine'),
              onTap: () {},
            ),
            BottomSheetListWidget(
              title: AppLocalizations.of(context)
                  .translate('bottom_sheet.experience'),
              subtitle:
                  AppLocalizations.of(context).translate('bottom_sheet.all'),
              onTap: () {},
            ),

            BottomSheetListWidget(
              title:
                  AppLocalizations.of(context).translate('bottom_sheet.gender'),
              subtitle: AppLocalizations.of(context)
                  .translate('bottom_sheet.menAndWomen'),
              onTap: () {},
            ),
            BottomSheetListWidget(
              title:
                  AppLocalizations.of(context).translate('bottom_sheet.date'),
              subtitle: AppLocalizations.of(context)
                  .translate('bottom_sheet.thisWeek'),
              onTap: () {},
            ),
            BottomSheetListWidget(
              title: AppLocalizations.of(context)
                  .translate('bottom_sheet.courseLanguage'),
              subtitle: AppLocalizations.of(context)
                  .translate('bottom_sheet.frenchAndEnglish'),
              onTap: () {},
            ),

            // ToggleWidget(
            //   title: 'Prix le plus bas',
            //   state: true,
            //   change: (value) {},
            // ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetListWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  const BottomSheetListWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      onTap: onTap,
      title: NormalText(
        title,
        color: kBottomSheetTitleColor,
        fontSize: kDefaultFontSize - 2,
      ),
      subtitle: NormalText(
        subtitle,
        fontSize: kDefaultFontSize - 4,
        color: kBottomSheetSubTitleColor,
      ),
      trailing: const Icon(
        Icons.arrow_forward,
        color: kBottomSheetArrowColor,
      ),
    );
  }
}

class ToggleWidget extends StatelessWidget {
  final String title;
  final dynamic change;
  final bool state;
  final double? fontSize;
  final bool isBold;
  const ToggleWidget({
    Key? key,
    required this.title,
    required this.state,
    this.fontSize,
    this.isBold = false,
    required this.change,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NormalText(
          title,
          fontSize: fontSize ?? kDefaultFontSize - 2,
          isBold: isBold,
        ),
        const Spacer(),
        Switch(
          value: state,
          onChanged: change,
          activeTrackColor: kBottonColor.withOpacity(0.5),
          activeColor: kBottonColor,
        ),
      ],
    );
  }
}

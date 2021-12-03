import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/widgets/appbar/default_appbar.dart';
import 'package:digicoach/src/features/parameter/parameter_list.dart';
import 'package:flutter/material.dart';

class ParameterPage extends StatelessWidget {
  const ParameterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: "parameter_page.settings".tr(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Column(
            children: [
              ParameterLists(
                title: "parameter_page.account".tr(context),
                icon: IconAsset.account,
              ),
              ParameterLists(
                title: "parameter_page.password".tr(context),
                icon: IconAsset.pass,
              ),
              ParameterLists(
                title: "parameter_page.rate_application".tr(context),
                icon: IconAsset.terms,
              ),
              ParameterLists(
                title: "parameter_page.aid".tr(context),
                icon: IconAsset.privacy,
              ),
              ParameterLists(
                title: "parameter_page.version".tr(context),
                icon: IconAsset.version,
                hasLeading: true,
              ),
              ParameterLists(
                title: "parameter_page.terms_and_conditions".tr(context),
                icon: IconAsset.opensource,
              ),
              ParameterLists(
                title: "parameter_page.data_protection".tr(context),
                icon: IconAsset.opensource,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

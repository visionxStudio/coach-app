import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../app_localization.dart';

class ProfileParameterPage extends StatelessWidget {
  const ProfileParameterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kPureBlack,
      appBar: AppBar(
        toolbarHeight: 50.0,
        elevation: 0.0,
        backgroundColor: kPureBlack,
        leading: InkWell(
          onTap: () {
            context.router.pop();
          },
          splashColor: kWhiteColor,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 8.0),
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 10.0,
              width: 10.0,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: kWhiteColor),
              child: const Center(
                child: Icon(
                  Icons.arrow_back,
                  color: kPureBlack,
                  size: 18.0,
                ),
              ),
            ),
          ),
        ),
        title: NormalText(
          AppLocalizations.of(context)
              .translate('profile_parameter.profile_photo'),
          color: kWhiteColor,
          fontSize: 20.0,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          height: height - MediaQuery.of(context).padding.top - 50,
          child: Stack(
            children: [
              SizedBox(
                height: height - MediaQuery.of(context).padding.top - 100,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 279,
                    width: 279,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                            ImageAsset.profileEdit,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: height * 0.07 + 24.0,
                left: 16.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0),
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.remove_red_eye_outlined,
                        color: kAppBarColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        AppLocalizations.of(context)
                            .translate('profile_parameter.visible'),
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.7,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              IconAsset.modify,
                              height: 20.0,
                              width: 20.0,
                              color: kPrimaryColor,
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .translate('profile_parameter.modify'),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              IconAsset.adjust,
                              height: 20.0,
                              width: 20.0,
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .translate('profile_parameter.adjust'),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              IconAsset.delete,
                              height: 20.0,
                              width: 20.0,
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .translate('profile_parameter.delete'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

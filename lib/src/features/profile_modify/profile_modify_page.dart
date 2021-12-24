import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/auth/new_auth/details_page/bloc/image_picker_controller.dart';
import 'package:digicoach/src/features/sutdent_profile/student_profile_page.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ProfileModifyPage extends StatelessWidget {
  const ProfileModifyPage({Key? key}) : super(key: key);

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
          'student_modify_page.title',
          isBold: true,
          color: kPrimaryColor,
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              OptionMenuItemsWidget(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      elevation: 0,
                      //  barrierColor: Colors.black.withAlpha(1),
                      backgroundColor: Colors.transparent,
                      builder: (context) => const CameraOptionWidget(),
                    );
                  },
                  title: 'student_modify_page.profilepic',
                  icon: IconAsset.profile),
              OptionMenuItemsWidget(
                  onTap: () {
                    context.router.push(const GoalPageRoute());
                  },
                  iscomplete: false,
                  title: 'student_modify_page.goal',
                  icon: IconAsset.check),
              OptionMenuItemsWidget(
                  onTap: () {
                    context.router.push(const BioPageRoute());
                  },
                  iscomplete: false,
                  title: 'student_modify_page.bio',
                  icon: IconAsset.chats),
              OptionMenuItemsWidget(
                  onTap: () {
                    context.router.push(const WellbeingPageRoute());
                  },
                  title: 'student_modify_page.wellbeing',
                  icon: IconAsset.wellbeing),
              OptionMenuItemsWidget(
                  onTap: () {},
                  title: 'student_modify_page.physicalandmentalinfo',
                  icon: IconAsset.info),
            ],
          ),
        ),
      ),
    );
  }
}

class CameraOptionWidget extends StatelessWidget {
  const CameraOptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (ctx, ref, child) {
        return Container(
          padding: const EdgeInsets.symmetric(
              vertical: kDefaultmargin, horizontal: kDefaultPadding / 2),
          height: height(250),
          decoration: const BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kDefaultRadius),
              topRight: Radius.circular(kDefaultRadius),
            ),
          ),
          child: Column(
            children: [
              const Center(
                child: NormalText(
                  "student_modify_page.optionselect",
                  isBold: true,
                  fontSize: 18,
                ),
              ),
              const HeightWidget(20),
              ListTile(
                onTap: () {
                  ref
                      .read(imagePickerControllerNotifier)
                      .pickImage(imageSource: ImageSource.camera);
                  context.router.pop();
                },
                leading: const NormalText(
                  "student_modify_page.opencamera",
                  fontSize: 18,
                  color: kbuttonsheetText,
                ),
              ),
              ListTile(
                onTap: () {
                  ref
                      .read(imagePickerControllerNotifier)
                      .pickImage(imageSource: ImageSource.gallery);
                  context.router.pop();
                },
                leading: const NormalText(
                  "student_modify_page.opengallery",
                  fontSize: 18,
                  color: kbuttonsheetText,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  context.router.pop();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const NormalText(
                    'student_modify_page.cancel',
                    color: kTextLinkColor,
                    //color: ,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

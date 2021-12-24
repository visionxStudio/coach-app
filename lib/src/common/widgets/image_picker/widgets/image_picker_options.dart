import 'package:auto_route/auto_route.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/auth/new_auth/details_page/bloc/image_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerOptions extends ConsumerStatefulWidget {
  const ImagePickerOptions({
    Key? key,
  }) : super(key: key);

  @override
  _ImagePickerOptionsState createState() => _ImagePickerOptionsState();
}

class _ImagePickerOptionsState extends ConsumerState<ImagePickerOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      width: SizeConfig.screenWidth * 0.8,
      decoration: BoxDecoration(
        color: kDialogBoxBackground,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0), color: kWhiteColor),
            child: Image.asset(
              ImageAsset.pickImage,
              height: 100.0,
              width: 100.0,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: kDialogBoxBackground,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  const NormalText(
                    "Pick an image",
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                    isCentered: true,
                    fontSize: 18.0,
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      CustomElevatedButton(
                        label: "Pick From Gallery",
                        onPressed: () {
                          ref
                              .read(imagePickerControllerNotifier)
                              .pickImage(imageSource: ImageSource.gallery);
                          context.router.pop();
                        },
                        backgroundColor: kWhiteColor,
                        textColor: kDialogBoxBackground,
                        height: 40.0,
                      ),
                      CustomElevatedButton(
                        label: "Pick from Camera",
                        onPressed: () {
                          ref
                              .read(imagePickerControllerNotifier)
                              .pickImage(imageSource: ImageSource.camera);
                          context.router.pop();
                        },
                        backgroundColor: kWhiteColor,
                        textColor: kDialogBoxBackground,
                        height: 40.0,
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    label: "Cancel",
                    onPressed: () {
                      context.router.pop();
                    },
                    backgroundColor: kWhiteColor,
                    textColor: kDialogBoxBackground,
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

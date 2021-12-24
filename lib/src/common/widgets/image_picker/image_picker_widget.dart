import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';

import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/auth/new_auth/details_page/bloc/image_picker_controller.dart';
import 'package:digicoach/src/features/profile_modify/profile_modify_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImagePickerWidget extends ConsumerStatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends ConsumerState<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (ctx, ref, child) {
        final imageProvider = ref.watch(imagePickerControllerNotifier);
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              elevation: 0,
              backgroundColor: Colors.transparent,
              builder: (context) => const CameraOptionWidget(),
            );
          },
          child: Column(
            children: [
              imageProvider.imageFile != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(300.0),
                      child: Image.file(
                        imageProvider.imageFile!,
                        fit: BoxFit.cover,
                        height: 80.0,
                        width: 80.0,
                      ),
                    )
                  : Image.asset(
                      ImageAsset.placeholder,
                      height: 80.0,
                      width: 80.0,
                    ),
              const HeightWidget(4.0),
              NormalText(
                "details_page.add_photo".tr(context),
                fontSize: 16.0,
                isCentered: true,
                fontWeight: FontWeight.w400,
                color: kLightGreyColor,
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CoachDocumentsUpload extends StatelessWidget {
  const CoachDocumentsUpload({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: DottedBorder(
        color: kDocumentTextColor,
        radius: const Radius.circular(8),
        borderType: BorderType.RRect,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const WidthWidget(16.0),
              Image.asset(
                IconAsset.upload,
                height: 14.0,
                color: kDocumentTextColor,
              ),
              const WidthWidget(8.0),
              Expanded(
                child: NormalText(
                  label,
                  fontSize:
                      SizeConfig.screenHeight < kTabletBreakpoint ? 16.0 : 18.0,
                  color: kDocumentTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

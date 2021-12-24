import 'package:auto_route/auto_route.dart';
import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/coach_documents/widgets/coach_documents_upload.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';

class CoachDocumentsPage extends StatelessWidget {
  const CoachDocumentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.router.pop();
          },
          borderRadius: BorderRadius.circular(50.0),
          child: const Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
        ),
        elevation: 0.0,
        backgroundColor: kScafoldColor,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const HeightWidget(8.0),
                Column(
                  children: [
                    NormalText(
                      "coach_documents.document_verification".tr(context),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400,
                      isCentered: true,
                      color: kPrimaryColor,
                    ),
                    const HeightWidget(8.0),
                    NormalText(
                      "coach_documents.document_information".tr(context),
                      fontSize: 16.0,
                      isCentered: true,
                      fontWeight: FontWeight.w400,
                      color: ksearchText,
                    ),
                  ],
                ),
                const HeightWidget(16.0),
                Column(
                  children: [
                    CoachDocumentsUpload(
                      label: "coach_documents.professional_card".tr(context),
                    ),
                    CoachDocumentsUpload(
                      label: "coach_documents.identity_card".tr(context),
                    ),
                    CoachDocumentsUpload(
                      label: "coach_documents.download_diplomas".tr(context),
                    ),
                    CoachDocumentsUpload(
                      label: "coach_documents.other_documents".tr(context),
                    ),
                  ],
                ),
                const HeightWidget(16.0),
                Column(
                  children: [
                    CustomElevatedButton(
                      label: "coach_documents.send".tr(context),
                      onPressed: () {
                        context.router.push(NavBarRoute());
                      },
                    ),
                    const HeightWidget(8.0),
                    NormalText(
                      "details_page.skip_now".tr(context),
                      fontSize: 18.0,
                      color: kTextLinkColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/container/custom_container.dart';
import 'package:digicoach/src/common/widgets/input_field/minimal_input_field.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/auth/new_auth/mobile_number_page/widgets/country_dropdown.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

class ChangeMobileNumberPage extends StatelessWidget {
  const ChangeMobileNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kPrimaryColor),
        backgroundColor: kWhiteColor,
        centerTitle: true,
        elevation: 0.0,
        title: const NormalText(
          "Changer de numéro de téléphone",
          color: kPrimaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeightWidget(16.0),
            CustomContainer(
              child: Column(
                children: [
                  const HeightWidget(32.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CountryCodeDropdown(),
                        const WidthWidget(8.0),
                        Consumer(
                          builder: (ctx, ref, child) {
                            return const Expanded(
                              child: MinimalInputField(
                                backgroundColor: kScafoldColor,
                                // onChanged: (String value) {
                                //   ref
                                //       .read(mobileNumberControllerProvider)
                                //       .changeMobileNumber(
                                //           value: int.parse(value));
                                // },
                                hintText: "(00)-00-00-00-00",
                                maxLines: 10,
                                textInputType: TextInputType.number,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const HeightWidget(32.0),
                  CustomElevatedButton(
                      label: "ENvoyer le code OTP",
                      onPressed: () {
                        context.router.push(const OtpVerificationPageRoute());
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

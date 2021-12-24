import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/container/custom_container.dart';
import 'package:digicoach/src/common/widgets/input_field/minimal_input_field.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/auth/bloc/signup_with_mobile/signup_with_mobile_state_notifier.dart';
import 'package:digicoach/src/features/auth/new_auth/mobile_number_page/widgets/country_dropdown.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeMobileNumberPage extends StatefulWidget {
  const ChangeMobileNumberPage({Key? key}) : super(key: key);

  @override
  State<ChangeMobileNumberPage> createState() => _ChangeMobileNumberPageState();
}

class _ChangeMobileNumberPageState extends State<ChangeMobileNumberPage> {
  final _formKey = GlobalKey<FormState>();

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
                            final state = ref.watch(mobileSignUpStateProvider);
                            return Expanded(
                              child: Form(
                                key: _formKey,
                                child: MinimalInputField(
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Field is required ";
                                    } else if (state.mobileNumber.invalid) {
                                      return "Invalid mobile number";
                                    }
                                    return null;
                                  },
                                  errorText: state.mobileNumber.invalid
                                      ? "Invalid mobile number"
                                      : null,
                                  onChanged: ref
                                      .read(mobileSignUpStateProvider.notifier)
                                      .mobileNumberChanged,
                                  hintText: "(00)-00-00-00-00",
                                  maxLines: 10,
                                  textInputType: TextInputType.phone,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const HeightWidget(32.0),
                  CustomElevatedButton(
                      label: "ENvoyer le code OTP", onPressed: () {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

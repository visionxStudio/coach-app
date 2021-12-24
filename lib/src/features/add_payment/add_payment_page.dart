import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/container/custom_container.dart';
import 'package:digicoach/src/common/widgets/input_field/minimal_input_field.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class AddPaymentPage extends StatelessWidget {
  const AddPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.router.navigateBack();
          },
          color: kPrimaryColor,
        ),
        // iconTheme: const IconThemeData(),
        backgroundColor: kWhiteColor,
        centerTitle: true,
        elevation: 0.0,
        title: const NormalText(
          "Entrez vos informations de carte",
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
                  const HeightWidget(16.0),
                  Column(
                    children: const [
                      MinimalInputField(
                        label: "Numéro de carte",
                        hintText: "Numéro de carte",
                        backgroundColor: kScafoldColor,
                        textInputType: TextInputType.number,
                      ),
                      MinimalInputField(
                        hintText: "Nom et prénom sur la carte",
                        label: "Nom et prénom sur la carte",
                        backgroundColor: kScafoldColor,
                        textInputType: TextInputType.name,
                      ),
                      MinimalInputField(
                        hintText: "Date d’expiration (MM/YY)",
                        label: "Date d’expiration (MM/YY)",
                        backgroundColor: kScafoldColor,
                        textInputType: TextInputType.datetime,
                      ),
                      MinimalInputField(
                        hintText: "CVV",
                        label: "CVV",
                        backgroundColor: kScafoldColor,
                        textInputType: TextInputType.number,
                        maxLines: 3,
                      ),
                    ],
                  ),
                  const HeightWidget(8.0),
                  CustomElevatedButton(
                      label: "Ajouter la carte", onPressed: () {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

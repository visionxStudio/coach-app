import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart';
import 'package:digicoach/app_localization.dart';

class ProfilePersonalInofrmationPage extends StatefulWidget {
  const ProfilePersonalInofrmationPage({Key? key}) : super(key: key);

  @override
  State<ProfilePersonalInofrmationPage> createState() =>
      _ProfilePersonalInofrmationPageState();
}

class _ProfilePersonalInofrmationPageState
    extends State<ProfilePersonalInofrmationPage> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
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
          'personal_info_page.title',
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
              Container(
                color: kWhiteColor,
                margin: const EdgeInsets.symmetric(
                  vertical: kDefaultmargin,
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding, horizontal: kDefaultPadding / 2),
                child: Column(
                  children: [
                    TextField(
                      controller:
                          dateinput, //editing controller of this TextField
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusColor: kScafoldColor,
                          fillColor: kScafoldColor,
                          filled: true,
                          labelStyle:
                              const TextStyle(color: kDarkGrey, fontSize: 14),
                          hintStyle:
                              const TextStyle(color: kDarkGrey, fontSize: 14),
                          hintText:
                              "personal_info_page.dateofbirth".tr(context)),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);

                          setState(() {
                            dateinput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        }
                      },
                    ),
                    const HeightWidget(10),
                    TextField(
                      //   controller: dateinput, //editing controller of this TextField
                      decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.place,
                            color: kDarkGrey,
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusColor: kScafoldColor,
                          fillColor: kScafoldColor,
                          filled: true,
                          labelStyle:
                              const TextStyle(color: kDarkGrey, fontSize: 14),
                          hintStyle:
                              const TextStyle(color: kDarkGrey, fontSize: 14),
                          hintText:
                              "personal_info_page.dateofbirth".tr(context)),
                      readOnly: true,
                      onTap: () async {},
                    ),
                    const HeightWidget(10),
                    CustomElevatedButton(
                      onPressed: () {},
                      label: 'personal_info_page.continue',
                    ),
                    const HeightWidget(10),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

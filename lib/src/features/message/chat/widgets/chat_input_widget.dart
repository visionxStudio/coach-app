import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/features/message/data/user_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputTextAreaWidget extends StatelessWidget {
  const InputTextAreaWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  final UserModel args;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(218),
      margin: const EdgeInsets.symmetric(
          horizontal: kDefaultmargin, vertical: kDefaultPadding / 2),
      padding: const EdgeInsets.only(
        top: kDefaultmargin / 4,
        left: kDefaultmargin / 2,
        right: kDefaultmargin / 2,
      ),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(kDefaultmargin),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: kDefaultPadding),
                  child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.search,
                        color: kPrimaryColor,
                        size: 17,
                      )),
                ),
                Expanded(
                  child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: kDefaultPadding / 4),
                      child: TextFormField(
                        maxLines: 7,
                        decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Écrire"),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: kDefaultPadding),
                  child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.mic,
                        color: kPrimaryColor,
                        size: 17,
                      )),
                )
              ],
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.bold,
                        color: kInputOptionButtonColor,
                        size: 18,
                      )),
                  const WidthWidget(8),
                  InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.italic,
                        color: kInputOptionButtonColor,
                        size: 18,
                      )),
                  const WidthWidget(8),
                  InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.strikethrough,
                        color: kInputOptionButtonColor,
                        size: 18,
                      )),
                  const WidthWidget(8),
                  InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.paperclip,
                        color: kInputOptionButtonColor,
                        size: 18,
                      )),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.link,
                        color: kInputOptionButtonColor,
                        size: 18,
                      )),
                  const WidthWidget(8),
                  InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.smile,
                        color: kInputOptionButtonColor,
                        size: 18,
                      )),
                  const WidthWidget(8),
                  SizedBox(
                    width: width(100),
                    child: CustomElevatedButton(
                        backgroundColor: kChatButtonColor,
                        label: 'Envoyer',
                        fontsize: 14.0,
                        onPressed: () {
                          //homeController.submitdata(args);
                        }),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

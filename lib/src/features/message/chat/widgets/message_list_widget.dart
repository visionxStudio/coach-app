import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/message/chat/widgets/chat_input_widget.dart';
import 'package:digicoach/src/features/message/data/message_model.dart';
import 'package:digicoach/src/features/message/data/user_model.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatefulWidget {
  final UserModel args;

  const MessageWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  void initState() {
    // homeController.addListener(() {
    //   homeController.scrollController.animateTo(
    //     homeController.scrollController.position.maxScrollExtent,
    //     duration: const Duration(seconds: 1),
    //     curve: Curves.fastOutSlowIn,
    //   );
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SingleChildScrollView(
        //   controller: homeController.scrollController,
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.args.message!.length,
                separatorBuilder: (context, index) {
                  return Stack(
                    children: [
                      const Divider(),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kSecondaryColor,
                          ),
                          child: const NormalText(
                            " Mardi 17 août à 22h ",
                            color: kBlackColor,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemBuilder: (context, index) {
                  MessageModel msg = widget.args.message![index];
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const WidthWidget(.01),
                        const CircleAvatar(
                            radius: 38,
                            backgroundImage:
                                AssetImage(ImageAsset.testprofile)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const WidthWidget(.02),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding, vertical: 2),
                                  child: Text(
                                    widget.args.name,
                                    style: const TextStyle(
                                      fontSize: 12.5,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                                Container(
                                    padding: const EdgeInsets.all(
                                        kDefaultPadding / 2),
                                    margin: const EdgeInsets.only(
                                        bottom: kDefaultPadding / 2,
                                        right: kDefaultPadding / 2,
                                        left: kDefaultPadding / 2),
                                    decoration: const BoxDecoration(
                                        color: kWhiteColor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Text(msg.message,
                                        style: const TextStyle(
                                          color: kBlackColor,
                                          fontSize: 15,
                                        ))),
                              ],
                            ),
                          ),
                        ),
                      ]);
                }),
            InputTextAreaWidget(args: widget.args),
          ],
        ),
      ),
    );
  }
}

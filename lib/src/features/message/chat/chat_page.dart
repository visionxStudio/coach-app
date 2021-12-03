import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/message/bloc/message_controller.dart';
import 'package:digicoach/src/features/message/chat/widgets/message_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatController = ref.watch(messageController);
    chatController.chatData = chatController.userModelList[0];
    return WillPopScope(
      onWillPop: () async {
        if (chatController.isNavigateFromProfile) {
          chatController.isChatPage = false;
          chatController.isNavigateFromProfile = false;
          context.navigateBack();
        }
        chatController.changeChatPage();

        return false;
      },
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: height(100),
              decoration: BoxDecoration(
                color: kWhiteColor,
                border: Border.all(color: kPrimaryColor, width: 1),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        if (chatController.isNavigateFromProfile) {
                          chatController.isChatPage = false;
                          chatController.isNavigateFromProfile = false;
                          context.navigateBack();
                        }
                        chatController.changeChatPage();
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.arrowCircleLeft,
                        color: kPrimaryColor,
                      )),
                  const Spacer(
                    flex: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NormalText(
                      chatController.chatData!.name,
                      color: kPrimaryColor,
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  )
                ],
              ),
            ),
            Expanded(
                child: chatController.chatData!.message != null &&
                        chatController.chatData!.message!.isEmpty
                    ? const Center(
                        child: NormalText("No Message"),
                      )
                    : MessageWidget(args: chatController.chatData!)),
          ],
        ),
      ),
    );
  }
}

class CustomInputButtonWidget extends StatelessWidget {
  final Color? color;
  final IconData icon;
  final double? size;
  const CustomInputButtonWidget(
      {Key? key, this.color, this.size, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: FaIcon(
          icon,
          color: color ?? kPrimaryColor,
          size: size ?? 24,
        ));
  }
}

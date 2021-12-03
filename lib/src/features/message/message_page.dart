import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/message/bloc/message_controller.dart';
import 'package:digicoach/src/features/message/chat/chat_page.dart';
import 'package:digicoach/src/features/message/tabs/message_home_dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BodyWidget(tabController: tabController),
    );
  }
}

class BodyWidget extends ConsumerWidget {
  const BodyWidget({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chat = ref.watch(messageController);
    // final mainController = ref.watch(main_dashboard_containerController);
    return chat.isChatPage
        ? const ChatPage()
        : WillPopScope(
            onWillPop: () async {
              if (chat.isNavigateFromProfile) {
                chat.isNavigateFromProfile = false;
                context.navigateBack();
              }
              if (chat.isChatPage) {
                return false;
              }

              return true;
            },
            child: Scaffold(
              extendBody: true,
              appBar: AppBar(
                backgroundColor: kWhiteColor,
                elevation: 0,
                title: const NormalText(
                  "Mon espace coach",
                  fontSize: kDefaultFontSize + 10,
                ),
                centerTitle: true,
                bottom: TabBar(
                  controller: tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  onTap: (index) {
                    // Tab index when user select it, it start from zero
                  },
                  tabs: const [
                    Tab(
                      child: NormalText(
                        "COACH",
                        fontSize: kDefaultFontSize - 2,
                      ),
                    ),
                    Tab(
                      child: NormalText(
                        "RENCONTRES",
                        fontSize: kDefaultFontSize - 2,
                      ),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  const Divider(
                    color: kBlackColor,
                  ),
                  Expanded(
                    child:
                        TabBarView(controller: tabController, children: const [
                      MessageHomeDashBoardWidget(),
                      MessageHomeDashBoardWidget(),
                    ]),
                  ),
                ],
              ),
            ),
          );
  }
}

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/avis/tabs/comments_page.dart';
import 'package:digicoach/src/features/avis/tabs/receipts_page.dart';
import 'package:digicoach/src/features/education/tabs/education_coach_tab_widget.dart';
import 'package:digicoach/src/features/education/tabs/education_program_tab_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_localization.dart';

class AvisPage extends StatefulWidget {
  const AvisPage({Key? key}) : super(key: key);

  @override
  State<AvisPage> createState() => _AvisPageState();
}

class _AvisPageState extends State<AvisPage> with TickerProviderStateMixin {
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
    // final chat = ref.watch(messageController);
    // // final mainController = ref.watch(main_dashboard_containerController);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          bottom: TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.label,
            onTap: (index) {
              // Tab index when user select it, it start from zero
            },
            tabs: [
              Tab(
                child: NormalText(
                  AppLocalizations.of(context).translate('avis_page.tab1'),
                  fontSize: kDefaultFontSize - 2,
                ),
              ),
              Tab(
                child: NormalText(
                  AppLocalizations.of(context).translate('avis_page.tab2'),
                  fontSize: kDefaultFontSize - 2,
                ),
              ),
            ],
          ),
          toolbarHeight: 50.0,
          elevation: 0.0,
          backgroundColor: kWhiteColor,
          leading: InkWell(
            onTap: () {
              context.router.pop();
            },
            splashColor: kWhiteColor,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 10.0,
                width: 10.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: kPrimaryColor),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: kWhiteColor,
                    size: 18.0,
                  ),
                ),
              ),
            ),
          ),
          title: NormalText(
            AppLocalizations.of(context).translate('avis_page.avis'),
            color: kPrimaryColor,
            fontSize: 20.0,
            isBold: true,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Divider(
              color: kBlackColor,
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [ReceiptsPage(), CommentsPage()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

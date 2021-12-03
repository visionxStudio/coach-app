import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/education/tabs/education_coach_tab_widget.dart';
import 'package:digicoach/src/features/education/tabs/education_program_tab_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({Key? key}) : super(key: key);

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage>
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
    // final chat = ref.watch(messageController);
    // // final mainController = ref.watch(main_dashboard_containerController);
    return WillPopScope(
      onWillPop: () async {
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
                  "PROGRAMME",
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
              child: TabBarView(controller: tabController, children: const [
                EducationCoachTabView(),
                EducationProgramTabView()
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

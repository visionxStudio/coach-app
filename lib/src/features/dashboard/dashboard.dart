import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/appbar/appbar_background.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/circle_progress.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/syncfusion_chart.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/common/widgets/text/shader_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController progressController;
  late Animation<double> animation;
  double pts = 82;
  @override
  void initState() {
    super.initState();
    progressController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animation = Tween<double>(begin: 0, end: pts).animate(progressController)
      ..addListener(() {
        setState(() {});
      });
    progressController.forward();
  }

  @override
  void dispose() {
    progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60.0),
        child: AppbarBackgroudWidget(
          child: Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                NormalText(
                  "Mes statistiques",
                  isCentered: true,
                  color: kWhiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: kHomeBackground,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 8.0),
                        // TOP circular progress indicator
                        CircularChart(animation: animation, pts: pts),
                        const SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 8.0),
                          child: Column(
                            children: const [
                              Center(
                                child: ShaderText(
                                  text: "Informations",
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              SizedBox(height: 8.0),
                              StackChart(),
                              SizedBox(height: 60.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        margin: const EdgeInsets.only(bottom: 8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xff2B3674),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    "assets/icons/a.png",
                                    height: 25.0,
                                  ),
                                  const Text(
                                    "Stats",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    "assets/icons/b.png",
                                    height: 25.0,
                                  ),
                                  const Text(
                                    "Stats",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    "assets/icons/c.png",
                                    height: 25.0,
                                  ),
                                  const Text(
                                    "Stats",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularChart extends ConsumerWidget {
  const CircularChart({
    Key? key,
    required this.animation,
    required this.pts,
  }) : super(key: key);

  final Animation<double> animation;
  final double pts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final studentProvider = ref.watch(profileController);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F8FD),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: const Offset(0, 2),
            spreadRadius: 0,
            color: const Color(0xff000000).withOpacity(0.25),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Center(
                child: CustomPaint(
                  foregroundPainter: CircleProgress(animation.value),
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            pts.toString() + " pts",
                            style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff1B2559),
                            ),
                          ),
                          const SizedBox(
                            height: 2.0,
                          ),
                          const Text(
                            "Atteints",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xff1B2559),
                            ),
                          ),
                          const SizedBox(
                            height: 2.0,
                          ),
                          Image.asset("assets/images/arrow_up.png")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                "nouvel achevement",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff1B2559),
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              const ShaderText(
                text: " À créditer sur \n vos prochains cours",
                fontSize: 18.0,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // if (studentProvider.isUser)
              //   const NormalText(
              //     "Mode visible",
              //     fontSize: kDefaultFontSize - 7,
              //   ),
              // if (studentProvider.isUser)
              Switch(
                  value: true,
                  onChanged: (value) {
                    if (value) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const NormalText("Information"),
                              content: const NormalText(
                                  "Are you Sure ? your information will be visible to other user."),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: width(100),
                                      child: CustomElevatedButton(
                                          label: "Yes",
                                          onPressed: () {
                                            // studentProvider
                                            //     .changeProfileInformationHideShow(
                                            //         value);
                                            Navigator.of(context).pop();
                                          }),
                                    ),
                                    const WidthWidget(20),
                                    SizedBox(
                                      width: width(100),
                                      child: CustomElevatedButton(
                                          label: "No",
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          }),
                                    )
                                  ],
                                )
                              ],
                            );
                          });
                    } else {
                      // studentProvider.changeProfileInformationHideShow(value);
                    }
                  }),
              Image.asset(
                "assets/images/home.png",
                height: height(170),
                width: width(150),
                fit: BoxFit.fill,
              ),
            ],
          )),
          // SizedBox(height: 200, child: Image.asset("assets/images/home.png")),
        ],
      ),
    );
  }
}

class StackChart extends StatelessWidget {
  const StackChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height > 700 ? 300.0 : 250.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: const SyncfusionChart(),
        ),
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            gradient: const LinearGradient(
              end: Alignment.bottomLeft,
              begin: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFF65C7F7),
                Color(0xFF0052D4),
              ], // red to yellow
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
        Container(
          height: 60.0,
          padding: const EdgeInsets.only(bottom: 16.0),
          child: const Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Mes statistiques",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}

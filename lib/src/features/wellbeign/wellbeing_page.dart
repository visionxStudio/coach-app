import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class WellbeingPage extends StatefulWidget {
  const WellbeingPage({Key? key}) : super(key: key);

  @override
  State<WellbeingPage> createState() => _WellbeingPageState();
}

class _WellbeingPageState extends State<WellbeingPage> {
  int flexibilityIndex = 0;
  int sleepquality = 0;
  int stresslevel = 0;
  int foodquality = 0;

  void setflexibility(int index) {
    setState(() {
      flexibilityIndex = index;
    });
  }

  void setSleepQuality(int index) {
    setState(() {
      sleepquality = index;
    });
  }

  void setStresslevel(int index) {
    setState(() {
      stresslevel = index;
    });
  }

  void setFoodQuality(int index) {
    setState(() {
      foodquality = index;
    });
  }

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
          'wellbeign_page.title',
          isBold: true,
          color: kPrimaryColor,
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: kWhiteColor,
                padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding, horizontal: kDefaultPadding / 2),
                margin: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: NormalText(
                        "wellbeign_page.informcoach",
                        fontSize: 14,
                        isBold: true,
                      ),
                    ),
                    const HeightWidget(10),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: NormalText(
                        "wellbeign_page.flexibility",
                        fontSize: 12,
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: OptionWithIconWidget(
                              onTap: () => setflexibility(1),
                              icon: Icons.sentiment_dissatisfied_outlined,
                              label: "wellbeign_page.bad",
                              index: 1,
                              selectedIndex: flexibilityIndex,
                            ),
                          ),
                          Flexible(
                            child: OptionWithIconWidget(
                              onTap: () => setflexibility(2),
                              icon: Icons.sentiment_neutral_outlined,
                              label: "wellbeign_page.good",
                              index: 2,
                              selectedIndex: flexibilityIndex,
                            ),
                          ),
                          Flexible(
                            child: OptionWithIconWidget(
                              onTap: () => setflexibility(3),
                              icon: Icons.sentiment_satisfied_alt_outlined,
                              label: "wellbeign_page.well",
                              index: 3,
                              selectedIndex: flexibilityIndex,
                            ),
                          ),
                        ]),
                    const HeightWidget(10),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: NormalText(
                        "wellbeign_page.sleepquality",
                        fontSize: 12,
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: OptionWithIconWidget(
                              onTap: () => setSleepQuality(1),
                              icon: Icons.sentiment_dissatisfied_outlined,
                              label: "wellbeign_page.bad",
                              index: 1,
                              selectedIndex: sleepquality,
                            ),
                          ),
                          Flexible(
                            child: OptionWithIconWidget(
                              onTap: () => setSleepQuality(2),
                              icon: Icons.sentiment_neutral_outlined,
                              label: "wellbeign_page.good",
                              index: 2,
                              selectedIndex: sleepquality,
                            ),
                          ),
                          Flexible(
                            child: OptionWithIconWidget(
                              onTap: () => setSleepQuality(3),
                              icon: Icons.sentiment_satisfied_alt_outlined,
                              label: "wellbeign_page.well",
                              index: 3,
                              selectedIndex: sleepquality,
                            ),
                          ),
                        ]),
                    const HeightWidget(10),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: NormalText(
                        "wellbeign_page.Stresslevel",
                        fontSize: 12,
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: OptionWithIconWidget(
                              onTap: () => setStresslevel(1),
                              icon: Icons.sentiment_dissatisfied_outlined,
                              label: "wellbeign_page.bad",
                              index: 1,
                              selectedIndex: stresslevel,
                            ),
                          ),
                          Flexible(
                            child: OptionWithIconWidget(
                              onTap: () => setStresslevel(2),
                              icon: Icons.sentiment_neutral_outlined,
                              label: "wellbeign_page.good",
                              index: 2,
                              selectedIndex: stresslevel,
                            ),
                          ),
                          Flexible(
                            child: OptionWithIconWidget(
                              onTap: () => setStresslevel(3),
                              icon: Icons.sentiment_satisfied_alt_outlined,
                              label: "wellbeign_page.well",
                              index: 3,
                              selectedIndex: stresslevel,
                            ),
                          ),
                        ]),
                    const HeightWidget(10),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: NormalText(
                        "wellbeign_page.foodquality",
                        fontSize: 12,
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: OptionWithIconWidget(
                              onTap: () => setFoodQuality(1),
                              icon: Icons.sentiment_dissatisfied_outlined,
                              label: "wellbeign_page.bad",
                              index: 1,
                              selectedIndex: foodquality,
                            ),
                          ),
                          Flexible(
                            child: OptionWithIconWidget(
                              onTap: () => setFoodQuality(2),
                              icon: Icons.sentiment_neutral_outlined,
                              label: "wellbeign_page.good",
                              index: 2,
                              selectedIndex: foodquality,
                            ),
                          ),
                          Flexible(
                            child: OptionWithIconWidget(
                              onTap: () => setFoodQuality(3),
                              icon: Icons.sentiment_satisfied_alt_outlined,
                              label: "wellbeign_page.well",
                              index: 3,
                              selectedIndex: foodquality,
                            ),
                          ),
                        ]),
                    const HeightWidget(10),
                    CustomButton(
                      ontap: () {},
                      text: 'wellbeign_page.confirm',
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? ontap;

  const CustomButton({
    Key? key,
    required this.text,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding, horizontal: kDefaultPadding),
        margin: const EdgeInsets.symmetric(
            horizontal: kDefaultmargin / 2, vertical: kDefaultmargin),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kBottonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: NormalText(
          text,
          color: kWhiteColor,
          fontSize: 14,
        ),
      ),
    );
  }
}

class OptionWithIconWidget extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final String label;
  final IconData icon;
  final VoidCallback? onTap;
  const OptionWithIconWidget({
    Key? key,
    required this.index,
    required this.selectedIndex,
    required this.label,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: index == selectedIndex ? kselectionColor : kbilldownload,
          border: Border.all(
              color: index == selectedIndex
                  ? kBottonColor
                  : kProfileEditbuttonColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 11,
              color: index == selectedIndex ? kWhiteColor : kscheduleTextColor,
            ),
            const WidthWidget(5),
            NormalText(
              label,
              fontSize: 10,
              color: index == selectedIndex ? kWhiteColor : null,
            )
          ],
        ),
      ),
    );
  }
}

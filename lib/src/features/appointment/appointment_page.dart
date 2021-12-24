import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  int selectedDateIndex = 14;
  String selectedmonth = "January";

  List<String> monthList = const [
    "January",
    "Feburary",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  void selectedDate(int index) {
    setState(() {
      selectedDateIndex = index;
    });
  }

  void selectedMonth(String month) {
    setState(() {
      selectedmonth = month.substring(0, 3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kWhiteColor,
          leading: BackButton(
            color: kBlackColor,
            onPressed: () {
              context.router.navigateBack();
            },
          ),
          title: const NormalText("Méditation en pleine conscience"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HeightWidget(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Container(
                                    height: height(300),
                                    width: SizeConfig.screenWidth,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Expanded(
                                              child: NormalText(
                                                "appointment_page.selectmonth",
                                                isCentered: true,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.info_outline,
                                                  color: knavbarInactiveColor,
                                                ))
                                          ],
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: monthList.length,
                                              itemBuilder: (context, index) {
                                                String month = monthList[index];
                                                return ListTile(
                                                  onTap: () {
                                                    selectedMonth(month);
                                                    Navigator.pop(context);
                                                  },
                                                  title: NormalText(
                                                      monthList[index]),
                                                );
                                              }),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Row(
                          children: const [
                            NormalText("Jan"),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SelectDayWidgetItem(
                                ontap: () => selectedDate(12),
                                day: 12,
                                selecteddate: selectedDateIndex,
                                week: "Mon",
                              ),
                              SelectDayWidgetItem(
                                ontap: () => selectedDate(13),
                                day: 13,
                                selecteddate: selectedDateIndex,
                                week: "Tue",
                              ),
                              SelectDayWidgetItem(
                                ontap: () => selectedDate(14),
                                day: 14,
                                selecteddate: selectedDateIndex,
                                week: "Wed",
                              ),
                              SelectDayWidgetItem(
                                ontap: () => selectedDate(15),
                                day: 15,
                                selecteddate: selectedDateIndex,
                                week: "Thu",
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const HeightWidget(20),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: NormalText(
                          "Selectionnez une heure",
                          fontSize: kDefaultFontSize - 4,
                          isBold: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth,
                      // height: height(200),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding + 5),
                        child: GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          crossAxisSpacing: 20,
                          padding: EdgeInsets.zero,
                          mainAxisSpacing: 5,
                          childAspectRatio: 2.4,
                          children: List.generate(
                            5,
                            (index) {
                              return Container(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: index == 2 ? kBottonColor : null,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: kScheduleBorder),
                                  ),
                                  child: NormalText(
                                    "10:30",
                                    color:
                                        index == 2 ? kWhiteColor : kBottonColor,
                                  ));
                            },
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: NormalText(
                          "Selectionnez l’adresse de facturation",
                          fontSize: kDefaultFontSize - 4,
                          isBold: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: kDefaultmargin,
                                  vertical: kDefaultmargin / 2),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding,
                                  vertical: kDefaultPadding / 2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: index != 1
                                        ? kunSelectedAddressBorder
                                        : kAddressborder),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const NormalText(
                                        "Mathieu A- Home",
                                        fontSize: kDefaultFontSize - 4,
                                        isBold: true,
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.border_color,
                                            color: kAddressborder,
                                          ))
                                    ],
                                  ),
                                  const NormalText(
                                    "987-980-4418",
                                    fontSize: kDefaultFontSize - 4,
                                  ),
                                  const NormalText(
                                    "104 chemin de l’arbre blanc 39240",
                                    fontSize: kDefaultFontSize - 4,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(
                      color: kWhiteColor,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          horizontal: kDefaultmargin,
                          vertical: kDefaultmargin / 4),
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.add,
                              color: kLightBlueTextColor,
                            ),
                            WidthWidget(10),
                            NormalText(
                              "Add new address",
                              color: kLightBlueTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: kDefaultmargin, vertical: 3),
              //  padding: const EdgeInsets.all(kDefaultPadding / 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(flex: 3, child: NormalText("Total: 29€")),
                  const WidthWidget(10),
                  Expanded(
                      flex: 7,
                      child: CustomElevatedButton(
                        onPressed: () {
                          context.router.push(const NewPaymentPageRoute());
                        },
                        label: 'Continuer vers le paiement',
                        fontsize: kDefaultFontSize - 6,
                      )),
                ],
              ),
            )
          ],
        ));
  }
}

Path customPath = Path()
  ..moveTo(20, 20)
  ..lineTo(50, 100)
  ..lineTo(20, 200)
  ..lineTo(100, 100)
  ..lineTo(20, 20);

class SelectDayWidgetItem extends StatelessWidget {
  final VoidCallback ontap;
  final int day;
  final String week;
  final int selecteddate;
  const SelectDayWidgetItem({
    Key? key,
    required this.ontap,
    required this.day,
    required this.week,
    required this.selecteddate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            border:
                selecteddate != day ? Border.all(color: kScheduleBorder) : null,
            borderRadius: BorderRadius.circular(20),
            color: selecteddate == day ? kPrimaryColorDark : null),
        child: Column(
          children: [
            NormalText(
              day.toString(),
              fontSize: kDefaultFontSize + 6,
              color: selecteddate == day ? kWhiteColor : kBlackColor,
            ),
            const HeightWidget(10),
            NormalText(
              week.toString(),
              fontSize: kDefaultFontSize - 6,
              color: selecteddate == day ? kWhiteColor : kBlackColor,
            )
          ],
        ),
      ),
    );
  }
}

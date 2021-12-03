import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/button/custom_gradient_button.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage0 extends StatelessWidget {
  const BookingPage0({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              locale: 'fr_FR',
              onDaySelected: (selectedDay, focusedDay) {
                // controller.hidAndShowCalendarBottomSheet();
              },
              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.white),
                    )),
                todayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xFFA3AED0),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.white),
                    )),
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: const CalendarStyle(
                  markerDecoration: BoxDecoration(
                      color: ksearchText, shape: BoxShape.rectangle)),
              headerStyle: const HeaderStyle(
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: kDefaultFontSize + 1,
                      color: kPrimaryColor),
                  titleCentered: true,
                  formatButtonVisible: false),
            ),
          ),
          const HeightWidget(10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: kWhiteColor, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                const HeightWidget(10),
                const NormalText("Selectionnez une heure"),
                const HeightWidget(10),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: kBlackColor),
                      borderRadius: BorderRadius.circular(30)),
                  child: const NormalText(
                    "14h30",
                    fontSize: kDefaultFontSize - 4,
                  ),
                ),
                const HeightWidget(kDefaultmargin),
                const NormalText("Selectionnez l’adresse de facturation"),
                const HeightWidget(kDefaultmargin),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding + 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: kSearch, borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      const HeightWidget(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              WidthWidget(20),
                              NormalText(
                                "Mathieu A- Home",
                                isBold: true,
                                fontSize: kDefaultFontSize - 2,
                              ),
                              HeightWidget(10),
                              NormalText(
                                "104 chemin de l’arbre blanc 39240",
                                fontSize: kDefaultFontSize - 2,
                                color: ktextColor,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Radio(
                              value: true,
                              groupValue: "select",
                              onChanged: (value) {}),
                        ],
                      ),
                      const HeightWidget(20),
                      const Divider(
                        color: kPrimaryColor,
                        thickness: 2,
                      ),
                      const HeightWidget(10),
                      const NormalText(
                        "Modifier",
                        fontSize: kDefaultFontSize - 4,
                      ),
                    ],
                  ),
                ),
                const HeightWidget(20),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          WidthWidget(20),
                          NormalText(
                            "Mathieu A- Home",
                            isBold: true,
                            fontSize: kDefaultFontSize - 2,
                          ),
                          HeightWidget(10),
                          NormalText(
                            "104 chemin de l’arbre blanc 39240",
                            fontSize: kDefaultFontSize - 2,
                            color: ktextColor,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Radio(
                          value: true,
                          groupValue: "select",
                          onChanged: (value) {}),
                    ],
                  ),
                ),
                const WidthWidget(10),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: kBlackColor),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(kDefaultPadding),
                  margin: const EdgeInsets.all(kDefaultPadding),
                  child: const NormalText("Ajouter une adresse"),
                ),
                const HeightWidget(10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NormalText("1 cours"),
                          Container(
                              height: height(48),
                              width: width(48),
                              padding:
                                  const EdgeInsets.all(kDefaultPadding / 2),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const CircleAvatar(
                                radius: 10,
                                backgroundColor: kWhiteColor,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: kPrimaryColor,
                                ),
                              )),
                        ],
                      ),
                      const Divider(
                        color: kDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NormalText("Pack de 3 cours",
                              fontSize: kDefaultFontSize - 2),
                          const NormalText("-5%",
                              color: kGreen, fontSize: kDefaultFontSize - 2),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.north_west))
                        ],
                      ),
                      const Divider(
                        color: kDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NormalText("Pack de 3 cours",
                              fontSize: kDefaultFontSize - 2),
                          const NormalText("-5%",
                              color: kGreen, fontSize: kDefaultFontSize - 2),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.north_west))
                        ],
                      ),
                      const Divider(
                        color: kDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NormalText("Pack de 3 cours",
                              fontSize: kDefaultFontSize - 2),
                          const NormalText("-5%",
                              color: kGreen, fontSize: kDefaultFontSize - 2),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.north_west))
                        ],
                      ),
                      const Divider(
                        color: kDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NormalText("Pack de 3 cours",
                              fontSize: kDefaultFontSize - 2),
                          const NormalText("-5%",
                              color: kGreen, fontSize: kDefaultFontSize - 2),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.north_west))
                        ],
                      ),
                      const Divider(
                        color: kDividerColor,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Row(
                    children: const [
                      NormalText(
                        "Total",
                        isBold: true,
                      ),
                      Spacer(),
                      NormalText(
                        "25€",
                        isBold: true,
                      )
                    ],
                  ),
                ),
                const HeightWidget(20),
                CustomGradentButton(onTap: () {}, text: 'Continue'),
                const HeightWidget(20),
              ],
            ),
          )
        ],
      ),
    );
  }
}

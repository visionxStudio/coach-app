import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class EducationProgramTabView extends ConsumerWidget {
  const EducationProgramTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  final provider = ref.watch(educationProvider);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: kCalendarButtonColor,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(kDefaultPadding / 4),
                      child: NormalText(
                        "Aujourd’hui",
                        fontSize: kDefaultFontSize - 6,
                      ),
                    ),
                    const WidthWidget(10),
                    Container(
                      padding: const EdgeInsets.all(kDefaultPadding / 4),
                      decoration:
                          BoxDecoration(border: Border.all(color: kBlackColor)),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(Icons.arrow_left),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(kDefaultPadding / 4),
                      decoration:
                          BoxDecoration(border: Border.all(color: kBlackColor)),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(Icons.arrow_right),
                      ),
                    )
                  ],
                ),
              ),

              Flexible(
                child: Row(
                  children: const [
                    WidthWidget(5),
                    Icon(Icons.calendar_today),
                    WidthWidget(5),
                    Flexible(
                      child: NormalText(
                        "Mardi, 27 Avril, 2021",
                        fontSize: kDefaultFontSize - 6,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: kCalendarButtonColor,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(kDefaultPadding / 4),
                      child: NormalText(
                        "Mois",
                        fontSize: kDefaultFontSize - 6,
                      ),
                    ),
                    const WidthWidget(5),
                    Container(
                      padding: const EdgeInsets.all(kDefaultPadding / 2),
                      decoration:
                          BoxDecoration(border: Border.all(color: kBlackColor)),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ],
                ),
              )

              //NormalText(DateTime.now().toString()),
            ],
          ),
        ),
        const HeightWidget(10),
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          locale: 'fr_FR',
          headerVisible: false,
          headerStyle: HeaderStyle(
            titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
            formatButtonDecoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20.0),
            ),
            formatButtonTextStyle: const TextStyle(color: Colors.white),
            formatButtonShowsNext: false,
          ),
          startingDayOfWeek: StartingDayOfWeek.monday,
          onDaySelected: (date, holidays) {
            // setState(() {
            //   // _selectedEvents = events;
            // });
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
                    color: kGreyColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  date.day.toString(),
                  style: const TextStyle(color: Colors.white),
                )),
          ),
          //: provider.controller,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultFontSize / 2),
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(Icons.arrow_back_ios),
              ),
              const NormalText(
                "Programme du coach Bessie Cooper",
                fontSize: kDefaultFontSize - 1,
              ),
              InkWell(
                onTap: () {},
                child: const Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        ),
        const HeightWidget(20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NormalText(
                    "Options",
                    fontSize: kDefaultFontSize - 2,
                  ),
                  const HeightWidget(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const NormalText(
                        "Voir la fiche du coach",
                        fontSize: kDefaultFontSize - 2,
                      ),
                      Radio(
                          value: true, groupValue: () {}, onChanged: (value) {})
                    ],
                  ),
                  const HeightWidget(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const NormalText(
                        "Retirer le programme",
                        fontSize: kDefaultFontSize - 2,
                      ),
                      Radio(
                          value: true, groupValue: () {}, onChanged: (value) {})
                    ],
                  ),
                  const HeightWidget(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const NormalText(
                        "Notifications",
                        fontSize: kDefaultFontSize - 2,
                      ),
                      Radio(
                          value: true, groupValue: () {}, onChanged: (value) {})
                    ],
                  ),
                  const HeightWidget(20),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

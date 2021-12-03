import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/appbar/appbar_background.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/common/widgets/text/shader_text.dart';
import 'package:digicoach/src/features/calendar/bloc/utils.dart';
import 'package:digicoach/src/features/calendar/calendar_controller.dart';
import 'package:digicoach/src/features/calendar/widget/calendar_bottom_nav_widget.dart';
import 'package:digicoach/src/features/home/widgets/search_input_fiel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui' as ui;

import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 200.0),
        child: const AppBarWidget(),
      ),
      body: Container(
        height: double.infinity,
        // padding: const EdgeInsets.only(top: kDefaultPadding / 2),
        color: kSecondaryColor,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HeightWidget(20),
                    Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding,
                        ),
                        child: const SearchInputFieldWidget()),
                    const TableCalendarWidget(),
                    const HeightWidget(10),
                    const CalendarEvenListWidget(),
                    const HeightWidget(50),
                    const NormalText("Bessie Cooper"),
                    const HeightWidget(20),
                    const CallerInfoWidget(),
                    const HeightWidget(50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarEvenListWidget extends ConsumerWidget {
  const CalendarEvenListWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calProvider = ref.watch(calendarController);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultmargin / 2, horizontal: kDefaultPadding / 2),
      color: kWhiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
            child: NormalText(
              "RDV à venir : ",
              isBold: true,
              fontSize: kDefaultFontSize + 8,
            ),
          ),
          ValueListenableBuilder<List<Event>>(
              valueListenable: calProvider.selectedEvents!,
              builder: (context, value, _) {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // CalendarEventModel calModel =
                      //     calController.calendarModelList[index];
                      return InkWell(
                        onTap: () {},
                        child: Container(
                            width: double.infinity,
                            height: height(60),
                            margin: const EdgeInsets.symmetric(
                                vertical: kDefaultmargin / 3,
                                horizontal: kDefaultmargin / 4),
                            padding: const EdgeInsets.all(
                              kDefaultPadding / 2,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: width(5),
                                  margin: const EdgeInsets.only(
                                      right: kDefaultmargin),
                                  height: double.infinity,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    gradient: LinearGradient(
                                      end: Alignment.topLeft,
                                      begin: Alignment.bottomRight,
                                      colors: <Color>[
                                        Color(0xFF65C7F7),
                                        Color(0xFF0052D4),
                                      ], // red to yellow
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 9,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // NormalText(
                                              //   "${calModel.eventType}/ ${calModel.coachName}",
                                              //   fontSize: kDefaultFontSize - 2,
                                              //   isBold: true,
                                              // ),
                                              NormalText(
                                                "${value[index]}",
                                                fontSize: kDefaultFontSize - 2,
                                                isBold: true,
                                              ),
                                              const HeightWidget(4),
                                              // NormalText(
                                              //   "${calModel.startTime.toString()} - ${calModel.endTime.toString()}",
                                              //   fontSize: kDefaultFontSize - 6,
                                              //   color: ksearchText,
                                              //   isBold: true,
                                              // )
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: ShaderMask(
                                                blendMode: BlendMode.srcIn,
                                                shaderCallback: (Rect bounds) {
                                                  return ui.Gradient.linear(
                                                    const Offset(4.0, 24.0),
                                                    const Offset(24.0, 4.0),
                                                    [
                                                      kPrimaryColor,
                                                      kIndicatorColor2,
                                                    ],
                                                  );
                                                },
                                                child: // calModel.notification
                                                    //     ? const Icon(
                                                    //         Icons.notifications_active)
                                                    //:
                                                    const Icon(
                                                        Icons.notifications)))
                                      ],
                                    ))
                              ],
                            )),
                      );
                    });
              }),
        ],
      ),
    );
  }
}

class CallerInfoWidget extends StatelessWidget {
  const CallerInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: kDefaultmargin * 3),
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kBlackColor)),
      child: Column(
        children: [
          const HeightWidget(20),
          Container(
            width: width(400),
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: kDefaultmargin / 2),
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ShaderText(
                      text: "Yoga",
                    ),
                    const HeightWidget(15),
                    ClipRRect(
                      child: Image.asset(
                        ImageAsset.testprofile,
                        height: height(96),
                      ),
                    ),
                    const HeightWidget(10),
                    const NormalText(
                      "Bessie Cooper",
                      isBold: true,
                    ),
                    const HeightWidget(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.place,
                          color: ksearchText,
                        ),
                        NormalText("Perking, china",
                            fontSize: kDefaultFontSize - 4, color: ksearchText),
                      ],
                    ),
                    const HeightWidget(10),
                    const NormalText(
                      "Me connecter à la séance",
                      fontSize: kDefaultFontSize - 2,
                      isBold: true,
                    ),
                    const HeightWidget(10),
                    const NormalText(
                      "12:00 PM - 12:30 PM",
                      fontSize: kDefaultFontSize - 4,
                      color: ksearchText,
                    ),
                    const HeightWidget(10),
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.video_call,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TableCalendarWidget extends ConsumerWidget {
  const TableCalendarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calProvider = ref.watch(calendarController);

    return CalendarBodyWidget(calProvider: calProvider);
  }
}

class CalendarBodyWidget extends StatefulWidget {
  const CalendarBodyWidget({
    Key? key,
    required this.calProvider,
  }) : super(key: key);

  final CalendarController calProvider;

  @override
  State<CalendarBodyWidget> createState() => _CalendarBodyWidgetState();
}

class _CalendarBodyWidgetState extends State<CalendarBodyWidget> {
  @override
  void initState() {
    widget.calProvider.initialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: kWhiteColor,
          border: Border.all(color: kBlackColor),
          borderRadius: BorderRadius.circular(kDefaultRadius)),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: NormalText(
              "Selectionnez une date",
              isCentered: true,
              fontSize: kDefaultFontSize + 1,
            ),
          ),
          TableCalendar<Event>(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            locale: 'fr_FR',

            focusedDay: widget.calProvider.focusedDay,
            selectedDayPredicate: (day) =>
                isSameDay(widget.calProvider.selectedDay, day),
            rangeStartDay: widget.calProvider.rangeStart,
            rangeEndDay: widget.calProvider.rangeEnd,
            //  calendarFormat: calProvider.calendarFormat,
            rangeSelectionMode: widget.calProvider.rangeSelectionMode,
            eventLoader: widget.calProvider.getEventsForDay,
            onDaySelected: (selectedDay, focusDay) {
              widget.calProvider.onDaySelected(selectedDay, focusDay);
              if (widget.calProvider.showCalendarBottomSheet) {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const CalendarBottomSheetWidget();
                    });
              }
            },
            onRangeSelected: widget.calProvider.onRangeSelected,
            onFormatChanged: (format) {
              // if (_calendarFormat != format) {
              //   setState(() {
              //     _calendarFormat = format;
              //   });
              // }
            },
            onPageChanged: (focusedDay) {
              //_focusedDay = focusedDay;
            },
            startingDayOfWeek: StartingDayOfWeek.monday,
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
        ],
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppbarBackgroudWidget(
      shape: false,
      child: Container(
        height: height(60),
        padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
        alignment: Alignment.bottomCenter,
        child: const NormalText(
          "MES RDV",
          isCentered: true,
          color: kWhiteColor,
        ),
      ),
    );
  }
}

import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/button/custom_elevated_button.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class Notificationpage extends StatefulWidget {
  const Notificationpage({Key? key}) : super(key: key);

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  bool notificationON = true;
  bool emailON = true;

  int hour = 01;
  int minute = 30;

  void changeNotification() {
    notificationON = !notificationON;
    setState(() {});
  }

  void changeEmail() {
    emailON = !emailON;
    setState(() {});
  }

  void increaseTimer() {
    if (hour >= 24) {
      hour = 0;
    } else {
      if (minute >= 60) {
        hour++;
        minute = 0;
      } else {
        minute++;
      }
    }
    setState(() {});
  }

  void decreaseTimer() {
    if (hour < 1) {
      if (minute <= 0) {
        hour = 0;
        minute = 0;
      } else {
        hour = 0;
        minute--;
      }
    } else {
      if (minute == 0) {
        hour--;
        minute = 60;
      } else {
        minute--;
      }
    }
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
          'notification_page.title',
          isBold: true,
          color: kPrimaryColor,
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: kWhiteColor,
                margin: const EdgeInsets.symmetric(vertical: kDefaultmargin),
                padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding, horizontal: kDefaultPadding),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            NormalText(
                              "notification_page.push_notifications",
                              fontSize: 14,
                            ),
                            NormalText(
                              "notification_page.stayinformed",
                              fontSize: 10,
                              color: kNotificationColor,
                            )
                          ],
                        ),
                        Switch(
                            focusColor: kBottonColor,
                            activeColor: kBottonColor,
                            value: notificationON,
                            inactiveTrackColor: kUnCheck,
                            inactiveThumbColor: kUnCheck,
                            onChanged: (value) => changeNotification()),
                      ],
                    ),
                    const HeightWidget(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            NormalText("45"),
                            NormalText("notification_page.before"),
                          ],
                        ),
                        const Icon(
                          Icons.do_disturb_on_outlined,
                          color: Colors.red,
                        )
                      ],
                    ),
                    const HeightWidget(20),
                    const NormalText(
                      "notification_page.remindar",
                      isBold: true,
                      fontSize: 14,
                    ),
                    Container(
                      color: kScafoldColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding / 2,
                          horizontal: kDefaultPadding / 2),
                      margin: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding / 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: kNavBarBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(2),
                            child: IconButton(
                                onPressed: () => decreaseTimer(),
                                icon: const Icon(
                                  Icons.remove,
                                  color: kBottonColor,
                                )),
                          ),
                          Row(
                            children: [
                              NormalText(
                                hour.toString(),
                                fontSize: 24,
                              ),
                              const WidthWidget(5),
                              const NormalText(
                                "notification_page.hour",
                                fontSize: 24,
                              ),
                              const WidthWidget(5),
                              NormalText(
                                minute.toString(),
                                fontSize: 24,
                              ),
                              const WidthWidget(5),
                              const NormalText(
                                "notification_page.min",
                                fontSize: 24,
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: kNavBarBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(2),
                            child: IconButton(
                              onPressed: () => increaseTimer(),
                              icon: const Icon(
                                Icons.add,
                                color: kBottonColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const HeightWidget(10),
                    SizedBox(
                      width: SizeConfig.screenWidth,
                      child: CustomElevatedButton(
                        backgroundColor: kPrimaryColorDark,
                        label: 'notification_page.add',
                        onPressed: () {},
                      ),
                    ),
                    const HeightWidget(20),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: const NormalText(
                        "Ajouter",
                        color: kbioColor,
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NormalText(
                            "Email",
                            fontSize: 14,
                          ),
                          Switch(
                              focusColor: kBottonColor,
                              activeColor: kBottonColor,
                              value: emailON,
                              inactiveTrackColor: kUnCheck,
                              inactiveThumbColor: kUnCheck,
                              onChanged: (value) => changeEmail()),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            barrierColor: kLightGrey.withOpacity(0.6),
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            context: context,
                            builder: (context) {
                              return Container(
                                height: height(250),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding,
                                    vertical: kDefaultPadding),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0)),
                                  color: kWhiteColor,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const NormalText(
                                      "Notice",
                                      fontSize: 14,
                                      isBold: true,
                                    ),
                                    const HeightWidget(10),
                                    Center(
                                      child: Container(
                                        padding: const EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: kNavBarBackgroundColor,
                                        ),
                                        child: const Icon(
                                          Icons.sms_failed_outlined,
                                          color: kBottonColor,
                                        ),
                                      ),
                                    ),
                                    const HeightWidget(10),
                                    const NormalText(
                                      "Nous avons besoin de vous envoyer des SMS seulement pour les informations importantes et pour les réservations et annulations",
                                      isCentered: true,
                                      fontSize: 14,
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              NormalText(
                                "SMS",
                                fontSize: 14,
                              ),
                              Icon(Icons.keyboard_arrow_right)
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

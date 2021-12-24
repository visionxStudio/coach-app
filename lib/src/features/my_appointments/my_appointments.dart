import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/home/widgets/search_input_fiel_widget.dart';
import 'package:digicoach/src/features/my_appointments/data/appointment_list.dart';
import 'package:digicoach/src/features/my_appointments/data/models/appoint_model.dart';
import 'package:digicoach/src/features/my_appointments/widgets/appointment_notification.dart';

import 'package:flutter/material.dart';

class MyAppointmentsPage extends StatelessWidget {
  const MyAppointmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kBlackColor),
        title: Text(
          "my_appointments.title".tr(context),
          style: const TextStyle(
              fontSize: kDefaultFontSize - 4,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: kWhiteColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeightWidget(16.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SearchInputFieldWidget(),
              ),
              const HeightWidget(16.0),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: kWhiteColor),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: NormalText(
                  "my_appointments.title".tr(context) +
                      " (${appointments.length.toString()})",
                  fontWeight: FontWeight.w600,
                  fontSize: kDefaultFontSize - 4,
                  color: kPrimaryColor,
                ),
              ),
              const MyAppointments(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyAppointments extends StatelessWidget {
  const MyAppointments({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kScafoldColor,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: appointments.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (BuildContext context, int index) {
              final AppointmentModel appointment = appointments[index];
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    barrierColor: kLightGrey.withOpacity(0.6),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    context: context,
                    builder: (context) {
                      return const AppointmentNotification();
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  margin: const EdgeInsets.only(bottom: 2.0),
                  color: kWhiteColor,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.asset(
                          ImageAsset.avatar1,
                          height: 32.0,
                          width: 32.0,
                        ),
                      ),
                      const WidthWidget(16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalText(
                            appointment.appointmentTitl,
                            color: kBlackGrey,
                            fontSize: kDefaultFontSize - 6,
                          ),
                          const HeightWidget(4.0),
                          NormalText(
                            " Par ${appointment.coach}",
                            color: kLightBlueTextColor,
                            fontSize: kDefaultFontSize - 6,
                          ),
                          const HeightWidget(4.0),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 8.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color: kunSelectedAddressBorder,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Row(
                              children: [
                                NormalText(
                                  appointment.dateTime,
                                  color: kscheduleTextColor,
                                  fontSize: kDefaultFontSize - 6,
                                ),
                                NormalText(
                                  "• ${appointment.type}",
                                  color: kscheduleTextColor,
                                  fontSize: kDefaultFontSize - 6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const HeightWidget(16.0),
        ],
      ),
    );
  }
}

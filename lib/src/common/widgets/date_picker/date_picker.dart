import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/date_picker/bloc/date_picker_controller.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateTimeWidget extends StatelessWidget {
  // final Function()? onTap;
  const DateTimeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (ctx, ref, child) {
        final dateTime = ref.watch(datePickerControllerProvider);
        return GestureDetector(
          onTap: () async {
            final DateTime? date = await showDatePicker(
              context: context,
              initialDate: dateTime.dateTime,
              firstDate: DateTime(1800),
              lastDate: DateTime.now(),
            );
            if (date != null) {
              dateTime.changeDateTime(date: date);
            }
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: NormalText(
                !dateTime.isDateChanged
                    ? "details_page.dob".tr(context)
                    : "${dateTime.dateTime.year}-${dateTime.dateTime.month}-${dateTime.dateTime.day}",
                color: !dateTime.isDateChanged ? ksearchText : kBlackColor,
              ),
            ),
          ),
        );
      },
    );
  }
}

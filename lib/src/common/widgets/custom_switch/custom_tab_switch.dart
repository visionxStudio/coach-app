import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/custom_switch/bloc/custom_tab_switch_controller.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/features/home/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTabSwitch extends StatelessWidget {
  final String tab1;
  final String tab2;

  const CustomTabSwitch({
    Key? key,
    required this.tab1,
    required this.tab2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (ctx, ref, child) {
        final tabIndexController = ref.watch(customTabControllerProvider);
        return Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: kChipColor,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSwitch(
                title: tab1,
                isActive: tabIndexController.index == 0,
                onTap: () {
                  ref.read(customTabControllerProvider).changeIndex(value: 0);
                },
              ),
              const WidthWidget(4.0),
              CustomSwitch(
                title: tab2,
                isActive: tabIndexController.index == 1,
                onTap: () {
                  ref.read(customTabControllerProvider).changeIndex(value: 1);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

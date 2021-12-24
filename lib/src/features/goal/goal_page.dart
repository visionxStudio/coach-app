import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/service/exceptions/network_exceptions.dart';
import 'package:digicoach/src/common/widgets/error_indicator/error_indicator.dart';
import 'package:digicoach/src/common/widgets/loading_indicator/loading_indicator.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/goal/bloc/goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:digicoach/app_localization.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({Key? key}) : super(key: key);

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  bool forcephysique = false;
  bool weightloss = false;
  bool weightgain = false;
  bool stressreduction = false;
  bool increaseflexibility = false;
  bool discovery = false;

  void setphysical() {
    forcephysique = !forcephysique;

    setState(() {});
  }

  void setweightLoss() {
    weightloss = !weightloss;
    setState(() {});
  }

  void setWeightGain() {
    weightgain = !weightgain;
    setState(() {});
  }

  void setStressReducation() {
    stressreduction = !stressreduction;
    setState(() {});
  }

  void setIncreaseflexibility() {
    increaseflexibility = !increaseflexibility;
    setState(() {});
  }

  void setdiscovery() {
    discovery = !discovery;
    setState(() {});
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
          'student_modify_page.title',
          isBold: true,
          color: kPrimaryColor,
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final asyncGoals = ref.watch(goalProvider);

          return asyncGoals.asyncGoals.when(
            error: (error, stackTrace) {
              if (error is NetworkExceptions) {
                return ErrorIndicator(
                  message: error.getIntlException().tr(context),
                );
              } else {
                return ErrorIndicator(
                  message: 'exception.something-went-wrong'.tr(context),
                );
              }
            },
            loading: () => const LoadingIndicator(),
            data: (goals) {
              return Container(
                color: kWhiteColor,
                margin:
                    const EdgeInsets.symmetric(vertical: kDefaultmargin / 2),
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: goals.map((e) {
                      return ListTile(
                          title: NormalText(e.key.toString()),
                          trailing: Checkbox(
                              activeColor: kWhiteColor,
                              checkColor: kcircleButtonBorder,
                              value: e.value,
                              onChanged: (value) =>
                                  asyncGoals.update(e.copyWith(
                                    id: e.id,
                                    value: value!,
                                  ))));
                    }).toList(),
                  ),
                  // child: Column(
                  //   children: [
                  //     ListTile(
                  //         title: const NormalText("goals_page.physicalforce"),
                  //         trailing: Checkbox(
                  //             activeColor: kWhiteColor,
                  //             checkColor: kcircleButtonBorder,
                  //             value: forcephysique,
                  //             onChanged: (value) => setphysical())),
                  //     ListTile(
                  //         title: const NormalText("goals_page.weightgain"),
                  //         trailing: Checkbox(
                  //             activeColor: kWhiteColor,
                  //             checkColor: kcircleButtonBorder,
                  //             value: weightgain,
                  //             onChanged: (value) => setWeightGain())),
                  //     ListTile(
                  //         title: const NormalText("goals_page.weightloss"),
                  //         trailing: Checkbox(
                  //             activeColor: kWhiteColor,
                  //             checkColor: kcircleButtonBorder,
                  //             value: weightloss,
                  //             onChanged: (value) => setweightLoss())),
                  //     ListTile(
                  //         title: const NormalText("goals_page.stressreduction"),
                  //         trailing: Checkbox(
                  //             activeColor: kWhiteColor,
                  //             checkColor: kcircleButtonBorder,
                  //             value: stressreduction,
                  //             onChanged: (value) => setStressReducation())),
                  //     ListTile(
                  //         title: const NormalText(
                  //             "goals_page.increaseflexibility"),
                  //         trailing: Checkbox(
                  //             activeColor: kWhiteColor,
                  //             checkColor: kcircleButtonBorder,
                  //             value: increaseflexibility,
                  //             onChanged: (value) => setIncreaseflexibility())),
                  //     ListTile(
                  //         title: const NormalText("goals_page.discovery"),
                  //         trailing: Checkbox(
                  //             activeColor: kWhiteColor,
                  //             checkColor: kcircleButtonBorder,
                  //             value: discovery,
                  //             onChanged: (value) => setdiscovery())),
                  //     Container(
                  //       margin: const EdgeInsets.all(kDefaultmargin),
                  //       padding: const EdgeInsets.all(kDefaultPadding),
                  //       child: const NormalText(
                  //         "goals_page.toadd",
                  //         color: knavbarInactiveColor,
                  //       ),
                  //     )
                  //   ],
                  // ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

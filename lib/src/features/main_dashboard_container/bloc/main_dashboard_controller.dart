import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/enums.dart';
import 'package:digicoach/src/features/main_dashboard_container/data/coach_student_detail_model.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainDashboardProvider = ChangeNotifierProvider<MainDashboardProvider>(
    (_) => MainDashboardProvider());

class MainDashboardProvider extends ChangeNotifier {
//by default usertype will be coach can be change if user select student while registration.
  UserType userType = UserType.coach;

  //default list
  List<String> topmenulist = [
    'Lives',
    'Visio',
    'À domicile',
    'Coachs',
    'Rencontres'
  ];
//top menu index
  int topmenuIndex = 3;

  // changing the top menu index
  void changeTopMenuIndex(int index) {
    topmenuIndex = index;
    notifyListeners();
  }

  List<CoachStudentModel> studentDetailList = [
    CoachStudentModel(
        id: "1",
        name: "Tennis",
        profile: ImageAsset.testprofile,
        title: "Tennis",
        address: "20 m",
        coachtype: "workout",
        coachingImage: ImageAsset.waterskiing,
        heart: 7,
        comment: 3,
        averageRating: 3.5,
        fee: 29,
        interest: ImageAsset.rockclimbing,
        participant: [ImageAsset.boxing, ImageAsset.exercise, ImageAsset.gulf]),
    CoachStudentModel(
        id: "1",
        name: "judo",
        profile: ImageAsset.testprofile,
        title: "judo",
        address: "4 km",
        coachtype: "workout",
        coachingImage: ImageAsset.waterskiing,
        heart: 7,
        comment: 3,
        averageRating: 3.5,
        fee: 29,
        interest: ImageAsset.waterskiing,
        participant: [ImageAsset.tennis, ImageAsset.exercise, ImageAsset.gulf]),
    CoachStudentModel(
        id: "1",
        name: "Escalade",
        profile: ImageAsset.testprofile,
        title: "Escalade",
        address: "10 km",
        coachtype: "workout",
        coachingImage: ImageAsset.waterskiing,
        heart: 7,
        comment: 3,
        averageRating: 3.5,
        fee: 29,
        interest: ImageAsset.tennis,
        participant: [
          ImageAsset.boxing,
          ImageAsset.meditation,
          ImageAsset.gulf
        ]),
    CoachStudentModel(
        id: "1",
        name: "Windsurfing",
        profile: ImageAsset.testprofile,
        title: "Windsurfing",
        address: "20 m",
        coachtype: "workout",
        coachingImage: ImageAsset.waterskiing,
        heart: 7,
        comment: 3,
        averageRating: 3.5,
        fee: 29,
        interest: ImageAsset.running,
        participant: [
          ImageAsset.running,
          ImageAsset.exercise,
          ImageAsset.gulf
        ]),
    CoachStudentModel(
        id: "1",
        name: "Karate",
        profile: ImageAsset.testprofile,
        title: "Windsurfing",
        address: "2 km",
        coachtype: "workout",
        coachingImage: ImageAsset.waterskiing,
        heart: 7,
        comment: 3,
        averageRating: 3.5,
        fee: 29,
        interest: ImageAsset.exercise,
        participant: [
          ImageAsset.running,
          ImageAsset.exercise,
          ImageAsset.tennis
        ]),
  ];

  List<CoachStudentModel> coachDetailList = [
    CoachStudentModel(
        id: "1",
        name: "Bessie Cooper",
        profile: ImageAsset.testprofile,
        title: "Coach de méditation",
        address: "France, Lille",
        coachtype: "workout",
        heart: 7,
        comment: 3,
        coachingImage: ImageAsset.waterskiing,
        averageRating: 3.5,
        fee: 29,
        participant: []),
    CoachStudentModel(
        id: "1",
        name: "lynda",
        profile: ImageAsset.testprofile,
        title: "Coach de méditation",
        address: "France, Lille",
        coachtype: "workout",
        coachingImage: ImageAsset.waterskiing,
        heart: 7,
        comment: 3,
        averageRating: 3.5,
        fee: 29,
        participant: []),
    CoachStudentModel(
        id: "1",
        name: "john",
        profile: ImageAsset.testprofile,
        title: "Coach de méditation",
        address: "France, Lille",
        coachtype: "workout",
        coachingImage: ImageAsset.waterskiing,
        heart: 7,
        comment: 3,
        averageRating: 3.5,
        fee: 29,
        participant: []),
    CoachStudentModel(
        id: "1",
        name: "Bessie Cooper",
        profile: ImageAsset.testprofile,
        title: "Coach de méditation",
        address: "France, Lille",
        coachtype: "workout",
        coachingImage: ImageAsset.waterskiing,
        heart: 7,
        comment: 3,
        averageRating: 3.5,
        fee: 29,
        participant: []),
    CoachStudentModel(
        id: "1",
        name: "Bessie Cooper",
        profile: ImageAsset.testprofile,
        title: "Coach de méditation",
        address: "France, Lille",
        coachtype: "workout",
        coachingImage: ImageAsset.waterskiing,
        heart: 7,
        comment: 3,
        averageRating: 3.5,
        fee: 29,
        participant: []),
    CoachStudentModel(
        id: "1",
        name: "Bessie Cooper",
        profile: ImageAsset.testprofile,
        title: "Coach de méditation",
        address: "France, Lille",
        coachtype: "workout",
        coachingImage: ImageAsset.waterskiing,
        heart: 7,
        comment: 3,
        averageRating: 3.5,
        fee: 29,
        participant: []),
    CoachStudentModel(
        id: "1",
        name: "Bessie Cooper",
        profile: ImageAsset.testprofile,
        title: "Coach de méditation",
        address: "France, Lille",
        coachtype: "workout",
        coachingImage: ImageAsset.waterskiing,
        heart: 7,
        comment: 3,
        averageRating: 3.5,
        fee: 29,
        participant: []),
    CoachStudentModel(
        id: "1",
        name: "Bessie Cooper",
        profile: ImageAsset.testprofile,
        title: "Coach de méditation",
        address: "France, Lille",
        coachtype: "workout",
        coachingImage: ImageAsset.waterskiing,
        heart: 7,
        comment: 3,
        averageRating: 3.5,
        fee: 29,
        participant: []),
    CoachStudentModel(
        id: "1",
        name: "Bessie Cooper",
        profile: ImageAsset.testprofile,
        title: "Coach de méditation",
        address: "France, Lille",
        coachtype: "workout",
        coachingImage: ImageAsset.waterskiing,
        heart: 7,
        comment: 3,
        averageRating: 3.5,
        fee: 29,
        participant: []),
    CoachStudentModel(
        id: "1",
        name: "Bessie Cooper",
        profile: ImageAsset.testprofile,
        title: "Coach de méditation",
        address: "France, Lille",
        coachtype: "workout",
        coachingImage: ImageAsset.waterskiing,
        heart: 7,
        comment: 3,
        averageRating: 3.5,
        fee: 29,
        participant: []),
  ];
}


/*
onPressed: () {
  if (listScrollController.hasClients) {
    final position = listScrollController.position.maxScrollExtent;
    listScrollController.jumpTo(position);
  }
},

//to move to top
onPressed: () {
    if (listScrollController.hasClients) {
      final position = listScrollController.position.minScrollExtent;
      listScrollController.animateTo(
        position,
        duration: Duration(seconds: 3),
        curve: Curves.easeOut,
      );
    }

 */

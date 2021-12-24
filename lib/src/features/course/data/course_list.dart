import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:flutter/material.dart';

class CoursesModel {
  final String course;
  final String courseImage;
  final Color backgroundColor;
  final int value;

  CoursesModel({
    required this.course,
    required this.courseImage,
    required this.backgroundColor,
    required this.value,
  });
}

final List<CoursesModel> courses = [
  CoursesModel(
    course: "Mise en forme",
    courseImage: ImageAsset.mise1,
    backgroundColor: const Color(0xFFF3BE01),
    value: 1,
  ),
  CoursesModel(
    course: "Méditation",
    courseImage: ImageAsset.mediation1,
    backgroundColor: const Color(0xFF2AB2FE),
    value: 2,
  ),
  CoursesModel(
    course: "Yoga",
    courseImage: ImageAsset.yoga1,
    backgroundColor: const Color(0xFF6C42FF),
    value: 3,
  ),
  CoursesModel(
    course: "Pilates",
    courseImage: ImageAsset.pilates1,
    backgroundColor: const Color(0xFFFE2A2A),
    value: 4,
  ),
  CoursesModel(
    course: "Nutrition",
    courseImage: ImageAsset.nutrition1,
    backgroundColor: const Color(0xFF05A47A),
    value: 5,
  ),
];

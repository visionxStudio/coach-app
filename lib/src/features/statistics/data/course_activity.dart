import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:flutter/material.dart';

class CourseActivityModel {
  final Color color;
  final String title;
  final double duration;
  final int course;
  final String image;
  final double completedDuration;

  CourseActivityModel({
    required this.color,
    required this.title,
    required this.duration,
    required this.course,
    required this.image,
    required this.completedDuration,
  });
}

final List<CourseActivityModel> courseActivity = [
  CourseActivityModel(
    color: const Color(0xFF6C42FF),
    title: "Yoga",
    duration: 90.0,
    course: 1,
    image: ImageAsset.yoga1,
    completedDuration: 10.0,
  ),
  CourseActivityModel(
    color: const Color(0xFF5BC4FE),
    title: "Méditation",
    duration: 560.0,
    course: 8,
    image: ImageAsset.mediation1,
    completedDuration: 200.0,
  ),
  CourseActivityModel(
    color: const Color(0xFFFE5B5B),
    title: "Pilates",
    duration: 360.0,
    course: 5,
    image: ImageAsset.pilates1,
    completedDuration: 90.0,
  ),
  CourseActivityModel(
    color: const Color(0xFFFEDA5B),
    title: "Mise en forme",
    duration: 400.0,
    course: 6,
    image: ImageAsset.mise1,
    completedDuration: 150.0,
  ),
  CourseActivityModel(
    color: const Color(0xFF06D6A0),
    title: "Nutrition",
    duration: 420.0,
    course: 7,
    image: ImageAsset.nutrition1,
    completedDuration: 220.0,
  ),
];

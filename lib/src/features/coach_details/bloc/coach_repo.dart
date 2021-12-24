import 'package:digicoach/src/common/constants/api_link.dart';
import 'package:digicoach/src/common/service/repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coachRepoProvider = Provider((ref) => CoachRepository());

abstract class ICoachRepository {
  Future<void> createCoach();

  Future<void> updateCoachInformation({
    required String fullName,
    required String email,
    required String postal,
    required String date,
    required List<String> language,
    required String gender,
  });
}

class CoachRepository extends Repo implements ICoachRepository {
  @override
  Future<void> createCoach() async {
    final String message;

    try {
      final response = await client.post(ApiLink.createCoach, data: {
        "availability_start": "9:00",
        "availability_end": "17:00",
      });
      message = response['message'];
      debugPrint(message);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateCoachInformation({
    required String fullName,
    required String email,
    required String postal,
    required String date,
    required List<String> language,
    required String gender,
  }) async {
    try {
      final response = await client.post(ApiLink.updateUserProfile, data: {
        "name": fullName,
        "email": email,
        "date_of_birth": date,
        "address": postal,
        "languages": language,
        "gender": gender,
      });

      debugPrint(response["message"]);
    } catch (e) {
      rethrow;
    }
  }
}

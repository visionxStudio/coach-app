import 'package:digicoach/src/common/constants/api_link.dart';
import 'package:digicoach/src/common/service/repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final courseRepoProvider = Provider((ref) => CourseRepository());

abstract class IcourseRepository {
  Future<void> createCourse({
    required int interestId,
    required int packageId,
    required String duration,
    required String price,
    required List<int> topics,
  });

  Future<void> createCoach();
}

class CourseRepository extends Repo implements IcourseRepository {
  @override
  Future<String> createCourse({
    required int interestId,
    required int packageId,
    required String duration,
    required String price,
    required List<int> topics,
  }) async {
    final String message;
    try {
      final response = await client.post(
        ApiLink.createCourse,
        data: {
          "interest_id": interestId,
          "package_id": packageId,
          "duration": duration,
          "price": price,
          "topics": topics,
        },
      );
      message = response['message'];

      return message;
    } catch (e) {
      rethrow;
    }
  }

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
}

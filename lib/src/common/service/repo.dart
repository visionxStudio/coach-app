import 'package:digicoach/src/common/service/dio_client.dart';

/// Absract class which can be extended in repository
abstract class Repo {
  final DioClient client = DioClient.instance;
}
